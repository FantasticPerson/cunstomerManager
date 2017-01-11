<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="{{.baseurl}}/static/lib/jquery.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.all-3.5.min.js"></script>
	<link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
  </head>
  <body>


<ul id="deptTree" class="ztree" style="max-height:320px;overflow:auto;display:none;"></ul>
<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> 
	</div>
</body>
<script type="text/javascript">
 $(function (){

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
                }
              }
            };
        var $tree = $.fn.zTree.init($("#deptTree"), setting);
		
		var roleid = {{.id}};

		var fn = function () {
              setTreeNodes(roleid, $tree);
            };
        setTimeout(fn, 500);
    });
	
	
	function getRoleById (roleid) {
      var data = parent.window.__cache__.data;
      var target;
      for (var i = 0, item; item = data[i++];) {
        if (item['Id'] == roleid) {
          target = item;
          break;
        }
      }
      return target;
    }

    function setTreeNodes (roleid, $zTree) {
      var target = getRoleById(roleid);
      if (target) {
        var ids = target['Departs'].split(',');
        
        removeTreeNodes($zTree, $zTree.getNodes(), ids);
        
      }
	  $("#deptTree").show();
    }
	
	function removeTreeNodes($zTree, nodes, array) {
      if(!nodes) return;
      var arr = [];
      for (var i = 0, node; node = nodes[i++];) {
        if (node.children) {
          // deal with the children nodes first
          removeTreeNodes($zTree, node.children, array);
        }

        if (node.pId && !ArrayContains(node.pId, array) && isSubsChecked(node)) {
          // then deal with current node
          arr.push(node);
        }
      }

      for (var j=0, l = arr.length; j < l; j++) {
        $zTree.removeNode(arr[j]);
      }
    }
	
	function ArrayContains (item, array) {
      if (Array.prototype.indexOf) {
        return array.indexOf(item) >= 0
      } else {
        var ret = -1;
        for (var i=0, el; el = array[i]; i++) {
          if (el == item) {
            ret = i;
            break;
          }
        }
        return ret >= 0;
      }
    }
	
	function isSubsChecked (node) {
      if (node.children) {
        for (var i = 0, child; child = node.children[i++];) {
          if (!child.checked) {
            return false;
          }
        }
      }

      return true;
    }
</script>
</html>