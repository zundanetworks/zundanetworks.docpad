# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON

#Kwabi: 2014/01/15 22:00:04
cheerio = require('cheerio')
url = require('url')

docpadConfig = {

  # =================================
  # Server Configuration

  # Port
  # Use to change the port that DocPad listens to
  #default we will detect the appropriate port number for our environment
  # if no environment port number is detected we will use 9778 as the port number
  # Checked environment variables are:
  # - PORT - Heroku, Nodejitsu, Custom
  # - VCAP_APP_PORT - AppFog
  # - VMC_APP_PORT - CloudFoundry
  port: 9777  # 2013/12/17 17:09:28 Kwabi changed so I can run the local docpad.org instance at the same time
  
  # Template Data
  # =============
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:

    # Specify some site properties
    site:
      # The production url of our website
      url: "http://www.zundanetworks.com"

      # Here are some old site urls that you would like to redirect from
      oldUrls: [
        'www.website.com',
        'website.herokuapp.com'
      ]

      # The default title of our website
      title: "Zunda Networks"

      # The website description (for SEO)
      description: """
        Zunda Networks is an ICT Services outfit specialising in innovative application of “Open Source” and “Open Standards”
        Compliant ICT technologies to allow business houses and home users to easily carry out their day to day activities. Our products defy vendor lock-in.
        motto:Conquer ICT ⟶ Improve Living standards
        """

      # The website keywords (for SEO) separated by commas
      keywords: """
        CMS, nosql, website development, document management, search engine appliance, nodejs, angularjs, mobile first, database, email server, email, web server, ubuntu linux, linux, networking, zunda networks, zunda, networks, mobile, apps, monogdb, couchdb, pouchdb, indexeddb, javascript, php, python, css, html5, design, ux, gis, geospacial, map, sailsjs, zambia, it solutions, social, business, software, dynamic website, CRM, NoCMS, D3, D3.js, visualization, virtualisation
        """

      # The website author's name
      author: "Zunda Networks"

      # The website author's email
      email: "code@zundanetworks.com"

      # Your company's name
      #copyright: "Copyright © 2014 Zunda Networks"
      copyright: "Copyright &copy; 2014 Zunda Networks"

      #Kwabi: 2014/02/18 13:03:49 Discus.com settings
      disqusShortName: 'zunda'

    # Helper Functions
    # ----------------

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
      # if our document does not have it's own title, then we should just use the site's title
      else
        @site.title

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site's description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')

    #Kwabi: 2014/01/15 12:47:00 moment helper function added
    # moment date library for parsing, validating, manipulating, and formatting dates.

    moment: require('moment')

    #Kwabi: 2014/01/15 22:00:04
		fixLinks: (content) ->
			baseUrl = @site.url
			regex = /^(http|https|ftp|mailto):/

			$ = cheerio.load(content)
			$('img').each ->
				$img = $(@)
				src = $img.attr('src')
				$img.attr('src', baseUrl + src) unless regex.test(src)
			$('a').each ->
				$a = $(@)
				href = $a.attr('href')
				$a.attr('href', baseUrl + href) unless regex.test(href)
			$.html()

  # Collections
  # ===========
  # These are special collections that our website makes available to us

  collections:
    # For instance, this one will fetch in all documents that have pageOrder set within their meta data
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

    # This one, will fetch in all documents that will be outputted to the posts directory
    posts: (database) ->
      database.findAllLive({relativeOutDirPath:'posts'},[date:-1])

	environments:
		development:
			collections:
				posts: ->
					@getCollection('documents').findAllLive({relativeDirPath: {'$in' : ['posts', 'drafts']}}, [relativeDirPath: 1,  date: -1])

  # Plugins
  #Kwabi: 2014/01/15 17:09:33 Plugin configurations. 
	plugins:
		tagging:
			collectionName: 'posts'
			indexPageLowercase: true
		dateurls:
			cleanurl: true
			trailingSlashes: true
			keepOriginalUrls: false
			collectionName: 'posts'
			dateIncludesTime: true
		paged:
			cleanurl: true
			startingPageNumber: 2
		cleanurls:
			trailingSlashes: true
}

# Export our DocPad Configuration
module.exports = docpadConfig
