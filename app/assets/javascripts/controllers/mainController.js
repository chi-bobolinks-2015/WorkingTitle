var app = angular.module('sift', []);

  app.controller('mainController', ['$scope', '$http', function($scope, $http) {
    $scope.submit = function(){
      var urls = $http.get('/api/search', { params: { keyword: $scope.keyword, paths: $scope.checkboxModel } })
      .success(function(urlData){
        $scope.urls = urlData
      })
    }
    $scope.submitCollection = function() {
      var createCollection = $http.post('/collections.json', { collection: {collectionName: $scope.collection } } )
        .success(function(createCollection){
          console.log(createCollection)
          $scope.newCollectionID = createCollection.id;
          console.log($scope.newCollectionID)
        })
      $scope.showCollectionForm = false;

    }
    $scope.showCollectionForm = function() {
      $scope.showCollectionForm = true;
    }
    $scope.showSearchForm = function() {
      $scope.showSearchForm = true;
    }

  var organizations = $http.get('/api/organizations')
    .success(function(organizations){
      $scope.orgs = organizations
    })
  }])
