require('lib/setup')

Spine = require('spine')

Post = require("models/post")
Posts = require("controllers/posts")

PostModal = require("controllers/modals/post")
InfoModal = require("controllers/modals/info")


class App extends Spine.Controller
  @extend Spine.Controller.ModalController

  elements:
    ".posts" : "postPlaceholder"

  constructor: ->
    super
    Post.refresh @dataPosts
    posts = new Posts(el: @postPlaceholder )
    
    @setupModal()
    
    #html require("views/layout")

    

module.exports = App
    