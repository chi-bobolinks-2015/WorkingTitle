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

    $scope.submitCollection = function() {
      var createCollection = $http.post('/collections.json', { collection: {collectionName: $scope.collection } } )
        .success(function(createCollection){
          $scope.newCollectionID = createCollection.id;
        })
    }
    $scope.saveLink = function() {
      // console.log({ codeSnippet: {codeUrl: $scope.linkUrl, collectionId: $scope.newCollectionID }  })
      console.log($scope)
      var createCodeSnippet = $http.post('/codeSnippets.json', { codeSnippet: {codeUrl: $scope.linkUrl, collectionId: $scope.newCollectionID }  } )
        .success(function(createSnippet){
          $scope.snippet = createSnippet
        })
    }

    $scope.showSearchInfo = function() {
      $scope.showSearchInfo = true;
    }
  }])
