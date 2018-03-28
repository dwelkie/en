---
layout: topic
title: "PyTorch Taipei 2018 筆記整理"
date: 2018-02-28T11:39:03-04:00
modified:
#excerpt: ""
tags: []
image:
  feature: pytorch-header.jpg
fbcomments: yes
---

### 1. PyTorch Taipei 緣起

[PyTorch Taiwan](https://www.facebook.com/groups/2027602154187130/){:target="_blank"}是[Marcel Wang](https://www.linkedin.com/in/marcel-wang-3a988b7a/){:target="_blank"}先生為促進台灣深度學習發展，在網路上號召成立的深度學習讀書會，
<br>目前有[PyTorch Taipei](http://hemingwang.blogspot.tw/2018/01/pytorchpytorch-taipei_20.html){:target="_blank"}和[PyTorch Hsinchu](http://hemingwang.blogspot.tw/2018/01/pytorchpytorch-hsinchu.html){:target="_blank"}兩個子分會。

<img src="../../images/PyTorchTP/pytp1.jpg">

2018.03.08 第一次讀書會(PC: Eric Yang)

### 2. 讀書會資訊
時間: 每週四19:00~21:00

內容:

1. 經典論文導讀
 - 預計進行18周(共19篇論文)
 - 參加者建議已具備ML/DL/[CNN](../basic-CNN-FP){:target="_blank"}基礎知識

2. PyTorch實作
 - 由台大CS+X計畫負責人[Pecu老師](https://github.com/pecu){:target="_blank"}及其團隊負責帶領
 - [進度表](https://github.com/pecu/PyTorch_CSX){:target="_blank"}

地點: 台灣大學普通教學館305教室 <br>
停車資訊: [台大校內停車地點](http://general.ga.ntu.edu.tw/uploads/archive_file_multiple/file/56d1ee4f48b8a10b9200024b/%E6%A0%A1%E7%B8%BD%E5%8D%80%E6%B1%BD%E6%A9%9F%E8%BB%8A%E5%81%9C%E8%BB%8A%E5%A0%B4%E5%8D%80%E4%BD%8D%E5%9C%96-103-09.pdf){:target="_blank"}及[收費規則](http://general.ga.ntu.edu.tw/zh_tw/qa/校園臨時停車收費費率-22859878){:target="_blank"}，校友若持[校友證]( http://www.alumni.ntu.edu.tw/card_benefits.html ){:target="_blank"}則能以優惠價格停車
<div class="mapouter"><div class="gmap_canvas"><iframe width="600" height="350" id="gmap_canvas" src="https://maps.google.com/maps?q=普通教學館&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe></div><a href="https://www.maps-erstellen.de"></a><style>.mapouter{overflow:hidden;height:350px;width:600px;}.gmap_canvas {background:none!important;height:350px;width:600px;}</style></div>

<br/>

### 3. 論文導讀進度表(附論文連結&講者投影片連結)
Link for Batch Download:

 - [Separate PDFs in .Rar](https://drive.google.com/open?id=1B8Jwm-WKUHqtcCMH_nZxWTh2yvkrjBXC){:target="_blank"}
 - [All in one PDF](https://drive.google.com/open?id=1yNuhvzGn7qGqEfxolJlSBwwyEf45jWag){:target="_blank"}

| CNN                                              | Pre R-CNN                              | R-CNN                                     |
| ------------------------------------------------ |--------------------------------------- | ----------------------------------------- |
| 3/08 [LeNet][1]{:target="_blank"} [(slide)][20]{:target="_blank"} & [AlexNet][2]{:target="_blank"} [(blog)][21]{:target="_blank"} | 4/26 [PreVGGNet][8]{:target="_blank"} | 6/07 [R-CNN][14]{:target="_blank"} |
| 3/15 [ZFNet][3]{:target="_blank"} [(slide)][22]{:target="_blank"}                | 5/03 [SVM][9]{:target="_blank"}        | 6/14 [SPPNet][15]{:target="_blank"}       |
| 3/22 [NIN][4]{:target="_blank"} [(slide)][23]{:target="_blank"}                  | 5/10 [SMO][10]{:target="_blank"}       | 6/21 [Fast R-CNN][16]{:target="_blank"}   |
| 3/29 [GoogLeNet][5]{:target="_blank"}            | 5/17 [DPM][11]{:target="_blank"}       | 6/28 [Faster R-CNN][17]{:target="_blank"} |
| 4/12 [VGGNet][6]{:target="_blank"}               | 5/24 [SS][12]{:target="_blank"}        | 7/05 YOLO ([v1][18]{:target="_blank"}, [v2][24]{:target="_blank"} , [v3][25]{:target="_blank"})         |
| 4/19 [SqueezeNet][7]{:target="_blank"}           | 5/31 [FCN][13]{:target="_blank"}       | 7/12 [SSD][19]{:target="_blank"}          |


[1]: http://yann.lecun.com/exdb/publis/pdf/lecun-98.pdf
[2]: http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf
[3]: https://arxiv.org/pdf/1311.2901.pdf
[4]: https://arxiv.org/pdf/1312.4400.pdf
[5]: http://openaccess.thecvf.com/content_cvpr_2015/papers/Szegedy_Going_Deeper_With_2015_CVPR_paper.pdf
[6]: https://arxiv.org/pdf/1409.1556/
[7]: https://arxiv.org/pdf/1602.07360.pdf
[8]: http://people.idsia.ch/~juergen/ijcai2011.pdf
[9]: http://w.svms.org/training/BOGV92.pdf
[10]: https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/tr-98-14.pdf
[11]: https://cs.brown.edu/~pff/papers/lsvm-pami.pdf
[12]: https://ivi.fnwi.uva.nl/isis/publications/2013/UijlingsIJCV2013/UijlingsIJCV2013.pdf
[13]: https://www.cv-foundation.org/openaccess/content_cvpr_2015/app/2B_011.pdf
[14]: https://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Girshick_Rich_Feature_Hierarchies_2014_CVPR_paper.pdf?spm=5176.100239.blogcont55892.8.pm8zm1&file=Girshick_Rich_Feature_Hierarchies_2014_CVPR_paper.pdf
[15]: https://arxiv.org/pdf/1406.4729.pdf
[16]: http://openaccess.thecvf.com/content_iccv_2015/papers/Girshick_Fast_R-CNN_ICCV_2015_paper.pdf
[17]: http://papers.nips.cc/paper/5638-faster-r-cnn-towards-real-time-object-detection-with-region-proposal-networks.pdf
[18]: https://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Redmon_You_Only_Look_CVPR_2016_paper.pdf
[19]: https://arxiv.org/pdf/1512.02325.pdf
[20]:https://hackmd.io/p/BkxYFCnOM#/
[21]:https://medium.com/@WhoYoung99/alexnet-架構概述-988113c06b4b
[22]:https://www.dropbox.com/s/rrgc205ffedims8/ZFNet_shape.pdf
[23]:https://www.slideshare.net/gilbert6555tw/nin-20180319-91529205
[24]: https://pjreddie.com/media/files/papers/YOLOv3.pdf
[25]: https://arxiv.org/pdf/1612.08242


P.S. 4/5 清明連假 暫停一次

<br/>

### 4. 每周整理

這部分為我自己的筆記整理，可以點[這裡][100]{:target="_blank"}看所有文章。

[100]: ./Menu

#### 4.1 論文導讀整理

| CNN                                                                    | Pre R-CNN                              | R-CNN                                     |
| ---------------------------------------------------------------------- |--------------------------------------- | ----------------------------------------- |
| 3/08 [LeNet][101]{:target="_blank"} & [AlexNet][102]{:target="_blank"} | 4/26 PreVGGNet[][108]{:target="_blank"} | 6/07 R-CNN[][114]{:target="_blank"} |
| 3/15 [ZFNet(整理中)][103]{:target="_blank"}                            | 5/03 SVM[][109]{:target="_blank"}        | 6/14 SPPNet[][115]{:target="_blank"}       |
| 3/22 NIN(整理中)[][104]{:target="_blank"}                  | 5/10 SMO[][110]{:target="_blank"}       | 6/21 Fast R-CNN[][116]{:target="_blank"}   |
| 3/29 GoogLeNet(整理中)[][105]{:target="_blank"}            | 5/17 DPM[][111]{:target="_blank"}       | 6/28 Faster R-CNN[][117]{:target="_blank"} |
| 4/12 VGGNet[][106]{:target="_blank"}               | 5/24 SS[][112]{:target="_blank"}        | 7/05 YOLO[][118]{:target="_blank"}         |
| 4/19 SqueezeNet[][107]{:target="_blank"}           | 5/31 FCN[][113]{:target="_blank"}       | 7/12 SSD[][119]{:target="_blank"}          |


[101]: ../../articles/PyTorchTP-LeNet/
[102]: ../../articles/PyTorchTP-AlexNet/
[103]: ../../articles/PyTorchTP-ZFNet/
[104]: ../../articles/PyTorchTP-NIN/
[105]: ../../articles/PyTorchTP-GoogLeNet/
[106]: ../../articles/PyTorchTP-VGGNet/
[107]: ../../articles/PyTorchTP-SqueezeNet/
[108]: ../../articles/PyTorchTP-
[109]: ../../articles/PyTorchTP-
[110]: ../../articles/PyTorchTP-
[111]: ../../articles/PyTorchTP-
[112]: ../../articles/PyTorchTP-
[113]: ../../articles/PyTorchTP-
[114]: ../../articles/PyTorchTP-
[115]: ../../articles/PyTorchTP-
[116]: ../../articles/PyTorchTP-
[117]: ../../articles/PyTorchTP-
[118]: ../../articles/PyTorchTP-
[119]: ../../articles/PyTorchTP-
[120]: ../../articles/PyTorchTP-
[121]: ../../articles/PyTorchTP-
[122]: ../../articles/PyTorchTP-


#### 4.2 PyTorch實作

這裡的整理與論文導讀和Pecu老師的教學都不同步，純粹只是自己的學習紀錄，定期在[我的GitHub](https://github.com/mattwang44/PyTorch_Taipei/tree/master/PyTorch%20Tutorial){:target="_blank"}上更新


<div class="container">

  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse1">Week l</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">
          <a target="_blank" href="../../articles/01-Fundamentals-of-PyTorch-Tensor/">
            <strong>01. Fundamentals of PyTorch Tensor: </strong>
            <br>PyTorch Tensor建立方法、Tensor和Numpy比較、如何在GPU上運行
          </a>
        </div>
        <div class="panel-body">
          <a target="_blank" href="../../articles/02-Variables-&-Gradients/">
            <strong>02. Variables & Gradients: </strong>
			<br>建立Variable的方法、PyTorch中如何自動計算gradient
          </a>
        </div>
      </div>
<!-- 2 -->
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse2">Week 2</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
          <a target="_blank" href="https://github.com/mattwang44/PyTorch_Taipei">
            Neural Networks & LeNet Implementation for MNIST Dataset (整理中)
          </a>
        </div>

      </div>
<!-- 3 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse3">Week 3</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 4 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse4">Week 4</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 5 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse5">Week 5</a>
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 6 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse6">Week 6</a>
        </h4>
      </div>
      <div id="collapse6" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 7 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse7">Week 7</a>
        </h4>
      </div>
      <div id="collapse7" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 8 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse8">Week 8</a>
        </h4>
      </div>
      <div id="collapse8" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 9 --><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse9">Week 9</a>
        </h4>
      </div>
      <div id="collapse9" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 10--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse10">Week 10</a>
        </h4>
      </div>
      <div id="collapse10" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 11--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse11">Week 11</a>
        </h4>
      </div>
      <div id="collapse11" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 12--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse12">Week 12</a>
        </h4>
      </div>
      <div id="collapse12" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 13--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse13">Week 13</a>
        </h4>
      </div>
      <div id="collapse13" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 14--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse14">Week 14</a>
        </h4>
      </div>
      <div id="collapse14" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 15--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse2">Week 15</a>
        </h4>
      </div>
      <div id="collapse15" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 16--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse16">Week 16</a>
        </h4>
      </div>
      <div id="collapse16" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 17--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse171">Week 17</a>
        </h4>
      </div>
      <div id="collapse17" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 18--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse18">Week 18</a>
        </h4>
      </div>
      <div id="collapse18" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 19--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse19">Week 19</a>
        </h4>
      </div>
      <div id="collapse19" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 20--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse20">Week 20</a>
        </h4>
      </div>
      <div id="collapse20" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 21--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse21">Week 21</a>
        </h4>
      </div>
      <div id="collapse21" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->
<!-- 22--><!--
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse22">Week 22</a>
        </h4>
      </div>
      <div id="collapse22" class="panel-collapse collapse">
        <div class="panel-body">


        </div>
      </div> -->

    </div>
  </div>
</div>
<meta property="fb:app_id"       content="221193225126786" />
{% include facebook-comments.html %}
{% if page.fbcomments %}
  <hr/>
  <h4>Comments</h4>
  <div class="fb-comments" data-href="http://mattwang44.github.io{{ page.url }}" data-colorscheme="dark" data-num-posts="4" data-width="706"></div>
{% endif %}
