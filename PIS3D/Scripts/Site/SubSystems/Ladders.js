﻿var app = angular.module('myApp', ['ngWYSIWYG']);
app.controller('LaddersCtrl', function ($scope, $http,$log) {
       
       
    //Test Text editor 
    //$scope.newRemark.Remark = '<h1>Hello world!</h1>';
    $scope.editorConfig = {
        fontAwesome: true
    };
    $scope.api = {
        scope: $scope
    };
    $scope.$watch('newRemark.Remark', function (newValue) {
        $log.info(newValue);
    });
    //End Test Text editor 


    $('#panel').keyup(function () {
        //$(this).val() // get the current value of the input field.
        document.getElementById("panel").className = "panel panel-primary";
    });
    $('#panel').mousedown(function () {
        //$(this).val() // get the current value of the input field.
        document.getElementById("panel").className = "panel panel-primary";
    });

    $scope.building = {};

    //Get BuildgArea From seesion 
    $http({
        method: "GET",
        url: "/Home/Getjson"
    }).then(function mySucces(response) {
        console.log(response.data);
        buildingvar = response.data;
        $scope.building = buildingvar;
    }, function myError(response) {
        //alert("error");
    });

    //Save  BuildgArea to seesion 
    $scope.SaveData = function () {
        var myJSONText = JSON.stringify($scope.building, null, 2);
        document.getElementById("panel").className = "panel panel-success";
        $http({
            method: "POST",
            //url: "@Url.Action("Setjson")",
            url: "/Home/Setjson",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ jsonStr: myJSONText })
        }).then(function mySucces(response) {
            console.log($scope.building);
        }, function myError(response) {
            //alert("error");
        });
    };




    $scope.AccName = "Ladders";
    $scope.Type = ["PLAIN", "CAGED", "NONE"];
    $scope.Location = ["INTERNAL", "EXTERNAL", "NONE"];
    $scope.From = ["FFL", "ROOF", "MEZZANINE", "ROOF WALKWAY", "NONE"];
    $scope.To = ["ROOF", "NONE", "MEZZANINE", "ROOF PLATFORM", "ROOF WALKWAY", "CATWALK"];
    $scope.EaveCond = {};
    $http({
        method: "GET",
        url: "/PISUser/GetEaveConditionEnum"
    }).then(function mySucces(response) {
        $scope.EaveCond = response.data;
    }, function myError(response) {
        alert("error");
    });
    //Get Downspouts Cond
    $scope.DownspoutsCond = {};
    $http({
        method: "GET",
        url: "/PISUser/GetDownspouts"
    }).then(function mySucces(response) {
        $scope.DownspoutsCond = response.data;
    }, function myError(response) {
        alert("error");
    });

    $scope.Acchistory = [];
    // Delete data
    $scope.removeAcc = function (index) {
        // Remove first / oldest element from history if it reaches maximum capacity of 10 records
        if ($scope.Acchistory.length === 10)
            $scope.Acchistory.shift();
        // Add deleted record to historical records
        $scope.Acchistory.push($scope.building.Subsystems.Ladders.Ladders[index]);
        // Remove from main records (using index)
        $scope.building.Subsystems.Ladders.Ladders.splice(index, 1);
    };
    // Undo action (delete)
    $scope.UndoAcc = function () {
        $scope.building.Subsystems.Ladders.Ladders.push($scope.Acchistory[$scope.Acchistory.length - 1]);
        $scope.Acchistory.pop();
    };
    $scope.Accword = "Add";
    $scope.accIndex = 0;

    $scope.myVar = true;
    // Reset new data model
    $scope.ResetAcc = function () {
        $scope.Accword = "Add";
        var id = 1;
        if ($scope.building.Subsystems.Ladders.Ladders)
            id = $scope.building.Subsystems.Ladders.Ladders.length + 1;
        $scope.newobj = {
            ID: id,
            "Type": "CAGED", 
            "Height": 1, 
            "Location": "INTERNAL", 
            "From": "ROOF", 
            "To": "NONE", 
            "MidLanding": true, 
            "Remarks": { "Remark": [ { "ID": "1", "Remark": " " } ] } 
        };
    };
    //Add  Bracing 
    $scope.AddAcc = function () {
        if ($scope.building.Subsystems.Ladders.Ladders)
            $scope.building.Subsystems.Ladders.Ladders.push(angular.copy($scope.newobj));
        else
            $scope.building.Subsystems.Ladders.Ladders = [angular.copy($scope.newobj)];
    };
    $scope.AccUpdate = function (index) {
        $scope.newobj = angular.copy($scope.building.Subsystems.Ladders.Ladders[index]);
        $scope.accIndex = index;
        $('#AccModal').modal('show');
        $scope.Accword = "Update";
        $scope.newobj = angular.copy($scope.building.Subsystems.Ladders.Ladders[index]);


    };
    $scope.AddUpdateAcc = function () {
        if ($scope.Accword == "Add")
            $scope.AddAcc();
        else if ($scope.Accword == "Update")
            $scope.ModyfyAcc();
    };
    $scope.ModyfyAcc = function () {
        $scope.building.Subsystems.Ladders.Ladders[$scope.accIndex] = angular.copy($scope.newobj);
    };


    ////------------*--------------*********Remarks ****--------------------------------*************---
    $scope.Remarkhistory = [];
    // Delete data
    $scope.removeRemark = function (index) {
        //// Remove first / oldest element from history if it reaches maximum capacity of 10 records
        //if ($scope.Remarkhistory.length === 10)
        //    $scope.Remarkhistory.shift();
        //// Add deleted record to historical records
        //$scope.Remarkhistory.push($scope.building.GeneralData.Remarks.Remark[index]);
        //// Remove from main records (using index)
        //$scope.building.GeneralData.Remarks.Remark.splice(index, 1);
        $scope.building.Subsystems.Ladders.Remarks.Remark[index].State = "false";
    };
    // Undo action (delete)
    $scope.UndoRemark = function () {
        $scope.building.Subsystems.Ladders.Remarks.Remark.push($scope.Remarkhistory[$scope.Remarkhistory.length - 1]);
        $scope.Remarkhistory.pop();
    };
    $scope.Remarkword = "Add";
    $scope.RemarkIndex = 0;
    // Reset new data model
    $scope.ResetRemark = function () {
        $scope.Remarkword = "Add";
        var id = 1;
        if ($scope.building.Subsystems.Ladders.Remarks.Remark)
            id = $scope.building.Subsystems.Ladders.Remarks.Remark.length + 1;
        $scope.newRemark = {
            ID: id,
            Remark: "",
            State: "true"
        };
    };
    //Add  Bracing 
    $scope.AddRemark = function () {
        if ($scope.building.Subsystems.Ladders.Remarks.Remark)
            $scope.building.Subsystems.Ladders.Remarks.Remark.push(angular.copy($scope.newRemark));
        else
            $scope.building.Subsystems.Ladders.Remarks.Remark = [angular.copy($scope.newRemark)];
    };
    $scope.RemarkUpdate = function (index) {
        $scope.newRemark = angular.copy($scope.building.Subsystems.Ladders.Remarks.Remark[index]);
        $scope.RemarkIndex = index;
        $('#RemarkModal').modal('show');
        $scope.Remarkword = "Update";

        $scope.newRemark = angular.copy($scope.building.Subsystems.Ladders.Remarks.Remark[index]);

    };
    $scope.AddUpdateRemark = function () {
        if ($scope.Remarkword == "Add")
            $scope.AddRemark();
        else if ($scope.Remarkword == "Update")
            $scope.ModyfyRemark();
    };
    $scope.ModyfyRemark = function () {
        $scope.building.Subsystems.Ladders.Remarks.Remark[$scope.RemarkIndex] = angular.copy($scope.newRemark);
    };
    $scope.ShowDeleRemark = function (state) {
        if (state == "true")
            return true;
        if (state == "false" && $scope.Deletedchecked == false)
            return false;
        if (state == "false" && $scope.Deletedchecked == true)
            return true;
    };

    ////------------*--------------*********Remarks ****--------------------------------*************---



});