Continuous Integration
######################
:date: 2015-01-15 16:20
:author: Duncan
:tags: development, maven, continuous integration
:slug: continuousintegration
:status: published

*“It works on my machine” really translates to “I don’t know why it works - I just clicked buttons” and the offender forced to buy lunch for the team*

Continuous Integration (CI) focusses on ensuring that a project’s code successfully builds whenever the code base (usually stored in a version control system) changes. The "continuous" aspect relates to the fact that the build is run every time code is checked in (committed). Given that some approaches see each team member commit code several times a day, the CI system may be quite busy. Having worked in a team where one member kept on committing code that broke the build, using a CI approach helped us determine where problems were coming from and saved time misspent thinking that your own code is wrong (``svn blame`` [#f1]_).

    In fact you could have a CI process that rolls back a commit that breaks the build.

The CI approach differs somewhat from approaches such as “nightly builds” as it really is continuous and can really help make sure people are only committing code that doesn’t break the build [#f2]_. This constant feedback loop should trigger a fix immediately whilst the code is “top of mind”. An associated work practice is “pull often, commit small, commit often” so that the team is working in-step and the CI process helps capture issues before they get too big [#f3]_.

This may sound a little complex but a CI process really has only 3 responsibilities:

#. Trigger a build when new code is checked into version control [#f4]_
#. Run the build and its associated unit tests
#. Report on any failures


Your CI process doesn’t have to be a huge bells and whistles affair. In the most basic case it may be a desktop PC that developers walk over to and manually start a build. The use of a separate system for CI helps reduce (but not eliminate) the false positives that occur when a build succeeds on a developer’s machine because of the miscellaneous debris crawling around developer laptops (old versions, libraries on classpaths that aren’t included in the build config etc).

There are many CI systems around that help you get going with a more automated CI environment:

-  I’ve used `Jenkins <http://jenkins-ci.org/>`_ and, prior to that, `Hudson <http://hudson-ci.org/>`_
-  The team I’m with at present are working with `Atlassian Bamboo <https://www.atlassian.com/software/bamboo>`_
-  `ThoughtWorks’ Go <http://www.go.cd/>`_ has been made available as open source
-  `Apache Continuum <http://continuum.apache.org/>`_

If you’re after an online service, take a look at `Travis <https://travis-ci.org/recent>`_ - I’ve not used it but it gets good press.

Automating your build
---------------------

Automating your build is extremely useful in terms of successfully establishing your CI environment but, beyond this, it’s a good candidate for the “best practice” list. In a CI environment an (efficient) automated build is extremely important as the build should be possible without manual intervention. Long build times may indicate that the build needs to be broken up into smaller components or that your tests are verging away from unit tests towards integration testing.

Workflows
---------

In a coding approach where you use branching workflows you might have the CI system “watch” only certain branches. Furthermore, it could be useful to consider a `Read Only Master Branch <http://www.yegor256.com/2014/07/21/read-only-master-branch.html>`_ in which individuals/features/ideas/etc have their own branch but a merge to the master branch is tested *before* being accepted.

Component-based development
---------------------------

A CI server can be very useful in projects that have teams working on separate components. For example, Apache Maven-based projects can have their CI server deploy SNAPSHOT artefacts to an artefact server (such as `Sonatype Nexus <http://www.sonatype.com/nexus>`_). This means that other developers with that dependency will have the new component version downloaded the next time they run a build.

Steak knives
------------

As you develop your CI infrastructure you can start exploring a number of toolsets that can further aid the development effort:

-  Software metric tools such as `SonarQube <http://www.sonarqube.org/>`_ can help you hone in on areas of weakness in your code quality (e.g. duplication, dodgy coding practice or a lack of documentation)

   -  These are best run less frequently (nightly) as they can be time consuming

-  Generate your documentation such as your javadoc or Maven site on a nightly basis
-  Create a “clean room” build that freshly downloads all dependencies before building - this really helps catch issues such as 3rd-party libraries that just disappear.
-  Deploy an instance of the built service into a virtual machine for user testing, interface testing (e.g. with `Selenium <http://www.seleniumhq.org/>`_ or integration tests [#f5]_

   -  Also best run less frequently - especially if you’re going to be soaking up a fair bit of system resources.

-  Get `Chuck Norris <https://wiki.jenkins-ci.org/display/JENKINS/ChuckNorris+Plugin>`_ in to make sure people know you’re serious!

Test drive
----------

Most CI systems are quite easy to install and get running - even just on your laptop. I’d suggest that the best first-step is to allocate 3–4 hours to install a CI system (try Jenkins), configure a job for your main codebase, run it and see how it goes. Then, add in Chuck Norris.

.. rubric:: Footnotes 

.. [#f1] This was used as an in-joke - see the `SVN Book <http://svnbook.red-bean.com/en/1.7/svn.ref.svn.c.blame.html>`_ - but, seriously, the CI server is not a torture device that lets everyone insult a team member. 

.. [#f2] In a regular environment I consider the build to be broken when it won’t compile or a unit test fails. Usually a less-frequent build would run other tests (integration, UI etc) but I usually label failures differently (e.g. “broke the deployment”)

.. [#f3] It can be useful to manually trigger the more comprehensive build and test suite once a feature is complete - why wait until tomorrow to see if it’s broken?

.. [#f4] Look at `GitHub <https://help.github.com/articles/about-webhooks>`_ and `BitBucket <https://confluence.atlassian.com/display/BITBUCKET/Manage+Bitbucket+hooks>`_ (Web)hooks for the push-model approach.

.. [#f5] Most of my integration testing experience has been manual or script-based. However, projects such as `Citrus Framework <http://www.citrusframework.org/>`_ look to provide a good basis for easily established integration tests.
