<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                           placeholder="Informe o nome"/>
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
                   ng-click="search(searchForm, false);"
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
        Erro ao processar a requisição.
    </span>
</div>
