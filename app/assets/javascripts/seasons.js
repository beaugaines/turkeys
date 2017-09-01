$(document).on('turbolinks:load', function() {

  const currentYear = (new Date).getFullYear();

  const novStart = `${currentYear}/11/20`;
  const decStart = `${currentYear}/12/20`;

  $('#season_name').change(function() {
    const season = this.value;

    $('.datepicker-autoclose').datepicker({
      autoclose: true,
      orientation: 'bottom',
      startDate: `${currentYear}/11/15`,
      format: 'yyyy/mm/dd'
    });

    $('.datepicker-multi').datepicker({
      multidate: true,
      startDate: (/Fall/.test(season)) ? novStart : decStart,
      orientation: 'bottom',
      format: 'yyyy/mm/dd'
    });

    $('.start-date-wrapper').removeClass('hidden').slideDown();
  });
});
