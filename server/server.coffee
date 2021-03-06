port =  process.env.PORT || 9294

express = require('express')
fs = require('fs')
Routes = require("./routes")
OpfDevUtil = require("./opfDevUtil")

PostController = require("./postController")
postController = new PostController()


##Setup Server
app = express.createServer()
app.use express.logger()
app.use express.bodyParser()
app.use express.cookieParser()

app.set 'view engine'  , 'jade'


OpfDevUtil.setupCompilers(app) if process.env.NODE_ENV != "production"

routes = new Routes(app)
      
app.use(express.static("./public"))


app.listen(port)
console.log "Listening on port " + port

