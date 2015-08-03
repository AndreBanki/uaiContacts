<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="masthead">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav" ng-controller="LocationController">
                    <li ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}" >
                        <a href="<c:url value="/"/>"
                             <p>Home</p>
                        </a>
                    </li>
                    <li ng-class="{'gray': activeURL == 'contacts', '': activeURL != 'contacts'}">
                        <a href="<c:url value='/protected/contacts'/>">
                            <p>Contatos</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav pull-right">
                    <li><a href="<c:url value='/logout' />" 
                        <p class="displayInLine">Sair&nbsp;(${user.name})</p>
                    </a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
