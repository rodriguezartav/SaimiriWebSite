Post = require("../app/models/post")



class Routes

  constructor: (@app) ->    
    @setupRoutes()
    
  setupRoutes: ->
   #ROUTES GO HERE
    @app.get "/", (req,res) ->
      res.render "index" , {posts: Post.all() }

    @app.get "/es", (req,res) ->
      res.render "index_es"

module.exports = Routes
   