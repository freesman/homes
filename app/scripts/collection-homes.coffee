homeTemplate = require('./templates/homeTemplate.jade')()
$ = require('jquery')

HomesModel = Backbone.Model.extend(
  defaults:
    name: 'project name'
    picture: 'picture path'
    price: 'project price'
    model: 'model name'
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
    homepath = 'content/img/homesGallery/' + this.model.get('model')
    $('.singleGallery').attr('data-id', 'home')
    $('.singleImg').attr('src', homepath + '/home-3d.png')
    $('.image').attr('src', homepath + '/home-3d.png')
    $('.planeFirst').attr('src', homepath + '/home-1p.png')
    $('.planeSecond').attr('src', homepath + '/home-2p.png')
    $('.project').text('проект ' + this.model.get('name'))
    $('.price').text('цена ' + this.model.get('price'))
    $('.planeFirst').removeClass('active')
    $('.planeSecond').removeClass('active')
    $('.image').addClass('active')
    $( "#tabs" ).tabs({active: 5})
)

AppHome = Backbone.Epoxy.View.extend(
  el:'#tabs-homes'
  collection: homesCol
  itemView: HomeView
  initialize: -> # title // picture // price // model name
    this.add('руслан', 'ruslan', '50 000', 'ruslan')
    this.add('петр', 'petr', '59 000', 'petr')
    this.add('демьян', 'demyan', '78 000', 'demyan')
    this.add('илья', 'ilya', '43 000', 'ilya')
    this.add('владимир', 'vladimir', '63 000', 'vladimir')
    this.add('яромир', 'yaromir', '47 000', 'yaromir')
  add: (nameH, pictureH, priceH, modelH)->
    pictureH = '../img/homes/' + pictureH + '.png'
    priceH = priceH + ' руб.'
    this.collection.add({name: nameH, picture: pictureH, price: priceH, model: modelH})
)

appHome = new AppHome