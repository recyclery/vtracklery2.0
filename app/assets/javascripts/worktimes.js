

var worktimes = function(){
  setupedit();
  setupsave();
  setupdelete();
};




var setupedit = function(){

  $("td").on("click", ".edit_button", function(){
    var workDate = $(this).parent().siblings(".work-date").html().trim();
    var workStart = $(this).parent().siblings(".work-start").html().trim();
    var workEnd = $(this).parent().siblings(".work-end").html().trim();

    var month = workDate.substr(5, 2);
    var day =  workDate.substr(8, 2);
    var year =  workDate.substr(0, 4);
    
    var starthours = workStart.substr(0, 2);
    var startminutes =  workStart.substr(3, 2);
    var startAMPM =  workStart.substr(6, 2);
    
    var endhours = workEnd.substr(0, 2);
    var endminutes =  workEnd.substr(3, 2);
    var endAMPM =  workEnd.substr(6, 2);  

    // $(this).parent().siblings(".work-end").html("<input type='time' value='" + workEnd + "'>");
    
    
    
    
    
    
    
    // $(this).parent().siblings(".work-date").html("<input type='date' value='" + workDate + "'>");
    // $(this).parent().siblings(".work-start").html("<input type='time' value='" + workStart + "'>");

    $(this).parent().html("<button class='save_button'>save</button>");

    // var hours = Number(workStart.match(/^(\d+)/)[1]);
    // var minutes = Number(workStart.match(/:(\d+)/)[1]);
    // var AMPM = workStart.match(/\s(.*)$/)[1];
    // if(AMPM == "PM" && hours<12) hours = hours+12;
    // if(AMPM == "AM" && hours==12) hours = hours-12;
    // var sHours = hours.toString();
    // var sMinutes = minutes.toString();
    // if(hours<10) sHours = "0" + sHours;
    // if(minutes<10) sMinutes = "0" + sMinutes;
    // workStart = sHours + ":" + sMinutes;

    
    

    // hours = Number(workEnd.match(/^(\d+)/)[1]);
    // minutes = Number(workEnd.match(/:(\d+)/)[1]);
    // AMPM = workEnd.match(/\s(.*)$/)[1];
    // if(AMPM == "PM" && hours<12) hours = hours+12;
    // if(AMPM == "AM" && hours==12) hours = hours-12;
    // sHours = hours.toString();
    // sMinutes = minutes.toString();
    // if(hours<10) sHours = "0" + sHours;
    // if(minutes<10) sMinutes = "0" + sMinutes;
    // workEnd = sHours + ":" + sMinutes;

    

    
  });
};



var setupsave = function(){
  $("td").on("click", ".save_button", function(){

    var workDate = $("td").children(".save_button").first().parent().siblings(".work-date").children("input").val()
    var workStart = $("td").children(".save_button").first().parent().siblings(".work-start").children("input").val()
    var workEnd = $("td").children(".save_button").first().parent().siblings(".work-end").children("input").val()

    workTimeID = $(this).parent().parent().attr('id')

    revisedStart = workDate + " " + workStart
    revisedEnd = workDate + " " + workEnd //update this to consider times that extend into the next day

    data = {start: revisedStart, end: revisedEnd, id: workTimeID}

    $.ajax({
        url: "/work_times/" + workTimeID,
        method: "patch",
        data: data
      }).done(function(response){

        if(response.length > 5){
          // if there's an error message-- controller is returning first of "full messages"
          $("p.errors").text(response);
        }

        $.ajax({
        url: "/work_times/" + workTimeID,
        method: "get"
        }).done(function(worktimeresponse){ // parse the server data and put it in the fields

// <<<<<<< HEAD
//           serverWorkDate = worktimeresponse["work_start"].substr(0, 10);
          serverWorkStart = worktimeresponse["work_start"].substr(11, 8);
          serverWorkEnd = worktimeresponse["work_end"].substr(11, 8);

//           var options = {
//               hour: "2-digit", minute: "2-digit"
//           };
// =======

            serverWorkDate = worktimeresponse["work_start"].substr(0, 10);

            var startHrs = worktimeresponse["work_start"].substr(11, 2);
            var endHrs = worktimeresponse["work_end"].substr(11, 2);

            var startMns = worktimeresponse["work_start"].substr(14, 2);
            var endMns = worktimeresponse["work_end"].substr(14, 2);

            var startAMPM = "AM"
            var endAMPM = "AM"

            if(parseInt(startHrs) > 12){
              startHrs = (parseInt(startHrs) - 12).toString()

              if(startHrs.length == 1){
                startHrs = "0" + startHrs;
              }

              startAMPM = "PM"
            }

            if(parseInt(endHrs) > 12){
              endHrs = (parseInt(endHrs) - 12).toString()

              if(endHrs.length == 1){
                endHrs = "0" + endHrs;
              }

              endAMPM = "PM"
            }

            serverWorkStart = startHrs + ":" + startMns + " " + startAMPM;
            serverWorkEnd = endHrs + ":" + endMns + " " + endAMPM;

          $("td").children(".save_button").first().parent().siblings(".work-date").html(serverWorkDate);
          $("td").children(".save_button").first().parent().siblings(".work-start").html(serverWorkStart);
          $("td").children(".save_button").first().parent().siblings(".work-end").html(serverWorkEnd);

          $("td").children(".save_button").parent().html("<button class='edit_button'>edit</button>");
        })

      })

  });
};


var setupdelete = function(){
  $("td").on("click", ".delete_button", function(){

    var conf = confirm("Are you sure you want to delete this work record?");

    if (conf == true) {
      row = $(this).parent().parent()
      workTimeID = row.attr('id');

      $.ajax({
          url: "/work_times/delete/" + workTimeID,
          method: "post"
          }).done(function(response){
              row.hide();
          });
    }


  });
};

