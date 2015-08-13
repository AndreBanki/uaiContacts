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
                               ng-model="contact.name"
                               name="name"
                               placeholder="Nome do contato"/>
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
                <div>
                    <div class="input-append">
                        <label>* E-mail:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="contact.email"
                               name="email"
                               placeholder="contato@email.com"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newForm.email.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* Telefone:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="contact.phoneNumber"
                               name="phoneNumber"
                               placeholder="9999-9999"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newForm.phoneNumber.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* Departamento:</label>
                    </div>
                    <div class="input-append">
                      <select id="department"
                              ng-model="contact.department" 
                              ng-options="department as department.name for department in departments"
                              required>
                      </select>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newForm.department.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="createContact(newForm);"
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
            Atualizar contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="updateForm" novalidate>
            <input type="hidden"
                   required
                   ng-model="contact.id"
                   name="id"
                   value="{{contact.id}}"/>

            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* Nome:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               autofocus
                               required
                               ng-model="contact.name"
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
                <div>
                    <div class="input-append">
                        <label>* E-mail:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="contact.email"
                               name="email"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateForm.email.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* Telefone:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="contact.phoneNumber"
                               name="phoneNumber"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateForm.phoneNumber.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* Departamento:</label>
                    </div>
                    <div class="input-append">
                      <select id="department"
                      		  ng-model="contact.department.id" 
                              ng-options="department.id as department.name for department in departments"
                              required>
                      </select>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newForm.department.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="updateContact(updateForm);"
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
