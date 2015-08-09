<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <h4><i class="icon-info-sign"></i> Nenhum registro encontrado</h4><br/>

    <p>Utilize o botão Adicionar.</p>
</div>
