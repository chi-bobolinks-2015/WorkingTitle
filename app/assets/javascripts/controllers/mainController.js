var app = angular.module('sift', []);

// app.factory ('sift', ['$http', function($http){
//   return $http.get('/api/login')
//     .success(function(data){
//       conslole.log(data);
//       return data;
//     })
//     .error(function(err){
//       return err;
//     });
// }]);

app.controller("mainController", function($scope, $http) {
  // $scope.submitForm = function(){
    var urls = $http.get('/api/search')

    .success(function(urlData){
      console.log("SUCCESSFUL")
      $scope.urls = urlData;
      // var deferred = $q.defer();
      // deferred.resolve(userAuthData);
      console.log(urlData);
      // $window.location.href = userAuthData["authorize_url"]
      // .then(function (response){
      //   console.log(response)
      // })
    // })
  });

});
