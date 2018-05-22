---
layout: article
title: "PyTorch Taipei 2018 week8: SVM (DRAFT)"
modified: 2018-05-03
categories: articles
excerpt: ""
tags: [PyTorchTP, DL]
image:
  feature:
  teaser:
  thumb:
date: 2018-05-03
fbcomments: true
---
<img src="" width="800">

{% include toc.html %}

論文名稱: (A T raining Algorithm for Optimal Margin Classiers)[paper]{:target="_blank"}

1. Linear Separable

How to separate? What kind of separation is more robust?

→ with thicker bundary(margin) → Fat Hyperplane

What's dual space?

函數集合: 把向量轉成的純量的函數，其集合為一個空間


soft margin:

find the  $$\max \frac{2}{\parallel w \parallel}$$, is equivalent to find $$\min \frac{\parallel w\parallel}{2}$$

→ find $$ \min \frac{\parallel w\parallel^2}{2} + C \sum^{n}_{i=0} \xi_i $$

s.t. $ \xi \geq 0 $, $ y_i(W^TX_i-b) \geq 1-\xi$

1. partial derivative is 0
2. lagrange factor $\alpha \geq 0$
3. contraint equation of opt. solution = 0 AND lagrange factor is max
4. contraint eq. $g(x, y)\leq 0$
5. KKT 互補鬆弛(WTF? slackness complementary) $\alpha g(x,y)=0$


$$ ℒ(x,b,\xi,\alpha_i,\beta_i)=\frac{\parallel w\parallel^2}{2} + C \sum^{n}_{i=0} \xi_i +  \sum^{n}_{i=0} \alpha_i[1-\xi-y_i(W^TX_i-b)]+\sum^n_{i=0}{\beta_i(-\xi_i)} $$

→

  $ x \rightarrow w - \sum \alpha_iy_ix_i=0 \rightarrow W = \sum\alpha y_i x_i $

  $ b \rightarrow \sum \alpha_i y_i=0 $

  $$ \xi_i \rightarrow C-\alpha_i\beta_i=0$$,  $$ \alpha_i \geq 0$$,  $$\beta_i \geq 0 $$

$ \rightarrow C = \alpha_i+\beta_i \rightarrow 0 \geq \alpha_i \geq C $

$ \sum^n_{i=1} \alpha_i - \frac{1}{2} \sum^n_{i,j=1} \alpha_i \alpha_j y_i y_j X_i^T X_j$

$ \sum^n_{i=3} \alpha_i y_i = - \alpha_1 y_1 - \alpha_2 y_2 $

conclusion

先確認

$ \alpha_2^{new} = \alpha_2^{old} + \frac{y_2 (E_1 - E_2)}{k_{11}+k_{22}-2k_{12}} $

if $ y_1 , y_2 $ 同號，$y_1 = \pm 1, y_2 = \pm 1$

$ \rightarrow \max{(0,\alpha_1^{old}+\alpha_1^{old}-C)} \leq \alpha_2^{new}  \leq \min{(C,\alpha_1^{old}+\alpha_1^{old})} $


if $ y_1 , y_2 $ 異號$

$ \rightarrow \max{(0,-\alpha_1^{old}+\alpha_1^{old})} \leq \alpha_2^{new}  \leq \min{(C,C-\alpha_1^{old}+\alpha_1^{old})} $

so $ \rightarrow \alpha_1^{new} = \alpha_1^{old}+y_1(\alpha_2^{old}-\alpha_2^{new}) $

### update for W

$ W = \sum \alpha_i y_i X_i$

$ W^{new}=\alpha_1^{new}y_1X_1+\alpha_2^{new}y_2X_2+   \sum^n_{i=3} \alpha_i^{new}y_iX_i $

$ W^{old}=\alpha_1^{old}y_1X_1+\alpha_2^{old}y_2X_2+   \sum^n_{i=3} \alpha_i^{new}y_iX_i $

subtract two eqations above

$ W^{new}=W^{old} + (\alpha_1^{new} - \alpha_1^{old}) y_1X_1+    (\alpha_2^{new} - \alpha_2^{old}) y_2X_2  $

then

$ b^{new}=W^{new,T}X_i-y_i$

$ \sum^n_{j=1} \alpha_j y_j X_j^T X_i = \alpha_1^{new}y_1X_1^TX_i + \alpha_2^{new}y_2X_2^TX_i + \sum^n_{j=3}\alpha_j y_j X_j^T X_i -y_i$

tips: $X_1^TX_i = k_1i$, $X_2^TX_i = k_2i$

$ b^{new} = b^{old} + E_i + (\alpha_1^{new} - \alpha_1^{old}) y_1 k_{1i} + (\alpha_2^{new} - \alpha_2^{old}) y_2 k_{2i} $








[paper]: http://w.svms.org/training/BOGV92.pdf
