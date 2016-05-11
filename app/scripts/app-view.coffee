AppView = Backbone.View.extend(
  el: 'body'
  events:
    'click .butClose' : 'closer'
    'click .image' : 'singleGallery'
    'click .planeFirst' : 'singleGallery'
    'click .planeSecond' : 'singleGallery'
    'click #fancybox-overlay' : 'closeGallery'
    'click #fancybox-thumbs a' : 'openThumbImg'
  closer: ->
    switcher = $('.singleGallery').attr('data-id')
    if switcher == 'home' then $( "#tabs" ).tabs({active: 1})
    else $( "#tabs" ).tabs({active: 2})
  singleGallery: (e)->
    srcAttr = e.currentTarget.src
    $('.singleImg').attr('src', srcAttr)
    $('.image').removeClass('active')
    $('.planeFirst').removeClass('active')
    $('.planeSecond').removeClass('active')
    $(e.currentTarget).addClass('active')
  closeGallery: ->
    $('body').css('overflow', 'auto')
  openThumbImg: (e)->
    $.fancybox.jumpto($(e.currentTarget).attr('data-id'))
)

appView = new AppView
