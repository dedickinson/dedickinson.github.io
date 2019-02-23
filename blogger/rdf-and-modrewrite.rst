RDF and mod_rewrite
###################
:date: 2009-06-15 09:03
:author: Anonymous
:tags: rdf apache
:slug: rdf-and-modrewrite
:status: published

| I was reading the `Best Practice Recipes for Publishing RDF Vocabularies <http://www.w3.org/TR/swbp-vocab-pub/>`__ and looking for an easy way to provide HTML and RDF on my site. At the moment I have (very) limited RDF but I wanted something that would allow me to have cool(ish) URIs automatically. Basically, a system that would work out if I have an HTML or RDF file depending on your request.
| So, http://duncan.dickinson.name/card should give you:

-  card.html if you're a web browser
-  card.rdf if you want semantic data

| 
| This stretched my mod\_rewrite skills but the following seems to work:

::

    # Turn off MultiViews
    Options -MultiViews -Indexes 
    DirectoryIndex card.html index.html index.htm index.php

    # Directive to ensure *.rdf files served as appropriate content type,
    # if not present in main apache config
    AddType application/rdf+xml .rdf

    # Rewrite engine setup
    RewriteEngine On
    RewriteBase /

    #Check if an RDF page exists, and return it
    RewriteCond %{HTTP_ACCEPT} application/rdf\+xml
    RewriteCond %{REQUEST_FILENAME}.rdf -f
    RewriteCond %{REQUEST_URI} !^/.*/$
    RewriteRule (.*) $1.rdf [L,R=303]

    #Provide a default RDF page 
    RewriteCond %{HTTP_ACCEPT} application/rdf\+xml
    RewriteCond %{REQUEST_URI} ^/$
    RewriteRule .* /card.rdf [L,R=303]

    #Provide the HTML for the request
    RewriteCond %{REQUEST_FILENAME}.html -f
    RewriteCond %{REQUEST_URI} !^/.*/$
    RewriteRule (.*) $1.html [L,R=303]

    #provide the PHP page for the request
    RewriteCond %{REQUEST_FILENAME}.php -f
    RewriteCond %{REQUEST_URI} !^/.*/$
    RewriteRule (.*) $1.php [L,R=303]

| 
| Using `some help <http://dowhatimean.net/2007/02/debugging-semantic-web-sites-with-curl>`__ I got curl looking at my site's rdf:

::

    curl -H "Accept: application/rdf+xml" http://duncan.dickinson.name/card

| 
| So now I get back a 303 redirect.

.. raw:: html

   </p>
