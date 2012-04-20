// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function set_time_zone(){
    var now = new Date();
    var gmtoffset = now.getTimezoneOffset();

    $.ajax({
        url: '/home/gmtoffset/?gmtoffset='+gmtoffset
    });
}

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}

function display_memo(id) {
    $('#memo_popup').modal();
    $.ajax({
        url: "/memos/new_memo?memo_date="+id,
        type: 'get',
        success: function(html) {

            $('#memo_popup').html(html);
        }
    });
    return false;
}