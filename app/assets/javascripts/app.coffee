angular.module('toDo', []).controller('MainCtrl', ['$scope', ($scope) ->
      $scope.tasks = [
        {title: 'Monday todo', status: 'nil'}
        {title: 'Tuesfay todo', status: 'nil'}
        {title: 'Thersday todo', status: 'nil'}
        {title: 'friday todo', status: 'nil'}
      ]
      $scope.addTask = ->
        $scope.tasks.push({title: $scope.title, status: 'nil'})
        $scope.title = ''
        console.log($scope + "added")
      $scope.taskStatus = ->
      {
        status: 'done' + Date.new
      }
      $scope.check = ->
        $scope.tasks.status.push('done')
        console.log('done')

])