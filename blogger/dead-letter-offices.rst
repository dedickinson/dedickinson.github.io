Dead letter offices
###################
:date: 2015-04-04 13:56
:author: Duncan
:tags: use-cases, agile, documentation
:slug: dead-letter-offices
:status: published

Let’s consider printing a map that shows us how to get to a meeting in the city. Once we get to the city and the meeting starts, what’s the utility of that map in terms of the meeting? It may be useful to get me back to my office but you probably don’t want it in the minutes or hand out a copy to everyone.

Okay, it’s not a great metaphor (you’d have used your phone) but you probably get what I’m saying. We often prepare items to achieve “something” but, once achieved, that artefact has no real utility as it has been replaced - probably by code. In an agile approach we should aim to prepare enough documentation (text and diagrams) to help build shared understanding and for us to competently undertake the work requested. Once that feature/story/use case resides in code, it is the code that has become the living rendition of that understanding. Over time, operational fixes and other updates will see the code move further away from the project’s documentation and those words and diagrams start to look more like zombies than the living reality of the code.

I’ve been approaching this issue by linking wiki documents such as use cases to tickets in our job-tracking system. As we develop we can close off the ticket via a commit comment and the status of the job is reflected against the documentation. This lets us see where and when the documentation and code aligned. Storage is cheap so I don’t actually throw the document away - I just let the project continue its flow and the commit message, ticket and document mark a spot in the stream. If that document->ticket->code link didn’t exist then we’d be tempted to think that the documentation and the system are a perfect match, regardless of the passage of time and decisions.

So I’m not advocating that you just toss out those use cases or story maps but know what they represent. Unless you work in an organisation which really does change management to the extreme, the role of all those diagrams and all that text is to help the project team prepare the code that forms the system. Do as little as is useful and no more.

.. raw:: html

   </p>
