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
  logo: PyTorchTP/LeNet5.png
date: 2018-03-09
fbcomments: yes
---

LeNet-5為1998年Yann LeCun於《[Gradient-Based Learning Applied to Document Recognition][1]{:target="_blank"}》
一文中提出的手寫字辨識技術，為CNN領域中的經典架構。原作其實除了LeNet-5，還包含非常多東西(e.g. 和其他model的比較、LeNet的變形以及其適用時機的討論等等)，不過本篇文章只單純講述LeNet-5。

CNN基礎架構早在1980年代就被[Kunihiko Fukishima(福島邦彥)][2]{:target="_blank"}
提出，但並未使用backpropagation(逆向傳播法)來更新權重。Yann LeCun重要貢獻為結合BP於CNN架構中並
大幅提高了辨識成功率，該技術被當時許多知名公司所運用，也是現今許多CNN研究的重要基礎。

LeNet-5由數層卷積層(C1、C3、C5)、sub-sampling層(S2、S4)和最後幾層全連接層組成，和單純只有全連接層的神經網路相比，LeNet-5需要訓練的權重是被共用的，
故雖連接(connections)數量多但trainable parameters(訓練參數)數量較少，能有效減少overfitting的發生。

LeNet-5 的架構如下圖所示:
<img src="../../images/PyTorchTP/LeNet5-structure.png" width="4200">

{% include toc.html %}

## Input Image
輸入為一張張 32×32×1 的圖。

1. 刻意放大邊緣空白處:
* 相當於padding，文中有提到輸入圖形有刻意在四周補上空白邊框，是為了大於手寫字大小(28×28)，因為leNet-5對於抽取位於圖片邊緣之特徵的能力較差，刻意放大圖片邊緣可以讓手寫字範圍皆位在圖片中央。後來演變成每次做卷積前都可以進行一次padding，防止feature maps不斷縮小。

2. Normalization:
* 為使整張圖的平均值約略等於0，故normalize輸入圖形使白色背景的值為-0.1、筆畫黑色範圍之值為1.175。

<br/>

## Squashing Function
LeNet-5前六層的輸出值皆會通過Squashing Function(應該和現今所稱的activation相似)，原作選用 $ f(a)=Atanh(Sa) $，其中$a$為該層輸出值, $A$為1.7159, $S$為$\frac{2}{3}$，該方程式(藍線)、其一階導數(紅線)與其二階導數(橘線)圖形如下 (plot by [Google Calculator](https://www.google.com.tw/search?ei=CH2wWsfYEIqn8QXepJyYDw&q=1.7159*tanh%282%2F3*x%29%2C+1.14393*%281-%28tanh%282%2F3*x%29%29%5E2%29%2C+-1.52524*%28%28tanh%282%2F3*x%29%29%29*%281-%28tanh%282%2F3*x%29%29%5E2%29&oq=1.7159*tanh%282%2F3*x%29%2C+1.14393*%281-%28tanh%282%2F3*x%29%29%5E2%29%2C+-1.52524*%28%28tanh%282%2F3*x%29%29%29*%281-%28tanh%282%2F3*x%29%29%5E2%29&gs_l=psy-ab.3...41855.43872.0.46329.2.2.0.0.0.0.34.62.2.2.0....0...1c.1.64.psy-ab..0.0.0....0.-TLCZyd_oos){:target="_blank"})

<img src="../../images/PyTorchTP/LeNet5-tanh.png" width="600">

優點:

1. 具對稱性的squashing function收斂較快 (但weight不能太小，否則收斂極慢，要小心調整初始值)
2. $$f(\pm 1)=\pm 1$$ → 增益約等於1、將輸出壓縮在$\pm1$之間
3. 二階導數約在$\pm1$時最大 → 保持loss能依靠backprop持續下降



<br/>

## 1ˢᵗ Layer: Convolution Layer C1
第一層為卷積層，卷積的細節在另一文章有寫過了，不再複述。

1. 用了6個大小為5×5×1的filter。
2. feature map大小為28×28 ($32-5+1=28$) 共6個。
3. trainable parameters個數為156 ($(5^2×1)×6+6=156$，含bias)。
4. connections個數為122,304 ($156×(28^2)=122,304$)。

<br/>

## 2ⁿᵈ Layer: Sub-sampling Layer S2
和現在常用的pooling layer相近，選取用法相同但計算方式不同，是將大小2×2的kernel(stride=2)所選取到的4個數加總，乘以一個訓練參數，再加上一個訓練參數。

1. feature map大小為14×14 ($28/2=14$) 共6個。
2. trainable parameters個數為12 ($6×2$)。
3. connections個數為5,880 ($(2^2+1)×14^2×6=5,880$)。

<br/>

## 3ʳᵈ Layer: Convolution Layer C3
同樣為卷積層，但為了減少運算量，並不是所有filter都會和輸入圖形做convolution，有做convolution的配對如下圖，這種做法也有強迫抽取不同特徵的功能。不過目前硬體運算能力和當時相比已經大幅增加，故此配對方法大多棄用。

<img src="../../images/PyTorchTP/lenet5-c3.jpg" width="420"><br/>

1. 用了16個大小為5×5×6的filter。
2. feature map大小為10×10 ($14-5+1=10$) 共16個。
3. trainable parameters個數為1516 ($(3×6+4×6+4×3+6×1)×(5^2)+16=1516$)。
4. connections個數為151,600 ($1516×(10^2)=151,600$)。

<br/>

## 4ᵗʰ Layer: Sub-sampling Layer S4
同S2。

1. feature map大小為5×5 ($10/2=5$) 共16個。
2. trainable parameters個數為32 ($16×2$)。
3. connections個數為2,000 ($(2^2+1)×5^2×16=2,000$)。

<br/>

## 5ᵗʰ Layer: Convolution Layer C5
同樣為卷積層，雖輸出的每張feature maps大小為1×1(使得實際上做的事情等同於全連接層)，但若最一開始的輸入圖形大於32×32，這裡的輸出便會大於1×1，故不稱之為全連接層(FC)。

1. 用了120個大小為5×5×16的filter。
2. feature map大小為1×1 ($5-5+1=1$) 共120個。
3. trainable parameters個數為48,120 ($(5^2×16)×120+120=48,120$)。
4. FC層之connections個數同trainable parameters。

<br/>

## 6ᵗʰ Layer: Fully-connected Layer F6
全連接層，如早期的Multi-Layer Perceptron (MLP) 一樣是計算 $y_i=\sigma(w_{ij}\bullet x_j+b)$，84個neurons。

1. trainable parameters個數為10,164 ($120×84+84=10,16$)。
2. FC層之connections個數同trainable parameters。
3. 選擇使用84個neurons之原因在下一層解釋。


<br/>

## 7ᵗʰ Layer: Fully-connected RBF Output Layer
這一層的輸出使用的是RBF(Euclidean Radius Basis function)

$$ y_i = \sum_j(x_j-w_{ij})^2 $$

以下節錄自原文:

```
The output of a particular RBF can be interpreted as a penalty term measuring the fit between the input pattern and a model of the class associated with the RBF. In probabilistic terms, the RBF output can be interpreted as the unnormalized negative log-likelihood of a Gaussian distortion in the space of configuration of layer F6.
```
LeNet-5以印刷用的ASCII set為目標，希望能判斷手寫字是其中的哪一類(即上文中的class)。這裡的ASCII set是一張張大小為7×12(=84)的點陣圖(如左下圖，有筆畫部分為+1、背景為-1)，被直接拿來當作這一層的固定值權重(像是文中要作阿拉伯數字辨識，就選取代表0~9的那十個向量作為這一層的$w_i$，故最後有十個輸出)，RBF便是計算F6輸出值(即上文中的input pattern)和這些目標向量的歐式距離。在右下圖中可以看到LeNet-5經訓練過後，F6的輸出和ASCII set中的圖形已經非常類似。

<figure class="half">
	<a target="blank" href="../../images/PyTorchTP/lenet5-ASCII.jpg"><img src="../../images/PyTorchTP/lenet5-ASCII.jpg" width="800"></a>
	<a target="blank" href="../../images/PyTorchTP/lenet5-F6.jpg"><img src="../../images/PyTorchTP/lenet5-F6.jpg" width="300"></a>
	<figcaption></figcaption>
</figure>

<br/>

## Loss Function
MSE(mean squared error):

$$E(W)=\frac{1}{P}\sum_{p=1}^{P} y_{D^p}(Z^p,W) $$

其中$y_{D^P}$即為前面說的RBF，是計算第$P$張input在F6層的輸出和該input正確class權重的歐式距離。$E(W)$便為RBF輸出的平均值。

原文提到這樣的計算方法若是輸出層的W非設為固定值，則loss function需要做些調整才能避免出現trivial solution(模型忽略input直接輸出0)，
但LeNet-5是將輸出層W設為固定值，就不多做討論。

<br/>

## Reference

1. [LeCun, Y., Bottou, L., Bengio, Y., & Haffner, P. (1998). Gradient-based learning applied to document recognition. Proceedings of the IEEE, 86(11), 2278-2323. DOI: 10.1109/5.726791][1]{:target="_blank"}
1. 本周[講解投影片](https://hackmd.io/p/BkxYFCnOM){:target="_blank"} by 彭駿達 (國立中央大學研究助理)
2. [Marcel Wang's blog](http://hemingwang.blogspot.tw/2017/03/ailenet-f6.html){:target="_blank"}
2. [知乎: CNN（卷积神经网络）最早是哪一年提出，是如何发展的？](https://www.zhihu.com/question/47705441){:target="_blank"}
3. [LeNet-5--Yann LeCun](http://yann.lecun.com/exdb/lenet/index.html){:target="_blank"}
4. [zouxy09's blog](http://blog.csdn.net/zouxy09/article/details/45288129){:target="_blank"}
5. [Tony Tan's blog](https://tony4ai.com/2017/09/13/Deep-Learning-LeNet/){:target="_blank"}

[1]: http://yann.lecun.com/exdb/publis/pdf/lecun-98.pdf
[2]: http://personalpage.flsi.or.jp/fukushima/index-e.html
