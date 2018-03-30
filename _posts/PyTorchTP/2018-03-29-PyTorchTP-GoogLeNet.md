---
layout: article
title: "PyTorch Taipei 2018 week4: GoogLeNet (DRAFT)"
modified: 2018-03-29
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser:
  thumb:
date: 2018-03-29
fbcomments: true
---
<img src="" width="800">

{% include toc.html %}

Hebbian principle: 1940s~50s之神經生理學家
"neurons that fire together, wire together"
multi-processing: 像靈長類視覺神經

預想將來需要將NN技術應用在嵌入式系統: 希望節省運算資源

生物神經:
第一層: 三種細胞接收RGB訊號 另一個接收明暗(灰階)
第二層: 組合顏色形狀等 再傳入大腦

由貓視神經實驗開啟一系列研究

10^12神經元 只有10^4神經束 其他不重要
67歲的人神經元數量>9歲 → 只有重要的神經元被留下

Hebbian
少數或勝者主導

gilbert filter: 多個大小不同的filter

稀疏連結越趨重要
但需要壓縮成相對denser的矩陣→運算加快
更緻密更具代表性的訊息

Inception module
{1, 3, 5conv & 3x3 max pooling} → 結果佳但效率極差
使用NIN(network in network)來降維

{3,5conv後和3pooling之前有1x1降維(有relu)}→壓縮資料而加速成功

ILSVRC-2014
22layer, average pooling before output
在不同層數之分類器輸出值以不同加權加總 → 後面幾層分類器沒有進步太多 → 參考前面資訊

data augmentation(非重點)
crop出越多圖 可降低error rate

7版本googlenet → ensemble做最終結果


1. 主講人 [台北榮總醫師 周延]

[1]:
[2]:
[3]:
[4]:
[5]:  
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
