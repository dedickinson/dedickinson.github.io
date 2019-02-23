Fascinator 0.3.0 and 2009 in review
###################################
:date: 2009-11-20 09:24
:author: Anonymous
:slug: fascinator-030-and-2009-in-review
:status: published

| Well, Linda has just released `Version 0.3.0 of The Fascinator <http://fascinator.usq.edu.au/trac/wiki/tf2/Version0.3.0>`__\ and I thought I'd take the opportunity to sit back and reflect on our work in 2009.
| So, to keep it short, here's my Top 5 "big things" from our Fascinator work this year:
| **1. Complete Fascinator redesign**
| We took a look at The Fascinator as it had been built for the ARROW project and started to reconceptualise it as a desktop system. Our work has lead us to take on a plugin notion throughout the system and this gives us the flexibility of plugging in different harvesters, storage layers and transformers.
| Maybe calling it a desktop eResearch system is a misnomer. We are certainly working to ensure that it runs on the desktop in a friendly manner but it should also scale so that it can be the faculty eResearch system, the institutional eResearch system and so on. eResearch - isn't it all about data and collaboration?
| **2. Advancing our Agile approach
  **\ The team (esp. Linda) has been working to fulfill more of the Agile approach. We're getting a lot better at scoping specific releases and actually releasing them. We're also finding a good balance in our documentation and knowledge sharing, with the idea that all the developers can work across the system.
| The hope now is to draw a line at some point near Easter and get The Fascinator 2.0 out there.
| **
  3. Embracing Maven**
| Oliver had utilised Maven in the original Fascinator and we continued this work. It's quite a learning curve but investment in time has meant that we can easily get instances of TF up and running and (hopefully) be more open to external developers wanting to take a crack at the code. Complementing this is our Nexus repository which allows us to manage dependencies without chunks of doco and frustration.
| This aspect is still developing and we hope to have a Continuous Integration service (Hudson) up and running in the new year. This will allow us to release daily snapshots, keep a live Maven site constantly updated and allow for Darth Tater to be quickly relocated to anyone that breaks the build.
| **4. Working with RDF**
| This proved a steep learning curve. We picked up RDF2Go and RDFReactor on the back of implementing the Aperture system. As we started to develop new harvesters and indexing rules we found the need to read/write RDF. I even got in and developed an RDF Reactor plugin for Eclipse with the hope of easing the development of my long overdue feed reader plugin.
| The area of RDF development still has a long way to go before it matches the abstraction provided to RDBMS developers.
| We're also getting a grip on SPARQL and may even have a triple store running at the back of TF sometime in 2010.
| **5. Presenting Fascinator**
| Well, this was big for me - I presented at eResearch Australasia 2009 and had a room full of people.
| I'm off to the UK for the DCC and IEEE eScience conferences in the first half of December. I'm looking forward to meeting a raft of new people and (hopefully) showing off our work over a pint.
| Importantly, it's not just me or Peter working on this stuff - Bron, Linda, Oliver, Ron and Cynthia have been developing, designing, planning and dealing with our flights of fancy (including harried IMs from conferences). Thanks guys!
