<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        Erro ao processar a solicitação.
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
        Erro ao processar a solicitação.
    </span>
</div>
