The Fascinator 2
################
:date: 2009-06-22 17:46
:author: Anonymous
:slug: fascinator-2
:status: published

| The team found itself with a little bit of breathing space this past week or so and we focussed on developing The Fascinator Desktop. There was a fair bit of whiteboard time with Peter early on and the coding began. Call it agile or whatever, a team sharing design issues whilst developing components just seems to get their stuff together better than a highly pre-spec'd system.
| So, what did we achieve? Well:

-  Linda got Watcher up and running - even despite a moving goal.
-  Ron and Oliver worked on creating a storage API to allow us to test against Fedora or CouchDB
-  Bron and I created components to get the Watcher queue and extract metadata and full text via Aperture.
-  Linda created a transformation API to convert files into a variety of renditions.

| 
| This gives us a tool chain where we:

#. Watch your system for file changes
#. Extract the metadata and fulltext from the file
#. Transform your various file types to renditions such as html and pdf
#. Store the data in a repository

| 
| From this point, we can lay The Fascinator search engine over the top and give you a faceted search of your files. It's not all there yet - we need to finish off some of the storage work and get it all tied together - but here's hoping that the end of the week brings version 0.1 of The Fascinator Desktop!
| My admission from the week: I must integrate unit tests into my development approach.

.. raw:: html

   </p>
