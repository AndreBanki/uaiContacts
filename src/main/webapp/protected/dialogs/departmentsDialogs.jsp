<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog">
    <div class="modal-header">
        <h3 id="addModalLabel" class="displayInLine">
            Novo contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="newForm" novalidate >
            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* Nome:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               autofocus
                               ng-model="department.name"
                               name="name"
                               placeholder="Nome do departamento"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newForm.name.$error.required">
                                        Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="createDepartment(newForm);"
                       value='OK'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#addModal');">
                    Cancelar
                </button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="updateModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog">
    <div class="modal-header">
        <h3 id="updateModalLabel" class="displayInLine">
            Atualizar departamento
        </h3>
    </div>
    <div class="modal-body">
        <form name="updateForm" novalidate>
            <input type="hidden"
                   required
                   ng-model="department.id"
                   name="id"
                   value="{{department.id}}"/>

            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* Nome:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               autofocus
                               required
                               ng-model="department.name"
                               name="name"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateForm.name.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="updateDepartment(updateForm);"
                       value='OK'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#updateModal');">
                    Cancelar</button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="deleteModal"
     class="modal hide fade in centering"
     role="dialog">
    <div class="modal-header">
        <h3 id="deleteModalLabel" class="displayInLine">
            Excluir contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="deleteForm" novalidate>
            <p>Deseja apagar&nbsp;{{department.name}}?</p>

            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="deleteDepartment();"
                   value='Sim'/>
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#deleteModal');">
                Não
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorIllegalAccess">
        <spring:message code="request.illegal.access"/>
    </span>
</div>

<div id="searchModal"
     class="modal hide fade in centering"
     role="dialog">
    <div class="modal-header">
        <h3 id="searchModalLabel" class="displayInLine">
            Pesquisar
        </h3>
    </div>
    <div class="modal-body">
        <form name="searchForm" novalidate>
            <label>Pesquisar por</label>

            <div>
                <div class="input-append">
                    <input type="text"
                           autofocus
                           required
                           ng-model="searchFor"
                           name="searchFor"
                           placeholder="Nome do departamento"/>
                </div>
                <div class="input-append displayInLine">
                    <label class="displayInLine">
                        <span class="alert alert-error"
                              ng-show="displayValidationError && searchForm.searchFor.$error.required">
                            Campo obrigatório
                        </span>
                    </label>
                </div>
            </div>
            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="searchDepartment(searchForm, false);"
                   value='OK'
                    />
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#searchModal');">
                Cancelar
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>
