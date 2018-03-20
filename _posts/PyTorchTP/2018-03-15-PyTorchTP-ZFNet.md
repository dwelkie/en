---
layout: article
title: "PyTorch Taipei 2018 week2: ZFNet"
modified:
categories: articles
excerpt: ""
tags: [DL, PyTorchTP]
image:
  feature:
  teaser:
  thumb:
date: 2018-03-10
---




2013 ImageNet 冠軍
以視覺化方法洞察AlexNet並作微調

看filter學到甚麼 Deconvolution

* Max Unpooling by Switches
switches會記錄max pooling 出現最大值的位置， unpooling的時候還原，其他位置補0

* filter轉置
1. dot(img to columns, filter to rows)


DeconvNet用途:
生成圖片unsupervised feature learning
GAN生成圖
etc


HOW?
training feature map
github/jalused

觀察:
more layer, more epoches needed

the effects of scaling & translation decreased deeper layer

The 1st layer in the AlexNet is empty -> how to improve it?
1. filter downsize (11->7)
2. stride 4 -> 2
3. more filtera in deeper layer
4. loss function: cross-entropy loss

Effect:
1. err rate 16.4% -> 11.2%
2. only using 1.3mil picture


補1
[熱圖]
顯示net抓到那些地方

補2 from 李宏毅
what filter can learn
所有feature map回train輸入圖

FC 抓到較為全體的特徵
output層輸出圖已經無法被人理解


111111111111111
