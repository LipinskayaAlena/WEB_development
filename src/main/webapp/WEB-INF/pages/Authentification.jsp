<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Authentification</title>
    <script src="../../resources/js/login-validate.js" defer></script>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
    <link href="../../resources/css/style.css" rel="stylesheet"/>
    <link rel="icon" href="../../resources/images/sign.png" type="image/x-icon" />
</head>
<body background="../../resources/images/background.jpg" >
    <table>
        <tr>
            <td>
                <img src="../../resources/images/signMenu.png" alt="Sign" width="100" height="50">
            </td>
            <td>
                <h1 class="styleText">MyCalendar</h1>
            </td>
        </tr>
    </table>

    <form id="login-form" action="<c:url value="/j_spring_security_check"/>" method="POST" style="position: fixed; top: 35%; left: 42%; width: 200px">
        Login:<br /> <input type="text" name="username" style="width: 200px"/><br />
        Password:<br /> <input type="password" name="password" maxlength="8" style="width: 200px"/><br />
       <button type="submit" class="button" align="center" style="width: 200px"> Enter </button>

            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Error:</span>
                    Invalid username or password
                </div>
            </c:if>
    </form>
    <a href="Registration"><input name="registr" value="Registration" type="button" class="button"
                                       style="position: fixed; left:42%; top: 60%; width: 200px" /></a>
</body>
</html>
