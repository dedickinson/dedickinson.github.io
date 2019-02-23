The treachery of diagrams
#########################
:date: 2015-03-24 07:25
:author: Duncan
:tags: analysis, use-case, agile
:slug: the-treachery-of-diagrams
:status: published

“A picture tells a thousand words” is often chanted by people that don’t want to write 5 words, let alone 1,000. So they draw a diagram and this can be a trap. Don’t get me wrong, I draw lots of diagrams over the course of a project — use cases, flow charts, concept maps, formal notation stuff. What matters most isn’t the diagram or the text — it’s ensuring that the right people share the understanding. We’ve all see huge requirements documents that we know no-one has read or, when development starts, will read.

Whilst I could write up a list of document traps such as the user-dozer\ `[1] <#fn:1>`__ or the arbitrary weight/length/template metric I want to look at approaches to diagrams that are used to either flummox non-technical people or to prepare less than the bare minimum documentation needed to deliver a competent output.

For each of the three traps I’ll highlight a praxis point that can help you skirt the trap.

The useless case diagram
------------------------

A piece of art can convey and draw upon deep concepts such as culture and memory that engage us as a viewer. Technical diagrams are not primarily pieces of art and should exist only to provide a succinct analysis of a design element. The Unified Modelling Language took in Ivar Jacobson’s stick figure and ellipse notation and tool-providers added these to their stencils and many, many people started thinking that these were the entirety of use cases. I stand in the gallery and look at the stick figure labelled “User” pointing at an elipse labelled “Withdraw cash” and it takes me back to having being in Italy on the Feast of the Assumption and having the ATM eat my card. Actually, it just looks meaningless - like I’m not being told how much work lies beneath.

In and of themselves the ellipse diagram is only part of the story and they should be accompanied by a body of text that helps describe aspects of the use case such as main success scenario and possible exceptions. Other diagrams suffer from the same curse - they don’t tell enough of the story.

Praxis: Diagrams and text are outcomes of conversations and are renditions of an understanding, not the understanding itself. Make sure that the diagram and text mean enough to stir agreement and action.

The intimidation notation
-------------------------

I enjoy animated series such as The Simpsons and Family Guy. The use of animation lets them deliver extreme situations that a live action TV series probably could not attempt. However, when Simpsons came out many people seemed to think it was for kids as it’s a cartoon - they maybe hadn’t seen any Anime. In a similar act of misplaced alignment, certain technical diagrams are often rolled out in front of stakeholders - they’re pictures, how hard can it be?

I have seen large, complex diagrams prepared in Business Process Model and Notation (BPMN) put in front of end users as part of seeking “sign off” prior to development (this project was far from agile to begin with and this just took it further away). I have no issue with the BPMN but it’s really a technical syntax that, for the untrained eye, is likely to be no different to showing them assembly code.

By using these documents on stakeholders we’re creating a situation where they may not feel confident enough to say they don’t understand what they’re looking at (very few people like to feel stupid, especially in a group). Actually, if one stakeholder stands up and says “I have no idea what that is and have no ability to give you any further feedback” then you’d probably know who was the stupid person in the room (hint: it’s not the one that stood up). We are working in their domain and we should be either training them up in the technique or tailoring the presentation to meet their model of the world. Did the BPMN actually say more than a text-based table or even a basic flow-chart format or did you use BPMN as that’s what you need to put in the workflow engine?

Praxis: When used for gathering and checking information about user goals, speak in a language that the user understands - diagrams can be just as technical as text and code.

The wall of confound
--------------------

Working in the 1990’s you’re likely to have walked into an office area and, instead of seeing project backlogs and story cards over the wall you would have seen a huge map of a relational database. Perhaps these were useful when computer screen were smaller. To me, however, they really yelled “This thing is big, really big, beware all who enter and any that seek modifications” and “We printed this so now it’s forever”. Most people in the office are also suffering from ozone poisoning.

Once your diagrams get so big and complex that you need to hire a sherpa as you walk through it, you need a rethink about how to present it (maybe also rethink your architecture). Approaches such as the `C4 Model <https://structurizr.com/c4>`__ are a good example of an almost Google Earth approach in which we can look from a high level and zoom down into our suburb by selecting layers relevant to the resolution we need. Even better, approaches such as C4 don’t demand that everything be perfectly diagrammed and we might only draw lower-level diagrams for complex components that are currently under analysis.

Praxis: Diagrams and text that are too large and complex just don’t help the discussion. Choose methods for zooming-in to reasonable scale whilst tuning out parts of the system not important to the discussion.

That is not my dog
------------------

Sorry, that’s just a reference to one of my favourite comedy sketches. Actually I wanted to close this post by pretending I know about art. René Magritte’s `“The Treachery of Images” <http://en.wikipedia.org/wiki/The_Treachery_of_Images>`__ is a favourite of mine as it beautifully reminds us that the image (of a pipe) is not the actual item (a real pipe):

|René Magrittes The Treachery of Images - This is not a pipe|

When we draw diagrams and write text we must remember that it is the running system that is the pipe.

Reading
-------

Some useful texts worth your time:

-  A. Cockburn, Writing Effective Use Cases, 1 edition. Boston: Addison-Wesley Professional, 2000.
-  Ivar Jacobson, Ian Spence, and Kurt Bittner, USE-CASE 2.0 The Definitive Guide. Ivar Jacobson International SA, 2011.

.. raw:: html

   <div class="footnotes">

--------------

#. 

   .. raw:: html

      <div id="fn:1">

   .. raw:: html

      </div>

   These are long and/or technical documents aimed at getting the user to agree just so you go away. They flatten the user’s interest completely. ` ↩ <#fnref:1>`__

.. raw:: html

   </div>

.. raw:: html

   </p>

.. |René Magrittes The Treachery of Images - This is not a pipe| image:: http://upload.wikimedia.org/wikipedia/en/thumb/b/b9/MagrittePipe.jpg/300px-MagrittePipe.jpg

