Spine = require('spine')

class Post extends Spine.Model
  @configure "Post" , "uniqueUrl", "date" , "thumbnail"  , "image" , "title","subtitle","description","tags","visits","votes","content","active"

  constructor: ->
    super
    @date = Date.parse(@date)

module.exports = Post

