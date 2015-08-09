<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="text-center" ng-show="displayCreateButton">
    <br/>
    <a href="#addModal"
       role="button"
       ng-click="resetEdition();"
       class="btn btn-primary"
       data-toggle="modal">
        <i class="icon-plus"></i>
        &nbsp;&nbsp;Adicionar
    </a>
</div>
