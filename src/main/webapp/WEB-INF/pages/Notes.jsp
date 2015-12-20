<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Notes</title>
    <link rel="stylesheet" href="../../resources/css/styleCalend.css">
    <link rel="stylesheet" href="../../resources/css/style.css">
    <link href="../../resources/css/menuStyle.css" rel="stylesheet"/>
    <link rel="icon" href="../../resources/images/sign.png" type="image/x-icon" />
    <link rel="stylesheet" href="../../resources/css/styleList.css">
    <link rel="stylesheet" href="../../resources/css/styleControlNote.css"/>

    <link rel='stylesheet' href='webjars/bootstrap/3.3.5/css/bootstrap.min.css' type='text/css' media='all'>

    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
    <script src="webjars/jquery-validation/1.14.0/jquery.validate.min.js"></script>
    <script src="webjars/jquery-validation/1.14.0/jquery.validate.js"></script>
    <script src="webjars/jquery-validation/1.14.0/additional-methods.min.js"></script>
    <script src="webjars/jquery-validation/1.14.0/additional-methods.js"></script>
    <script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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

  <table>
      <a class = "button" href="/add_note/${date}/${notes.size()}" style="height: 60px; margin-top: 20px">Add note</a>
      <c:forEach var="note" items="${notes}">
          <div class="button teach-me" id="note_editor" style="height: 60px; margin-top: 20px">
              <span id="note_text" class="item"><c:out value="${note.note_text}"/></span>
              <span id="note_date" class="meta cost"><c:out value="${note.note_date}"/></span>
              <i class="chevron"></i>
          </div>
          <a class = "button" href="/note/${note.note_id}/show">Edit note</a>
          <a class="button" onclick="return confirm('OK to delete ${note.note_text} ?');"
             href="/note/${user.username}/${note.note_id}/${date}/delete"> <i class="fa fa-times"></i>Delete note</a>
      </c:forEach>
  </table>
</body>
</html>
