---
layout: article
title: "PyTorch Taipei 2018 week1: LeNet-5"
modified: 2018-03-20
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser: PyTorchTP/LeNet5.png
  thumb: PyTorchTP/LeNet5.png
date: 2018-03-09
---

1998年Yann LeCun於《[Gradient-Based Learning Applied to Document Recognition][1]{:target="_blank"}》
一文中提出的手寫字辨識技術，為CNN領域中的經典架構。

CNN基礎架構(如convolution, pooling)早在1980年代就被[Kunihiko Fukishima(福島邦彥)][2]{:target="_blank"}
提出，但並未使用backpropagation(逆向傳播法)來更新權重。Yann LeCun重要貢獻為結合BP於CNN架構中並
大幅提高了辨識成功率，該技術被當時許多知名公司所運用，也是現今許多CNN研究的重要基礎。

LeNet-5由數層卷積層(C1、C3、C5)、sub-sampling層(S2、S4)和最後幾層全連接層組成，和單純只有全連接層的神經網路相比，LeNet-5需要訓練的權重是被共用的，
故雖連接(connections)數量多但trainable parameters(訓練參數)數量較少，能有效減少overfitting的發生。

## LeNet-5 架構
LeNet-5 的架構如下圖所示，一共七層。
<img src="../../images/PyTorchTP/LeNet5-structure.png" width="4200">

#### Input
輸入為一張張 32×32×1 的圖。

1. 刻意放大邊緣空白處:
* 文中有提到輸入圖形的尺寸遠大於手寫字大小(20×20)，是因為leNet-5對於抽取位於圖片邊緣之特徵的能力較差，
刻意放大圖片邊緣可以讓手寫字範圍皆位在圖片中央。(此時還沒有在卷積層前作padding的設計)
2. Normalization:
* 為使整張圖的平均值約略等於0，故normalize輸入圖形使白色背景的值為-0.1、筆畫黑色範圍之值為1.175。

<br/>

#### Squashing Function(原文解釋部分在附錄A)
LeNet-5前六層的輸出值皆會通過Squashing Function(應該和現今所稱的activation相似)，原作選用 $ f(a)=Atanh(Sa) $，其中$a$為該層輸出值, $A$為1.7159, $S$為$\frac{2}{3}$，該方程式(藍線)、其一階導數(紅線)與其二階導數(橘線)圖形如下 (plot by [Google Calculator](https://www.google.com.tw/search?ei=CH2wWsfYEIqn8QXepJyYDw&q=1.7159*tanh%282%2F3*x%29%2C+1.14393*%281-%28tanh%282%2F3*x%29%29%5E2%29%2C+-1.52524*%28%28tanh%282%2F3*x%29%29%29*%281-%28tanh%282%2F3*x%29%29%5E2%29&oq=1.7159*tanh%282%2F3*x%29%2C+1.14393*%281-%28tanh%282%2F3*x%29%29%5E2%29%2C+-1.52524*%28%28tanh%282%2F3*x%29%29%29*%281-%28tanh%282%2F3*x%29%29%5E2%29&gs_l=psy-ab.3...41855.43872.0.46329.2.2.0.0.0.0.34.62.2.2.0....0...1c.1.64.psy-ab..0.0.0....0.-TLCZyd_oos){:target="_blank"})

<img src="../../images/PyTorchTP/LeNet5-tanh.png" width="600">

優點:

1. 具對稱性的squashing function收斂較快 (但weight不能太小，否則收斂極慢，要小心調整初始值)
2. $$f(\pm 1)=\pm 1$$ → 增益約等於1、將輸出壓縮在$\pm1$之間
3. 二階導數約在$\pm1$時最大 → 保持loss能依靠backprop持續下降



<br/>

#### C1
第一層為卷積層，卷積的細節在另一文章有寫過了，不再複述。

1. 用了6個大小為5×5×1的filter。
2. feature map大小為28×28 ($32-5+1=28$) 共6個。
3. trainable parameters個數為156 ($(5^2×1)×6+6=156$，含bias)。
4. connections個數為122,304 ($156×(28^2)=122,304$)。

<br/>

#### S2
和現在常用的pooling layer相近，選取用法相同但計算方式不同，是將大小2×2的kernel(stride=2)所選取到的4個數加總，乘以一個訓練參數，再加上一個訓練參數。

1. feature map大小為14×14 ($28/2=14$) 共6個。
2. trainable parameters個數為12 ($6×2$)。
3. connections個數為5,880 ($(2^2+1)×14^2×6=5,880$)。

<br/>

#### C3
同樣為卷積層，但為了減少運算量，並不是所有filter都會和輸入圖形做convolution，有做convolution的配對如下圖。不過目前硬體運算能力和當時相比已經大幅增加，故此配對方法大多棄用。
<img src="../../images/PyTorchTP/lenet5-c3.jpg" width="420"><br/>

1. 用了16個大小為5×5×6的filter。
2. feature map大小為10×10 ($14-5+1=10$) 共16個。
3. trainable parameters個數為1516 ($(3×6+4×6+4×3+6×1)×(5^2)+16=1516$)。
4. connections個數為151,600 ($1516×(10^2)=151,600$)。

<br/>

#### S4
同S2。

1. feature map大小為5×5 ($10/2=5$) 共16個。
2. trainable parameters個數為32 ($16×2$)。
3. connections個數為2,000 ($(2^2+1)×5^2×16=2,000$)。

<br/>

#### C5
同樣為卷積層，雖輸出的每張feature maps大小為1×1(使得實際上做的事情等同於全連接層)，但若最一開始的輸入圖形大於32×32，這裡的輸出便會大於1×1，故不稱之為全連接層(FC)。

1. 用了120個大小為5×5×16的filter。
2. feature map大小為1×1 ($5-5+1=1$) 共120個。
3. trainable parameters個數為48,120 ($(5^2×16)×120+120=48,120$)。
4. FC層之connections個數同trainable parameters。

<br/>

#### F6
全連接層，84個neurons。

1. trainable parameters個數為10,164 ($120×84+84=10,16$)。
2. FC層之connections個數同trainable parameters。
3. 選擇使用84個neurons之原因:
- 整理中

<br/>

#### Output
並非像一般FC layer為 $y_i=\sigma(w_{ij}\bullet x_j+b)$，這裡使用的是RBF(Euclidean Radius Basis function)$ y_i = \sum_j(x_j-w_{ij})^2 $

<br/>

#### Loss Function(整理中):
1. MSE(mean squared error)
2. Cross-entropy

<br/>

#### Reference

1. [LeCun, Y., Bottou, L., Bengio, Y., & Haffner, P. (1998). Gradient-based learning applied to document recognition. Proceedings of the IEEE, 86(11), 2278-2323. DOI: 10.1109/5.726791][1]{:target="_blank"}
1. 本周[講解投影片](https://hackmd.io/p/BkxYFCnOM){:target="_blank"} by 彭駿達 (國立中央大學研究助理)
2. [知乎: CNN（卷积神经网络）最早是哪一年提出，是如何发展的？](https://www.zhihu.com/question/47705441){:target="_blank"}
3. [LeNet-5--Yann LeCun](http://yann.lecun.com/exdb/lenet/index.html){:target="_blank"}
4. [zouxy09's blog](http://blog.csdn.net/zouxy09/article/details/45288129){:target="_blank"}
5. [Tony Tan's blog](https://tony4ai.com/2017/09/13/Deep-Learning-LeNet/){:target="_blank"}

[1]: http://yann.lecun.com/exdb/publis/pdf/lecun-98.pdf
[2]: http://personalpage.flsi.or.jp/fukushima/index-e.html
