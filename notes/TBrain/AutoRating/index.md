---
layout: topic
title: "TBrain StudyGroup Discussion Record"
date: 2018-02-28
modified: 2018-04-17
tags:
image:
  feature: brainbanner.png
fbcomments: yes
description: "IT IS A SECRET"
TopicShare: true
---

{% include toc.html %}

<!-- include ajax -->
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<!-- form, button and output -->
<input type="text" id="input" name="input" placeholder="The path of CSV"/>
<button id="btn">Upload</button>
<div id="api_output"> </div>

<script>
function api_call(input) {
    $.ajax({
        url: "http://0.0.0.0:5000/api",
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(input),
        success: function( data, textStatus, jQxhr ){
            $('#api_output').html( data.output );
            $("#input").val("");
        },
        error: function( jqXhr, textStatus, errorThrown ){
            $('#api_output').html( "There was an error" );
            console.log( errorThrown );
        },
        timeout: 3000
    });
}
$( document ).ready(function() {
    // request when clicking on the button
    $('#btn').click(function() {
        var input = $("#input").val();
        api_call(input);
        input = "";
    });
});
</script>
