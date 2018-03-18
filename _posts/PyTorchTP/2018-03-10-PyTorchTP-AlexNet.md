---
layout: article
title: "PyTorch Taipei 2018 week1: AlexNet"
modified:
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser:
  thumb: 
date: 2018-03-10
---


# AlexNet
講者: Young Hu <br>
Blog: https://medium.com/@WhoYoung99/alexnet-架構概述-988113c06b4b 
論文連結: [Krizhevsky, Alex, Ilya Sutskever, and Geoffrey E. Hinton. "Imagenet classification with deep convolutional neural networks." Advances in neural information processing systems. 2012.](http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf)
重要貢獻為證明深層的訓練具有效果。
## 訓練資料
ImageNet為大型辨識資料集，共1500萬張影像，類別包含22000種。AlexNet在ImageNet Large Scale Visual Recognition Challenge (ILS-VRC)比賽中勝出。


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
