---
layout: article
title: "PyTorch Taipei 2018 week11: SS (DRAFT)"
modified: 2018-05-31
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser:
  thumb:
date: 2018-05-31
fbcomments: true
---
<img src="" width="800">

{% include toc.html %}

論文名稱: SS

以文理/顏色/形狀判斷是否為一個物體

THREE Questions

<EFFicient Graph-Based Image Segmentation>

運用圖學概念: 每個pixel為一個vector，

群內差異 Int(C): 區域內可以忍受雜質程度

群間差異 Dif(C1,C2): 兩群差異

k越大threshold越大

for-loop: 從小區域開始越來越大，遇到threshold就停下來

可參考: OTSU二值化，內部差異最大，群間差異最小



計算:
顏色space:

兩個RGB向量差異較小但視覺上差異較大故將影像轉換至HSL、HSV等color space



SIFT: HOG篩選出特徵點(向量)

特徵向量丟進K-means分成4000群

bag-of-word??

再丟進SVM

MABO: Mean Average Best Overlap → 評分標準

--------------------------------------

[Generative Model]

Gaussian Mixture Model, Variational Encoder, GAN
