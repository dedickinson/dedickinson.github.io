Artefact Repositories
#####################
:date: 2015-01-23 07:29
:author: Duncan
:tags: artefact, development, maven, continuous integration
:slug: artefact-repositories
:status: published

*Working from the same set of components helps to catch problems early*

In my last posts I provided an overview of version control and the use of a continuous integration server. This post adds an artefact repository to the development infrastructure. The artefact repository is a versioning store for compiled code components (such as jar files) and helps teams using and managing both 3rd-party and in-house developed components.

Most of my recent experience has been in the Java world and in using `Apache Maven <http://maven.apache.org/>`__ to manage builds, dependencies and various other tasks. I came across Maven several years ago and its dependency management feature quickly sold me. At the time I’d joined a team who had development documentation that required I locate a range of library and binary files scattered across the web. As I started to establish my development environment it became apparent that a number of the required components were no longer hosted at their original location and I had to ask team members to send me their copies. This is maddening enough when the team is in the same location but it completely collapses if you are remote, especially if you’re working in an open source community.

At first I wrestled with the idea of storing the files in our Subversion repository but it occurred to me that we’d still need some sort of system/script for bringing these files together and making sure the correct versions were being used. Likewise for setting up an FTP/HTTP accessible file store. After a fair bit of research I decided that Maven really gave me what I was after: the ability to manage in-house and 3rd-party components used by the build.

    I’ve enjoyed using Maven but the XML configuration can get tedious and lately I’ve enjoyed working with `Gradle <https://www.gradle.org/>`__. Dependency management in Gradle includes both Maven and Ivy repositories and Gradle has (improving) support for publishing to these repositories.

Once you discover the benefits of an artefact repository in its “pull” model (where you’re primarily grabbing components out of it) you can then really extend the advantages by setting up a local repository for managing your own components. Beyond that you can start distributing your components to central artefact repositories so that they can be easily utilised by other developers.

    Apache Maven is a build configuration tool and not an artefact repository. By default, Maven will use the central repository to source dependencies and will cache them in your home directory (``~/.m2/repository/``). This article really encourages you to look at the benefits of running your own artefact repository.

What are the benefits?
----------------------

Here are some of the key reasons to use an artefact repository:

They stop you needing to hunt out library files from the web, network storage or your colleague’s USB drive.
    Setup documentation that includes “get a copy of CrazyLib.jar from http://libs.example.com” is just asking for trouble. Instead of this you define a dependency in your build configuration and the build tool downloads a copy from the artefact repository.
Harmonise the libraries and their versions across the team
    Reduce the “it works on my laptop” and “d’oh we’ve been working on different versions for the past 3 months” by defining the build configuration used across the team.
Real code re-use
    To my mind the model of an artefact repository makes code reuse much more achievable than other approaches I’ve encountered. Structuring functionality into components helps improve system architecture and, when done right, means that a project can publish re-usable components based on specific functionality.

The role of the artefact repository
-----------------------------------

|Development infrastructure example|

Proxy for other repositories
    `The Central Repository <http://search.maven.org/>`__ provides a huge array of components to the Maven community. By setting up a local proxy for this repository you can cut down on network traffic and help speed up builds.
Local store of 3rd-party modules
    When you start using a 3rd party module (perhaps a jar or war) that isn’t available in another repository you can upload it to your local repo and make it available to the whole team.
Working with your continuous integration (CI) environment
    The CI environment should be charged with publishing SNAPSHOTs to your repository as a post-build step. This means that other (sub-)teams will pull down the newest version of the component if they happen to be using it.
    I’ve also found it extremely useful to configure a CI build that performs a clean-room build on a daily basis. This ensures that the CI system doesn’t use its cache of components and downloads everything configured as a dependency. This can be handy in discovering if “lingering” components are generating false positives in the build.
Release hosting
    When ready to release you switch from releasing SNAPSHOT (development) components to the production (release) version. Artefact repositories can (and usually do) host both and this demarcates stable and non-stable components.
    Repositories such as Sonatype Nexus can also provide interfaces used by package managers such as ``yum``. This allows you to distribute your packages into the same repository as your code components.

    Backing up your repository is really important as it will (over time) start to contain components that you may not be able to recover/rebuild in the case of a system failure.

Products
--------

My primary experience has been with `Sonatype’s Nexus <http://www.sonatype.com/nexus/compare-repos>`__ product - the OSS version specifically. There are a few other repositories worth investigating:

-  `Apache Archiva <http://archiva.apache.org/index.cgi>`__
-  `JFrog Artifactory <http://www.jfrog.com/artifactory/>`__

A `handy comparison is also available <http://docs.codehaus.org/display/MAVENUSER/Maven+Repository+Manager+Feature+Matrix>`__

More than just code modules
---------------------------

At the core of a repository such as Nexus is a filesystem that tracks versions. This gives you a piece of infrastructure that can handle the various components and packages that aren’t well-suited to version control systems such as Git. Here are a few ways in which I’ve utilised an artefact repository:

Host virtual machine images
    For this work I created a build environment in `Rake <http://docs.seattlerb.org/rake/>`__ that used `Packer <https://www.packer.io/>`__ to generate virtual machine images and store them in Nexus. Team members and the build environment could then use a `Vagrant <https://www.vagrantup.com/>`__ file to grab a copy of the image - ensuring that we had a stable platform for testing and creating demo systems. It gives you “platform defined as code”.
Deployment file store
    Using tools such as `Puppet <http://puppetlabs.com/>`__ has become increasingly prevalent but I notice many people resort to using version control for storing large files that are needed in deployment. Ideally you might look at setting up a local package repository but converting an existing application distribution to RPM can be time-consuming. Artefact repositories provide a system for hosting versioned files and an HTTP-based access point.
Production build proxy
    I was recently involved in a project that utilised Python and I noticed that the “release” onto the production server involved the deployment tool dragging a heap of libraries from the `Python Package Index (PyPi) <https://pypi.python.org/pypi>`__. I may be a bit old-school but the idea of a production system grabbing libraries from the public Internet makes me rather queasy. My suggestion was (at the very least) to set up a local proxy (such as `devpi <https://pypi.python.org/pypi/devpi>`__) to at least divert the egress into something a little more “controllable”. A number of artefact repositories provide services for a variety of package managers - providing a central repo for many uses.

Summary
-------

Over these past 3 posts I’ve covered `version control <http://blog.duncan.dickinson.name/2014/12/version-control.html>`__, `continuous integration <http://blog.duncan.dickinson.name/2015/01/continuousintegration.html>`__ and now artefact repositories. I hope these introductions describe the utility of each piece of development infrastructure.

.. raw:: html

   </p>

.. |Development infrastructure example| image:: https://lh3.googleusercontent.com/-5_A9Cx5z9TY/VKyDI2J7yKI/AAAAAAAAASU/i8UNXoeHSLI/s640/RepoArch.jpg
   :name: fig
