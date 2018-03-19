---
layout: article
title: "PyTorch Taipei 2018 week2: ZFNet"
modified:
categories: articles
excerpt: ""
tags: [DL, PyTorchTP]
image:
  feature:
  teaser:
  thumb:
date: 2018-03-10
---
<script src="/3d/three.js"></script>

<script>
  var camera, scene, renderer;
  var mesh;
  init();
  animate();
  function init() {
    camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 1000 );
    camera.position.z = 400;
    scene = new THREE.Scene();
    var texture = new THREE.TextureLoader().load( 'textures/crate.gif' );
    var geometry = new THREE.BoxBufferGeometry( 200, 200, 200 );
    var material = new THREE.MeshBasicMaterial( { map: texture } );
    mesh = new THREE.Mesh( geometry, material );
    scene.add( mesh );
    renderer = new THREE.WebGLRenderer();
    renderer.setPixelRatio( window.devicePixelRatio );
    renderer.setSize( window.innerWidth, window.innerHeight );
    document.body.appendChild( renderer.domElement );
    //
    window.addEventListener( 'resize', onWindowResize, false );
  }
  function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize( window.innerWidth, window.innerHeight );
  }
  function animate() {
    requestAnimationFrame( animate );
    mesh.rotation.x += 0.005;
    mesh.rotation.y += 0.01;
    renderer.render( scene, camera );
  }
</script>

2013 ImageNet 冠軍
以視覺化方法洞察AlexNet並作微調

看filter學到甚麼 Deconvolution

* Max Unpooling by Switches
switches會記錄max pooling 出現最大值的位置， unpooling的時候還原，其他位置補0

* filter轉置
1. dot(img to columns, filter to rows)


DeconvNet用途:
生成圖片unsupervised feature learning
GAN生成圖
etc


HOW?
training feature map
github/jalused

觀察:
more layer, more epoches needed

the effects of scaling & translation decreased deeper layer

The 1st layer in the AlexNet is empty -> how to improve it?
1. filter downsize (11->7)
2. stride 4 -> 2
3. more filtera in deeper layer
4. loss function: cross-entropy loss

Effect:
1. err rate 16.4% -> 11.2%
2. only using 1.3mil picture


補1
[熱圖]
顯示net抓到那些地方

補2 from 李宏毅
what filter can learn
所有feature map回train輸入圖

FC 抓到較為全體的特徵
output層輸出圖已經無法被人理解


111111111111111
