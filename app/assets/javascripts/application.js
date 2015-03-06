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
//= require jquery.turbolinks
//= require jquery_ujs
//= require social-share-button
//= require jquery.datetimepicker
//= require turbolinks
//= require_tree 

//Google Maps
var myMap = myMap || {};

myMap.initialize = function(){

  var startPortLat = parseFloat($("#start_port_lat").text());
  var startPortLong = parseFloat($("#start_port_long").text());
  var endPortLat = parseFloat($("#end_port_lat").text());
  var endPortLong = parseFloat($("#end_port_long").text());


  var startPortLatLong = new google.maps.LatLng(startPortLat, startPortLong);

  var endPortLatLong = new google.maps.LatLng(endPortLat, endPortLong);

  var mapOptions = {
    center: { lat: startPortLat, lng:  startPortLong},
    maxZoom: 11,
  };

  var map = new google.maps.Map(myMap.mapElement, mapOptions);

  var markerOptionsStart = {
   position: {lat: startPortLat, lng: startPortLong},
   map: map,
   icon: "/assets/harbor_marker.png" 
 };

 var markerStart = new google.maps.Marker(markerOptionsStart);
 markerStart.setMap(map);

 var popupStartContent = {
   content: '<strong>Start Port</strong>',
 };

 var popupStart = new google.maps.InfoWindow(popupStartContent);


 setTimeout(function(){
   popupStart.open(map, markerStart);
 }, 2500);

 var markerOptionsEnd = {
   position: {lat: endPortLat, lng: endPortLong},
   icon: "/assets/harbor_marker.png",
 };

 var markerEnd = new google.maps.Marker(markerOptionsEnd);
 markerEnd.setMap(map);

 var popupEndContent = {
   content: '<strong>End Port</strong>',
 };

 var popupEnd = new google.maps.InfoWindow(popupEndContent);

 setTimeout(function(){
   popupEnd.open(map, markerEnd);
 }, 3500);


 var bounds = new google.maps.LatLngBounds();

 bounds.extend(startPortLatLong);
 bounds.extend(endPortLatLong);
 map.fitBounds(bounds);


 myMap.getPosition();

};

//get current_location
myMap.getPosition = function(){
  if (navigator.geolocation){
    var geolocation = navigator.geolocation.getCurrentPosition(myMap.geolocationSuccess, myMap.geolocationFail);
  } else{
    alert("You don't have geolocation enabled");
  }
};


myMap.geolocationSuccess = function(position){
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  var url = '/journeys/weather_at/current/';
  var data = {'lat': latitude, 'long': longitude };
  $.get(url, data).success(function(data) {
    $('#current_weather_partial').html(data);

  });



  
};
myMap.geolocationFail = function(position){
  console.log('fail geolocation');
};



$(function(){
  if ($('#map_canvas').length > 0 ){
    
    myMap.mapElement = $('#map_canvas')[0];
    myMap.initialize();
  }
});


//ajax for weather api, get the partial and 
$(function() {
  $('.weather_partial').each(function(index, div) {
    var id = $(div).data('journeyId');
    var location = $(div).data('location');
    var url ='/journeys/' + id + '/weather_at/' + location;

    $.get(url).success(function(data) {
      $(div).html(data);
    });
  });


});




//datepicker from today on. 
$(function() {
  $('.datepicker').datetimepicker({
    minDate: 0,
    timepicker: false,
    format:'d.m.Y'
  });
});

// $('#inner-editor').click(function(){
//   $('.datetimepicker').datetimepicker('show'); //support hide,show and destroy command
// });



















