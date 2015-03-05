document.addEventListener 'page:change', ->
  $("body").fadeIn('fast');

document.addEventListener 'page:fetch', ->
  $("body").fadeOut('fast');
