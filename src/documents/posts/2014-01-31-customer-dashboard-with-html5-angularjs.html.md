---
layout: post
title: "Customer Dashboard: Fun with with HTML5, NoSQL, Angurlarjs and D3.js"
date: 2014-01-31 08:01
published: true
comments: true
tags: HTML5, AngularJS, NoSQL, D3, jQuery
---
This is the first of Single Page App(SPA) development using HTML5 technologies, Angularjs, D3, NoSQL and Nodejs

* The first post(this post) is about the actual functionality of a SPA app using only an HTML5 capable browser handling everything from datastorage to export & import and data conversion between json and csv.
* The subsquent posts will go into detail on the "How To" and the various technologies used and bolting a Nodejs app using a framework like Sailsjs with MongoDB

Now before I bore you with the whole slew of future posts to follow this one, here to you the future of software that does its intended purpose so well without need of an expensive IDE or SDK to develop it. You will only need a modern web browser - Firefox 20+, Chrome 10+ - and a decent text editor with code highlighting, I use geany on my Ubuntu 12.04 laptop.

### What is this?
A Customer Management & Billing System(CMBS), a CRM of sorts but more focus on just handling customer details and the service plans they have subscribed to. The app itself is not yet a finished product that you would use in you typical day to day business operation, but we are here to show you that the browser has indeed the desktop, and a powerful one as a matter of fact.

*Disclaimer: We are actually developing a Billing System for one of our clients and what talked about here makes part of that solution or used in prototyping*

**Features include...**
* A complete listing of all the client records
* Record filtering and sorting *based on any of the enabled filter/sort fields*
* Export to CSV *for use in your popular spreadsheet, whether LibreOffice Calc or MS Excel*
* Import of records from a CSV file
* Add and Edit forms
* Input data validation
* Persistent store to NoSQL backend of your choice. Currently, browser localstore is used but there is nothing stopping any to use whatever backend. We will be adding IndexedDB and levelDB

***Upcoming features***
* Mobile-optimised to work well on smartphones
* Graphs & Charts - *for easy visualization of key performance indicators(KPI)*
* Subscription plans management
* Invoice management
* Payment management
* Client notification via email and/or SMS
* Support tickets and feedback management.
    * Submitted via email, sms or voice call
    * Case/issue status sent to client on request or when the case is closed(with details of the resolution).
    * Filtered Summary reports with realtime graphical visualisation
* Alerts subsystem - notifying authorised staff about various monitored KPI and/or system health
* Secure audit trail detailing who did what at what time
* Restricted autheticated access. Role based access permissions facilitating access to the various reports and defining what a particular user is allowed to do in the system
* 

Screenshots of current functionality (click to enlarge)...

<img class="zoom" src="/images/slide/cmbs.png" width="270" alt="CMBS Dashboard: client list" title="CMBS Dashboard: client list" />
<img class="zoom" src="/images/blog/cmbs-add.jpg" width="200" alt="CMBS Dashboard: Add client form" title="CMBS Dashboard: Add client form" />
<img class="zoom" src="/images/blog/cmbs-edit.jpg" width="200" alt="CMBS Dashboard: Edit client form" title="CMBS Dashboard: Edit client form" />

### How Possible is it?
This kind of application was made possible, thanks to HTML5, NoSQL and Angularjs

Your modern browser is a powerful engine that is capable of running almost all your office computaional needs without calling on a backend service. Whether it is text manipulation and convertion or handling binary data streams or heavy graphics rendering/manipulation, all that is possible nowadays. Who knew that an pdf document could effortlessly be rendered in one's browser without a plugin - those are things we take for granted today. And recently it is now possbile to consume audio/video streams without calling on the venerable flash runtime. Anyway this post is not so much about the capabilities of web browsers, tis just that am so passionate about the possibilities web technologies have put in everyone's hands, I mean anyone willing. Am tempted to mention websockets and webRTC which gives us the full power of realtime communication and collaboration just from the comfort of your and my browser without touching any code in Java or C/C++, but all in the pervasive Javascript.

*__Ooh!..!!! How?__*

The CMBS app is just a simple web page(or files with fragements of HTML markup), CSS and javascript files. The css is the styling(skin) layer while javascript is where all the magical functionality happens.

For the un-initiated HTML5 is HTML + javascript and sophisticated browser functionality like localStorage and more access to the underlying operating system/hardware resources , it be filesystem, network, location(GPS), audio/vidoe devices like microphone, camera, etc. The best way to understand this is to think of your computer in terms of a smartphone with all that sensory gadgetry in it.

Bring in [Angularjs](http://angularjs.org), then we got a responsive realtime web app. Angularjs, a fronted webframework for responsive web apps, is the killer piece that allows us to easily develop this application without writting convulated javascript code and repeating ourselves. Angularjs takes care of updating our page in realtime( or more precisely parts parts) without moving away or reloading the entire thing. Think of it as the good old DOM manipulation or AJAX+jQuery turbo-charged, only much better and cleaner.

If you remember very well, NoSQL was mentioned some where in the paragraphs above. The HTML5 localStore is our NoSQL database allowing us to store all the client records. Of course we are aware of the fact that it is limited in how much data it can hold and prone to data loss if the the user clears the cache/offline data. However, it allows us to prototype and even implement the desired functionality without worrying about another layer to handle data persistence. In the next iteration we hope to use indexedDB which will allow us a more functionality than the text only localStore with is lack of real record querying.
Currently the entire data set has to be read into memory and converted to a json object and later has to be serialized to text when saving.

### Data Export & Import
Exporting and importing of data is handled by [D3(Data-Driven Documents)](http://d3js.org), a Javascript document manipulation and visualization library based on data. Until this project, I only knew of D3(Data-Driven Documents) as a graphing or visualization library. Truth told despite having downloaded it and kept it on my drive for years, I only used to use or tinker with flot, Raphaeljs, Visualise and other javascript charting libraries. Well there might be an explanation to that; as far as I can remember [jQuery](http://juery.org) was the only general purpose web frontend library used and anything that was not leaning towards it was quitely shelved.

### Technical Requirements
* [AngularJS](http://angularjs.org/) as the frontend application framework
* [Firefox](http://www.mozilla.org/) as the Browser
* [D3.js](http://d3js.org)
* [jQuery](http://jquery.org)

Note that the our experience with chrome get it right if you serve the app from a webserver otherwise the error below pops up its head.

`XMLHttpRequest cannot load file:///cmbs/app/views/clients.html. Origin null is not allowed by Access-Control-Allow-Origin.`

Firefox will get you up and running even thought you access it directly from the its fold -  I mean just open the index.html file

### Next steps
As said, this is not a finished product, development continues and will keep everyone updated and we will release the full source code for everything we are are shared with you.

Get the code from our github repo:

<https://github.com/zundanetworks/cmbs-html5.git>

Your questions and comments are welcome.
