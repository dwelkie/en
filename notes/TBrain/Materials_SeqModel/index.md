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

{% include toc.html %}

1. TBrain 比賽資訊
1. Sequnce Model 學習資源
2.












## TBrain

[T-Brain比賽資訊](https://tbrain.trendmicro.com.tw/Competitions/Details/2){:target="_blank"}<br>
[T-Brain比賽討論](https://tbrain.trendmicro.com.tw/Discussion/Forum_3){:target="_blank"}

比賽評分規則:

<img src="../../images/T/rules.jpg">

* 預測不止是漲跌, 還有點數
* 每個標的、每個點都有至少六項資料：時間、開盤、收盤、最高、最低、交易量

官方training data:

1. tetfp.csv: ETF股價資料(名目股價)
2. taetfp.csv: ETF調整後股價資料(調整股價)
3. 另外兩份為個股

### 各種連結

1.  ML/DL線上課程
   * [台大電機李宏毅教授](https://www.youtube.com/watch?v=xCGidAeyS4M&list=PLJV_el3uVTsPy9oCRY30oBPNLCo89yu49&index=30){:target="_blank"}
   * [吳恩達線上課程](https://www.youtube.com/playlist?list=PLBAGcD3siRDittPwQDGIIAWkjz-RucAc7){:target="_blank"}
   * [Standford CS231n](https://www.youtube.com/watch?v=iX5V1WpxxkY){:target="_blank"}
2. 推薦書籍
   *  [Deep Learning｜用Python進行深度學習的基礎理論實作 ](https://www.tenlong.com.tw/products/9789864764846){:target="_blank"}
3. 金融名詞解釋 (估狗隨便抓的)
   * [TEJ 股價模組──台灣市場 簡介](https://www.tej.com.tw/webtej/doc/wprcd.htm){:target="_blank"}
   * [股票名詞解釋](http://blog.xuite.net/auster.lai/twblog/123091930-股票名詞解釋){:target="_blank"}
   * [股市入門股市術語](https://goose168.com/股市入門股市術語看久了就成為常識/){:target="_blank"}
   * [WTH](http://hclovenote.blogspot.tw/2017/11/2017-11-26.html){:target="_blank"}
   * [WTF](http://ey90223.pixnet.net/blog/post/278439808-%E8%AA%8D%E8%AD%98%E6%AD%A3%E5%90%91%E5%8F%8D%E5%90%91%E6%A7%93%E6%A1%BFetf){:target="_blank"}
4. 資料下載來源
   * [Yahoo](https://finance.yahoo.com/quote/vt/history?ltr=1){:target="_blank"}
5. PTT投資相關
   * [PTT Stock](https://www.ptt.cc/man/Stock/index.html){:target="_blank"}
   * [PTT Foreign_Inv](https://www.ptt.cc/man/Foreign_Inv/index.html){:target="_blank"}



[特徵定義]
<br>初步的想法是蒐集全球一些較知名的指數、覺得會影響台股狀況的標的，例如：VT(全球股市基金ETF)、VTI(美國股市基金ETF)
<br>建議抓幾個大的市場指數基金過去5年的歷史資料進來當特徵集試試看：全球(VT)、美國(VTI)、歐洲(VGK)、亞太(VPL)、新興(VWO)

[Possible model]

1. 隨機森林
2. 決策樹
3. 在『高頻交易』的議題上，好像常直接用線性回歸來做預測

[其他影響台股因素]

1. 美股：台股很容易受美股影響、所以可以預期代表美股的VTI在預測0050上權重應該挺大的
2. 可以挑其他基金(或其他"市場"等級的標的)
3. 日韓經濟指數
4. 匯率
5. 各大權值股
6. 把 "世界各市場指數" 加上 "對各市場(國)的匯率"
7. 國外ADR
8. 參考反指標
9. RSI乖離率跟MA均線可以用，官方給的成交量可以用，還有法人的買賣超/成交量or 買賣超占成交量的比重

## 4/25開會標的

1. 研究未來co-work(coding) 平台？
2. 針對幾個目標(模型) or 興趣分組去測試

### regression
(Try by Max Cian)
<br>calculate MSE with Y_train and Yp_train:  7.224495810008536e-05
<br>calculate MSE with Y_test and Yp_test:  9.341841968634554e-05

[問題]

1. feature 怎麼定?
2. 簡單的用regression  fit出來後  要怎麼evaluate結果比較直覺?
  * 定義loss function(通常是RMSE)然後去比較
3. 如何讓 regression 處理 sequence 問題?
  * 我們的資料有2013/1/1~2018/3/31，我拿最近的30天當測試集，其他的當訓練集，
我的想法是，訓練5個模型，分別預測週一~週五的漲幅，漲幅基準線是前一週五為止的資料，回顧可能7個"交易日"或14日或30日，
就是我[上面圖中](../../images/T/OLHC.png)的1~n天

### LSTM

[try by 林家豪]: 把前七天、每天的五樣raw data擺進特徵向量中，總共35個特徵，(假設沒考慮其他標的的話)，如果考慮其他標的對它的影響就是35*N個標的，但結果沒收斂
<br>[try by Sophia Lien]: LSTM 預測下一天(data好像事先放股票類股指數的數據)，Test Score: 0.00021671 MSE

### 特徵

OLHC → raw data變成改變量 (Try by Max Cian, Sophia Lien)

<img src="../../images/T/OLHC.png" width="350">

我的切入點是  過去許多天的各項數值的變化  會影響今天的變化 試圖捕捉的特徵  應該跟MA均線或是RSI類似?
但因為目標也是變化量(±1之間的連續值)  所以只能用regression來做?

[可朝兩方向]

1. 大量時間著重在特徵工程:
   * 著重在特徵是否具有足夠的描述性或解釋性
2. 單純用LSTM暴力去姐 想不同架構

### 合作方式

暫定分兩小組: LSTM黑暗魔法暴力解組、Regression特徵工程系新解組


### 4/29

漲幅變化率做input: 每項feature在同一標準下正規化之後可以比較

regression高頻交易: 特徵選擇花較多時間、工作重視速度所以無法用LSTM

找影響短期投資客心理的指標

ARIMA tutorial:

1. [ARIMA model](https://people.duke.edu/~rnau/411arim2.htm)
1. [The Autocorrelation Function](https://www.alanzucconi.com/2016/06/06/autocorrelation-function/)
2. [銷售量預測 -- LSTM 的另一個應用](https://ithelp.ithome.com.tw/articles/10195400?sc=iThelpR)

[LSTM 實作股價預測](https://www.finlab.tw/用深度學習幫你解析K線圖！/)






5/3 @NTU普通
