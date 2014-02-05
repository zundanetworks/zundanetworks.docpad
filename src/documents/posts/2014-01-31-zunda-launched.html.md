---
title: Zunda Networks Website Launched
layout: post
date: 2014-02-05 03:26
published: true
comments: true
tags: ['website','showcase','Bootsrap', 'NoCMS', 'DocPad', 'NodeJS']
---
This world is paradoxical; it is true that most creators, whether builders, architects, artists, engineers or software developers, rarely
enjoy or avail themselves the best of what they produce. This has been the case at [Zunda Networks](/) until now, whereby our web presence has been weak. I actually remember including a slide in one of my presentations on entrepreneurship that read "Zero Social Media Foot Print". Thats just to show you that we have always been aware of our situation but never just had the courage and maybe time to correct that, too busy with clients' work. It is kind of "A Piper who can't dance to their own tune". Others could even call it hypocrisy. Resolutions and attempts were made several times, but it wasn't just happening.

Fast forward to today, we are happy and proud to launch our first [Zunda Networks](/) website ever. This website has so many running parts but it is also very simple and scalable. More of that in the following sections.

<div class="zoom">
<img alt="Home page screenshot" width="200" src="/images/blog/home.jpg" title="Home page screenshot">
<img alt="About us page screenshot" width="288" src="/images/blog/about-us.jpg" title="About us page screenshot">
<img alt="Contact us page screenshot" width="210" src="/images/blog/contact.jpg" title="Contact us page screenshot">
</div>

The website is what others, in this age of CMS powered websites, would term a "static website" since it is not dynamically generated from database stored content every time a page is requested. Ours is instead pre-generated the first time a page is published and can actually be served from any standard web server without need of a dynamic scripting language like [PHP](http://www.php.net), [Python](http://www.python.org) and recently server side [Javascript(Nodejs)](http://nodejs.org)...etc. To many, that would seem like a disadvantage as the site is inherently static - I mean it is not a dynamic CMS powered site, therefore, no comments, no tags, no forms that support user/visitor submitted content to be easily integrated into the site content or non tech(web designer) staff in the company can not easily create new content in cool WYSIWIG web editors. No..No..no..no..thats not what we are saying. Markdown, Jade, prose.io, Nodejs, GIT, github, cloud computing and storage, Saas etc - all these have turned things heels over head. With cloud services like [Disqus](http://disqus.com), which powers our user comments infrastructure, google docs/forms and wufoo, and [github](https://github.com) which hosts this site, it is now possible that the easy to use features that we have come to expect of any serious website are not sacrificed.

In short, we present to you our scalable NoCMS Dynamic and Mobile Friendly(responsive) Website. Additionally, I am happy to coin the term NoCMS, think NoSQL. *Disclaimer: I am sure NoCMS(like NoSQL) is being used for the first time to refer to a CMS-free website*

Yes you got that right

### Scalability: Scripted Vs Static
Scalable in the sense that it can handle thousands of page requests without demanding heavy CPU and disk access activity, and who knows maybe network activity in a setup where the web and database servers are on different machines. The web server is left to do what it does best, spitting out pages to the requesting web browser without waiting for a scripting runtime to complete, which itself might be waiting for a database server to return a results set. In reality the DB server would itself have to make a request to the under-laying filesystem(disk access). The whole setup of a CMS powered website has so many moving parts with their bottle necks. The trick part is these have to be called to action for each and every single page request, and this is expensive on system resources - CPU, memory, network, and disk IO(input/out). Where as a static page would only have to be read from disk and handed over to the requesting client. Isn't that much simpler and less resource intensive.

### Responsive & Mobile friendly
We have a responsive mobile friendly website that fits different screen sizes without requiring a whole different website to handle those visiting the site using their mobile phone or tablet computing device. All this is made possible thanks to the all powerful HTML5 web framework, [Twitter Bootstrap](http://getbootstrap.com).

### MVP: Unix Philosophy
Having tried to elaborate on how simple, responsive and scalable this site is, it would be unwise not to clarify in clear terms the earlier claim that it also has many running parts, though that has already been stated. We are refering to the user comments and contact us form capabilities which are cloud services by disqus and google and/or wufoo. So the many running parts does not imply complexity of the core website but rather that it comprise many loosely coupled parts, each doing one thing it does best while working in concert with the others to deliver a fully functional modern web experience. Working through the creation of this site has sent home the popular unix philosophy "software that does one thing and is networked". We will see how we can incorporate Minimum Viable Product(MVP) in our solutions.

### NoCMS Vs CMS
And finally to put everything into perspective, we are not saying that we have now reached that time where we can do away with CMSs for powering dynamic websites. A CMS is great for content management, but ill fitted to effiently handle a heavy traffic situation without a need for a caching tier. There are efforts and developments to tie together CMS and static site generation. One such product that comes to mind is dekyll a drupal based solution.

Talking of Drupal; it is an excellent CMS/Framework/Platform and we have delivered all sorts of solutions based on it. We have mostely developed websites on Drupal and this will continue based on the requirements.

[DocPad](http://www.docpad.org) is the static site generator off which this is possible. Docpad is so awesome not just because it runs on [Nodejs](http://nodejs.org) and extensible, but also because its so easy to have all of the following fuctionality

* Blog posts generated from Markdown files
* CSS stylesheets generated from Stylus or Less files
* Arbitrary web pages like the About Us page
* Page URLs based on the date of the post
* Disqus support for post comments
* Integration with cloud form services like google forms or wufoo
* Tags and tag index pages
* Syntax highlighting of code blocks
  ```
    //colorbox for blog posts images with class zoom
    $('.zoom img, img.zoom').colorbox({
      rel: 'group',
      width: 800,
      html: function(){
        return '<img src="' + $(this).attr('src') + '>';
      }
    });
  ```
  <img class="float-right" alt="Colorbox screenshot" width="276" src="/images/blog/colorbox-z.jpg" title="Colorbox screenshot">
* ColorBox support for images in blog posts without altering the existing markup
* Multiple templating languages supported e.g jade, eco, coffeekup etc
* Robust plugin interface hence rendering itself extensible
* Atom feed with relative urls automatically converted to full URLs
* Us the the same scripting language on the backend(server side) and the front-end
  
If need be Docpad can be used in a true dynamic way as we know it. It can be your primary web server configured to dynamically generate certain pages(or the entire site) from content stored in a database or files on the filesystem.

And finally in the true spirit of Free libre and Open Source Software you are free to fork what we have done here and use it as a base for your own Docpad website. The source is available on GitHub:

<https://github.com/zundanetworks/zundanetworks.docpad.git>

Be advised that it has all our content in it, which you would need to clean out, and of course our look and feel (which you may not want), though it could prove a good starting point.
