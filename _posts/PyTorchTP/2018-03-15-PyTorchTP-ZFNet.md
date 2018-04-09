---
layout: article
title: "PyTorch Taipei 2018 week2: ZFNet(DRAFT)"
modified:
categories: articles
excerpt: ""
tags: [DL, PyTorchTP]
image:
  feature:
  teaser:
  thumb:
date: 2018-03-15
fbcomments: yes
---

上週提到[AlexNet在ILSVRC-2012中獲勝，自此CNN技術開始備受矚目](../PyTorchTP-AlexNet/){:target="_blank"}。而這周介紹的[ZFNet][1]{:target="_blank"}是ILSVRC-2013冠軍，ZFNet以AlexNet為基礎，透過視覺化技術窺探卷積層當中到底發生了甚麼事，依此發現AlexNet的缺點並且進一步作調整。ZFNet和AlexNet相比，中間幾層conv layer較厚(feature maps數量較多)、第一層的stride和kernel size較小、Loss function為Cross Entropy、只用一張GPU(故沒有像AlexNet分兩路進行)。


The ILSVRC 2013 winner was a Convolutional Network from Matthew Zeiler and Rob Fergus. It became known as the ZFNet (short for Zeiler & Fergus Net). It was an improvement on AlexNet by tweaking the architecture hyperparameters, in particular by expanding the size of the middle convolutional layers and making the stride and filter size on the first layer smaller.
ZFNet/Deconv+Unpool.jpg

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


[1]: https://arxiv.org/pdf/1311.2901.pdf
