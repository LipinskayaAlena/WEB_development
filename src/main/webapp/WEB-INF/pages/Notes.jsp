<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Notes</title>
    <link rel="icon" href="../../resources/images/sign.png" type="image/x-icon" />
</head>
<body>
  <table>
    <c:forEach var="note" items="${notes}">

      <tr>
        <td><c:out value="${note.note_text}"/></td>
        <td><c:out value="${note.note_date}"/></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
