homeTemplate = require('./templates/homeTemplate.jade')()
$ = require('jquery')

HomesModel = Backbone.Model.extend(
  defaults:
    name: 'project name'
    picture: 'picture path'
    price: 'project price'
    model: 'model name'
    secondFloor: false
)

HomesCollection = Backbone.Collection.extend(
  model: HomesModel
)

homesCol = new HomesCollection

HomeView = Backbone.Epoxy.View.extend(
  el: homeTemplate
  bindings: 'data-bind'
  events:
    'click .home' : 'openHome'
  openHome: ->
    homepath = 'img/collection/homesGallery/' + this.model.get('model')
    $('[data-js-collection-item]').attr('data-id', 'home')
    $('[data-js-item-image]').attr('src', homepath + '/home-3d.jpg')
    $('[data-js-item-image-3d]').attr('src', homepath + '/home-3d.jpg')
    $('[data-js-item-image-plane1]').attr('src', homepath + '/home-1p.jpg')
    if this.model.get('secondFloor')
      $('[data-js-item-image-plane2]').css('display', 'block')
      $('[data-js-item-image-plane2]').attr('src', homepath + '/home-2p.jpg')
    else $('.planeSecond').css('display', 'none')
    $('[data-js-project-name]').text('проект ' + this.model.get('name'))
    $('[data-js-project-price]').text(this.model.get('price'))
    $('[data-js-item-image-plane1]').removeClass('active')
    $('[data-js-item-image-plane2]').removeClass('active')
    $('[data-js-item-image-3d]').addClass('active')
    $( "#tabs" ).tabs({active: 5})
)

AppHome = Backbone.Epoxy.View.extend(
  el:'#tabs-homes'
  collection: homesCol
  itemView: HomeView
  initialize: -> # title // picture // price // model name// 2nd floor
    this.add('руслан', 'ruslan', '50 000', 'ruslan', true)
    this.add('петр', 'petr', '59 000', 'petr', true)
    this.add('демьян', 'demyan', '78 000', 'demyan', true)
    this.add('илья', 'ilya', '43 000', 'ilya', true)
    this.add('владимир', 'vladimir', '63 000', 'vladimir', true)
    this.add('яромир', 'yaromir', '47 000', 'yaromir', true)
  add: (nameH, pictureH, priceH, modelH, scndFlr)->
    pictureH = 'img/homes/' + pictureH + '.jpg'
    priceH = priceH + ' руб.'
    this.collection.add({name: nameH, picture: pictureH, price: priceH, model: modelH, secondFloor: scndFlr})
)

appHome = new AppHome
console.log(appHome)