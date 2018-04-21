---
layout: ipynb
title: "PyTorch Practice 01: Fundamentals of PyTorch Tensor"
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
<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">import</span> <span class="nn">numpy</span> <span class="k">as</span> <span class="nn">np</span>
<span class="kn">import</span> <span class="nn">torch</span>
<span class="kn">import</span> <span class="nn">pandas</span> <span class="k">as</span> <span class="nn">pd</span>
</pre></div>

</div>
</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="1.1-Torch-Tensors">1.1 Torch Tensors<a class="anchor-link" href="#1.1-Torch-Tensors">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="1.1.1-Transferring-from-an-array">1.1.1 Transferring from an array<a class="anchor-link" href="#1.1.1-Transferring-from-an-array">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[2]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="p">[[</span><span class="mi">1</span><span class="p">,</span> <span class="mi">2</span><span class="p">],</span> <span class="p">[</span><span class="mi">3</span><span class="p">,</span> <span class="mi">4</span><span class="p">]]</span>
<span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;array: </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">arr</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="n">arr1</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">array</span><span class="p">(</span><span class="n">arr</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Numpy array: </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">arr1</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="n">arr2</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">Tensor</span><span class="p">(</span><span class="n">arr</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">arr2</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>array:
 [[1, 2], [3, 4]]

Numpy array:
 [[1 2]
 [3 4]]

Torch Tensor:  
 1  2
 3  4
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
<h3 id="1.1.2-Matrices-with-default-values">1.1.2 Matrices with default values<a class="anchor-link" href="#1.1.2-Matrices-with-default-values">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[3]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">ones</span><span class="p">((</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">))</span>
<span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;Numpy array: </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">arr</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="n">arr1</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">((</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">))</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">arr1</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Numpy array:
 [[1. 1.]
 [1. 1.]]

Torch Tensor:  
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
<div class="prompt input_prompt">In&nbsp;[4]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">zeros</span><span class="p">((</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">))</span>
<span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;Numpy array: </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">arr</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="n">arr1</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">zeros</span><span class="p">((</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">))</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">arr1</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Numpy array:
 [[0. 0.]
 [0. 0.]]

Torch Tensor:  
 0  0
 0  0
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
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr1</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">eye</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">arr1</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="n">arr1</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">eye</span><span class="p">(</span><span class="mi">4</span><span class="p">,</span><span class="mi">6</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">arr1</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Torch Tensor:  
 1  0  0
 0  1  0
 0  0  1
[torch.FloatTensor of size 3x3]


Torch Tensor:  
 1  0  0  0  0  0
 0  1  0  0  0  0
 0  0  1  0  0  0
 0  0  0  1  0  0
[torch.FloatTensor of size 4x6]


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
<p>※ <code>torch.numel()</code> return the number of components in the matrix.</p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[6]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">a</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">3</span><span class="p">,</span><span class="mi">4</span><span class="p">,</span><span class="mi">5</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">torch</span><span class="o">.</span><span class="n">numel</span><span class="p">(</span><span class="n">a</span><span class="p">))</span>

<span class="n">a</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">zeros</span><span class="p">(</span><span class="mi">4</span><span class="p">,</span><span class="mi">4</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">torch</span><span class="o">.</span><span class="n">numel</span><span class="p">(</span><span class="n">a</span><span class="p">))</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>120
16
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
<h3 id="1.1.3-Matrices-with-random-values-(with-seeds)">1.1.3 Matrices with random values (with seeds)<a class="anchor-link" href="#1.1.3-Matrices-with-random-values-(with-seeds)">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[7]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">np</span><span class="o">.</span><span class="n">random</span><span class="o">.</span><span class="n">seed</span><span class="p">(</span><span class="mi">0</span><span class="p">)</span>
<span class="n">arr</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">random</span><span class="o">.</span><span class="n">rand</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span>
<span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;Numpy array: </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">arr</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="n">torch</span><span class="o">.</span><span class="n">manual_seed</span><span class="p">(</span><span class="mi">0</span><span class="p">)</span>
<span class="n">arr1</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">rand</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">arr1</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Numpy array:
 [[0.5488135  0.71518937]
 [0.60276338 0.54488318]]

Torch Tensor:  
 0.4963  0.7682
 0.0885  0.1320
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
<p><strong>Seeds when using GPUs</strong></p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[8]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="k">if</span> <span class="n">torch</span><span class="o">.</span><span class="n">cuda</span><span class="o">.</span><span class="n">is_available</span><span class="p">():</span>
    <span class="n">torch</span><span class="o">.</span><span class="n">cuda</span><span class="o">.</span><span class="n">manual_seed_all</span><span class="p">(</span><span class="mi">0</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="1.1.4-One-dimensional-tensor">1.1.4 One-dimensional tensor<a class="anchor-link" href="#1.1.4-One-dimensional-tensor">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[9]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">torch</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span> <span class="n">end</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span> <span class="n">steps</span><span class="o">=</span><span class="mi">8</span><span class="p">)</span> <span class="c1"># divided into N steps</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[9]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>
-10.0000
 -7.1429
 -4.2857
 -1.4286
  1.4286
  4.2857
  7.1429
 10.0000
[torch.FloatTensor of size 8]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[10]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">torch</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">15</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span>  <span class="c1"># Length of each steps = N</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[10]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>
  3
  5
  7
  9
 11
 13
[torch.FloatTensor of size 6]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="1.2-Bridge-between-Numpy-and-Torch">1.2 Bridge between Numpy and Torch<a class="anchor-link" href="#1.2-Bridge-between-Numpy-and-Torch">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="1.2.1-Numpy-to-Torch">1.2.1 Numpy to Torch<a class="anchor-link" href="#1.2.1-Numpy-to-Torch">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[11]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">np_arr</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">ones</span><span class="p">((</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">))</span><span class="o">*</span><span class="mi">3</span>
<span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;Numpy array: </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">np_arr</span><span class="p">,</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">Type: &quot;</span><span class="p">,</span> <span class="nb">type</span><span class="p">(</span><span class="n">np_arr</span><span class="p">),</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>

<span class="c1">#Convert from np array</span>
<span class="n">torch_tensor</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">from_numpy</span><span class="p">(</span><span class="n">np_arr</span><span class="p">)</span>   
<span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;Torch Tensor: &quot;</span><span class="p">,</span> <span class="n">torch_tensor</span><span class="p">,</span> <span class="s2">&quot;Type: &quot;</span><span class="p">,</span> <span class="nb">type</span><span class="p">(</span><span class="n">torch_tensor</span><span class="p">),</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Numpy array:
 [[3. 3.]
 [3. 3.]]
Type:  &lt;class &#39;numpy.ndarray&#39;&gt;

Torch Tensor:  
 3  3
 3  3
[torch.DoubleTensor of size 2x2]
 Type:  &lt;class &#39;torch.DoubleTensor&#39;&gt;

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
<p><strong> Caution: This conversion only support </strong><code>double</code>, <code>float</code>, <code>int64</code>, <code>int32</code>, and <code>uint8</code></p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[28]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># intentional error</span>
<span class="n">torch</span><span class="o">.</span><span class="n">from_numpy</span><span class="p">(</span><span class="n">np</span><span class="o">.</span><span class="n">ones</span><span class="p">((</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">),</span><span class="n">dtype</span><span class="o">=</span><span class="n">np</span><span class="o">.</span><span class="n">int8</span><span class="p">))</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_text output_error">
<pre>
<span class="ansi-red-fg">--------------------------------------------------</span>
<span class="ansi-red-fg">RuntimeError</span>     Traceback (most recent call last)
<span class="ansi-green-fg">&lt;ipython-input-28-e95578f6bb83&gt;</span> in <span class="ansi-cyan-fg">&lt;module&gt;</span><span class="ansi-blue-fg">()</span>
<span class="ansi-green-intense-fg ansi-bold">      1</span> <span class="ansi-red-fg"># intentional error</span>
<span class="ansi-green-fg">----&gt; 2</span><span class="ansi-red-fg"> </span>torch<span class="ansi-blue-fg">.</span>from_numpy<span class="ansi-blue-fg">(</span>np<span class="ansi-blue-fg">.</span>ones<span class="ansi-blue-fg">(</span><span class="ansi-blue-fg">(</span><span class="ansi-cyan-fg">2</span><span class="ansi-blue-fg">,</span><span class="ansi-cyan-fg">2</span><span class="ansi-blue-fg">)</span><span class="ansi-blue-fg">,</span>dtype<span class="ansi-blue-fg">=</span>np<span class="ansi-blue-fg">.</span>int8<span class="ansi-blue-fg">)</span><span class="ansi-blue-fg">)</span>

<span class="ansi-red-fg">RuntimeError</span>: can&#39;t convert a given np.ndarray to a tensor - it has an invalid type. The only supported types are: double, float, int64, int32, and uint8.</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p><strong> Following table compares the data types before &amp; after the conversion </strong></p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[13]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">dtypes</span> <span class="o">=</span> <span class="p">[</span><span class="n">np</span><span class="o">.</span><span class="n">uint8</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">int32</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">int64</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">float32</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">float</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">float64</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">double</span><span class="p">,</span> <span class="p">]</span>
<span class="n">npArr_dtypes</span> <span class="o">=</span> <span class="p">[((</span><span class="n">dtype</span><span class="p">)</span><span class="o">.</span><span class="vm">__name__</span><span class="p">)</span> <span class="k">for</span> <span class="n">dtype</span> <span class="ow">in</span> <span class="n">dtypes</span><span class="p">]</span>
<span class="n">tensor_list</span> <span class="o">=</span> <span class="p">[</span><span class="n">torch</span><span class="o">.</span><span class="n">from_numpy</span><span class="p">(</span><span class="n">np</span><span class="o">.</span><span class="n">ones</span><span class="p">((</span><span class="mi">1</span><span class="p">),</span><span class="n">dtype</span><span class="o">=</span><span class="n">dtype</span><span class="p">))</span> <span class="k">for</span> <span class="n">dtype</span> <span class="ow">in</span> <span class="n">dtypes</span><span class="p">]</span>
<span class="n">tensor_types</span> <span class="o">=</span> <span class="p">[(</span><span class="nb">type</span><span class="p">(</span><span class="n">tensor</span><span class="p">)</span><span class="o">.</span><span class="vm">__name__</span><span class="p">)</span> <span class="k">for</span> <span class="n">tensor</span> <span class="ow">in</span> <span class="n">tensor_list</span><span class="p">]</span>
<span class="n">pd</span><span class="o">.</span><span class="n">concat</span><span class="p">([</span><span class="n">pd</span><span class="o">.</span><span class="n">DataFrame</span><span class="p">({</span><span class="s1">&#39;dtypes&#39;</span><span class="p">:</span> <span class="n">npArr_dtypes</span><span class="p">}),</span> \
           <span class="n">pd</span><span class="o">.</span><span class="n">DataFrame</span><span class="p">({</span><span class="s1">&#39;Tensor types&#39;</span><span class="p">:</span> <span class="n">tensor_types</span><span class="p">})],</span><span class="n">axis</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span><span class="o">.</span><span class="n">style</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[13]:</div>



<div class="output_html rendered_html output_subarea output_execute_result">
<style  type="text/css" >
</style>  
<table id="T_340a8182_221b_11e8_a253_080027094c12" >
<thead>    <tr>
        <th class="blank level0" ></th>
        <th class="col_heading level0 col0" >dtypes</th>
        <th class="col_heading level0 col1" >Tensor types</th>
    </tr></thead>
<tbody>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row0" class="row_heading level0 row0" >0</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row0_col0" class="data row0 col0" >uint8</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row0_col1" class="data row0 col1" >ByteTensor</td>
    </tr>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row1" class="row_heading level0 row1" >1</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row1_col0" class="data row1 col0" >int32</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row1_col1" class="data row1 col1" >IntTensor</td>
    </tr>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row2" class="row_heading level0 row2" >2</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row2_col0" class="data row2 col0" >int64</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row2_col1" class="data row2 col1" >LongTensor</td>
    </tr>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row3" class="row_heading level0 row3" >3</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row3_col0" class="data row3 col0" >float32</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row3_col1" class="data row3 col1" >FloatTensor</td>
    </tr>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row4" class="row_heading level0 row4" >4</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row4_col0" class="data row4 col0" >float</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row4_col1" class="data row4 col1" >DoubleTensor</td>
    </tr>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row5" class="row_heading level0 row5" >5</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row5_col0" class="data row5 col0" >float64</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row5_col1" class="data row5 col1" >DoubleTensor</td>
    </tr>    <tr>
        <th id="T_340a8182_221b_11e8_a253_080027094c12level0_row6" class="row_heading level0 row6" >6</th>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row6_col0" class="data row6 col0" >float64</td>
        <td id="T_340a8182_221b_11e8_a253_080027094c12row6_col1" class="data row6 col1" >DoubleTensor</td>
    </tr></tbody>
</table>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="1.2.2-Torch-to-Numpy">1.2.2 Torch to Numpy<a class="anchor-link" href="#1.2.2-Torch-to-Numpy">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[14]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">torch_tensor</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span>
<span class="n">np_arr</span> <span class="o">=</span> <span class="n">torch_tensor</span><span class="o">.</span><span class="n">numpy</span><span class="p">()</span>
<span class="nb">print</span><span class="p">(</span><span class="nb">type</span><span class="p">(</span><span class="n">np_arr</span><span class="p">))</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>&lt;class &#39;numpy.ndarray&#39;&gt;
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
<h2 id="1.3-Torch-Tensors-moving-between-CPU-&amp;-GPU">1.3 Torch Tensors moving between CPU &amp; GPU<a class="anchor-link" href="#1.3-Torch-Tensors-moving-between-CPU-&amp;-GPU">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[15]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">tensor</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span>

<span class="c1"># move to GPU</span>
<span class="k">if</span> <span class="n">torch</span><span class="o">.</span><span class="n">cuda</span><span class="o">.</span><span class="n">is_available</span><span class="p">():</span>
    <span class="n">tensor</span><span class="o">.</span><span class="n">cuda</span><span class="p">()</span>

<span class="c1"># move back to CPU</span>
<span class="n">tensor</span><span class="o">.</span><span class="n">cpu</span><span class="p">()</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[15]:</div>




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
<h2 id="1.4-Tensor-Operations">1.4 Tensor Operations<a class="anchor-link" href="#1.4-Tensor-Operations">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="1.4.1-Resizing-&amp;-Permute">1.4.1 Resizing &amp; Permute<a class="anchor-link" href="#1.4.1-Resizing-&amp;-Permute">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[16]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">16</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Size of original array:</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">arr</span><span class="o">.</span><span class="n">size</span><span class="p">(),</span> <span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>Size of original array:
 torch.Size([16])

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[17]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># view(): view the tensor in assigned shape </span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;arr.view(-1,2,4)) =&quot;</span><span class="p">,</span> <span class="n">arr</span><span class="o">.</span><span class="n">view</span><span class="p">(</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">4</span><span class="p">))</span> <span class="c1"># -1 means unknown numbers</span>
<span class="nb">print</span><span class="p">(</span><span class="n">arr</span><span class="o">.</span><span class="n">size</span><span class="p">())</span>  <span class="c1"># view() won&#39;t assign values to array</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>arr.view(-1,2,4)) =
(0 ,.,.) =
   0   1   2   3
   4   5   6   7

(1 ,.,.) =
   8   9  10  11
  12  13  14  15
[torch.FloatTensor of size 2x2x4]

torch.Size([16])
</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[18]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">arr</span><span class="o">.</span><span class="n">view</span><span class="p">(</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">4</span><span class="p">)</span>  <span class="c1"># assign values to array</span>
<span class="nb">print</span><span class="p">(</span><span class="n">arr</span><span class="o">.</span><span class="n">size</span><span class="p">())</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>torch.Size([2, 2, 4])
</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[19]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">arr</span><span class="o">.</span><span class="n">permute</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span> <span class="c1"># same sequence of dimension, won&#39;t change the array</span>
<span class="nb">print</span><span class="p">(</span><span class="n">arr</span><span class="o">.</span><span class="n">size</span><span class="p">())</span>
<span class="n">arr</span> <span class="o">=</span> <span class="n">arr</span><span class="o">.</span><span class="n">permute</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">1</span><span class="p">)</span> <span class="c1"># change the last two dimensions</span>
<span class="nb">print</span><span class="p">(</span><span class="n">arr</span><span class="o">.</span><span class="n">size</span><span class="p">())</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>torch.Size([2, 2, 4])
torch.Size([2, 4, 2])
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
<h3 id="1.4.2-add,-sub,-mul,-&amp;-div">1.4.2 add, sub, mul, &amp; div<a class="anchor-link" href="#1.4.2-add,-sub,-mul,-&amp;-div">&#182;</a></h3><p>Only take addition as example here, other 3 operations are used in the same way.</p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[20]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">a</span><span class="p">,</span> <span class="n">b</span><span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">),</span> <span class="n">torch</span><span class="o">.</span><span class="n">ones</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span><span class="o">*</span><span class="mi">2</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;a =&quot;</span><span class="p">,</span><span class="n">a</span><span class="p">,</span><span class="s2">&quot;</span><span class="se">\n</span><span class="s2">b =&quot;</span><span class="p">,</span><span class="n">b</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>a =
 1  1
 1  1
[torch.FloatTensor of size 2x2]

b =
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
<div class="prompt input_prompt">In&nbsp;[21]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># Element-wise operation</span>
<span class="nb">print</span><span class="p">(</span><span class="s2">&quot;torch.add(a,b) =&quot;</span><span class="p">,</span> <span class="n">torch</span><span class="o">.</span><span class="n">add</span><span class="p">(</span><span class="n">a</span><span class="p">,</span><span class="n">b</span><span class="p">))</span>  <span class="c1">#same as (a + b)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>torch.add(a,b) =
 3  3
 3  3
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
<p><strong>The difference between </strong><code>add()</code><strong> &amp; </strong><code>add_()</code><strong> is explained here. Subtraction, multiplication, &amp; division also have same characteristic.</strong></p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[22]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># In-place operation (without assigning values)</span>
<span class="n">c</span> <span class="o">=</span> <span class="n">a</span><span class="o">.</span><span class="n">add</span><span class="p">(</span><span class="n">b</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">c</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">a</span><span class="p">)</span> <span class="c1"># a remained the same</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>
 3  3
 3  3
[torch.FloatTensor of size 2x2]


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
<div class="prompt input_prompt">In&nbsp;[23]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># In-place operation (with assigning values)</span>
<span class="n">c</span> <span class="o">=</span> <span class="n">a</span><span class="o">.</span><span class="n">add_</span><span class="p">(</span><span class="n">b</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">c</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">a</span><span class="p">)</span> <span class="c1"># a changed</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt"></div>


<div class="output_subarea output_stream output_stdout output_text">
<pre>
 3  3
 3  3
[torch.FloatTensor of size 2x2]


 3  3
 3  3
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
<h3 id="1.4.3-Mean-&amp;-Standard-Deviation">1.4.3 Mean &amp; Standard Deviation<a class="anchor-link" href="#1.4.3-Mean-&amp;-Standard-Deviation">&#182;</a></h3>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[24]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">a</span> <span class="o">=</span> <span class="n">torch</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">9</span><span class="p">)</span><span class="o">.</span><span class="n">view</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
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
<pre>
 3  4
 5  6
 7  8
[torch.FloatTensor of size 3x2]

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[25]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">a</span><span class="o">.</span><span class="n">mean</span><span class="p">(</span><span class="n">dim</span><span class="o">=</span><span class="mi">0</span><span class="p">)</span> <span class="c1">#mean along axis 0</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[25]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>
 5
 6
[torch.FloatTensor of size 2]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[26]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">a</span><span class="o">.</span><span class="n">mean</span><span class="p">(</span><span class="n">dim</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span> <span class="c1">#mean along axis 1</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[26]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>
 3.5000
 5.5000
 7.5000
[torch.FloatTensor of size 3]</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[27]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">torch</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">17</span><span class="p">)</span><span class="o">.</span><span class="n">std</span><span class="p">(</span><span class="n">dim</span><span class="o">=</span><span class="mi">0</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area">

<div class="prompt output_prompt">Out[27]:</div>




<div class="output_text output_subarea output_execute_result">
<pre>
 5.0498
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
<h3 id="Q:-What's-the-difference-between-torch.from_numpy(np_arr)-&amp;-torch.tensor(np_arr)?-Execution-speed?">Q: What's the difference between <code>torch.from_numpy(np_arr)</code> &amp; <code>torch.tensor(np_arr)</code>? Execution speed?<a class="anchor-link" href="#Q:-What's-the-difference-between-torch.from_numpy(np_arr)-&amp;-torch.tensor(np_arr)?-Execution-speed?">&#182;</a></h3>
</div>
</div>
</div>
    </div>
  </div>
