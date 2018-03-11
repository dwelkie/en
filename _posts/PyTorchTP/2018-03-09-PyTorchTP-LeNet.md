---
layout: article
title: "PyTorch Taipei 2018 week1: LeNet"
modified:
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser: PyTorchTP/LeNet5.png
  thumb: PyTorchTP/LeNet5.png
date: 2018-03-09
---	

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    TeX: {
      equationNumbers: {
        autoNumber: "AMS"
      }
    },
    tex2jax: {
      inlineMath: [ ['$','$']],
      displayMath: [ ['$$','$$'] ],
      processEscapes: true,
    }
  });
</script>
<script type="text/javascript"
        src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

# LeNet-5
1998年Yann LeCun於《[Gradient-Based Learning Applied to Document Recognition][1]》
一文中提出的手寫字辨識技術，為CNN領域中的經典架構。

CNN基礎架構(如convolution, pooling)早在1980年代就被[Kunihiko Fukishima(福島邦彥)][2]
提出，但並未使用backpropagation(逆向傳播法)來更新權重。Yann LeCun重要貢獻為結合BP於CNN架構中並
大幅提高了辨識成功率，該技術被當時許多知名公司所運用，也是現今許多CNN研究的重要基礎。

## LeNet-5 架構

<img src="/images/PyTorchTP/LeNet5-structure.png" width="4200">

Input:輸入為32x32的圖
C1: Convolution
S2: subsamping

C3:
S4:
C5: 
F6:  

Output:
一般FC為 $X_n=\sigma(w\bullet x_n+b)

RBF(Euclidean Radius Basis function)
$$ y_i = \sum_j(x_i-w_ij)^2 $$

Loss Function:
1. MSE(mean squared error)
2. Cross-entropy


Q: 原作有沒有Zero-padding?
A: 沒有，沒有zero-padding會造成輸入圖片邊緣的資料被參考的次數較少，所以只選取手寫字位於圖片中間的。

1. 彭駿達 (國立中央大學研究助理) [講解投影片](https://hackmd.io/p/BkxYFCnOM)
2. [知乎: CNN（卷积神经网络）最早是哪一年提出，是如何发展的？](https://www.zhihu.com/question/47705441)
3. [LeNet-5](http://yann.lecun.com/exdb/lenet/index.html)

[1]: http://yann.lecun.com/exdb/publis/pdf/lecun-98.pdf
[2]: http://personalpage.flsi.or.jp/fukushima/index-e.html