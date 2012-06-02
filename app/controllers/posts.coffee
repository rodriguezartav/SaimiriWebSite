Spine = require('spine')
Post = require('models/post')

class Posts extends Spine.Controller

  elements:
    ".popable" : "popable"
    ".wrapper" : "wrapper"
    ".item"    : "item"

  events:
    "click .post" : "onItemClick"

  constructor: ->
    super
    @render()

  render: =>
    posts = Post.all()
    @log posts
    @html require("views/posts/item")( Post.all() )    
    
  onItemClick: (e) =>
    target = $(e.target)
    post = Post.find target.parents('.js_post_wrapper').attr "data-id"
    Spine.trigger "show_modal", "post" , post: post
    
     
module.exports = Posts
