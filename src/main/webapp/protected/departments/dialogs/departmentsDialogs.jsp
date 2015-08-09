<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addDepartmentModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addDepartmentsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="addDepartmentsModalLabel" class="displayInLine">
            Novo contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="newDepartmentForm" novalidate >
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
                               placeholder="Nome do departmento"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newDepartmentForm.name.$error.required">
                                        Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="createDepartment(newDepartmentForm);"
                       value='OK'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#addDepartmentsModal');"
                        aria-hidden="true">
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

<div id="updateDepartmentsModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updateDepartmentsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="updateDepartmentsModalLabel" class="displayInLine">
            Atualizar departmento
        </h3>
    </div>
    <div class="modal-body">
        <form name="updateDepartmentForm" novalidate>
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
                                      ng-show="displayValidationError && updateDepartmentForm.name.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="updateDepartment(updateDepartmentForm);"
                       value='OK'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#updateDepartmentsModal');"
                        aria-hidden="true">
                    Cancelar</button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="deleteDepartmentsModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchDepartmentsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="deleteDepartmentsModalLabel" class="displayInLine">
            Excluir contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="deleteDepartmentForm" novalidate>
            <p>Deseja apagar&nbsp;{{department.name}}?</p>

            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="deleteDepartment();"
                   value='Sim'/>
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#deleteDepartmentsModal');"
                    aria-hidden="true">
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

<div id="searchDepartmentsModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchDepartmentsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="searchDepartmentsModalLabel" class="displayInLine">
            Pesquisar
        </h3>
    </div>
    <div class="modal-body">
        <form name="searchDepartmentForm" novalidate>
            <label>Pesquisar por</label>

            <div>
                <div class="input-append">
                    <input type="text"
                           autofocus
                           required
                           ng-model="searchFor"
                           name="searchFor"
                           placeholder="Nome do departmento"/>
                </div>
                <div class="input-append displayInLine">
                    <label class="displayInLine">
                        <span class="alert alert-error"
                              ng-show="displayValidationError && searchDepartmentForm.searchFor.$error.required">
                            Campo obrigatório
                        </span>
                    </label>
                </div>
            </div>
            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="searchDepartment(searchDepartmentForm, false);"
                   value='OK'
                    />
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#searchDepartmentModal');"
                    aria-hidden="true">
                Cancelar
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>
