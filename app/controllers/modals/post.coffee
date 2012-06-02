Spine   = require('spine')

$       = Spine.$

class Post extends Spine.Controller
  @extend Spine.Controller.Modal
  
  className: 'showWarning modal'

  @type = "post"

  events:
    "click .js_close" : "onClose"

  constructor: ->
    super
    @html require('views/modals/post')(@data.post)

  
  onClose: =>
    Spine.trigger "hide_modal"
   
module.exports = Post