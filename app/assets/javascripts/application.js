// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function(){


  $("td").on("click", ".edit_button", function(){
    var workDate = $(this).parent().siblings(".work-date").html().trim();
    $(this).parent().siblings(".work-date").html("<input type='date' value='" + workDate + "'>");

    var workStart = $(this).parent().siblings(".work-start").html().trim();

    var hours = Number(workStart.match(/^(\d+)/)[1]);
    var minutes = Number(workStart.match(/:(\d+)/)[1]);
    var AMPM = workStart.match(/\s(.*)$/)[1];
    if(AMPM == "PM" && hours<12) hours = hours+12;
    if(AMPM == "AM" && hours==12) hours = hours-12;
    var sHours = hours.toString();
    var sMinutes = minutes.toString();
    if(hours<10) sHours = "0" + sHours;
    if(minutes<10) sMinutes = "0" + sMinutes;
    workStart = sHours + ":" + sMinutes;

    $(this).parent().siblings(".work-start").html("<input type='time' value='" + workStart + "'>");

    var workEnd = $(this).parent().siblings(".work-end").html().trim();

    hours = Number(workEnd.match(/^(\d+)/)[1]);
    minutes = Number(workEnd.match(/:(\d+)/)[1]);
    AMPM = workEnd.match(/\s(.*)$/)[1];
    if(AMPM == "PM" && hours<12) hours = hours+12;
    if(AMPM == "AM" && hours==12) hours = hours-12;
    sHours = hours.toString();
    sMinutes = minutes.toString();
    if(hours<10) sHours = "0" + sHours;
    if(minutes<10) sMinutes = "0" + sMinutes;
    workEnd = sHours + ":" + sMinutes;

    $(this).parent().siblings(".work-end").html("<input type='time' value='" + workEnd + "'>");

    $(this).parent().html("<button class='save_button'>save</button>");
  });


  $("td").on("click", ".save_button", function(){
    var $permathis = $(this);

    var workDate = $("td").children(".save_button").first().parent().siblings(".work-date").children("input").val()
    var workStart = $("td").children(".save_button").first().parent().siblings(".work-start").children("input").val()
    var workEnd = $("td").children(".save_button").first().parent().siblings(".work-end").children("input").val()

    workTimeID = $(this).parent().parent().attr('id')

    console.log("saving work-time number " + workTimeID + " with " + workDate + ", " + workStart + ", " + workEnd);

    revisedStart = workDate + " " + workStart
    revisedEnd = workDate + " " + workEnd //update this to consider times that extend into the next day

    data = {start: revisedStart, end: revisedEnd, id: workTimeID}

    $.ajax({
        url: "/work_times/" + workTimeID,
        method: "patch",
        data: data
      }).done(function(response){

        $.ajax({
        url: "/work_times/" + workTimeID,
        method: "get"
        }).done(function(worktimeresponse){ // parse the server data and put it in the fields

            serverWorkDate = worktimeresponse["work_start"].substr(0, 10);
            serverWorkStart = worktimeresponse["work_start"].substr(11, 8);
            serverWorkEnd = worktimeresponse["work_end"].substr(11, 8);

            $("td").children(".save_button").first().parent().siblings(".work-date").html(serverWorkDate);
            $("td").children(".save_button").first().parent().siblings(".work-start").html(serverWorkStart);
            $("td").children(".save_button").first().parent().siblings(".work-end").html(serverWorkEnd);

            $("td").children(".save_button").parent().html("<button class='edit_button'>edit</button>");
        })

      })

    // console.log("Entering new data the cheap way, not from the server");

    // $("td").children(".save_button").first().parent().siblings(".work-date").html(workDate);
    // $("td").children(".save_button").first().parent().siblings(".work-start").html(workStart);
    // $("td").children(".save_button").first().parent().siblings(".work-end").html(workEnd);


  });



})
