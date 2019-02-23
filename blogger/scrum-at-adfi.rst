Scrum at ADFI
#############
:date: 2011-04-01 18:35
:author: Anonymous
:slug: scrum-at-adfi
:status: published

| For quite a while I've been meaning to post an overview of my work to implement Scrum in the development team in which I work at the University of Southern Queensland. This has taken shape over many months and, as with any real process, it is always being reviewed and developed to meet team needs. If you aren't really acquainted with Scrum I would encourage you to visit http://www.scrum.org/ and check out their Scrum guide.

Why Scrum?
----------

| For quite some time the ADFI software development team had asserted that it was Agile in its approach. However, this was a very loose notion and the need for improved structure was recognised when we considered our problems in areas such as project scope and code stability and releases.
| The type of software development I'm interested in is design-based. No, not design as in design processes like UML, but in the creation of new solutions that improves a targetted context. We often work in new areas such as research data management systems and the main thing I have noticed when you create these new systems is that you embark on a journey that doesn't easily lend itself to easily defined time-frames and user requirements. This is where waterfall methods really fall over.
| I like Scrum as it provides an open and honest approach to project management. It doesn't tell you how to code, instead it focuses on what a project is delivering and how it communicates. I won't go into the various comparisons I undertook across approaches such as XP but I can say that a fair bit of time was spent looking for a best-fit method.

What does it look like?
-----------------------

| To begin with, the introduction of any new methodology is an exercise in culture change.If the change is to be sustained it's important that those in the team are willing to try the new approach, see its value and start to internalise the process. This last bit is the hardest part.
| I started gently by reorganising our meeting schedule. Our developers had been drawn into a long weekly meeting that was largely administrative and, when they demonstrated new development work, the conversation was dragged into organisational issues such as possible project sponsors and committee procedures. This was incurring a large cost in terms of resources. I am a strong believer that developers are most effective when given time to focus and, more broadly, people are more useful in meetings that relate to their work. So Step 1 was to break the meeting into two different meetings - an admin one (usually with no developers) and an iteration meeting for demoing the work being done and planning the next iteration.
| I then brought in the daily scrum so as to track our work on a daily basis and I can be made aware of any issues slowing us down. We don't have fines for being late - that's not helpful and can be a real demotivater. In my teaching career I really had problems with teachers that gave out lollies to motivate students and yelled at students for infractions. If people see a value in something (or are at the very least neutral to it) their intrinsic motivation should guide them to attending. In a negative scenario it's important to individually discuss the issue with the team member and try to work out what's going on before you wave the "fine tin" at them.
| So we now had fortnightly iteration (sprint) demos, sprint reflections and sprint planning and daily scrums.
| As a team we'd been using the Trac system for quite a while. Tickets that had been opened in an iteration but not finished just carried over into the next iteration and, very quickly, the list of tickets was soul destroying. To tame this beast we went through (groomed) our tickets and chucked out stuff that had been done, broke up the "needs" vs "dreams", and ensured that the remaining tickets had appropriate metadata. I then added custom fields so different projects could grab tickets and allocate them to their sprints.
| We then started to call tickets User Stories as they're really meant to track feature requests and be written so users could look at the list of things being done and understand them. However, we found that some stories were really developer stories and created another Story class to cover things that needed to be done that the user is unlikely to ever request.
| The result of this Trac work can be seen in pages like https://fascinator.usq.edu.au/trac/wiki/Projects/ReDBox- we have a vision statement for the project, key info and document links on the project page. Under the `development planning <https://fascinator.usq.edu.au/trac/wiki/Projects/ReDBox/DevelopmentPlanning>`__ link you can see the current sprint burndown and agreed that a defect burndown would be really handy in seeing the defects that need to be fixed and when we plan to get to them. From the development planning page you can access the product backlog and the various sprints. Picking a `recent sprint <https://fascinator.usq.edu.au/trac/wiki/Projects/ReDBox/Sprints/ReDBox_2011-04-12>`__ I can see the burndown list, a sprint goal and the full sprint backlog (this helps with the sprint demo). We also have room for Sprint notes but, honestly, we're getting better at commenting the stories so a lot of the information goes there or is expanded upon in a wiki page.

Issues
------

| One of the first things people shout out (they really do) when you describe the Scrum method is "so you want us to change how we do things just for your team?". It's one of the many ways you can see how dogmatic people can be about project management. Many of us have seen organisations cling to project management frameworks that fail time after time but are kept in place as they provide for "accountability".
| Realistically I find that Scrum makes us even more accountable than in many other methods. On a daily basis the team looks each other in the eye and lists the work they're doing. In every sprint meeting we demonstrate our efforts to the product owner and our peers. We then reflect on how well we're going. Surely this is far more accountable than feeding project reports into monthly project steering meetings in which only the only attending team member is the project manager.
| The point about meeting the needs and structures of others is still important though. This is another area where I believe Scrum is strong. I believe that Scrum can dovetail into a variety of project environments and, whilst not being "pure" Scrum, it still provides tangible benefits. In a current project we don't really have a perfect Scrum environment (a remote stakeholder and a project environment that isn't structured in that direct product owner <-> team interaction). This is where we adapt. We still have daily scrums, sprint planning, review and reflection but the team is suggesting priorities to the product owner rather than the product owner grooming and setting the user stories. The project group, however, is a trusting one and these suggestions are well placed and accepted before the sprint begins.
| I also think our demos are still overly technical and we need to be more user-centric in our presentations but we're getting there. Our releases are also not as often as they maybe could be but over time this process can be refined. This sort of ongoing development really highlights to me how much more effective stable teams can become rather than teams that are constantly dissolved at project completion (unless you have an organisation-wide agile model). As always, you're making a big investment in your team and it's probably got the best pay-off when viewed as a long term investment.
| As for Trac, it isn't a great multi-project environment but it's the one we had and, given more scope, I would start to explore better options.

Where to now?
-------------

As Scrum settles in I would like to start looking at drawing on my teaching background and examine how a variety of thinking skills can help development teams but that's for another day.

.. raw:: html

   </p>
