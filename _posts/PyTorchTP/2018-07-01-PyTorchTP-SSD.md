---
layout: article
title: "PyTorch Taipei 2018 week18: SSD (DRAFT)"
modified: 2018-07-01
categories: articles
description: "Single shot multibox detector(SSD)為2016年發表的real-time物件偵測演算法，承襲YOLO v1一樣只需要將圖片輸入CNN一次，但能夠從不同捲積層的feature maps偵測物件，準確率和運行速度都比YOLO v1更加提升。 | Convolution Neural Network, CNN, Deep Learning, real-time object detection | Wei-Hsiang Wang's Website"
tags: [PyTorchTP, DL, DLpaper]
image:
  feature:
  teaser: DL/SSD/logo.png
  thumb: DL/SSD/logo.png
date: 2018-07-01
fbcomments: true
---

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ TeX: { extensions: ["color.js"] }});
</script>
$$ \definecolor{lg}{RGB}{114,0,172} \definecolor{pi}{RGB}{18,110,213} \definecolor{og}{RGB}{217,86,16} \definecolor{f}{RGB}{45,177,93}$$

<img src="" width="800">
{% include toc.html %}

## **0. PLZ WAIT**

這場SSD論文報告是由我負責，想在這裡寫成文章形式，但還需要一些時間，在這裡放上當初為了報告做的PPT。PPT目前也還有一些問題，之後也會一起慢慢完善他。

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vSsTqYI41Du3huBSfh8mwwQtS5o8bwhwrGk7NDUz5H2bjHOeRvUF1KfVvJ0mjmdqpo7RdQKH08UgK36/embed?start=false&loop=false&delayms=60000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>


## **1. Intro**

[SSD (Single Shot MultiBox Detector)][SSD]{:target="_blank"}為[Wei Liu](http://www.cs.unc.edu/~wliu/){:target="_blank"}, [Dragomir Anguelov](http://ai.stanford.edu/~drago/){:target="_blank"}, [Dumitru Erhan](http://www.dumitru.ca){:target="_blank"}, [Christian Szegedy](https://ai.google/research/people/ChristianSzegedy){:target="_blank"}, [Scott Reed](http://www.scottreed.info){:target="_blank"}, [Cheng-Yang Fu](https://www.cs.unc.edu/~cyfu/){:target="_blank"}, [Alexander C. Berg](http://acberg.com){:target="_blank"}所著之real-time物件偵測演算法。2015年6月發表的[YOLO v1](https://arxiv.org/abs/1506.02640){:target="_blank"}(可參考我之前寫的[YOLO筆記](../PyTorchTP-YOLO){:target="_blank"})雖然運行速度上大幅超越當時表現最佳的Faster RCNN，但偵測準確率卻不及Faster RCNN。2015年12月於arXiv上發表的SSD大致承襲YOLO v1概念並參考了部分RCNN系列演算法之特點，改善了YOLO一些缺點並能夠在不同的捲積層中抽取出偵測結果，速度上比YOLO v1更快而準確率又比Faster RCNN更高。目前該領域表現最佳的的YOLO v2/v3亦參考了SSD的作法。

SSD第一作者[Wei Liu](http://www.cs.unc.edu/~wliu/){:target="_blank"}目前為UNC at Chapel Hill的CS Ph.D.，南京大學畢業後在Apple(2012), Google(2014)當過intern，在Google期間與團隊一同發表GoogLeNet(為第二作者)，隔年便發表SSD。<font color="white">總之就是一個發論文的速度比我讀論文速度還快的概念，而且品質都是世界級水準...。</font>.

<!--
## **2. Background/Related Works**

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Instruction</a></li>
    <li><a data-toggle="tab" href="#menu1">DPM</a></li>
    <li><a data-toggle="tab" href="#menu2">R-CNN</a></li>
    <li><a data-toggle="tab" href="#menu3">Fast R-CNN</a></li>
    <li><a data-toggle="tab" href="#menu4">Faster R-CNN</a></li>
    <li><a data-toggle="tab" href="#menu5">YOLO v1</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>


## Loss Function

$$ L(x,c,l,g) = \frac{1}{N}(L_{conf}(x,c)+\alpha L_{loc}(x,l,c)) \tag{1} $$

$$ L_{loc}(x,l,c) = \sum^N_{i \in Pos} \sum_{m \in \{cx,cy,w,h\}} x_{ij}^k smooth_{L1}(l_i^m-\hat{g}_j^m) \tag{2} $$

其中

$$ \hat{g}_j^{cx}=(g_j^{cx}-d_i^{cx})/d_i^w, \; \; \; \hat{g}_j^{cy}=(g_j^{cy}-d_i^{cy})/d_i^h $$

$$ \hat{g}_j^w=\log ( \frac{g_j^w}{d_i^w}), \; \; \; \hat{g}_j^h=\log (\frac{g_j^h}{d_i^h}) $$

$$ L_{conf}(x,c) = - \sum_{i \in Pos}^N x^p_{ij} \log (\hat{c}^p_i) - \sum_{i \in Pos} \log (\hat{c}^0_i)  \tag{3} $$

其中

$$ \hat{c}^p_i = \frac{exp(c^p_i)}{\sum_p exp(c^p_i)} $$

-->


## **Reference**

1. SSD: Single Shot MultiBox Detector
   * [Paper][SSD]{:target="_blank"}
   * [Slides][slides]{:target="_blank"}
   * [Cafe Code][code]{:target="_blank"}
2. You Only Look Once: Unified, Real-Time Object Detection
   * [Paper][6]{:target="_blank"}
   * [Website][3]{:target="_blank"}

[SSD]: https://arxiv.org/abs/1512.02325
[code]: https://github.com/weiliu89/caffe/tree/ssd
[slides]: http://www.cs.unc.edu/~wliu/papers/ssd_eccv2016_slide.pdf
[FRCNN]: https://arxiv.org/abs/1504.08083
[1]: https://pjreddie.com/darknet/yolo/
[2]: https://pjreddie.com/darknet/yolov2/
[3]: https://pjreddie.com/darknet/yolov1/
[4]: https://pjreddie.com/media/files/papers/YOLOv3.pdf
[5]: https://arxiv.org/pdf/1612.08242
[6]: https://arxiv.org/pdf/1506.02640
