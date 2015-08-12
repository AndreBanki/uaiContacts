<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <p>Deseja apagar este registro?</p>

            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="deleteEntity();"
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
        Erro ao processar a requisição.
    </span>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorIllegalAccess">
        Não foi possível excluir o registro.
    </span>
</div>
