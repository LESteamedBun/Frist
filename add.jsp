<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="padding:10px">
<script type="text/javascript">
	
	


	$(function(){
		//表单验证规则
		$.extend($.fn.validatebox.defaults.rules, {    
		    Sname: {    
		        validator: function(value){    
		        	return /^[\u0391-\uFFE5]+$/.test(value);   
		        },    
		        message: '请输入字符串'   
		    },
			Sage:{    
		        validator: function(value){    
		        	return /^[-+]?\d*$/.test(value);   
		        },    
		        message: '请输入数字'   
			} 
		});
		
		$('#add_submit').click(function(){
			$('#add_form').form('submit', {    
			    url:"../student/add.go",    
			    onSubmit: function(){
			    	
			    },    
			    success:function(data){
			        if(data==1){
			        	alert("添加成功");
			        	//关闭弹出框
			        	$("#add_Dialog").dialog("close");
			        	//刷新数据显示
			        	$("#student_table").datagrid("reload");
			        }else{
			        	$.messager.alert("新增失败","请重新添加")
			        }  
			    }    
			});
		});
	})
</script>
信息管理>>学生管理>>新增
<hr/>
<form action="" id="add_form">
<input type="hidden" name="s_id" value="0">
	<table style="margin-left:50px">
		<tr height="30"><td>姓名：</td><td><input type="text" name="s_name" class="easyui-validatebox" data-options="validType:'Sname'"/></td></tr>
		<tr height="30"><td>性别：</td><td><input type="text" name="s_sex"/></td></tr>
		<tr height="30"><td>年龄：</td><td><input type="text" name="s_age" class="easyui-validatebox" data-options="validType:'Sage'"></input> 
		<tr height="30"><td>生日：</td><td><input type="text" name="s_brithday"/></td></tr>
		<tr height="30"><td>班级：</td><td><input type="text" name="c_name"/></td></tr>
		<tr height="30"><td width="300px" align="right"" colspan="2"><a id="add_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">提交</a> </td></tr>
	</table>
</form>

</body>
</html>