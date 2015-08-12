<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
