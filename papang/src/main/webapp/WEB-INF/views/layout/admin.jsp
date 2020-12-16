<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
   <body>
   
    <section class="content">
      <tiles:insertAttribute name="header"/> <!--  /WEB-INF/views/common/layout/header.jsp -->
      <tiles:insertAttribute name="body"/> <!-- body -->
      <tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/common/layout/footer.jsp -->
    </section>
  </body>
</html>