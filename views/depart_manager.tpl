<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/css/app.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <style>

  </style>
  <body> 
        <div class="container bs-docs-container">
          <h4>【部门管理】可新增顶级部门与添加子级部门</h4>
        <div class="col-md-9" role="main">
          <div class="btn btn-primary" onclick="addClick(0)">新增顶级部门</div>
         <div>
   
         <ul id="tree" class="ztree">
         </ul>
  </br>
      <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-primary" onclick="addClick()">确 定</button>
              </div>


</div>
<div>
  </body>

  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.core-3.5.js"></script>
    <script>
      (function(){
      var setting = {
            view: {
              selectedMulti: false
            },
            async:{
              type:"get",
              enable: true,
              url:'{{.baseurl}}/depart/gettree2.do'
            },
            callback:{
              onClick:function(e,tid,tnode){
                  window.returnValue= tnode.pId+','+tnode.name;
                  window.close();
              }
            }
          };
      $.fn.zTree.init($("#tree"), setting);
    })();

   /**
    * 新增部门，如果id为0,则表示新增顶级部门，否则为添加子集部门
    */
    function addClick(id){
      //弹出div,获取文本框的内容

    }
    </script>
  </html>