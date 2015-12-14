var app = angular.module('sift', []);

  app.controller('mainController', ['$scope', '$http', function($scope, $http) {
    $scope.submit = function(){
      var urls = $http.get('/api/search', { params: { keyword: $scope.keyword, paths: $scope.checkboxModel } })
      .success(function(urlData){
        $scope.urls = urlData
      })
    }
    $scope.populateRepositories = function(){
      var repositories = $http.get('/api/repositories')
      .success(function(repositories){
        $scope.repositories = repositories
      })
    }
  }])
