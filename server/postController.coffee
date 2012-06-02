fs = require('fs')
findit = require('findit')
jade = require('jade')
Post = require("../app/models/post")

class PostController

  posts= []

  constructor: ->
    srcFiles = findit.findSync './views/posts/'
    for file in srcFiles
      jadeContent = @getFileContents(file)
      jadeFn = jade.compile( jadeContent, {});
      htmlContent = jadeFn()
      post = @getFileMetaData(htmlContent , file)
      post  = Post.create post
      @getStats(post)

  getFileMetaData: (content , path) ->
    parts = content.split("-->")
    rawMetaData = parts[0]
    content = parts[1]
    metaData = {}
    if rawMetaData
      metaData = rawMetaData.substring(5)
      metaData = JSON.parse metaData
      metaData.uniqueUrl = @getUniqueUrl(path)
      metaData.content = content
      metaData.visits = 0
      metaData.votes  = 0
      metaData.voted  = 0
      #@processTags(metaData)
    metaData

  getStats: (post) ->
    @getStat post,"visits"
    @getStat post,"votes"
    @getStat post,"shares"

  getStat: (post,key) ->
    #redisKey = "#{post.uniqueUrl}:#{key}"
    #RedisController.redis.get redisKey , (err, count)  =>
    #  return 0 if err
    post[key] = 0
      #console.log "Setting #{post.uniqueUrl} #{key} to #{post[key] } with #{redisKey}"
    post.save()

  processTags: (metaData) ->
    lowerTags = []
    for tag in metaData.tags
      tag = tag.toLowerCase()
      lowerTags.push tag
      Tag.create {name: tag }
    metaData.tags = lowerTags
    metaData

  getUniqueUrl: (path) ->
    i= path.lastIndexOf('/') + 1
    ii= path.lastIndexOf('.')
    uniqueUrl = path.substring(i,ii)

  getFileContents: (path) ->
    content = fs.readFileSync(path).toString()
    content

module.exports = PostController
