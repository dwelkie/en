---
layout: article
title: "PyTorch Taipei 2018 week5: VGGNet (DRAFT)"
modified: 2018-04-12
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser:
  thumb:
date: 2018-04-12
fbcomments: true
---
<img src="" width="800">

{% include toc.html %}

大量3x3filter
5x5 replaced by 2layer 3x3
7x7 replaced by 3layer 3x3
more nonlinearity
VGG需要更新的參數極多

2x2 s=2 max pooling
(better than avg pooling)

random training size [256,512]

testing rescale to 280 then crop 5 224x224

deeper better
prove LRN無用
training tips

BN (batch size太小則無用)
Layer Normalization (只適用RNN)

C++ Caffe
4x Titan black
time: 2~3weeks (transfer learning 縮時)

LRN -> 錯誤率微上升
C 1x1conv is better

D 1x1->3x3conv better than C(VGG16)
E is slightly better (VGG19)
太深會有資料耗損(ResNet減少耗損)

BCDE initial = A
other = nand

[conclusion]
small conv better
lrn useless
DE -> ensemble(平均) -> 和googlenet差不多


github: CNN benchmark



resnet
