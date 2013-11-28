
//angular.module('patientAnimations', ['ngAnimate']);
var patientsApp = angular.module('patientsApp',[
    'ngRoute','ngAnimate']);

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

patientsApp.controller('PatientNewCtrl', ['$scope', '$http', function($scope, $http){
  $scope.savePatient = function() {
    var url="/patients";
    var patientwrapper={} ;
    patientwrapper.patient = $scope.patient;
    var json = angular.toJson(patientwrapper);
    alert(json);
    $http({
      method: 'POST',
      url: url,
      data:json, 
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    })

  }

    }]);