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

# LeNet

## Backprop
1998年由Yann LeCun 首度使用 backpropagation (逆向傳播法)來進行手寫字辨識

## Gradient Descent Method

$$ W_k = W_{k-1} - \eta\frac{\partial E(W)}{\partial W_k} $$

其中$W$是參數矩陣，$eta$是learning rate(決定學習效率)

## LeNet-5
Pic-LeNet-5

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