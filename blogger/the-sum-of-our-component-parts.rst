The sum of our component parts
##############################
:date: 2015-10-01 17:57
:author: Duncan
:tags: gradle, security
:slug: the-sum-of-our-component-parts
:status: published

| I’ve recently been reading a book that’s been on my to-do stack for a little while: `The Machine That Changed the World: The Story of Lean Production <http://www.amazon.com/Machine-That-Changed-World-Revolutionizing/dp/0743299795>`__. It’s an extremely interesting look at the Toyota approach to manufacturing and often referenced by those describing *lean software development* and *DevOps*. One area that really attached itself in my mind was the fact that the act of assembling a vehicle represents 15–20% of the overall effort of constructing a vehicle. There’s a real parallel in how we build software as the business solution component of the codebase is likely to represent a similar ratio to the underlying libraries we depend on to perform a range of tasks and save us time. The model used by Toyota to source and work with component manufacturers was quite interesting and there are handy parallels to software development.
| It’s funny how things converge and `Episode 63 of the DevOps Cafe Podcast <http://devopscafe.org/show/2015/9/2/devops-cafe-episode-63-josh-corman.html>`__ featured Josh Corman discussing efforts such as *Rugged Software* and *I am the Cavalry*. With Mary and Tom Poppendieck featuring in `Episode 63 <http://devopscafe.org/show/2015/8/16/devops-cafe-episode-62-mary-and-tom-poppendieck.html>`__ there seemed to be a good confluence of thoughts going on (for me, anyway) and I started to think more about the task of reducing waste at the time of component selection.
| I would normally undertake investigation of the first-level dependencies but these checks are usually around the activity within the component’s project, frequency of release, status of a CI system and so on. The recent book and podcast inputs started me thinking about tooling that not only helped me discover any issues with dependencies but also across the set of transitive dependencies. Furthermore, such tooling would let me establish an ongoing report that could track components in use against newly determined security issues and bugs as well as determine if there’s an opportunity to rationalise versions or even libraries (I’m looking at you logging frameworks). In a perfect scenario, an issue with a component in production could trigger an alert for developers to review and act upon.

The problem
-----------

| The problem statement I got to was:

::

    Can I use Gradle to report on dependency licenses and known issues?

| 
| I picked Gradle as it’s my go-to build tool and I wanted to focus on existing approaches. I added in the licence aspect because, whilst it’s not a *software* issue, there’s a chance that one of the dependencies could “infect” the desired software distribution approach and knowing this before release is a handy thing. I’d situate the problem within the *Defects* category of the `seven wastes <https://en.wikipedia.org/wiki/Muda_%5C(Japanese_term%5C)#Seven_wastes>`__ and removing waste is a key improvement (*kaizen*) activity - I want to avoid the defect early on but also detect if a component is discovered to be defective at a later time.
| Within the problem statement are four key sub-questions for attention:

::

    Q1. What is the mix of licences in the dependencies?

    Q2. Does this licence mix impede the desired outcome?

    Q3. Are any of the library dependencies known to have security issues and/or other defects?

    Q4. Are there known issues (security, bugs etc) with the platform we're running on and the packages we need?

| 
| On the licensing side (Q1, Q2) we need two things: a list of the licenses for all of our software dependencies, and knowledge as to which licences we are prepared to accept. From these we could prepare a ruleset that automatically alerts developers when a dependency with an unacceptable licence is included. This would be part of the build and continuous integration reporting and notification configuration.
| As Gradle can use Maven dependencies and I’d been involved in preparing packages for `Maven Central <http://search.maven.org/>`__ I knew that the artifacts found there should have licence information within their `POM file <https://maven.apache.org/guides/introduction/introduction-to-the-pom.html>`__. Q1 should be reasonably achievable and I decided to put Q2 on the backburner.
| On the library vulnerabilities side (Q3) we need:

::

    Q3.1. A list of all dependencies and transitive dependencies

    Q3.2. A database of known vulnerabilities

    Q3.3. The ability to determine any intersections with the lists from Item 1 and 2

    Q3.4. An established process to assess and respond to potential security issues

::

| Gradle’s ``dependencies`` task will display a text overview of the dependencies for a build, indicating the data for Q3.1 was possible but I was a bit dubious about existing data for Q3.2 - impacting onto Q3.3. I’ll leave Q3.4 aside for now.
| I put Q4 on the backburner as I decided that it reached into other aspects of deployment such as packaging models (e.g. RPM) and provisioning (e.g. Puppet). Issues around these would also be analysed early but using tools outside of Gradle.
| So, back to Q3.2 and the `OWASP Top 10 for 2013 <https://www.owasp.org/index.php/Top10#OWASP_Top_10_for_2013>`__ featured: `A9 Using Components with Known Vulnerabilities <https://www.owasp.org/index.php/Top_10_2013-A9-Using_Components_with_Known_Vulnerabilities>`__ and tagged against it is the `OWASP Dependency Check project <https://www.owasp.org/index.php/OWASP_Dependency_Check>`__. The dependency check tool uses the `National Vulnerability Database <https://nvd.nist.gov/>`__ to source a list of known/reported issues. Things were a bit more optimistic for Q3.3.
| Next step is to check if I can get a Gradle plugin to help with Q1 and Q3 and I came up with:

-  `dependency.check <https://plugins.gradle.org/plugin/dependency.check>`__ which uses the OWASP tool
-  `com.github.hierynomus.license <https://plugins.gradle.org/plugin/com.github.hierynomus.license>`__

   -  there’s also `com.github.jk1.dependency-license-report <https://plugins.gradle.org/plugin/com.github.jk1.dependency-license-report>`__

The prototype
-------------

| It looked like I could try a small prototype. As part of the very basic demonstrator I declare one dependency, `Apache Tika <https://tika.apache.org/>`__, in a `Gradle <http://www.gradle.org/>`__ build file. I picked Tika as I know it has a non-trivial set of dependencies.
| Aside from Gradle’s Java plugin I also use the ```project-report`` <https://docs.gradle.org/current/userguide/project_reports_plugin.html>`__ plugin as it generates a nice dependency report.
| The whole build file looks as follows:

::

    plugins {
        id 'java'
        id 'project-report'
        id "com.github.hierynomus.license" version "0.11.0"
        id "dependency.check" version "0.0.6"
    }

    repositories {
        jcenter()
    }

    dependencies {
        compile 'org.apache.tika:tika-parsers:1.10'
    }

    downloadLicenses {
        includeProjectDependencies = true
        dependencyConfiguration = 'compile'
    }

| To generate the license report:

::

    ./gradlew downloadLicenses

| To generate the project reports:

::

    ./gradlew htmlDependencyReport

| To view the dependencies:

::

    ./gradlew dependencies

| To create a dependency check report (this takes a while):

::

    ./gradlew --info dependencyCheck

| I also setup a second Gradle build file (``details.gradle``) as a small attempt at extracting some details from Gradle:

::

    ./gradlew -b details.gradle listRepositoryUrls
    ./gradlew -b details.gradle listConfigurations
    ./gradlew -b details.gradle listAllDependencies

| 
| The demo code is available `in my GitHub account <https://bitbucket.org/duncan_dickinson/workbench/src/HEAD/dependency-audit/?at=master>`__

Conclusion
----------

| The license plugin produced two reports: dependency-license and license-dependency in both HTML and XML. It all looked pretty good in terms of solving Q1 and the XML could feed into a small analysis script to raise any concerns (Q2).
| The dependency.check reports were interesting and I’d encourage you to generate them for yourself and analyse them with the `associated guidance <http://jeremylong.github.io/DependencyCheck/general/thereport.html>`__. It’s not perfect but it’s a start so I think Q3 is solvable to a limited extent.
| What becomes quite clear is that the licence aspect is reasonably easy provided you can locate the licence and this is somewhat of a one-off. The dependency check is more complex as the reporting of these issues and the associated matching of the issue to the component version is not an ingrained process for many projects. You’re likely to need a range of inquiries to help in analysis:

-  Review of the project vitality and its issue tracker
-  Tracking new releases and changelogs

   -  An automated report should be able to tell you if you’re out-of-date

-  In-house security testing (where feasible)
-  Monitoring mailing lists

   -  I consider 100% coverage on this almost impossible - maybe just track key dependencies

| I’m still intrigued and have started a `project in GitHub <https://github.com/dedickinson/dependency-reporter>`__ to look at an analysis tool. I’ll have to see where I can steal a bit of time…

Further reading
---------------

-  `Toyota Production System <http://www.toyota.com.au/toyota/company/operations/toyota-production-system>`__
-  `The Unfortunate Reality of Insecure Libraries <http://www.aspectsecurity.com/research-presentations/the-unfortunate-reality-of-insecure-libraries>`__
-  `Sonatype’s Application Health Check <http://www.sonatype.com/assessments/application-health-check>`__
-  `The Software Package Data Exchange <http://spdx.org/about-spdx/what-is-spdx>`__
-  `Cyber Supply Chain Management and Transparency Act of 2014 <https://www.congress.gov/bill/113th-congress/house-bill/5793>`__ - US Legislation

.. raw:: html

   </p>
