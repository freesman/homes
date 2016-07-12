AppView = Backbone.View.extend(
  el: 'body'
  events:
    'click .fancybox-prev' : 'clearSelection'
    'click .fancybox-next' : 'clearSelection'
    'click .butClose' : 'closer'
    'click .image' : 'singleGallery'
    'click .planeFirst' : 'singleGallery'
    'click .planeSecond' : 'singleGallery'
    'click #fancybox-overlay' : 'closeGallery'
    'click #fancybox-thumbs a' : 'openThumbImg'
  clearSelection: ->
    if(window.getSelection) then window.getSelection().removeAllRanges()
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
