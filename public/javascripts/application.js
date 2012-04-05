// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function set_time_zone(){
    var now = new Date();
    var gmtoffset = now.getTimezoneOffset();

    $.ajax({
        url: '/home/gmtoffset/?gmtoffset='+gmtoffset
    });
}