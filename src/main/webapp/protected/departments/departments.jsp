<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row-fluid" ng-controller="departmentsController">
    <h2>
        <p class="text-right">
            <a href="#searchModal"
               id="headerButton"
               role="button"
               ng-show="displaySearchButton"
               class="btn btn-primary" data-toggle="modal">
                <i class="icon-search"></i>&nbsp;Filtrar
            </a>
        </p>
    </h2>
    <div>
        <div id="loadingModal" class="modal hide fade in centering"
             role="dialog">
            <div id="divLoadingIcon" class="text-center">
                <div class="icon-align-center loading"></div>
            </div>
        </div>

        <div class="alert badge-inverse" ng-show="displaySearchMessage">
            <p class="messageToUser"><i class="icon-info-sign"></i>&nbsp;Mostrando resultados filtrados por: {{searchFor}}</p>
            <p class="text-right">
            <a href="#"
               role="button"
               ng-click="resetSearch();"
               class="btn btn-primary" data-toggle="modal">
                <i class="icon-remove"></i> Limpar filtro
            </a>
          </p>
        </div>

        <div class="alert badge-inverse" ng-show="displayMessageToUser">
            <h4 class="displayInLine">
                <p class="messageToUser displayInLine"><i class="icon-info-sign"></i>&nbsp;{{page.actionMessage}}</p>
            </h4>
        </div>

        <div ng-class="{'alert alert-block alert-error': state == 'error', 'none': state != 'error'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="error.generic.header"/></h4><br/>

            <p><spring:message code="error.generic.text"/></p>
        </div>

        <div class="alert alert-info" ng-show="state == 'noresult'">
            <h4><i class="icon-info-sign"></i> Nenhum departamento encontrado</h4><br/>

            <p>Utilize o botão Adicionar para criar um departamento.</p>
        </div>

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

            <div class="text-center">
                <button href="#" class="btn btn-primary"
                        ng-class="{'btn-primary': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
                        >
                    Primeiro
                </button>
                <button href="#"
                        class="btn btn-primary"
                        ng-class="{'btn-primary': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" class="btn btn-primary"
                        ng-click="changePage(page.currentPage - 1)"
                        >&lt;</button>
                <span>Página {{page.currentPage + 1}} de {{page.pagesCount}}</span>
                <button href="#"
                        class="btn btn-primary"
                        ng-class="{'btn-primary': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-click="changePage(page.currentPage + 1)"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        >&gt;</button>
                <button href="#"
                        class="btn btn-primary"
                        ng-class="{'btn-primary': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        ng-click="changePage(page.pagesCount - 1)"
                        >
                    Último
                </button>
            </div>
        </div>
        <div class="text-center" ng-show="displayCreateButton">
            <br/>
            <a href="#addModal"
               role="button"
               ng-click="resetDepartment();"
               class="btn btn-primary"
               data-toggle="modal">
                <i class="icon-plus"></i>
                &nbsp;&nbsp;Adicionar
            </a>
        </div>

        <jsp:include page="dialogs/departmentsDialogs.jsp"/>

    </div>
</div>

<script src="<c:url value="/resources/js/pages/departments.js" />"></script>
