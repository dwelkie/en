---
layout: topic
title: "TBrain StudyGroup Discussion Record"
date: 2018-02-28
modified: 2018-04-17
tags:
image:
  feature: brainbanner.png
fbcomments: yes
description: "IT IS A SECRET"
TopicShare: true
---

[T-Brain比賽資訊](https://tbrain.trendmicro.com.tw/Competitions/Details/2)
[T-Brain比賽討論](https://tbrain.trendmicro.com.tw/Discussion/Forum_3)

### 基礎 RNN 學習資源()

#### 線上課程

1. [台大電機李宏毅教授](https://www.youtube.com/watch?v=xCGidAeyS4M&list=PLJV_el3uVTsPy9oCRY30oBPNLCo89yu49&index=30){:target="_blank"}
2. [吳恩達線上課程](https://www.youtube.com/playlist?list=PLBAGcD3siRDittPwQDGIIAWkjz-RucAc7){:target="_blank"}
3. [Standford CS231n](https://www.youtube.com/watch?v=iX5V1WpxxkY){:target="_blank"}

#### 推薦書籍

1. [Deep Learning｜用Python進行深度學習的基礎理論實作 ](https://www.tenlong.com.tw/products/9789864764846){:target="_blank"}



## 名詞解釋

1. TEJ 股價模組──台灣市場 簡介](https://www.tej.com.tw/webtej/doc/wprcd.htm)
1. http://blog.xuite.net/auster.lai/twblog/123091930-股票名詞解釋
2. https://goose168.com/股市入門股市術語看久了就成為常識/
3. http://hclovenote.blogspot.tw/2017/11/2017-11-26.html
4. http://ey90223.pixnet.net/blog/post/278439808-%E8%AA%8D%E8%AD%98%E6%AD%A3%E5%90%91%E5%8F%8D%E5%90%91%E6%A7%93%E6%A1%BFetf

## 資料下載

1. [Yahoo](https://finance.yahoo.com/quote/vt/history?ltr=1)



## PTT投資相關

1. [PTT Stock](https://www.ptt.cc/man/Stock/index.html)
2. [PTT Foreign_Inv](https://www.ptt.cc/man/Foreign_Inv/index.html)



定義特徵的部分  我初步的想法是蒐集全球一些較知名的指數、覺得會影響台股狀況的標的，例如  VT(全球股市基金ETF)  VTI(美國股市基金ETF)
建議抓幾個大的市場指數基金過去5年的歷史資料進來當特徵集試試看
全球(VT)  美國(VTI)  歐洲(VGK)  亞太(VPL) 新興(VWO)

預測結果只能在週五18:00~週一06:00 提交, 每天限提交2次, 以每個隊伍在每週一06:00前最後提交的檔案計算成績
第一階段於第五週至第八週 (4/27/2018 – 5/25/2018) 開始計算各隊伍的週積分, 但不列入總積分，5/25之後才開始正式算成績
預測不止是漲跌, 還有點數
每個標的  每點都有至少六項資料：時間  開盤  收盤  最高 最低  交易量

tetfp.csv: ETF股價資料(名目股價)
taetfp.csv: ETF調整後股價資料(調整股價)
另外兩份為個股

在『高頻交易』的議題上，好像常直接用線性回歸來做預測
隨機森林, 決策樹

台股很容易受美股影響  所以可以預期代表美股的VTI  在預測0050上權重應該挺大的
如果不挑ETF  是還可以挑其他基金啦~  但我覺得目標就"市場"等級的標的

日本是經濟大國
韓國經濟規模跟我們很像
也會對我們有影響
或許也可以考慮匯率 或是各大權值股
把 "世界各市場指數"   加上"對各市場(國)的匯率"
國外ADR

還有一種指標叫反指標
