# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#user_postalcode").jpostal({
    postcode : [ "#user_postalcode" ],
    address  : {
                  "#user_prefecturecode" : "%3",
                  "#user_city"            : "%4",
                  "#user_street"          : "%5%6%7"
                }
  })