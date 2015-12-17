<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Registration</title>
    <script src="../../resources/js/registration-validate.js" defer></script>


    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251"/>
    <link href="../../css/style.css" rel="stylesheet"/>
    <link rel="icon" href="../../images/sign.png" type="image/x-icon" />
</head>
<body background="../../images/calendar.jpg" style="background-size: 100%">
<table>
    <tr>
        <td>
            <img src="../../images/signMenu.png" alt="Sign" width="100" height="50">
        </td>
        <td>
            <h1 class="styleText">MyCalendar</h1>
        </td>
    </tr>
</table>


<form action="/Registration" method="POST" commandName = "user" style="position:fixed; top:10%; left:22%">
    <fieldset>
        <legend class="styleText">Registration</legend>
        <table class="styleText" style="width: 200px">
            <tr>
                <td>Name</td>
                <td><input name="name" type="text" style="width: 200px" /><br /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input name="e_mail" type="email" style="width: 200px" /><br /></td>
            </tr>
            <tr>
                <td>Login</td>
                <td><input name="login" type="text" style="width: 200px" /><br /></td>
            </tr>

            <tr class="control-group">
                <td class="controls">
                    <c:if test="${not empty error}">
                        <td class="alert alert-danger" role="alert">
                            User with such username already exists
                        </td>
                    </c:if>
                </td>
            </tr>

            <tr>
                <td>Password</td>
                <td><input name="password" type="password" maxlength="8" style="width: 200px" /><br /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="registr" value="Add user" class="button"  style="width: 200px" /><br/></td>
            </tr>
        </table>

    </fieldset>
</form>

</body>
</html>