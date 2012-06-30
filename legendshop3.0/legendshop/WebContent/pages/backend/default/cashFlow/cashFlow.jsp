<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ include file="/pages/common/back-common.jsp"%>
<%@ include file="/pages/common/taglib.jsp"%>
<html>
    <head>
        <title>创建CashFlow</title>
         <script type='text/javascript' src="<ls:templateResource item='/common/js/jquery.js'/>"></script>
         <script type='text/javascript' src="<ls:templateResource item='/common/js/jquery.validate.js'/>" /></script>
        <link rel="stylesheet" type="text/css" media="screen" href="<ls:templateResource item='/common/css/default/indexJpgForm.css'/>" />
        <style type="text/css" media="all">
          @import url(<ls:templateResource item='/common/css/default/screen.css'/>);
        </style>
        <script language="javascript">
		    $.validator.setDefaults({
		    });

    $(document).ready(function() {
    jQuery("#form1").validate({
            rules: {
            banner: {
                required: true,
                minlength: 5
            },
            url: "required"
        },
        messages: {
            banner: {
                required: "Please enter banner",
                minlength: "banner must consist of at least 5 characters"
            },
            url: {
                required: "Please provide a password"
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
    <body>
        <form action="<ls:url address='/admin/cashFlow/save'/>" method="post" id="form1">
            <input id="flowId" name="flowId" value="${cashFlow.flowId}" type="hidden">
            <div align="center">
            <table border="0" align="center" class="${tableclass}" id="col1">
                <thead>
                    <tr class="sortable">
                        <th colspan="2">
                            <div align="center">
                                创建CashFlow
                            </div>
                        </th>
                    </tr>
                </thead>
     			     <tr>
        <td>
          <div align="center">UserId: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="userId" id="userId" value="${cashFlow.userId}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">UserName: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="userName" id="userName" value="${cashFlow.userName}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">AdminId: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="adminId" id="adminId" value="${cashFlow.adminId}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">DetailId: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="detailId" id="detailId" value="${cashFlow.detailId}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">Detail: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="detail" id="detail" value="${cashFlow.detail}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">Direction: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="direction" id="direction" value="${cashFlow.direction}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">Money: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="money" id="money" value="${cashFlow.money}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">Action: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="action" id="action" value="${cashFlow.action}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">CreateTime: <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="createTime" id="createTime" value="${cashFlow.createTime}" /></p>
        </td>
      </tr>

                <tr>
                    <td colspan="2">
                        <div align="center">
                            <input type="submit" value="添加" />
                            <input type="reset" value="重置" />
                            <input type="button" value="返回"
                                onclick="window.location='<ls:url address="/admin/cashFlow/query"/>'" />
                        </div>
                    </td>
                </tr>
            </table>
           </div>
        </form>
    </body>
</html>


