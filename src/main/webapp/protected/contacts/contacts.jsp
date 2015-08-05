<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row-fluid" ng-controller="contactsController">
    <h2>
        <p class="text-right">
            <a href="#searchContactsModal"
               id="contactsHeaderButton"
               role="button"
               ng-class="{'': displaySearchButton == true, 'none': displaySearchButton == false}"
               class="btn btn-primary" data-toggle="modal">
                <i class="icon-search"></i>&nbsp;Filtrar
            </a>
        </p>
    </h2>
    <div>
        <div id="loadingModal" class="modal hide fade in centering"
             role="dialog"
             aria-labelledby="deleteContactsModalLabel" aria-hidden="true">
            <div id="divLoadingIcon" class="text-center">
                <div class="icon-align-center loading"></div>
            </div>
        </div>

        <div class="alert badge-inverse" ng-show="displaySearchMessage">
            <p class="messageToUser"><i class="icon-info-sign"></i>&nbsp;{{page.searchMessage}}</p>
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

        <div ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="contacts.emptyData"/></h4><br/>

            <p><spring:message code="contacts.emptyData.text"/></p>
        </div>

        <div id="gridContainer" ng-class="{'': state == 'list', 'none': state != 'list'}">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Telefone</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="contact in page.source">
                    <td class="tdContactsCentered">{{contact.name}}</td>
                    <td class="tdContactsCentered">{{contact.email}}</td>
                    <td class="tdContactsCentered">{{contact.phoneNumber}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{contact.id}}"/>
                            <a href="#updateContactsModal"
                               ng-click="selectedContact(contact);"
                               role="button"
                               class="btn btn-primary" data-toggle="modal">
                                <i class="icon-pencil"></i>
                            </a>
                            <a href="#deleteContactsModal"
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
        <div ng-class="{'text-center': displayCreateContactButton == true, 'none': displayCreateContactButton == false}">
            <br/>
            <a href="#addContactsModal"
               role="button"
               ng-click="resetContact();"
               title="<spring:message code='create'/>&nbsp;<spring:message code='contact'/>"
               class="btn btn-primary"
               data-toggle="modal">
                <i class="icon-plus"></i>
                &nbsp;&nbsp;Adicionar
            </a>
        </div>

        <jsp:include page="dialogs/contactsDialogs.jsp"/>

    </div>
</div>

<script src="<c:url value="/resources/js/pages/contacts.js" />"></script>
