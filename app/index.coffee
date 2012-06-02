require('lib/setup')

Spine = require('spine')

Post = require("models/post")
Posts = require("controllers/posts")

class App extends Spine.Controller

  elements:
    ".posts" : "postPlaceholder"

  constructor: ->
    super
    Post.refresh @dataPosts
    posts = new Posts(el: @postPlaceholder )
    
    #html require("views/layout")

module.exports = App
    