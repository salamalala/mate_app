// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require typekit
//= require social-share-button
//= require jquery.datetimepicker
//= require_tree .

//Google Maps
var myMap = myMap || {};

myMap.initialize = function(){

  var startPortLat = parseFloat($("#start_port_lat").text());
  var startPortLong = parseFloat($("#start_port_long").text());
  var endPortLat = parseFloat($("#end_port_lat").text());
  console.log(endPortLat)
  var endPortLong = parseFloat($("#end_port_long").text());

  var mapOptions = {
    center: { lat: startPortLat, lng:  startPortLong},
    zoom: 8,
  };

  var map = new google.maps.Map(myMap.mapElement, mapOptions);

  var markerOptionsStart = {
   position: {lat: startPortLat, lng: startPortLong}
  };

  var markerStart = new google.maps.Marker(markerOptionsStart);
  markerStart.setMap(map);

  var markerOptionsEnd = {
   position: {lat: endPortLat, lng: endPortLong}
  };

  var markerEnd = new google.maps.Marker(markerOptionsEnd);
  markerEnd.setMap(map);
  };



$(function(){
  myMap.mapElement = $('#map_canvas')[0];
  myMap.initialize();

});






//datepicker from today on. 
$(function() {
  $('.datepicker').datetimepicker({
    minDate: 0,
    timepicker: false,
    format:'d.m.Y'

  });
});
















