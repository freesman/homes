galleryTemplate = require('./templates/galleryTemplate.jade')()

PictureModel = Backbone.Model.extend(
  defaults:
    name: 'name'
    picture: 'picture path'
    id: 'picture id'
    gallery: 'thumb-home'
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
  el:'.content--gallery-home'
  collection: galleryCol
  itemView: GalleryView
  initialize: -> # title // picture // id
    this.add('gal1')
    this.add('gal2')
    this.add('gal3')
    this.add('gal4')
    this.add('gal5')
    this.add('gal6')
  add: (pictureH)->
    pictureH = 'img/gallery/home/' + pictureH + '.jpg'
    idH = this.collection.length + 1
    this.collection.add({picture: pictureH, id: idH})
)

appgallery = new AppGallery