angular.module('toDo', []).controller('MainCtrl', ['$scope', ($scope) ->
      $scope.tasks = [
        {title: 'Monday todo',    done: 'false',  date: 'nil'}
        {title: 'Tuesfay todo',   done: 'false',  date: 'nil'}
        {title: 'Thersday todo',  done: 'false',   date: 'nil'}
        {title: 'friday todo',    done: 'false',   date: 'nil'}
      ]
      $scope.addTask = ->
        $scope.tasks.push({title: $scope.title, status: 'false'})
        $scope.title = ''
        console.log($scope + "added")

      $scope.checkTask = (task)->
        if task.date == 'nil'
          task.done = true
          task.date = new Date()
          console.log('title: ' + task.title + ' done: ' + task.done + ' date: ' + task.date )
          return task

          task.done = false
          task.date = 'nil'

          return task

        console.log(task.title + task.done +  task.date )






])