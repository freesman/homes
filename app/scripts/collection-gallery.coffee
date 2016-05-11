galleryTemplate = require('./templates/galleryTemplate.jade')()

PictureModel = Backbone.Model.extend(
  defaults:
    name: 'name'
    picture: 'picture path'
    id: 'picture id'
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
  el:'#tabs-gallery'
  collection: galleryCol
  itemView: GalleryView
  initialize: -> # title // picture // id
    this.add('фото 1', 'gal1')
    this.add('фото 2', 'gal2')
    this.add('фото 3', 'gal3')
    this.add('фото 4', 'gal4')
    this.add('фото 5', 'gal5')
    this.add('фото 6', 'gal6')
    this.add('фото 7', 'gal7')
    this.add('фото 8', 'gal8')
    this.add('фото 9', 'gal9')
    this.add('фото 10', 'gal10')
    this.add('фото 11', 'gal11')
  add: (nameH, pictureH)->
    pictureH = '../img/gallery/' + pictureH + '.jpg'
    idH = this.collection.length + 1
    this.collection.add({name: nameH, picture: pictureH, id: idH})
)

appgallery = new AppGallery