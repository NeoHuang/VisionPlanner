var patientsApp = angular.module('patientsApp',[
    'ngRoute']);
patientsApp.config(['$routeProvider',
    function($routeProvider){
      $routeProvider.
  when('/patients',{
    templateUrl: '/assets/patientList.html',
  controller: 'PatientListCtrl'
  }).
otherwise({
  redirectTo: '/patients'});
}]);
patientsApp.controller('PatientListCtrl', function($scope, $http) {
  $http.get('patients.json').success(function(data) {
    $scope.patients = data;
  })
});
