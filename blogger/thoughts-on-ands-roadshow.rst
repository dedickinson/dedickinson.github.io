Thoughts on the ANDS Roadshow
#############################
:date: 2009-10-14 18:27
:author: Anonymous
:slug: thoughts-on-ands-roadshow
:status: published

| On October 29 and 30 I attended the Australian National Data Service (ANDS) Roadshow. The primary topics were:

-  Research data policy and the Australian Code for the Responsible Conduct of Research
-  ANDS software services

| This post is a bit of my thinking about the various topics discussed rather than a didactic report back.

`Identify my Data <http://www.ands.org.au/services/identify-my-data.html>`__
============================================================================

    The ANDS Identify My Data service allows you to persistently identify your data.

| The primary "marketing" around handles is that it provides an identifier that points to the underlying resource. You can move this resource, update the handle and people using the handle will always be able to get to the document (or an explanation as to why it doesn't exist).
| The W3C talks about "Cool URIs" (http://www.w3.org/Provider/Style/URI) and, in essence, a repository manager that tends their URL garden according to the notion of "cool" will be achieving this availability aspect of handles anyway.
| Let's look at a USQ ePrint: http://eprints.usq.edu.au/5259/. This was written by my boss, Peter Sefton and Oliver Lucido, a member of our coding team. The URI is pretty "cool" as it doesn't specify a file name/extension. The domain name may be argued as not very "cool" as the "eprints" aspect may be seen to relate to the ePrints software from Southampton. However the eprints actually refers to the notion of a research document (see http://en.wikipedia.org/wiki/Eprint).
| We don't use handles in USQ ePrints so what would happen if we moved to a new server or even a new software platform? Well, we'd dump out the data and move it over to the new instance. We know what the old URL is and any decent platform should indicate the new URL (or at least identifier). So we'd then write an Apache Rewrite rule or even a small script that maps to the new location.
| If we did have handles we'd just have to add something to our migration script that updated the handle at the same time.
| Thinking from the user end of the process though, say we did have a handle for http://eprints.usq.edu.au/5259/. When Peter created his eprint he'd open the page (either via the eprint URL or a handle) and in the URL box he'd see....
| http://eprints.usq.edu.au/5259/. So what do you think he'd email people, put on his powerpoints or display in his staff profiles? Chances are it's http://eprints.usq.edu.au/5259/.
| So all this basically means is that http://eprints.usq.edu.au/5259/ should be "cool" and always resolve to either the metadata page or a page explaining why it has disappeared. In effect, any good repository manager is already making the decision to keep the URL operating for a good stretch of time. If they also had handles they would have to update those as well.
| So I don't see that handles really change this aspect of data management. I see a more tangible role for it in my later discussion.

`Register my Data <http://www.ands.org.au/services/register-my-data.html>`__
============================================================================

    The ANDS Register My Data service allows you to register collections of research materials.

| The current state of institutional repositories would indicate that people register metadata in their home institution rather than just defer to an entry hosted elsewhere. For example, a USQ researcher and a QUT researcher that write an article together will each submit a copy to their institutional repository. Why? for a variety of reasons - reporting, staff profiles, different policies etc. This was a concern echoed by QUT's Lance DeVine at the ANDS Roadshow.
| Each repository is harvested by various sources (e.g. OAIster and the NLA's ARO service). The big international harvesters don't scrub the data so you'll often see repeated entries. The NLA does look for matches and only displays one entry for the publication. I checked this with Natasha over at the NLA and this matching is done on identifiers, not titles so using a handle in your local repository could provide an aggregator with the ability to match across multiple repositories.
| But who's metadata wins? What if the researchers disagree on some of the metadata?
| This may not seem to be an issue but start to think about 5, 10, 20 years into the future. So a good idea put forward by ANDS is that the research team decides who will manage the data from the outset. This person will register and manage the handle/identifier and take on the role of ensuring that data/metadata are available for a reasonable length of time. This person manages what I'll call the authoritative metadata.
| But what we have seen in institutional repositories will, I suspect, re-occur in data repositories. People will start to put data (or at least metadata) into their own local repositories. This may be due to local policies (we want to have any data you've worked on), local access (2Tb is a large amount to download each time you have a new postgrad student) or even for peace of mind. This creates a concern when this non-authoritative metadata is harvested by ANDS - it creates duplication that can start to affect the usefulness of search results.
| The easiest option is to only put authoritative metadata into any dataset repository being offered up to the ANDS harvester. This means that you're not supplying potentially redundant information but also means you may need to run more that one repository.
| Another option is to have 2 OAI-PMH sets - one for authoritative metadata and the other for "local" metadata. I think maybe the term canonical comes to play here.
| A further option is to look at the data/metadata in a FRBR fashion. The notion of the dataset is a Work and all local instances are an Expression/Manifestation/Item - whichever makes sense. The Work could be denoted by a persistent identifier (e.g. a handle) that is referred to by each local instance. This would mean a change to RIF-CS so an easier model could be the one described to me by StJohn Kettle, as described in the next section.

Handles as Works
----------------

| If we create a handle we can do more than just create a simple link-through. A handle would effectively be the identifier for that Work (ala FRBR).
| Let's say QUT and USQ start a collaborative research effort. We agree that QUT will manage the data and create a handle to point to their dataset's metadata. They take on responsibility to look after the metadata and the handle. USQ, however, might have a policy that they hold a local copy in their own data repository.
| So, we might end up with ANDS harvesting the same data from QUT and USQ. However, with a "tweak" their harvester could say "for every handle I get I am going to determine the primary link and only index that".
| The main problem is that the Handle points to the metadata location and not the OAI-PMH record for the metadata. However OAI-PMH identifiers can be any URI so, potentially, the identifier could be the handle URI. I need to think more on this one.
| What we also get is a distributed data access system - if the handle system can't find the primary record it will indicate other possible locations.

Classify my data
================

| Briefly, ANDS is working on a system to provide "end points" to useful thesauri such as the ANZSRC. This means that we can eliminate the problems faced by the NLA ARO system of inconsistent resource type and subject naming. This may also provide a platform for institutional repositories to normalise their labels.
| I don't want to go into it here as it's all a work in progress and I don't want to send you down the wrong path. However, I will say that this work will be useful to watch with regards to repository software as the service and vocabs will provide a handy central reference. I'll also say that my enquiries about the service were quickly and comprehensively answered by ANDS team members.

.. raw:: html

   </p>
