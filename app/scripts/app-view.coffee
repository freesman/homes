AppView = Backbone.View.extend(
  el: 'body'
  events:
    'click .fancybox-prev' : 'clearSelection'
    'click .fancybox-next' : 'clearSelection'
    'click [data-js-btn-close]' : 'closer'
    'click [data-js-item-image-3d]' : 'singleGallery'
    'click [data-js-item-image-plane1]' : 'singleGallery'
    'click [data-js-item-image-plane2]' : 'singleGallery'
    'click #fancybox-overlay' : 'closeGallery'
    'click #fancybox-thumbs a' : 'openThumbImg'
  clearSelection: ->
    if(window.getSelection) then window.getSelection().removeAllRanges()
  closer: ->
    switcher = $('[data-js-collection-item]').attr('data-id')
    if switcher == 'home' then $( "#tabs" ).tabs({active: 1})
    else $( "#tabs" ).tabs({active: 2})
  singleGallery: (e)->
    srcAttr = e.currentTarget.src
    $('[data-js-item-image]').attr('src', srcAttr)
    $('[data-js-item-image-3d]').removeClass('active')
    $('[data-js-item-image-plane1]').removeClass('active')
    $('[data-js-item-image-plane2]').removeClass('active')
    $(e.currentTarget).addClass('active')
  closeGallery: ->
    $('body').css('overflow', 'auto')
  openThumbImg: (e)->
    $.fancybox.jumpto($(e.currentTarget).attr('data-id'))
)

appView = new AppView
