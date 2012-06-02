Spine = require('spine')
Post = require('models/post')

class Posts extends Spine.Controller

  elements:
    ".popable" : "popable"
    ".wrapper" : "wrapper"
    ".item"    : "item"

  events:
    "click .js_select_post" : "onItemClick"

  constructor: ->
    super
    @render()

  render: =>
    posts = Post.all()
    @log posts
    @html require("views/posts/item")( Post.all() )    
     
module.exports = Posts
