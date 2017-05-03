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
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function(){
  // Equal height columns
  var maxHeight=0;
  $(".tab-content .tab-pane").each(function(){
      $(this).addClass("active");
     var height = $(this).height();
      maxHeight = height>maxHeight?height:maxHeight;
      $(this).removeClass("active");
  });
  $(".tab-content .tab-pane:first").addClass("active");
  $(".tab-content").height(maxHeight);
});
