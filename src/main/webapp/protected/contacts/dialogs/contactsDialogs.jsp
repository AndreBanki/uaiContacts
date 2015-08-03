<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addContactsModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addContactsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="addContactsModalLabel" class="displayInLine">
            Novo contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="newContactForm" novalidate >
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
                                      ng-show="displayValidationError && newContactForm.name.$error.required">
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
                                      ng-show="displayValidationError && newContactForm.email.$error.required">
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
                                      ng-show="displayValidationError && newContactForm.phoneNumber.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="createContact(newContactForm);"
                       value='OK'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#addContactsModal');"
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

<div id="updateContactsModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updateContactsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="updateContactsModalLabel" class="displayInLine">
            Atualizar contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="updateContactForm" novalidate>
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
                                      ng-show="displayValidationError && updateContactForm.name.$error.required">
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
                                      ng-show="displayValidationError && updateContactForm.email.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="contacts.phone"/>:</label>
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
                                      ng-show="displayValidationError && updateContactForm.phoneNumber.$error.required">
                                    Campo obrigatório
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="updateContact(updateContactForm);"
                       value='OK'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#updateContactsModal');"
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

<div id="deleteContactsModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchContactsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="deleteContactsModalLabel" class="displayInLine">
            Excluir contato
        </h3>
    </div>
    <div class="modal-body">
        <form name="deleteContactForm" novalidate>
            <p>Deseja apagar&nbsp;{{contact.name}}?</p>

            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="deleteContact();"
                   value='Sim'/>
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#deleteContactsModal');"
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

<div id="searchContactsModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchContactsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="searchContactsModalLabel" class="displayInLine">
            Pesquisar
        </h3>
    </div>
    <div class="modal-body">
        <form name="searchContactForm" novalidate>
            <label>Pesquisar por</label>

            <div>
                <div class="input-append">
                    <input type="text"
                           autofocus
                           required
                           ng-model="searchFor"
                           name="searchFor"
                           placeholder="Nome do contato"/>
                </div>
                <div class="input-append displayInLine">
                    <label class="displayInLine">
                        <span class="alert alert-error"
                              ng-show="displayValidationError && searchContactForm.searchFor.$error.required">
                            Campo obrigatório
                        </span>
                    </label>
                </div>
            </div>
            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="searchContact(searchContactForm, false);"
                   value='OK'
                    />
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#searchContactsModal');"
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
