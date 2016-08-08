require('./main.styl')
require('./header/header')
require('./content/content')

Backbone = require('backbone')
Epoxy = require('backbone.epoxy')
tabs = require('./scripts/tabs')
require('./scripts/jquery-mousewheel/jquery.mousewheel')
fancybox = require('./scripts/fancybox/jquery.fancybox')
require('./scripts/fancybox/jquery.fancybox-thumbs')

$( "#tabs" ).tabs()

$(document).keydown( 
  (e)->
    if e.keyCode==27 and $('#fancybox-overlay') != null
      $('body').css('overflow', 'auto')
)

appView = require('./scripts/app-view')
require('./scripts/collection-homes')
require('./scripts/collection-baths')
require('./scripts/collection-gallery-bath')
require('./scripts/collection-gallery-home')

addGallery = (gallClass) ->
  $(gallClass).fancybox(
    openEffect: 'none'
    closeEffect: 'none'
    prevEffect: 'none'
    nextEffect: 'none'
    href: 'index.html'
    afterClose: -> $('body').css('overflow', 'auto')
    helpers:
      title: null
      thumbs: 
        width: 70 
        height: 70         
  )

openThumb = ->
  addGallery('.thumb-bath')
  addGallery('.thumb-home')

$(document).ready(openThumb)


