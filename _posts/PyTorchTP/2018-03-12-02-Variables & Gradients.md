---
layout: ipynb
title: "PyTorch Practice 02-Variables & Gradients"
modified:
categories: articles
excerpt: ""
tags: [DL, Python, PyTorchTP]
image:
  feature:
  teaser: pytorch.jpg
  thumb: pytorch.jpg
date: 2018-03-12
---

  <div tabindex="-1" id="notebook" class="border-box-sizing">
    <div class="container" id="notebook-container">

<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[1]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">import</span> <span class="nn">torch</span>
</pre></div>

</div>
</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="2.1-Variables">2.1 Variables<a class="anchor-link" href="#2.1-Variables">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[2]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># A matrix with fixed components (NOT a variable)</span>
<span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[2]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>
 1  1
 1  1
[torch.FloatTensor of size 2x2]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p><strong> This is the method to turn a tensor into Variables. </strong><br>
<code>requires_grad</code> will be explained in next section.</p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[3]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">from</span> <span class="nn">torch.autograd</span> <span class="k">import</span> <span class="n">Variable</span>
</pre></div>

</div>
</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[4]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># Variables</span>
<span class="n">a</span> <span class="o">=</span> <span class="n">Variable</span><span class="p">(</span><span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">),</span> <span class="n">requires_grad</span><span class="o">=</span><span class="kc">True</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">a</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Variable containing:
 1  1
 1  1
[torch.FloatTensor of size 2x2]

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[5]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># Create another Variables</span>
<span class="n">b</span> <span class="o">=</span> <span class="n">Variable</span><span class="p">(</span><span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">),</span> <span class="n">requires_grad</span><span class="o">=</span><span class="kc">True</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">a</span><span class="o">+</span><span class="n">b</span><span class="p">)</span> <span class="c1">#or torch.add(a,b)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Variable containing:
 2  2
 2  2
[torch.FloatTensor of size 2x2]

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[6]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="nb">print</span><span class="p">(</span><span class="n">a</span><span class="o">*</span><span class="n">b</span><span class="p">)</span> <span class="c1">#or torch.mul(a,b)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Variable containing:
 1  1
 1  1
[torch.FloatTensor of size 2x2]

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="2.2-Gradients">2.2 Gradients<a class="anchor-link" href="#2.2-Gradients">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p><strong><code>requires_grad</code></strong> allows calculations of gradients w.r.t. the variables. <br>
For the following equations as example &amp; a tuple with 4 components equal to 1 as input,
$$ x = [1, 2, 3, 4] $$
$$ y_i=5(x_i+1)^2$$
$$z=\frac{1}{4}\sum_i(y_i)$$
Then, substitue $y$ iinto $z$:
$$z=\frac{1}{4}\sum_i5(x_i+1)^2$$
For the partial deriviation:
$$\frac{\partial z}{\partial x_i}=\frac{5}{2}(x_i+1)$$
$$\frac{\partial z}{\partial x}=[2.5, 5, 7.5, 10]$$
These equations can be realized by followings:</p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[7]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x</span> <span class="o">=</span> <span class="n">Variable</span><span class="p">(</span><span class="n">torch</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">4</span><span class="p">),</span> <span class="n">requires_grad</span><span class="o">=</span><span class="kc">True</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">x</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Variable containing:
 0
 1
 2
 3
[torch.FloatTensor of size 4]

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[8]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">y</span> <span class="o">=</span> <span class="mi">5</span> <span class="o">*</span> <span class="p">(</span><span class="n">x</span> <span class="o">+</span> <span class="mi">1</span><span class="p">)</span> <span class="o">**</span> <span class="mi">2</span>
<span class="n">y</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[8]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>Variable containing:
  5
 20
 45
 80
[torch.FloatTensor of size 4]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[9]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">z</span> <span class="o">=</span> <span class="n">y</span><span class="o">.</span><span class="n">mean</span><span class="p">()</span>
<span class="n">z</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[9]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>Variable containing:
 37.5000
[torch.FloatTensor of size 1]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p><strong>Here begins to calculate gradients</strong></p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[10]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">z</span><span class="o">.</span><span class="n">backward</span><span class="p">()</span>
<span class="n">x</span><span class="o">.</span><span class="n">grad</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[10]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>Variable containing:
  2.5000
  5.0000
  7.5000
 10.0000
[torch.FloatTensor of size 4]</pre>
</div>

</div>

</div>
</div>

</div>
    </div>
  </div>
