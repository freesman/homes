galleryTemplate = require('./templates/galleryTemplate.jade')()

PictureModel = Backbone.Model.extend(
  defaults:
    picture: 'picture path'
    id: 'picture id'
    gallery: 'thumb-bath'
)

GalleryCollection = Backbone.Collection.extend(
  model: PictureModel
)

galleryCol = new GalleryCollection

GalleryView = Backbone.Epoxy.View.extend(
  el: galleryTemplate
  bindings: 'data-bind'
  events:
    'click .work' : 'openWork'
  openWork: ->
    $('body').css('overflow', 'hidden')
)

AppGallery = Backbone.Epoxy.View.extend(
  el:'.content--gallery-bath'
  collection: galleryCol
  itemView: GalleryView
  initialize: -> # title // picture // id
    this.add('gal1')
    this.add('gal2')
    this.add('gal3')
    this.add('gal4')
    this.add('gal5')
  add: (pictureH)->
    pictureH = 'img/gallery/bath/' + pictureH + '.jpg'
    idH = this.collection.length + 1
    this.collection.add({picture: pictureH, id: idH})
)

appgallery = new AppGallery

console.log(appgallery)