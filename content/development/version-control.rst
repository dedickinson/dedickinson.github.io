Version control
###############
:date: 2014-12-26 07:00
:author: Duncan
:tags: development, project management
:slug: version-control
:status: published


*Don’t write a single line of code until you have a version control system in place*

Almost all developers know of at least one version control system (also called source code control or revision control). These systems provide a backup of your work and allow you to dip back into the past to find some lost code or work out where a bug may have crept in. However, with a head full of steam and the desire to get a prototype going to demo to the team/client/world you’ll fire up an IDE and start coding and version control won’t enter your head. Stop for just 5 minutes and get a version control repository running first. This is an insurance policy for a number of things:

-  you have a backup when your laptop dies on you
-  when you decide to tear down a section of code - you can always revert back if you find you’ve gone down the wrong path
-  you can easily share your code and encourage others to assist

Which to use?
~~~~~~~~~~~~~

There are several contemporary version control systems you could consider using, each with their own benefits. Client-server (or centralised) version control systems maintain a master copy on a central server with a local copy being “checked out” by a client. Generally the server maintains the full version history and the client only accesses a specific version as a working copy. Distributed version control systems (DVCS) don’t require a central master copy and all instances of the codebase includes the full version history.

If you don’t currently use a version control system, the following options are worth exploring as they’re heavily used and well documented:

-  `Git <http://en.wikipedia.org/wiki/Git_(software)>`__
-  `Mercurial <http://en.wikipedia.org/wiki/Mercurial>`__
-  `Subversion <http://en.wikipedia.org/wiki/Subversion>`__

If you’re able to influence the selection of a version control system, it’d be worth opting for a DVCS such as Git - it has a lot of support and most up-to-date developers have used it.

Hosted services
~~~~~~~~~~~~~~~

Historically, developers may have deferred the use of a version control system as these needed to be installed and managed on a server. However, there are a number of hosted services that take away the burden of running your own version control system. Some offer free hosting, usually for open source projects, but also offer paid accounts for closed codebases.

The key hosted version control providers include:

-  `Atlassian's Bitbucket <https://bitbucket.org/>`__
-  `Microsoft's Codeplex <http://www.codeplex.com/>`__
-  `GitHub <https://github.com/>`__
-  `Google code <https://code.google.com/>`__
-  `Sourceforge <http://sourceforge.net/>`__

Version control workflows
~~~~~~~~~~~~~~~~~~~~~~~~~

It's one thing to use version control, it's another to use it effectively - especially when you have larger teams or multiple product versions. `Atlassian provide an excellent overview <https://www.atlassian.com/git/tutorials/comparing-workflows>`__ of the most common Git workflows - it's well worth your reading time.

One last note
~~~~~~~~~~~~~

DropBox and Google Drive are not version control systems for development purpose. They are great systems for sharing documents etc but there’s a lot more development functionality and integration options in a good version control system.
