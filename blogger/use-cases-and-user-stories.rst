Use cases and user stories
##########################
:date: 2015-03-30 18:24
:author: Duncan
:tags: use-case, agile, user-stories
:slug: use-cases-and-user-stories
:status: published

It often seems that the biggest challenge in a software project is determining what the user wants and how that translates into a functional system. Within agile approaches we seek to partner with the users and take the journey with them rather than interrogate them before we code and release to users only when the system is fully operational. A range of tools and processes have been developed over the decades to help understand what the user wants and, in this post I want to look at two such approaches: user stories and use cases. I’ll start with an overview of each and then discuss the possibility of using them together.

User stories
============

Stories are based in the XP approach and are simple 1–2 sentence work item statements. Something like “List all currently active users”. Sometimes they use a template such as “As a <role> I want to <reach some goal> so that I can <get some benefit>”. The mistake often made is to believe that is it (done! complete!) we know what they want so LET’S CODE!. Actually, stories are a placeholder for a conversation between people. These people need to discuss the story to such a level that it can be turned into code and tests. In some teams you may see this as a straight-to-test/code approach in which the conversation between the developers and the expert user is turned into code immediately and little documentation is done (aside from a bit of whiteboarding). Other teams expect that the users/analysts are busy describing the story away from the development team and, when development on the story is about to start, these descriptions appear and can be acted upon. How these descriptions actually appear is sometimes not really clear. The goal is really to get the user’s needs into code with as few (if any) intermediary steps.

If you really just use one-liner user stories as backlog items then you’re probably facing problems around not knowing the full story and making assumptions. This is especially the case if you don’t have an expert user available to the development team as a full-time knowledgebase. It’d be worth your time checking out `this guide by Mike Cohn <http://www.mountaingoatsoftware.com/agile/user-stories>`__

Use-cases
=========

Use cases predate the Agile movement (BM - before manifesto). Ivar Jacobson is credited as the father of the use case but he is by no means the only person that worked on how use cases are prepared. I like Alistair Cockburn’s “Writing Effective Use Cases” as it’s a very readable book with solid examples and presents a number of approaches to writing use cases. Use cases seek to capture behavioural requirements for a system - essentially a description of how stakeholders and a system will interact (at the conceptual-, not interface-level). Some authors use text-centric approaches, others use diagram-centric approaches but, at a conceptual level, use cases can be thought of as a user goal combined with the set of “things” worth knowing about the interaction. In particular, we need to know who is involved (the primary actor), what the success scenario looks like and any exceptions that may occur to this scenario (good and bad). A use case may be described broadly in the early days of the project and the details expanded just in time.

Unfortunately, some people have boiled use cases down to that stick figure and ellipse diagram. Much like user stories being boiled down to 1–2 sentences and no conversations, it is an anaemia created by misuse or misunderstanding and not the fault of the approach itself. You’ll also hear arguments that use cases “are not agile” - an odd term often used by charlatans. They argue that use cases gather lots of requirements up front and take us back to “waterfall” approaches. But that’s an argument against writing complete use cases up front and not against writing use cases.

Will it blend?
==============

A brief search of the internet regarding the combination of use cases and user stories will yield articles such as:

-  `User Stories and Use Cases - Don’t Use Both! <http://www.batimes.com/articles/user-stories-and-use-cases-dont-use-both.html>`__
-  `Developing Effective Agile Requirements Relies on Both User Stories and Use Cases <http://www.esi-intl.com/~/media/Files/Public-Site/US/POVs/ESIViewpoint_Developing-Effective-Agile-Requirements>`__

This is confusing. I understand that you shouldn’t mix bleach and ammonia as it’ll really start to cause physical pain. But why can’t we mix two methods? Do we create a singularity? No. What we should do as effective practitioners is read a variety of opinions, evaluate them and, if the positives are stacking up, we should try them out. Perhaps we’ll do this in a small project or just for a couple of sprints. Once we’ve had a run with it we’ll use our retrospective time to evaluate how it went, maybe add our observations and recommendations in our learning log and decide if it’s worth pursuing. This is us being empirical.

What we must always remember is that these structures/methods/prcesses aren’t a universal law. Even the Agile manifesto really boils down to some guys meeting up and negotiating a shared set of values. Granted, these are experienced software guys and the outcome distilled critical learning from their careers so it’s worth considering their ideas. Alistair Cockburn’s `Oath of non-allegiance <http://alistair.cockburn.us/Oath+of+Non-Allegiance>`__ reminds us that we should consider options from a variety of sources and the manifesto’s priority of “Individuals and interaction” really guides us to respond to the people around us rather than just plough on ahead with a methodology or tool that isn’t optimal. You should be able to adapt to your surroundings and empirical evidence is your shield.

Mix it up
=========

In Education circles, Constructivist theory provides a notion called the “zone of proximal development” (ZPD). Described by social constructivists (those that view development as influenced by those around us rather than just internal), the ZPD indicates what a learner can do with the aid of an instructor but not by themselves. When guiding a learner we establish scaffolds to guide them through new learning. This sort of thing should happen in effective teams and organisations - senior people help more junior colleagues in advancing by mentoring them at key points in their development (in a wise organisation we can sometimes see the junior bring new ideas and questions that prompt those more senior to learn). A new team member may not know much about testing so we could send them on a course, have them pair with an experienced tester, set them small challenges and review their solutions to help guide them to more effective ones. By just throwing new work at the team member with no attention to their skills, the gap to the ZPD may be too great and they will quickly become demotivated.

So what’s this got to do with my discussion about user stories and use cases? I’m glad you asked! Say your team is using user stories but you keep finding that the user feedback is that the system isn’t really meeting their expectation of a certain business process. Alternatively, consider that you have noticed that the team isn’t handling exception conditions very well. On reflection you may determine that some more structure is needed when discussing a story. Perhaps the team or the client isn’t delving into the story enough or perhaps key additional stories aren’t surfacing.

This presents a learning opportunity. By bringing in more formal tools you can help scaffold the thinking process around user stories so that the correct information is being collected and responded to. You may choose to bring in use case templates to this end. As with all scaffolding, once the building is done you can reduce its resolution and, eventually, remove it. The hope is that team members and users have absorbed the learning and now perform the action as a matter of course. At certain times, such as complex stories, they can put up a bit of scaffolding again to help them through the problem.

In cases where the client/users are looking at 300 user stories and are struggling to work out how they interact you might look at the use case concept of goals as a method of drawing out the top-level value items. You may even flip the whole thing and start with the coarse use cases that generate stories. These help guide everyone in learning where things provide value and we often change tack in the ZPD if the learner doesn’t appear to be picking up what they need - we don’t just keep pointing at the same thing and start talking louder in the hope they work it out.

People may argue that 1 use case = many user stories and that a use case may be too big for one sprint. There may be a debate about a fear of increasing levels of documentation. Have these debates. These are reasonable debates (when informed and not dogmatic) and the debate is good but outcomes are better. What matters here is that you are using the tools that best help you to communicate with stakeholders and to deliver working software you can be proud of.

Further reading
===============

-  `The Art of Agile Development <http://shop.oreilly.com/product/9780596527679.do>`__ by James Shore and Shane Warden
-  `Managing Software Requirements: A Use Case Approach (2nd edition) <http://www.amazon.com/Managing-Software-Requirements-Approach-Edition/dp/032112247X>`__ by Dean Leffingwell and Don Widrig
-  `Writing Effective Use Cases <http://www.amazon.com/Writing-Effective-Cases-Alistair-Cockburn/dp/0201702258>`__ by Alistair Cockburn

   -  as well as `Why I still use use cases <http://alistair.cockburn.us/Why+I+still+use+use+cases>`__

-  `User Stories Applied <http://www.amazon.com/User-Stories-Applied-Software-Development/dp/0321205685>`__ by Mike Cohn

   -  He also discusses User Stories and Use Cases in `Advantages of User Stories for Requirements <http://www.mountaingoatsoftware.com/articles/advantages-of-user-stories-for-requirements>`__

-  I don’t discuss it here due to the size of this post but also check out `The new user story backlog is a map <http://www.agileproductdesign.com/blog/the_new_backlog.html>`__ and the work being done around user story mapping.

.. raw:: html

   </p>
