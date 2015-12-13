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

// app.controller("mainController", function($window, $scope, $http) {
//   $scope.login = function(){
//     var userAuth = $http.get('/api/login')
//
//     .success(function(userAuthData){
//       // $scope.userAuth = userAuthData;
//       // var deferred = $q.defer();
//       // deferred.resolve(userAuthData);
//       console.log(userAuthData);
//       // $window.location.href = userAuthData["authorize_url"]
//       // .then(function (response){
//       //   console.log(response)
//       // })
//     })
//   };
//
// });
