// JavaScript Document
$(document).ready(function(){
  var terms_and_conditions = window.localStorage.getItem("terms_and_conditions");	
  $('.terms').html(terms_and_conditions);
})