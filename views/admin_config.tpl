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


<ul id="deptTree" class="ztree" style="max-height:320px;overflow:auto;"></ul>
<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="doConfig();" value="确定" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
var roleid = {{.id}};
 $(function (){

        var setting = {
				check:{
					enable:true, 
					chkboxType:{"Y":"","N":""},
				 },
              view: {
                selectedMulti: true
              },
              async:{
                type:"get",
                enable: true,
                url:'{{.baseurl}}/depart/gettree2.do'
              },
              callback:{
                onClick:function(e,tid,tnode){

                  if(tnode.type=='0'){
					currentDeptName = tnode.name;
					currentDeptId = tnode.pId;
                  }
                }
              }
            };
        var $tree = $.fn.zTree.init($("#deptTree"), setting);

		var fn = function () {
              setTreeNodes(roleid, $tree);
            };
        setTimeout(fn, 500);
    });
	
	function setTreeNodes (roleid, $zTree) {
      var target = getRoleById(roleid);
      if (target) {
        var ids = target['Departs'].split(',');
        
        for (var i = 0, id; id = ids[i++];) {
          var node=$zTree.getNodeByParam("pId",id);
          !!node && $zTree.checkNode(node, true);
        }
        
      }
    }
	
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
	
	function doConfig(){
		var zTree = $.fn.zTree.getZTreeObj("deptTree");
		  var nodes = zTree.getCheckedNodes();
		  var departIds = getFixedSelectedNodes(zTree, nodes).join(',');
		  $.ajax({
			type : "GET",
			url : '{{.baseurl}}/superadmin/setDeparts.do?id='+roleid+'&did='+departIds,
			success : function () {
			  alert("配置成功");
			  parent.navTab.reload('{{.baseurl}}/role/main.do',null,"GET");
			  parent.dialog.close();
			}
		  });
	}
	
	function getFixedSelectedNodes (ztree, nodes) {
      var array = [];
      for (var i = 0, node; node = nodes[i++];) {
        var allSubFlag = true;
        if (node.children) {
          var children = node.children;
          for (var j = 0, child; child = children[j++];) {
            if (!child.checked) {
              allSubFlag = false;
              break;
            }
          }
        } else {
          allSubFlag = false;
        }

        if (!allSubFlag) {
          array.push(node.pId);
        }
      }
      return array;
    }
</script>
</html>