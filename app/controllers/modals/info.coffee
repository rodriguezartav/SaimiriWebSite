Spine   = require('spine')
$       = Spine.$

class Info extends Spine.Controller
  @extend Spine.Controller.Modal
  
  className: 'showWarning modal'

  @type = "info"

  events:
    "click .js_close" : "onClose"

  constructor: ->
    super
    @html require('views/modals/' + @data.template)

  @registerEvents: ->
    events = $('[data-event]')
    for event in events
      target = $(event)
      target.click (e) ->
        target = $(e.target)
        template = target.attr "data-event-template"
        Spine.trigger "show_modal", "info" , template: template
          
        
  onClose: =>
    Spine.trigger "hide_modal"
   
module.exports = Info
Info.registerEvents()
