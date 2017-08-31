// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  const currentYear = (new Date).getFullYear();

  const novStart = `11/20/${currentYear}`;
  const decStart = `12/20/${currentYear}`;

  $('.datepicker-autoclose').datepicker({
    autoclose: true,
    orientation: 'bottom',
    startDate: `10/15/${currentYear}`,
    format: 'yyyy/mm/dd'
  });

  $('.datepicker-multi').datepicker({
    multidate: true,
    startDate: novStart
  });

  $('#season_name').change(function() {
    $('.datepicker-multi').datepicker('destroy');
    const season = this.value;

    $('.datepicker-multi').datepicker({
      multidate: true,
      startDate: (/Fall/.test(season)) ? novStart : decStart
    });
  });
});
