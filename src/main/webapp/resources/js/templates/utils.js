var app = angular.module('uaiContacts', []);

app.directive('myInput', function () {

	var controller = ['$scope', function ($scope) {

		function init() {
				alert("label = " + $scope.label + "required = " + $scope.required);
				$scope.requiredFlag = ($scope.required ? 'required' : '');
				$scope.autofocusFlag = ($scope.autofocus ? 'autofocus' : '');
    }

		init();
  }],

		template =
		 '<div class="input-append">' +
		 '   <label>{{label}}</label>' +
		 '</div>' +
		 '<div class="input-append">' +
		 '   <input type="text"' +
		 '   {{requiredFlag}}' +
		 '   {{autofocusFlag}}' +
		 '          ng-model="contact.name"' +
		 '          name="name"' +
		 '          placeholder="Nome do contato"/>' +
		 '</div>';

		return {
		       restrict: "E",
					 scope: {
						 label: "@",
						 required: "@",
						 autofocus: "@"
					 },
					 controller: controller,
					 template: template
		};
});
