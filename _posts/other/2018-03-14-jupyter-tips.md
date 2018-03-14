---
layout: article
title: "Jupyter Notebook Extensions"
modified:
categories: articles
excerpt: ""
tags: [other, jupyter]
image:
  feature: jupyter.jpg
  teaser: jupyter.jpg
  thumb: jupyter.jpg
date: 2018-03-09
---
The [Jupyter Notebook App](http://jupyter.org){:target="_blank"} is a server-client application that allows editing and running notebook documents via a web browser.
It also can be convert into LaTex, Markdown, or PDF. etc. I mostly convert the code into HTML to show them in my blog posts.


With [Unofficial Jupyter Notebook Extensions](http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/exporting.html){:target="_blank"}
installed, functions increasing readability like foldable headings can be added into the notebooks.

### Install Jupyter Notebook Extensions package
```shell
pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
```

### How to Enable the Extensions?

#### 1. Enable/Disable extensions permanently
Type following line in terminal can enable/disable specific functions anytime.

```shell
jupyter nbextension enable <nbextension require path>
jupyter nbextension disable <nbextension require path>
```

e.g. to have [foldable code blocks](http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/codefolding/readme.html){:target="_blank"} in the notebooks, 

```shell
jupyter nbextension enable codefolding/main
```

#### 2. Enable functions when editing notebook temporarily
To enable [collapsible headings](http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/collapsible_headings/readme.html){:target="_blank"} when editing, 
 just run a cell with following codes in the notebook

```python
%%javascript
utils.load_extension('collapsible_headings/main')
```

#### 3. [Exporters](http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/exporting.html#exporters){:target="_blank"}
To enable the funtions made by the inlining css & javascript (such as collapsible headings) after being converted to html,

```shell
jupyter nbconvert --to html_ch <notebook_name>.ipynb
```

Or convert the images in notebooks to base64 images and embed into html 
(P.S. base64 images make web loading time longer),

```shell
jupyter nbconvert --to html_embed <notebook_name>.ipynb
```

#### 4. [Preprocessor](http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/exporting.html#preprocessors){:target="_blank"}
With following commands, the folded code blocks in the notebook will remained folded in .html (lose the expand/fold function)

```shell
jupyter nbconvert --to html --CodeFoldingPreprocessor.remove_folded_code=True <notebook_name>.ipynb
```

### Reference

1. [Unofficial Jupyter Notebook Extensions](http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/exporting.html)
2. https://github.com/ipython-contrib/jupyter_contrib_nbextensions/issues/822
3. https://github.com/ipython-contrib/jupyter_contrib_nbextensions/pull/1058


