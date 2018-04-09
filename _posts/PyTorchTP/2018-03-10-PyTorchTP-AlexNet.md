---
layout: article
title: "PyTorch Taipei 2018 week1: AlexNet"
modified: 2018-03-28
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser: PyTorchTP/AlexNet/AlexNet.png
  thumb: PyTorchTP/AlexNet/AlexNet.png
date: 2018-03-10
fbcomments: yes
---

ImageNet為大型圖片資料集，約1500萬張已標記影像，類別約22,000種。ImageNet Large Scale Visual Recognition Challenge (ILSVRC)是Stanford教授李飛飛所領導[Vision Lab](http://vision.stanford.edu/people.html){:target="_blank"}在2010年開始舉辦、基於ImageNet的圖片辨識技術競賽([2017 workshop](https://www.youtube.com/watch?v=jYvBmJo7qjc){:target="_blank"}上宣布為最後一屆，之後會調整dataset內容並與Kaggle合辦)。

本文介紹的AlexNet是[ILSVRC-2012](http://www.image-net.org/challenges/LSVRC/2012/results.html){:target="_blank"}的冠軍，作者為多倫多大學知名教授[Geoffrey Hinton](http://www.cs.toronto.edu/~hinton/){:target="_blank"}(backprop主要貢獻者)和他當時的兩位博士生[Alex Krizhevsky](https://www.cs.toronto.edu/~kriz/){:target="_blank"}和[Ilya Sutskever](http://www.cs.toronto.edu/~ilya/){:target="_yblank"}，不僅在比賽中大勝其他對手，表現上也超越當時技術。此後ILSVRC的冠軍皆由CNN相關演算法奪得，後來的ZFnet, SPPnet, VGG等技術都是在其基礎之上做修正，似乎也是從那時候開始DL相關技術越來越被各界所重視。

這周介紹的[論文][1]{:target="_yblank"}(Conference Paper)主要說明在過去CNN的基礎上，他們為AlexNet引入了哪些tricks及其幫助model降低了多少error rate。

AlexNet的重要貢獻有：

 * 證明CNN加深能使表現更好
 * 使用GPU平行運算
 * 引入ReLU, Dropout和 (因效果不佳漸漸被棄用的)LRN、Overlapping Pooling。

<br>
AlexNet架構:
<img src="../../images/PyTorchTP/AlexNet/AlexNetStruc.png" width="800">


{% include toc.html %}

## **1. Dataset & Preprocessing**

## 1.1 ILSVRC-2012's Dataset
訓練集只取ImageNet當中120萬張圖(約1000classes, 每個class約1000張)、validation set五萬張、testing set十五萬張。

## 1.2 Preprocessing for AlexNet
1. **裁切至256×256**: 每張圖rescaling至短邊為256pixels，再將長邊裁切出256pixels。<br>(之後會再裁出數張224×224的圖)
2. **使pixels平均值為0**: 訓練集每張圖都減去訓練集上所有RGB pixels值的平均值。<br><br>

## **2. Architecture**
論文中的ch.3, 依照重要程度順序列出他認為這個架構能在比賽中勝出的關鍵。

## 2.1 ReLU
activation function為ReLU（Rectified Linear Unit），函式為$f(x)=\max(0,x)$，在每一層輸出後都會接ReLU，論文中說明他們實驗得到<a href="../../images/PyTorchTP/AlexNet/AlexNetReLU.png" target="blank">在一個四層NN當中使用ReLU的收斂速度比tanh快上四倍</a>。

ReLU, tanh, sigmoid, softplus(ReLU之隨處可微分改良版)比較圖: <br>
<img src="../../images/PyTorchTP/AlexNet/AlexNet4act.png" width="800">

(plot by [desmos](https://www.desmos.com/calculator){:target="_blank"})

ReLU勝於sigmoid、tanh的主要原因有：

1. **無梯度消失問題(vanishing gradient)**: 使用sigmoid、tanh時，若$x$非常大或非常小則導數會趨近於零，造成學習效率降低，這種現象為梯度消失問題，故需要先做normalization再輸入以改善，而ReLU沒有這個缺點。
2. **相較exponential運算更加快速**: ReLU只是單純的thresholding，比起含有exponential的運算更加快速。
3. **稀疏性**: ReLU使得部分神經元輸出為0，據說較為接近真實生物神經情況(感知時只有約1~4%的神經元被同時啟動)，降低神經元之間的依賴性而減少overfitting([參考文章][8]{:target="_blank"})。
4. 有講述ReLU效果的兩篇論文:
 - [What is the Best Multi-Stage Architecture for Object Recognition?][3]{:target="_blank"}
 - [Rectified Linear Units Improve Restricted Boltzmann Machines][4]{:target="_blank"}

<br>
ReLU缺點:

1. **Dead ReLU Problem**: 某些神經元在forward prop中x<0則此後不再被激發的情況。可透過[Xavier Initialization][9]{:target="_blank"}(使輸入輸出方差一致)或Adagrad減緩這種情況發生。
或者改用Leaky ReLU(負值部分斜率為0.01), [PReLU][10]{:target="_blank"}(斜率透過backprop而得)或者其他ReLU變形。
2. **非Zero-centered**: 即輸出均值非0的問題，輸入至下一層的值並非zero-centered，使得backprop中梯度全為正或全為負。可改用ELU來改善(但計算量又會增加)。
<br><br>ReLU, Leaky ReLU, Randomized Leaky ReLU, ELU之圖形:<br><img src="../../images/PyTorchTP/ReLUfamily.png" width="800"><br>(picture modified from: [Isaac Changhau's blog][19]{:target="_blank"})

## 2.2 Training on GPUs
使用了兩張GTX 580 GPU(單張內存只有3GB)分兩路運算(見架構圖)，但在第三層的兩路conv layer都是使用所有前一層所有feature maps作為input，其他conv layers則是分開的。在哪幾層有在GPU之間做這樣的溝通連接是cross-validation試出來的結果。

## 2.3 Local Response Normalization(LRN)
在第一和第二層(conv layers)的ReLU輸出接的normalization，函式為:

$$b^i_{x,y}=a^i_{x,y}/(k+\alpha \sum_{j=\max(0,i-n/2)}^{\min(N-1,i+n/2)}(a^j_{x,y})^2)^{\beta}$$

其中

- $a^i_{x,y}$是在$x, y$位置上，原本convolution輸出值。
- $b^i_{x,y}$為LRN輸出值，做為下一層的輸入值。
- $N$是該層kernel maps數量。
- $n$是要做加總運算的鄰近kernel maps數量，為hyperparameter。
- $k, \alpha, \beta$是hyperparameters，論文中選用$k=2$, $\alpha=10^{-4}$, $\beta=0.75$。

式子中的summation運算即ReLU的輸出在鄰近n個feature maps上相同位置的值要做平方加總，依此畫了示意圖(insired by [Hu Yixuan][13]{:target="_blank"}):
<img src="../../images/PyTorchTP/LRN.gif" width="800">

不過後來研究發現LRN效果不大，漸漸被[Batch Normalization][14]{:target="_blank"}取代。

## 2.4 Overlapping Pooling
AlexNet都是使用kernel大小為3×3, stride=2的max pooling，即每個要做pooling的範圍有重疊，減少pooling損失的資料量。但之後的研究普遍認為Overlapping Pooling效果不會比沒重疊的pooling更好。

## 2.5 Overall Architecture
1. 1~5層為conv layers，6~8層為FC layers。
2. 最後一層接的是softmax(為使輸出為機率，總和為1)，輸出1000個classes的機率分布。
3. 用兩張GPU平行運算，但在第三層和全連接層有相互交流。
4. 每層輸出都有接ReLU。
5. 第1, 2層的ReLU之後有接LRN。
6. 在第1, 2層的LRN和第五層的ReLU之後有接max pooling(kernel size=3×3, stride=2)。<br><br>

## **3. Reducing Overfitting**

## 3.1 Data Augmentation
資料擴增有兩個方法，皆在CPU上進行，完成後直接丟進GPU訓練，不需將擴增而得的圖片存下來。但論文中似乎沒有非常詳細的說明這兩種方法是分開使用還是cooperate。

1. **Reflection & Extracting**: 將Preprocessing而得的256x256圖片水平翻轉，並於其上各切出1024張224x224的圖(每次移動1pixel)，每張原圖擴增為2048張。算testing set時是將原圖水平翻轉取五張224x224的圖(四個角落和正中央)，再取這十張輸出的softmax平均作為該原圖的判斷依據。
2. **PCA**: 將RGB數值作[主成份分析(PCA)][15]{:target="_blank"}，使每張原圖pixel之RGB值 $I_{xy}=[I_{xy}^R,I_{xy}^G,I_{xy}^B]^T$加上

$$[p_1,p_2,p_3][\alpha_1 \lambda_1,\alpha_2 \lambda_2,\alpha_3 \lambda_3]^T$$

　　其中$p_i$和$\lambda_i$為該pixel RGB值之[covariance matrix][16]{:target="_blank"}(大小為3×3)的第$i$個特徵向量和特徵值、<br>　　$\alpha_i$為一個mean=0, std=0.1高斯分布(常態分布)的隨機值。

前者切出各種不同範圍的圖片送去訓練，似乎可以讓model不需要完整資訊就能做判斷。而後者讓圖片主成份做變動(增加或減少)，使得model較不受圖片上明亮的部分控制。

## 3.2 Dropout
同樣來自[G. E. Hinton實驗室的論文][17]{:target="_blank"}，某此訓練當中，某些neurons被暫時"丟棄"，不參與forward prop和back prop，權重不被更新，也是現在非常常用的技法，似乎也符合前面提過的生物特性: 生物感知時只會用到少數的神經元。

<img src="../../images/PyTorchTP/dropout.png" width="600">

(picture source: CS231@Stanford)

在需要dropout的那一層需要設定probability of dropout，即要休息的神經元比率。原作在前兩層FC layer有dropout，比率皆為0.5。能有效地防止overfitting，但收斂所需的epoches大約會增加一倍。

當model訓練完成後要計算testing set之error rate時，就不會再有neurons被dropout，而在訓練時有設定dropout的那幾層之輸出要乘以0.5，使得training和testing時neurons輸出值之期望值相同

$$Training: px+(1-p)0$$

$$Testing: x\rightarrow px$$


<br><br>

## **4. Details of Learning**

## 4.1 Stochastic Gradient Descent
batch size=128, momentum=0.9, weight decay=0.00005

$$v_{i+1}:=0.9v_{i}-0.0005\epsilon w_i-\epsilon\langle \frac{\partial L}{\partial w} \vert _{w_i}  \rangle_{D_i}$$

$$w_{i+1}=w_i+v_{i+1}$$

where $v$ is momentum variable, $\epsilon$ is learning rate, ${\langle \frac{\partial L}{\partial w} \vert {w_i}\rangle}_{D_i} $ is average over $$i^{th}$$ batch $D_i$ of derivative of the object with respect to $w$.<br><br>

## 4.2 Initialization
1. Weight insitialization: Gaussian Distribution(mean=0, std=0.01)
2. Bias insitialization: 1 (at 2nd, 4th, 5th & FC layers), 0 (at other layers)
3. Learning rate: 0.01 (若validation error不再下降則除以10)

<br>

## **Reference**

1. [Alex Krizhevsky, Ilya Sutskever, and Geoffrey E. Hinton. 2012. ImageNet classification with deep convolutional neural networks. In Proceedings of the 25th International Conference on Neural Information Processing Systems - Volume 1 (NIPS'12), F. Pereira, C. J. C. Burges, L. Bottou, and K. Q. Weinberger (Eds.), Vol. 1. Curran Associates Inc., USA, 1097-1105.][1]{:target="_blank"}
2. [本周講者Young Hu部落格: AlexNet 架構概述][2]{:target="_blank"}
3. [Kevin Jarrett, Koray Kavukcuoglu, M Ranzato, and Yann LeCun. What is the best multi-stage architecture for object recognition? In Computer Vision, 2009 IEEE 12th International Conference on, pages 2146–2153. IEEE, 2009.][3]{:target="_blank"}
4. [Nair, Vinod and Hinton, Geoffrey E. Rectifiedlinear units improve restricted boltzmann machines. In ICML, pp. 807–814. Omnipress, 2010. ][4]{:target="_blank"}
4. CS231: [Commonly used activation functions][6]{:target="_blank"}, [Dropout][18]{:target="_blank"}
5. [qrlhl's blog: activation functions][7]{:target="_blank"}
5. [Isaac Changhau's blog: Activation Functions in Artificial Neural Networks][19]{:target="_blank"}
5. [Physcalの大魔導書: sparsity of ReLU][8]{:target="_blank"}
9. [Glorot, X. and Bengio, Y. Understanding the difficulty of training deep feedforward neural networks. InProc. AISTATS, volume 9, pp. 249–256, 2010. ][9]{:target="_blank"}
1. [K. He, X. Zhang, S. Ren, and J. Sun. Delving deep into rectifiers: Surpassing human-level performance on imagenet classification. In ICCV, 2015. ][10]{:target="_blank"}
1. [LearnOpenCV.com: Understanding Activation Functions in Deep Learning][11]{:target="_blank"}
1. [yeephycho's blog: Normalizations in Neural Networks][12]{:target="_blank"}
2. [Hu Yixuan's answer on Quora: What is local response normalization?][13]{:target="_blank"}
2. [Batch Normalization@Zhihu][14]{:target="_blank"}
2. 線代啟示錄: [PCA][15]{:target="_blank"}, [Covariance Matrix][16]{:target="_blank"}
2. [Hinton, Geoffrey E, Srivastava, Nitish, Krizhevsky, Alex, Sutskever, Ilya, and Salakhutdinov, Ruslan R. Im-proving neural networks by preventing co-adaptation of feature detectors. arXiv preprint arXiv:1207.0580, 2012b. ][17]{:target="_blank"}

[1]: http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf
[2]: https://medium.com/@WhoYoung99/alexnet-架構概述-988113c06b4b
[3]: http://yann.lecun.com/exdb/publis/pdf/jarrett-iccv-09.pdf
[4]: https://www.cs.toronto.edu/~hinton/absps/reluICML.pdf
[5]: https://blog.csdn.net/algorithm_image/article/details/78042429
[6]: http://cs231n.github.io/neural-networks-1/
[7]: https://blog.csdn.net/qrlhl/article/details/60883604
[8]: http://www.cnblogs.com/neopenx/p/4453161.html
[9]: http://proceedings.mlr.press/v9/glorot10a/glorot10a.pdf
[10]: https://arxiv.org/abs/1502.01852
[11]: https://www.learnopencv.com/understanding-activation-functions-in-deep-learning/
[12]: http://yeephycho.github.io/2016/08/03/Normalizations-in-neural-networks/
[13]: https://www.quora.com/What-is-local-response-normalization
[14]: https://www.zhihu.com/question/38102762
[15]: https://ccjou.wordpress.com/2013/04/15/%E4%B8%BB%E6%88%90%E5%88%86%E5%88%86%E6%9E%90/
[16]: https://ccjou.wordpress.com/2014/06/03/共變異數矩陣的性質/
[17]: https://arxiv.org/abs/1207.0580
[18]: http://cs231n.github.io/neural-networks-2/
[19]: https://isaacchanghau.github.io/2017/05/22/Activation-Functions-in-Artificial-Neural-Networks/
