---
layout: article
title: "PyTorch Taipei 2018 week1: AlexNet"
modified: 2018-03-23
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser: PyTorchTP/AlexNet.png
  thumb: PyTorchTP/AlexNet.png
date: 2018-03-10
---

ImageNet為大型圖片資料集，約1500萬張已標記影像，類別約22,000種。ImageNet Large Scale Visual Recognition Challenge (ILSVRC)是Stanford教授李飛飛所領導[Vision Lab](http://vision.stanford.edu/people.html){:target="_blank"}在2010年開始舉辦，基於ImageNet的圖片辨識技術競賽([2017 workshop](https://www.youtube.com/watch?v=jYvBmJo7qjc){:target="_blank"}上宣布為最後一屆，之後會調整dataset內容並與Kaggle合辦)。

本文介紹的AlexNet是[ILSVRC-2012](http://www.image-net.org/challenges/LSVRC/2012/results.html){:target="_blank"}的冠軍，作者為多倫多大學教授[Geoffrey Hinton](http://www.cs.toronto.edu/~hinton/){:target="_blank"}(主要貢獻有backprop和近期的capsule)和他當時的兩位博士生[Alex Krizhevsky](https://www.cs.toronto.edu/~kriz/){:target="_blank"}和[Ilya Sutskever](http://www.cs.toronto.edu/~ilya/){:target="_yblank"}，不僅大勝其他對手，表現上也超越當時技術，後來的ZFnet, SPPnet, VGG技術也都是在其基礎之上做修正，似乎也是從那時候開始DL相關技術越來越被各界所重視。

AlexNet架構:
<img src="../../images/PyTorchTP/AlexNetStruc.png" width="800">


{% include toc.html %}

重要貢獻為證明深層的訓練具有效果。
## 訓練資料
AlexNet在比賽中勝出。


## 架構 (論文中的section3~5)
論文中依照重要程度列出他認為這個架構能在比賽中勝出的關鍵。

### 3.

#### 3.1 使用ReLU
一階微分經過訓練之後趨近於0

Softplus為ReLU之可微分的改良版

使用ReLU，輸出層用Softmax

#### 3.2 using GPUs
兩張Nvidia GTX 580的平行計算

#### 3.3 Local Response Normalization (LRN)


#### 3.4 Overlapping Pooling
解決Max Pooling損失太多訊號的缺點，使用stride=1的Max Pooling

※但有研究顯示效果並沒有非常好


### 4. Avoid Overfitting

#### 4.1 Data Aug
1. 256x256隨機裁切224224
2. PCA

#### 4.2 Dropout



Q: Why using Softmax in the output layer?
A: It gives the final result as the Probability?

Q: ReLU?
A: It mimics the behaviour of (Biology) neuron. It gives positive output when input is larger than threshold.

Leaky ReLU

Q: When to using Dropout?
A: When you get a decent performance of input
In this paper, the dropout ratio is 0.5.

## Reference

1. [Alex Krizhevsky, Ilya Sutskever, and Geoffrey E. Hinton. 2012. ImageNet classification with deep convolutional neural networks. In Proceedings of the 25th International Conference on Neural Information Processing Systems - Volume 1 (NIPS'12), F. Pereira, C. J. C. Burges, L. Bottou, and K. Q. Weinberger (Eds.), Vol. 1. Curran Associates Inc., USA, 1097-1105.][1]{:target="_blank"}
2. [本周講者Young Hu部落格][2]{:target="_blank"}

[1]: http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf
[2]: https://medium.com/@WhoYoung99/alexnet-架構概述-988113c06b4b
