

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
    
    var startHours = workStart.substr(0, 2);
    var startMinutes =  workStart.substr(3, 2);
    var startAMPM =  workStart.substr(6, 2);
    
    var endHours = workEnd.substr(0, 2);
    var endMinutes =  workEnd.substr(3, 2);
    var endAMPM =  workEnd.substr(6, 2);  


    var monthSelector = `
      <select class='month'>
        <option value='01'>January(1)</option>
        <option value='02'>February(2)</option>
        <option value='03'>March(3)</option>
        <option value='04'>April(4)</option>
        <option value='05'>May(5)</option>
        <option value='06'>June(6)</option>
        <option value='07'>July(7)</option>
        <option value='08'>August(8)</option>
        <option value='09'>September(9)</option>
        <option value='10'>October(10)</option>
        <option value='11'>November(11)</option>
        <option value='12'>December(12)</option>
      </select>
  `;

  var daySelector = `
    <select class='day'>
      <option value='01'>1</option>
      <option value='02'>2</option>
      <option value='03'>3</option>
      <option value='04'>4</option>
      <option value='05'>5</option>
      <option value='06'>6</option>
      <option value='07'>7</option>
      <option value='08'>8</option>
      <option value='09'>9</option>
      <option value='10'>10</option>
      <option value='11'>11</option>
      <option value='12'>12</option>
      <option value='13'>13</option>
      <option value='14'>14</option>
      <option value='15'>15</option>
      <option value='16'>16</option>
      <option value='17'>17</option>
      <option value='18'>18</option>
      <option value='19'>19</option>
      <option value='20'>20</option>
      <option value='21'>21</option>
      <option value='22'>22</option>
      <option value='23'>23</option>
      <option value='24'>24</option>
      <option value='25'>25</option>
      <option value='26'>26</option>
      <option value='27'>27</option>
      <option value='28'>28</option>
      <option value='29'>29</option>
      <option value='30'>30</option>
      <option value='31'>31</option>
    </select>
  `;

    var yearSelector = `
      <select class='year'>
        <option value='2000'>2000</option>
        <option value='2001'>2001</option>
        <option value='2002'>2002</option>
        <option value='2003'>2003</option>
        <option value='2004'>2004</option>
        <option value='2005'>2005</option>
        <option value='2006'>2006</option>
        <option value='2007'>2007</option>
        <option value='2008'>2008</option>
        <option value='2009'>2009</option>
        <option value='2010'>2010</option>
        <option value='2011'>2011</option>
        <option value='2012'>2012</option>
        <option value='2013'>2013</option>
        <option value='2014'>2014</option>
        <option value='2015'>2015</option>
        <option value='2016'>2016</option>
        <option value='2017'>2017</option>
        <option value='2018'>2018</option>
        <option value='2019'>2019</option>
        <option value='2020'>2020</option>
        <option value='2021'>2021</option>
        <option value='2022'>2022</option>
        <option value='2023'>2023</option>
        <option value='2024'>2024</option>
        <option value='2025'>2025</option>
      </select>                           
    `;

  var hourSelector = `
    <select class='hour'>
      <option value='01'>01</option>
      <option value='02'>02</option>
      <option value='03'>03</option>
      <option value='04'>04</option>
      <option value='05'>05</option>
      <option value='06'>06</option>
      <option value='07'>07</option>
      <option value='08'>08</option>
      <option value='09'>09</option>
      <option value='10'>10</option>
      <option value='11'>11</option>
      <option value='12'>12</option>
    </select>                                                                                                   
  `;
  
  var minuteSelector = `
    <select class='minute'>
      <option value='00'>00</option>
      <option value='01'>01</option>
      <option value='02'>02</option>
      <option value='03'>03</option>
      <option value='04'>04</option>
      <option value='05'>05</option>
      <option value='06'>06</option>
      <option value='07'>07</option>
      <option value='08'>08</option>
      <option value='09'>09</option>
      <option value='10'>10</option>
      <option value='11'>11</option>
      <option value='12'>12</option>
      <option value='13'>13</option>
      <option value='14'>14</option>
      <option value='15'>15</option>
      <option value='16'>16</option>
      <option value='17'>17</option>
      <option value='18'>18</option>
      <option value='19'>19</option>
      <option value='20'>20</option>
      <option value='21'>21</option>
      <option value='22'>22</option>
      <option value='23'>23</option>
      <option value='24'>24</option>
      <option value='25'>25</option>
      <option value='26'>26</option>
      <option value='27'>27</option>
      <option value='28'>28</option>
      <option value='29'>29</option>
      <option value='30'>30</option>
      <option value='31'>31</option>
      <option value='32'>32</option>
      <option value='33'>33</option>
      <option value='34'>34</option>
      <option value='35'>35</option>
      <option value='36'>36</option>
      <option value='37'>37</option>
      <option value='38'>38</option>
      <option value='39'>39</option>
      <option value='40'>40</option>
      <option value='41'>41</option>
      <option value='42'>42</option>
      <option value='43'>43</option>
      <option value='44'>44</option>
      <option value='45'>45</option>
      <option value='46'>46</option>
      <option value='47'>47</option>
      <option value='48'>48</option>
      <option value='49'>49</option>
      <option value='50'>50</option>
      <option value='51'>51</option>
      <option value='52'>52</option>
      <option value='53'>53</option>
      <option value='54'>54</option>
      <option value='55'>55</option>
      <option value='56'>56</option>
      <option value='57'>57</option>
      <option value='58'>58</option>
      <option value='59'>59</option>
    </select>`;

  var ampmSelector = `
    <select class='ampm'>
      <option value='AM'>AM</option>
      <option value='PM'>PM</option>
    </select>   
    `;


    $(this).parent().siblings(".work-date").html(
      monthSelector.replace("option value='" + month, "option selected='selected' value='" + month) 
      + daySelector.replace("option value='" + day, "option selected='selected' value='" + day)
      + yearSelector.replace("option value='" + year, "option selected='selected' value='" + year)
      );

    $(this).parent().siblings(".work-start").html(
      hourSelector.replace("option value='" + startHours, "option selected='selected' value='" + startHours)
      + minuteSelector.replace("option value='" + startMinutes, "option selected='selected' value='" + startMinutes)
      + ampmSelector.replace("option value='" + startAMPM, "option selected='selected' value='" + startAMPM)
      );
      
      
    $(this).parent().siblings(".work-end").html(
      hourSelector.replace("option value='" + endHours, "option selected='selected' value='" + endHours)
      + minuteSelector.replace("option value='" + endMinutes, "option selected='selected' value='" + endMinutes)
      + ampmSelector.replace("option value='" + endAMPM, "option selected='selected' value='" + endAMPM)
      );
    

    $(this).parent().html("<button class='save_button'>save</button>");

    
  });
};



var setupsave = function(){
  $("td").on("click", ".save_button", function(event){

    var $saveButtonCell = $(this).parent(),
        $currentWorkDateField = $saveButtonCell.siblings('.work-date');
        $currentWorkStartField = $saveButtonCell.siblings('.work-start');
        $currentWorkEndField = $saveButtonCell.siblings('.work-end');
        
    var workDay = $currentWorkDateField.children("select[class='day']").val();
    var workMonth = $currentWorkDateField.children("select[class='month']").val();
    var workYear = $currentWorkDateField.children("select[class='year']").val();

    var workStartHour = $currentWorkStartField.children("select[class='hour']").val();
    var workStartMinute = $currentWorkStartField.children("select[class='minute']").val();
    var workStartAMPM = $currentWorkStartField.children("select[class='ampm']").val();
    
    var workEndHour = $currentWorkEndField.children("select[class='hour']").val();
    var workEndMinute = $currentWorkEndField.children("select[class='minute']").val();
    var workEndAMPM = $currentWorkEndField.children("select[class='ampm']").val();
    
    var workTimeID = $(this).parent().parent().attr('id');

    // work_start: "2017-01-13 03:00:00"
    // work_end: "2017-01-13 11:00:00"
    
    if(workStartAMPM = "PM"){
      workStartHour = (parseInt(workStartHour) + 12).toString();
      
    }
    
    if(workEndAMPM = "PM"){
      workEndHour = (parseInt(workEndHour) + 12).toString();
    }
    
    var revisedStart = workYear + "-" + workMonth + "-" + workDay + " " + workStartHour + ":" + workStartMinute + ":00"
    var revisedEnd = workYear + "-" + workMonth + "-" + workDay + " " + workEndHour + ":" + workEndMinute + ":00"
    //update this to consider times that extend into the next day

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

          $currentWorkDateField.html(serverWorkDate);
          $currentWorkStartField.html(serverWorkStart);
          $currentWorkEndField.html(serverWorkEnd);



         $saveButtonCell.html("<button class='edit_button'>edit</button>");
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

