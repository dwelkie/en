---
layout: topic
title: "PyTorch Taipei 2018 筆記整理"
date: 2018-02-28
modified: 2018-04-17
tags: #[PyTorchTP, DL]
image:
  feature: pytorch-header.jpg
fbcomments: yes
description: "PyTorch Taiwan是Marcel Wang先生為促進台灣深度學習發展，在網路上號召成立的深度學習讀書會，目前有台北和新竹兩分會 @ Wei-Hsiang Wang's Website"
TopicShare: true
---

我目前是讀書會聯絡人之一，後來我為讀書會創了一個[GitHub page](https://pytorchtaipei.github.io){:target="_blank"}(原先整理在一頁的資料連結也移到了[這裡](https://pytorchtaipei.github.io/records/2018/spring/){:target="_blank"})，未來讀書會相關消息就統一發布在這個網站之下。

### 論文筆記

希望每周讀完論文、聽完講解後，能夠消化吸收再寫出一篇整理，目前穩定遲交中...<br>因為論文和比賽完全停擺中冏，有朝一日會認真完成的...

<div class="tiles">
{% for post in site.tags.DLpaper %}
  {% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->


### 實作練習

不定期在[我的GitHub](https://github.com/mattwang44/){:target="_blank"}上更新


<div class="container">

  <div class="panel-group">
    <div class="panel panel-default">      

      <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse0"> ML/DL Fundamentals</a>
            </h4>
          </div>
          <div id="collapse0" class="panel-collapse collapse">
            <div class="panel-body">
            <a target="_blank" href="https://github.com/mattwang44/ML-DL-practice/tree/master/MLP_backprop_MATLAB">
              <strong>MLP on Iris Dataset Using MATLAB </strong>
              <br>用MATLAB手刻兩層隱藏層的MLP(多層感知器)，以Iris資料集中的三個特徵(原資料集有四個)訓練，準確率98%
            </a>
            </div>
          </div>

      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" href="#collapse1">PyTorch Fundamentals</a>
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
          <a data-toggle="collapse" href="#collapse2">LeNet-5</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
          <a target="_blank" href="https://github.com/mattwang44/PyTorch_Taipei">
            PyTorch: Neural Networks & LeNet Implementation(整理中)
          </a>
        </div>
        <div class="panel-body">
          <a target="_blank" href="https://github.com/mattwang44/LeNet5_from_Scratch">
            <strong> LeNet-5 Implementation SCRATCH </strong>
            <br>   不用任何自動back-prop工具實現LeNet-5，20 epoches 訓練 (3.5小時 with CPU)，準確率98.6%。
            <br>   <img src="../../images/DL/implementLeNet5.jpg" width="750" />
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
