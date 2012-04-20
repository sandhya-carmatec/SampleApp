/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2010 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js 254 2010-07-23 05:14:44Z emartin24 $
 */

jQuery(function ($) {
    // Load dialog on page load
    //$('#basic-modal-content').modal();

    // Load dialog on click
    $('.new_family').click(function (){
        $('#basic-modal-content').modal();
        $.ajax({
            url: "/families/new",
            type: 'get',
            success: function(html){
                $('#basic-modal-content').html(html);
            }
        });
        return false;
    });



//    $('.advance_payment').click(function (){
//        $('#basic-modal-content').modal();
//        $.ajax({
//            url: "/payments/new",
//            type: 'get',
//            success: function(html){
//                $('#basic-modal-content').html(html);
//            }
//        });
//        return false;
//    });


    $('.new_category').click(function (){
        $('#basic-modal-content').modal();
        $.ajax({
            url: "/categories/new?",
            type: 'get',
            success: function(html){
                $('#basic-modal-content').html(html);
            }
        });
        return false;
    });

    $('.new_doctor_specialization').click(function (){
        $('#basic-modal-content').modal();
        $.ajax({
            url: "/doctor_specializations/new?",
            type: 'get',
            success: function(html){
                $('#basic-modal-content').html(html);
            }
        });
        return false;
    });


    $('.all_vendors_list').click(function() {
        $('#basic-modal-content').modal();
        $.ajax({
            url: "/purchase_orders/vendors_list?",
            type: 'get',
            success: function(html) {
                $('#basic-modal-content').html(html);
            }
        });
        return false;
    });
});
