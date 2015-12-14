var app = angular.module('sift', []);

  app.controller('mainController', ['$scope', '$http', function($scope, $http) {
    $scope.submit = function(){
      console.log("submitting")
      var urls = $http.get('/api/search', { params: { keyword: $scope.keyword } })
      .success(function(urlData){
        $scope.urls = urlData
      })
    }
    $scope.submitCollection = function() {
      $scope.showCollectionForm = false;
    }
    $scope.showCollectionForm = function() {
      $scope.showCollectionForm = true;
    }
    $scope.showSearchForm = function() {
      $scope.showSearchForm = true;
    }
  }])
