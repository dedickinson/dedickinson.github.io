The Fascinator @ eResearch Australasia
######################################
:date: 2009-11-11 07:11
:author: Anonymous
:tags: eresearch, fascinator
:slug: fascinator-eresearch-australasia
:status: published

| Well, I gave my first substantial conference presentation today and, although I felt really nervous, I'm told it didn't show. The presentation ran for 15 minutes with 5 on top for questions.
| I was asked 2 questions - one by Andrew Treloar on the design and another by Jim Richardson about tagging. Andrew asked about the code model and I thought I'd add some extra clarification: the whole system is a plugin model so already runs as components. What it lacks, however, is an asynchronous, parallel form of communication. So, when you harvest a file, the system will transform and index in serial and then look at the next file. What we're wanting to do is move towards a message queue system (e.g. Rabbit MQ or Apache's MQ) that allows the system to break up and spread things like transformation. This is very useful when you hit a 1Gig video that you want to transform to flv. Time, however, is always challenging us...
| Jim's question was handy as I had forgotten to show off the tagging system. We're using the CommonTag schema (http://commontag.org/) so can point to endpoints. We're currently creating a user endpoint using their email as the URI but hope to have you linking to ontologies and places like dbPedia soon(ish).
| On the tagging front, I'd like to see us build an ontology/taxonomy/thesearus builder. This may be based on SKOS and will allow the user to create their own thesaurus. For example, in our current work, Leonie could create a list of participants for use in tags. Peter's also interested in hierarchical tagging (e.g. people/duncan) that doesn't require you to define anything formally. With this data we could create at least a basic SKOS for the user at publication time.
| At some point in the near future (once it's been cleared) you'll be able to check out the slides via USQ ePrints: http://eprints.usq.edu.au/6090.
