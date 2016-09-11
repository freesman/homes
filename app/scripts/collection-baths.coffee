bathTemplate = require('./templates/bathTemplate.jade')()
$ = require('jquery')

BathsModel = Backbone.Model.extend(
  defaults:
    name: 'project name'
    picture: 'picture path'
    price: 'project price'
    model: 'model name'
    secondFloor: false
)

BathsCollection = Backbone.Collection.extend(
  model: BathsModel
)

bathsCol = new BathsCollection

BathView = Backbone.Epoxy.View.extend(
  el: bathTemplate
  bindings: 'data-bind'
  events:
    'click .bath' : 'openBath'
  openBath: ->
    bathpath = 'img/collection/bathsGallery/' + this.model.get('model')
    $('[data-js-collection-item]').attr('data-id', 'bath')
    $('[data-js-item-image]').attr('src', bathpath + '/bath-3d.jpg')
    $('[data-js-item-image-3d]').attr('src', bathpath + '/bath-3d.jpg')
    $('[data-js-item-image-plane1]').attr('src', bathpath + '/bath-1p.jpg')
    if this.model.get('secondFloor')
      $('[data-js-item-image-plane2]').css('display', 'block')
      $('[data-js-item-image-plane2]').attr('src', bathpath + '/bath-2p.jpg')
    else $('[data-js-item-image-plane2]').css('display', 'none')
    $('[data-js-project-name]').text('проект ' + this.model.get('name'))
    $('[data-js-project-price]').text(this.model.get('price'))
    $('[data-js-item-image-plane1]').removeClass('active')
    $('[data-js-item-image-plane2]').removeClass('active')
    $('[data-js-item-image-3d]').addClass('active')
    $( "#tabs" ).tabs({active: 5})
)

AppBath = Backbone.Epoxy.View.extend(
  el:'#tabs-baths'
  collection: bathsCol
  itemView: BathView
  initialize: -> # title // picture // price // model name
    this.add('алена', 'alena', '20 000', 'alena', false)
    this.add('анна', 'anna', '23 000', 'anna', false)
    this.add('екатерина', 'ekaterina', '17 000', 'ekaterina', false)
    this.add('елена', 'elena', '15 000', 'elena', false)
    this.add('ирина', 'irina', '19 000', 'irina', false)
    this.add('наталья', 'natalya', '30 000', 'natalya', false)
  add: (nameH, pictureH, priceH, modelH, scndFlr)->
    pictureH = 'img/baths/' + pictureH + '.jpg'
    priceH = priceH + ' руб.'
    this.collection.add({name: nameH, picture: pictureH, price: priceH, model: modelH, secondFloor: scndFlr})
)

appBath = new AppBath