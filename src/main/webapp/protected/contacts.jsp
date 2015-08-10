<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row-fluid" ng-controller="contactsController">
    <jsp:include page="dialogs/searchButton.jsp"/>
    <div>
        <jsp:include page="dialogs/alerts.jsp"/>
        <div id="gridContainer" ng-show="state == 'list'">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">Departamento</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="contact in page.source">
                    <td class="tdContactsCentered">{{contact.name}}</td>
                    <td class="tdContactsCentered">{{contact.email}}</td>
                    <td class="tdContactsCentered">{{contact.phoneNumber}}</td>
                    <td class="tdContactsCentered">{{contact.department.name}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{contact.id}}"/>
                            <a href="#updateModal"
                               ng-click="selectedContact(contact);"
                               role="button"
                               class="btn btn-primary" data-toggle="modal">
                                <i class="icon-pencil"></i>
                            </a>
                            <a href="#deleteModal"
                               ng-click="selectedContact(contact);"
                               role="button"
                               class="btn btn-primary" data-toggle="modal">
                                <i class="icon-minus"></i>
                            </a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <jsp:include page="dialogs/navigator.jsp"/>
        </div>
        <jsp:include page="dialogs/addButton.jsp"/>
        <jsp:include page="dialogs/contactsDialogs.jsp"/>
        <jsp:include page="dialogs/deleteDialog.jsp"/>
        <jsp:include page="dialogs/searchDialog.jsp"/>
    </div>
</div>
<script src="<c:url value="/resources/js/pages/contacts.js" />"></script>
