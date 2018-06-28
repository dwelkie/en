---
layout: article
title: "PyTorch Taipei 2018 week17: YOLO v1"
modified: 2018-06-27
categories: articles
excerpt: ""
tags: [PyTorchTP, DL, DLpaper]
image:
  feature:
  teaser: yologo.png
  thumb: yologo.png
date: 2018-06-27
fbcomments: true
---

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ TeX: { extensions: ["color.js"] }});
</script>
$$ \definecolor{lg}{RGB}{114,0,172} \definecolor{pi}{RGB}{18,110,213} \definecolor{og}{RGB}{217,86,16} \definecolor{f}{RGB}{45,177,93}$$
<img src="" width="800">
{% include toc.html %}

## **1. Intro**

[YOLO (You Only Look Once)][6]{:target="_blank"} 是[Joseph Redmon](https://pjreddie.com/){:target="_blank"}(他的[彩虹小馬CV](https://pjreddie.com/static/Redmon%20Resume.pdf){:target="_blank"}), Santosh Divvalay, Ross Girshick, Ali Farhadi四人於2015年合著之real-time物件偵測(Object Detection)演算法，然而在2016和2018又再各推出了改良版YOLO(即[v2][5]{:target="_blank"}和[v3][4]{:target="_blank"})，可以說是目前該領域表現最佳之演算法，之後有空也會寫這兩篇論文的筆記。很奇葩的第一作者也曾經[在TedTalk上講過YOLO](https://www.ted.com/talks/joseph_redmon_how_a_computer_learns_to_recognize_objects_instantly){:target="_blank"}有興趣可以看看。

這裡介紹的YOLO v1的重要性在於跳脫過去DPM之sliding window技巧(一張圖需要多次輸入進CNN)和RCNN使用的region proposal + classify + refine組合技，YOLO中每張圖片只需要跑過一次CNN架構，大幅提升運算效率。論文其實閱讀上感覺並不困難，可能半天就能讀完，但有些實際運行方面的細節沒有寫出來，需要參考其他資料。本文為該論文的閱讀筆記，架構以我自己認為比較好懂得上重新編排(如果有人覺得還是很難懂可以底下留言跟我說XD)。

## **2. Training**

## 2.1 Backbone CNN Classifier

<p align="center"><img src="../../images/DL/YOLOv1/backbone.png" width="800"></p>

上圖為YOLO所用之CNN分類器架構，共24層ConvLayer和2層FC Layer，參考GoogLeNet的架構但把Inception直接用1*1 Conv取代。(筆者認為上圖中為圖片標記的尺寸似乎有些地方有錯，不過這不是很重要就是了，下面寫的convolution資訊就能夠複製作法，而且YOLO也能替換用其他分類器。)

另外，該架構使用的activaiton function是Leaky ReLU(可以看我之前寫的[ReLU相關介紹](https://mattwang44.github.io/en/articles/PyTorchTP-AlexNet/#21-relu){:target="_blank"})，主要優點為運算速度和ReLU差不多快但不會丟失負值訊息。

## 2.2 Pretraining

原作將上述架構的前20層ConvLayer再補上一層avg-pooling layer和一層ConvLayer做pretraining，雖然YOLO針對的是PASCAL VOC但原作pretrain是使用ImageNet資料集(1000-class)，花了約一周訓練並在ImageNet2012上得到top5-acc. 88%。Pretrain完成後才再以完整架構(pretrain架構+4conv+2FC)做訓練，最後輸出一個7×7×30大小的tensor(為符合後面的演算法設計)。

## 2.3 Bounding Box Regression

YOLO會將一張圖分割成$\color{black}{S×S}$個cell而所有cell都會再做出$\color{black}{B}$個bounding box預測，每個bounding box代表一個物件的存在(每個物件中心所在的cell即做為該物件之代表性cell)，預測標的包含物件大小、中心位置、信心水準($p_i(c)$, 被定義為$\color{black}{P(Object)*IoU}$)，而每個cell同時也會輸出一組向量$\color{black}{C}$，其中每個值代表一個class在物件存在條件下出現的機率(即$\color{black}{P(Class_i \mid Object)}$)。

原作$\color{black}{S=7}$, $\color{black}{B=2}$，而class數量為20，前述CNN分類器輸出的是一個大小為$\color{black}{7×7×(2×5+20)}$的tensor。下式之向量為tensor中第$ \color{black}{i}$個cell的代表輸出值。

$$ \color{black}{V = [Bbox1 \; \mid \; Bbox2 \; \mid \; C]^T} $$

$$ \color{black}{=[p_{i,1}(c) \; b_{xi,1} \; b_{yi,1} \; b_{wi,1} \; b_{hi,1} \; \mid \; p_{i,2}(c) \; b_{xi,2} \; b_{yi,2} \; b_{wi,2} \;  b_{hi,2} \mid C_1 \; C_2 \; C_3 \; ... \; C_{20}]^T} $$

其中的$\color{black}{b_x}$、$\color{black}{b_y}$代表的是bounding box中心位置，是以其所屬之cell的座標為基準，故只會介於$\color{black}{0}$、$\color{black}{1}$之間。$\color{black}{b_w}$、$\color{black}{b_h}$是以該bounding box之長寬除以整張圖的長寬，故也只會介於$\color{black}{0}$、$\color{black}{1}$之間。

訓練時每個cell會從$\color{black}{B}$個bounding box中選出一個和真實物件位置計算出的IoU最大的做loss function計算，但在預測時就會輸出$\color{black}{S×S×B}$個bounding box，便需要以Non-maximum Suppression(NMS、非極大抑制)輸出最後結果。YOLO的loss function和NMS用法後面都會再詳述。

<p align="center"><img src="../../images/DL/YOLOv1/iou.png" width="800"></p>

## 2.4 Loss Function

$$ \color{black}{loss \, function =} $$

$$ \color{orange}{\lambda_{coord}} \color{black}{\sum_{i=0}^{S^2} \sum_{j=0}^B} \color{green}{\mathbb{1}_{ij}^{obj}}  \color{black}{[(b_{xi}-\hat{b}_{xi})^2+(b_{yi}-\hat{b}_{yi})^2]} \tag{1} $$

$$ \color{black}{+} \color{orange}{\lambda_{coord}} \color{black}{\sum_{i=0}^{S^2} \sum_{j=0}^B} \color{green}{\mathbb{1}_{ij}^{obj}}  \color{black}{[(\sqrt{b_{wi}}-\sqrt{\hat{b}_{wi}})^2+(\sqrt{b_{hi}}-\sqrt{\hat{b}_{hi}})^2]} \tag{2} $$

$$ \color{black}{+ \sum_{i=0}^{S^2} \sum_{j=0}^B} \color{green}{\mathbb{1}_{ij}^{obj}} \color{black}{(C_i-\hat{C}_i)} \tag{3} $$

$$ \color{black}{+} \color{red}{\lambda_{noobj}} \color{black}{\sum_{i=0}^{S^2} \sum_{j=0}^B} \color{pi}{\mathbb{1}_{ij}^{noobj}} \color{black}{(C_i-\hat{C}_i)} \tag{4} $$

$$ \color{black}{+ \sum_{c \in classes}} \color{lg}{\mathbb{1}_{i}^{obj}} \color{black}{(p_i(c)-\hat{p}_i(c))} \tag{5} $$

$\color{black}{(1)(2)(4)}$中的$\color{orange}{\lambda_{coord}=5}$和$\color{red}{\lambda_{noobj}=0.5}$兩個參數是為了**加重懲罰圖片中有物件處之誤差，並減輕背景處誤差之懲罰**。因為圖片大部分cell中不會有值得關注的物件，若沒有這兩個參數，整個演算法會傾向圖中猜測沒有任何物件。

$\color{black}{(1)(2)(3)}$三項分別計算bounding box的位置、大小、預測class機率(即向量$\color{black}{C}$)的誤差，其中計算大小的第$\color{black}{(2)}$項加上開根號是為了讓能夠做到讓**同樣的尺寸誤差在大圖中所受的懲罰較小**。以下圖為例，假使紅框為真實bounding box而藍框為預測的bounding box且長度皆大了真實值一相同值(e.g. 10px)，將尺寸開根號計算能將誤差在狗(較大圖)上的所受懲罰變得較車(較小圖)還來的小。

<p align="center"><img src="../../images/DL/YOLOv1/in0.png" width="500"></p>

第$\color{black}{(1)(2)(3)}$項中的$ \color{green}{\mathbb{1}_{ij}^{obj}}$ 代表第 $\color{black}{i}$ 個cell上的第$\color{black}{j}$個bounding box被指定為predictor(即該bounding box在第$\color{black}{i}$個cell上總共B個bounding box中具有最大的 $$ \color{black}{IoU_{pred}^{truth}} $$)，即**loss function中$\color{black}{(1)(2)(3)}$三項只需計算被指定為predictor之bounding box所預測的位置、尺寸、class出現機率誤差**。

相對的，第$\color{black}{(4)}$項中的$\color{pi}{\mathbb{1}_{ij}^{noobj}}$代表**所有沒有出現物件的cell上所有bounding box，若是做出了大於零的class機率預測便皆視為誤差**。

第$\color{black}{(5)}$項中的$\color{lg}{\mathbb{1}_{i}^{obj}}$代表第$\color{black}{i}$個cell中有物件則為1否則為0，即loss function須計入出現物件所代表之cell所預測各個class出現機率(即物件出現機率confidence乘以向量$\color{black}{C}$)與真實值間的誤差。以下圖為例，若編號A~H的cell皆預測出有狗，但真實值為狗狗中心所在的cell D，故loss function第$\color{black}{(5)}$項在狗狗物件上只需要計算cell D。

<p align="center"><img src="../../images/DL/YOLOv1/in.png" width="500"></p>

## 2.5 Non-max Suppression [Constructing]



## 2.6 Parameters [Constructing]

## 2.7 Techniques for Avoiding Overfitting

作法有三：

1. 第二層FC Layer有dropout(rate=0.5)
2. 原文: random scaling & translation up to 20% of original image size.
3. 將圖片的HSV色彩空間中的exposure和saturation做隨機調整(最多1.5倍)

第一項作法明確，但後兩項的實際作法在原文中就沒詳述了，目前的疑問：

1. 圖片translation代表甚麼?整張圖移動? e.g.圖片左移後，圖中右邊的內容變成甚麼?
2. 1.5倍調整是指放大而不包含縮小? 為何不像其他論文中常見的用PCA找出色彩空間中較突出的值，再平移至該項之平均值，而是採取隨機調整?

## **3. Discussion**

## 3.0 mAP (mean Average Precision) [Constructing]

## 3.1 Limitation of YOLO v1

1. 演算法上明顯的缺點是，每個cell上雖有B個bounding box做預測，但最後只能用最好的一個，限制了每個cell只能預測出一個物件，如果一個cell中有多個物件，或是幾個較大物件的中心剛好出現在同一個cell，可能就會做出錯誤判斷。
2. 如果要做預測的圖中所出現的物件的長寬比或排列方式較為異常(即訓練資料中不常見)，則YOLO並無這樣的泛化學習能力，而容易做出錯誤預測。
3. CNN分類器架構中有多層max-pooling layer，使某些特徵消失。若是用更為細緻的CNN架構作為backbone分類器，則可能降低運行效率，使YOLO無法做到real-time檢測。(e.g. YOLO+VGG16只有21FPS)
4. 雖然loss function中第$\color{black}{(2)}$項有考慮相同誤差在較大圖中的影響應該要較小，但在$\color{black}{IoU}$的計算中卻是沒有辦法做到同樣的處理。

## 3.2 Comparison with Faster RCNN [Constructing]

YOLO v1的發明是嶄新的作法，和當時最好的Faster RCNN相比更快，但是判斷正確率較低一些。原文有寫出YOLO和各種物件偵測系統演算法的比較，但筆者認為不是太重要，重要的是原作第四章中YOLO和Faster RCNN在VOC2007資料集上的比較結果，所以本文也就只針對這個來做敘述。

## **Reference**

1. You Only Look Once: Unified, Real-Time Object Detection
   * [Paper][6]{:target="_blank"}
   * [Website][3]{:target="_blank"}
2. Deep Learning Specialization by Andrew Ng
   * [YouTube](https://www.youtube.com/watch?v=GSwYGkTfOKk&index=24&list=PLkDaE6sCZn6Gl29AoE31iwdVwSG-KnDzF&t=0s){:target="_blank"}
   * 如果你的時間不多的話，這門課(C4W3部分)可以幫助你在一小時左右就對Object Detection能有大致的了解
3. [Intersection over Union (IoU) for object detection@pyimagesearch.com](https://www.pyimagesearch.com/2016/11/07/intersection-over-union-iou-for-object-detection/){:target="_blank"}
99. 和YOLO論文無關的[Mathjax上色方法](http://adereth.github.io/blog/2013/11/29/colorful-equations/){:target="_blank"}



[1]: https://pjreddie.com/darknet/yolo/
[2]: https://pjreddie.com/darknet/yolov2/
[3]: https://pjreddie.com/darknet/yolov1/
[4]: https://pjreddie.com/media/files/papers/YOLOv3.pdf
[5]: https://arxiv.org/pdf/1612.08242
[6]: https://arxiv.org/pdf/1506.02640
