<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row-fluid" ng-controller="departmentsController">
    <jsp:include page="dialogs/searchButton.jsp"/>
    <div>
      <jsp:include page="dialogs/alerts.jsp"/>

        <div id="gridContainer" ng-show="state == 'list'">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col"></th>
                </tr>
                 </thead>
                 <tbody>
                 <tr ng-repeat="department in page.source">
                    <td class="tdContactsCentered">{{department.name}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{department.id}}"/>
                            <a href="#updateModal"
                               ng-click="selectedDepartment(department);"
                               role="button"
                               class="btn btn-primary" data-toggle="modal">
                                <i class="icon-pencil"></i>
                            </a>
                            <a href="#deleteModal"
                               ng-click="selectedDepartment(department);"
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
        <jsp:include page="dialogs/departmentsDialogs.jsp"/>
        <jsp:include page="dialogs/deleteDialog.jsp"/>
        <jsp:include page="dialogs/searchDialog.jsp"/>
    </div>
</div>
<script src="<c:url value="/resources/js/pages/departments.js" />"></script>
