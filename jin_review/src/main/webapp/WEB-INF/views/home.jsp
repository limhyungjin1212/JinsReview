<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Heroic Features - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/heroic-features.css" rel="stylesheet">

</head>

<body>
<div>
  <jsp:include page="include/header.jsp"></jsp:include>
</div>
  <!-- Page Content -->
  <div class="container">
     <jsp:include page="include/container.jsp"></jsp:include>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
   		<jsp:include page="include/footer.jsp"></jsp:include>
  </footer>

  </body>
</html>
