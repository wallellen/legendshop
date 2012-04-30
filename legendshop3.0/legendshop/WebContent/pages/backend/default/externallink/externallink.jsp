<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/auth.tld" prefix="auth"%>
<%@ include file="/pages/common/back-common.jsp"%>
<html>
    <head>
        <title>创建友情连接</title>
        <script src="<ls:templateResource item='/common/js/jquery.js'/>" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.validate.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/common/css/indexJpgForm.css" />
        <script language="javascript">
    $.validator.setDefaults({
    });

    $(document).ready(function() {
    jQuery("#form1").validate({
            rules: {
            url: "required",
            wordlink: "required",
            content: "required",
            bs: "number"
        },
        messages: {
        	url: {
            required: "请输入连接地址"
        },
        wordlink: {
        	required: "请输入连接显示文字"
        },
        content: {
        	required: "请输入描述"
        },
        bs: {
			number: "显示顺序必须为数字"
            }
        }
    });
 
      $("#col1 tr").each(function(i){
      if(i>0){
         if(i%2 == 0){
             $(this).addClass('even');
         }else{    
              $(this).addClass('odd'); 
         }   
    }
     });   
         $("#col1 th").addClass('sortable'); 
});
</script>
</head>
  <body class="bodymargin">
   <table class="${tableclass}" style="width: 100%">
    <thead>
    	<tr><td><a href="<ls:url address='/admin/index'/>" target="_parent">首页</a> &raquo; 商城管理  &raquo; <a href="${pageContext.request.contextPath}/admin/externallink/query${applicationScope.WEB_SUFFIX}">连接管理</a> &raquo; 创建友情连接</td></tr>
    </thead>
    </table>
        <form action="${pageContext.request.contextPath}/admin/externallink/save${applicationScope.WEB_SUFFIX}" method="post" id="form1" enctype="multipart/form-data">
            <input id="id" name="id" value="${bean.id}" type="hidden">
            <div align="center">
            <table  align="center" class="${tableclass}" id="col1">
                <thead>
                    <tr>
                        <th colspan="2">
                            <div align="center">创建友情连接</div>
                        </th>
                    </tr>
                </thead>
      <tr>
        <td>
          <div align="right">连接地址<font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="url" id="url" value="${bean.url}" size="50" maxlength="300"/></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="right">连接显示文字<font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="wordlink" id="wordlink" value="${bean.wordlink}" size="50" maxlength="50"/></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="right">描述<font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="content" id="content" value="${bean.content}" size="50"/></p>
        </td>
      </tr>
      <tr><td>
              <div align="right">上传友情连接图片</div>
           </td>
           <td>
                        <p>
                            <input type="file" name="file" id="file" size="50"/>
                            <input type="hidden" name="picture" id="picture" size="80"
                                value="${bean.picture}" />
                        </p>
                    </td>
      </tr>
     <tr>
        <td>
          <div align="right">显示顺序（数字，越小越靠前）</div>
       </td>
        <td>
           <p><input type="text" name="bs" id="bs" value="${bean.bs}" /></p>
        </td>
      </tr>
                <tr>
                    <td colspan="2">
                        <div align="center">
                        <auth:auth ifAnyGranted="F_OPERATOR">
                            <input type="submit" value="提交" />
                         </auth:auth>
                            <input type="reset" value="重置" />
                            <input type="button" value="返回"
                                onclick="window.location='${pageContext.request.contextPath}/admin/externallink/query${applicationScope.WEB_SUFFIX}'" />
                        </div>
                    </td>
                </tr>
            </table>
            </div>
        </form>
    </body>
</html>

