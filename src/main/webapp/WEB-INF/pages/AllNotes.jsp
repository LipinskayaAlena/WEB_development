<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyNotes</title>
  <link rel="stylesheet" href="../../resources/css/styleCalend.css">
  <link rel="stylesheet" href="../../resources/css/style.css">
  <link href="resources/css/menuStyle.css" rel="stylesheet"/>
  <link rel="icon" href="../../resources/images/sign.png" type="image/x-icon" />
  <link rel="stylesheet" href="../../resources/css/styleList.css">
</head>
<body style="background: #dad8c0">
<table>
  <tr>
    <ul id="menu">
      <li style="margin-left: 10px;"><img src="../../resources/images/signMenu.png" style="width: 35px; height: 31px"></li>
      <li class="styleText">${user.username}</li>
      <li><a href="<c:url value="/month"/>">Home</a></li>
      <li><a href="<c:url value="/all_notes"/>">All events</a></li>
      <li><a href="<c:url value="/j_spring_security_logout"/>">Exit</a></li>
    </ul>
  </tr>
</table>


<c:forEach var="note" items="${all_notes}">
<a class="button teach-me" style="height: 60px; margin-top: 20px">
  <span class="item"><c:out value="${note.note_text}"/></span>
  <span class="meta cost"><c:out value="${note.note_date}"/></span>
  <i class="chevron"></i>
</a>
</c:forEach>




</body>
</html>
