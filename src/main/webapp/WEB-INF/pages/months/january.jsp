<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>MyCalendar</title>
  <link rel="stylesheet" href="../../../resources/css/styleCalend.css">
  <link rel="stylesheet" href="../../../resources/css/style.css">
  <link href="../../../resources/css/menuStyle.css" rel="stylesheet"/>
  <link rel="icon" href="../../../resources/images/sign.png" type="image/x-icon" />
  <link rel="stylesheet" href="../../../resources/css/styleControlNote.css">

  <link rel='stylesheet' href='webjars/bootstrap/3.3.5/css/bootstrap.min.css' type='text/css' media='all'>

  <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
  <script src="webjars/jquery-validation/1.14.0/jquery.validate.min.js"></script>
  <script src="webjars/jquery-validation/1.14.0/jquery.validate.js"></script>
  <script src="webjars/jquery-validation/1.14.0/additional-methods.min.js"></script>
  <script src="webjars/jquery-validation/1.14.0/additional-methods.js"></script>
  <script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body style="background: #dad8c0">

<table style="margin-top: 30px">
  <tr>
    <ul id="menu">
      <li style="margin-left: 10px;"><img src="../../../resources/images/signMenu.png" style="width: 35px; height: 31px"></li>
      <li class="styleText">${user.username}</li>
      <li><a href="<c:url value="/month"/>">Home</a></li>
      <li><a href="<c:url value="/all_notes"/>">All events</a></li>
      <li><a href="<c:url value="/j_spring_security_logout"/>">Exit</a></li>
    </ul>
  </tr>
</table>


<c:url var="notes_link" value="/${user.username}/notes"/>
<section class="container">
  <div class="cal">
    <table class="cal-table">
      <caption class="cal-caption">
        <a href="<c:url value="/month/last"/>" class="prev">&laquo;</a>
        <a href="<c:url value="/month/next"/>" class="next">&raquo;</a>
        ${name_month_year}
      </caption>

      <tbody class="cal-body">
      <tr>
        <td class="cal-off"><a>28</a></td>
        <td class="cal-off"><a>29</a></td>
        <td class="cal-off"><a>30</a></td>
        <td class="cal-off"><a>31</a></td>

        <c:choose>
          <c:when test="${current_day == '2016-01-01'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-01"/>">1</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-01')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-01"/>">1</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-01"/>">1</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-02'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-02"/>">2</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-02')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-02"/>">2</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-02"/>">2</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-03'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-03"/>">3</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-03')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-03"/>">3</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-03"/>">3</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
      </tr>
      <tr>
        <c:choose>
          <c:when test="${current_day == '2016-01-04'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-04"/>">4</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-04')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-04"/>">4</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-04"/>">4</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-05'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-05"/>">5</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-05')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-05"/>">5</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-05"/>">5</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-06'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-06"/>">6</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2015-01-06')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-06"/>">6</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-06"/>">6</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>


        <c:choose>
          <c:when test="${current_day == '2016-01-07'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-07"/>">7</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-07')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-07"/>">7</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-07"/>">7</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-08'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-08"/>">8</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-08')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-08"/>">8</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-08"/>">8</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-09'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-09"/>">9</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-09')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-09"/>">9</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-09"/>">9</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-10'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-10"/>">10</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-10')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-10"/>">10</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-10"/>">10</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
      </tr>
      <tr>
        <c:choose>
          <c:when test="${current_day == '2016-01-11'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-11"/>">11</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-11')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-11"/>">11</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-11"/>">11</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-12'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-12"/>">12</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-12')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-12"/>">12</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-12"/>">12</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-13'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-13"/>">13</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-13')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-13"/>">13</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-13"/>">13</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-14'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-14"/>">14</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-14')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-14"/>">14</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-14"/>">14</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-15'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-15"/>">15</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-15')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-15"/>">15</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-15"/>">15</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-16'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-16"/>">16</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-16')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-16"/>">16</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-16"/>">16</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-17'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-17"/>">17</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-17')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-17"/>">17</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-17"/>">17</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
      </tr>
      <tr>
        <c:choose>
          <c:when test="${current_day == '2016-01-18'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-18"/>">18</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-18')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-18"/>">18</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-18"/>">18</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-19'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-19"/>">19</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-19')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-19"/>">19</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-19"/>">19</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-20'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-20"/>">20</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-20')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-20"/>">20</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-20"/>">20</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-21'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-21"/>">21</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-21')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-21"/>">21</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-21"/>">21</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-22'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-22"/>">22</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-22')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-22"/>">22</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-22"/>">22</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-23'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-23"/>">23</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-23')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-23"/>">23</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-23"/>">23</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-24'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-24"/>">24</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-24')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-24"/>">24</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-24"/>">24</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
      </tr>
      <tr>
        <c:choose>
          <c:when test="${current_day == '2016-01-25'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-25"/>">25</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-25')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-25"/>">25</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-25"/>">25</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${current_day == '2016-01-26'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-26"/>">26</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-26')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-26"/>">26</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-26"/>">26</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-27'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-27"/>">27</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-27')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-27"/>">27</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-27"/>">27</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-28'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-28"/>">28</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-28')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-28"/>">28</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-28"/>">28</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-29'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-29"/>">29</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-29')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-29"/>">29</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-29"/>">29</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-30'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-30"/>">30</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-30')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-30"/>">30</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-30"/>">30</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${current_day == '2016-01-31'}">
            <td class="cal-selected"><a href="<c:url value="/${user.username}/notes/2016-01-31"/>">31</a></td>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${date_notes.contains('2016-01-31')}">
                <td class="cal-check"><a href="<c:url value="/${user.username}/notes/2016-01-31"/>">31</a></td>
              </c:when>
              <c:otherwise>
                <td><a href="<c:url value="/${user.username}/notes/2016-01-31"/>">31</a></td>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

      </tr>
      </tbody>
    </table>
  </div>
</section>


<section class="about">
  <p class="about-author">
    &copy; 2015&ndash;2016 <a>MyCalendar</a>
    <a>AlenaLipinskaya</a>
  </p>
  <p class="mail">
    <a>lipinskaya_alena@mail.ru</a><br>
  </p>
</section>
</body>
</html>
