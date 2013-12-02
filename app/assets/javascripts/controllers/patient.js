
//angular.module('patientAnimations', ['ngAnimate']);
var patientsApp = angular.module('patientsApp',[
    'ngRoute','ngAnimate']);
patientsApp.config(["$httpProvider", function($httpProvider){
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]); 
patientsApp.config(['$routeProvider',
    function($routeProvider){
      $routeProvider.
  when('/list',{
    templateUrl: '/assets/patientList.html',
  controller: 'PatientListCtrl'
  }).

when('/detail/:patientId', {
  templateUrl: '/assets/patient.html',
controller: 'PatientDetailCtrl'
}).

when('/new', {
  templateUrl: '/assets/patientNew.html',
controller: 'PatientNewCtrl'
}).
otherwise({
  redirectTo: '/list'});
}]);
function getPatientImg(gender){
  switch (gender){
    case 0:
      return "/assets/male.png";
      break;
    case 1:
      return "/assets/female.png";
      break;
    case 2:
      return "/assets/unknowgender.jpg";
      break;
  }

}


patientsApp.controller('PatientListCtrl', function($scope, $http) {
  $http.get('/patients.json').success(function(data) {
    $scope.patients = data;
    for (var i = 0; i < $scope.patients.length; i++){
      var patient = $scope.patients[i];
      patient.name = patient.firstname + ' ' + patient.lastname;

      patient.url="#detail/" + $scope.patients[i].id;
      patient.img_url = getPatientImg(patient.gender);
    }

  })
  $scope.deletePatient = function($index){
    $http.delete('/patients/' + $scope.patients[$index].id + ".json").success(function(data)
      {

    //alert("deleted " + $scope.patients[$index].id);
    $scope.patients.splice($index, 1);
      });

  };
});

patientsApp.controller('PatientDetailCtrl', ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams) {
  $scope.patientId = $routeParams.patientId;
  $http.get('/patients/' + $routeParams.patientId + '.json').success(function(data) {
    $scope.patient = data;
    $scope.patient.img_url = getPatientImg($scope.patient.gender);
    $scope.$watch('measurements', function () {
      $( "#accordion" ).accordion({heightStyle: "content"});
      return false;
    });
  })
}]);

patientsApp.controller('PatientNewCtrl', ['$scope', '$http', '$location', function($scope, $http, $location){

  $scope.savePatient = function() {
    var json = angular.toJson($scope.patient);
    var url="/patients.json";
    $http({
      method: 'POST',
      url: url,
      data:json, 
      headers: {'Content-Type': 'application/json', 'ACCEPT':  'application/json'}
    }).success(function(data){
      $location.path("/list");
    })

    }

    }]);
patientsApp.directive('datepicker', function() {
    return {
        restrict: 'A',
        require : 'ngModel',
        link : function (scope, element, attrs, ngModelCtrl) {
            $(function(){
      var d = new Date(1950, 0, 1);
			element.datepicker({
				dateFormat: 'yy-mm-dd',
        minDate: "-100Y", maxDate: 0,
        changeMonth: true,
        changeYear: true,
        defaultDate: d,
                    onSelect:function (date) {
                        scope.$apply(function () {
                            ngModelCtrl.$setViewValue(date);
                        });
                    }


			})
                element.datepicker({
                    dateFormat:'dd/mm/yy',
                });
            });
        }
    }
});
