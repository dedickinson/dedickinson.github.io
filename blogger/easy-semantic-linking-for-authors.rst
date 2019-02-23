Easy semantic linking for authors
#################################
:date: 2009-04-16 08:13
:author: Anonymous
:slug: easy-semantic-linking-for-authors
:status: published

| I've been playing with RDF a bit lately to see what I can make of it in terms of practical applications. The first hurdle is the rather long specs. Now, I won't pretend I'm someone that can pick up a spec and read it cover to cover. I like to play with some code as I read so that I can sort it in my head. So, as part of my reading I put together `semanto <http://duncan.dickinson.name/semanto/index.php>`__ - it's wrong in a couple of ways and generally basic but it's my live learning.
| This got me thinking about people that don't want to read the W3 specs and hunt for schema that suits their needs. Peter Sefton `discussed <http://ptsefton.com/2009/04/08/journal-20-embedding-semantics-in-documents.htm>`__ a method for authors to embed a triple into a document's link. Once the article is completed, the publisher can pass the document to a system that will turn these links into RDF/RDFa and output a webpage.
| As he's my boss, I tend to agree with Peter. Actually, no, I tend to agree with the idea as it provides part of an "easy in" for authors.
| Having played with the various RDF stuff out there, I can see that an essential part of the "easy in" is to remove the chase for RDF schemas. Bascially, I want to author something and then have an easy to use UI for classifying the information. If that system can provide me standard predicates for my items then I don't really need to think too much about semantics.
| To base my thoughts on this workflow:

#. Do research
#. Write article
#. Indicate document predicates/objects
#. (Maybe) Determine other predicates/objects
#. Publish

| Steps 1 & 2 are really in your court (though you may want to keep an eye on `The Fascinator <http://fascinator.usq.edu.au/>`__).
| I pick up Peter's idea in step 3. You can go through your document and add links to useful information. For example, you can assert that "Jim Smith" is a dc:creator and the dc:title is "My Weekend" etc. In Peter's model, these all appear as hyperlinks. You could even highlight the abstract and create a dc:description link. It'd be ugly and (from my experience unwieldy) but it is possible and it is cross app. You could even do some fancy grouping \*.
| What Step 3 needs is a predefined set of terms for you to plug into. For example, we would cherry pick the various schema elements and provide those best suited to the work being produced. You could base this in an eprints-style workflow:

--------------

| 

.. raw:: html

   <form>

| 
| What sort of publication are you describing?
| ArticleBook

.. raw:: html

   </form>

| 

--------------

| 
| ... then we present the usual

--------------

| 

.. raw:: html

   <form>

| 
| The following properties are available for an article:

Title

| 

Creator

| 

Abstract

| 

.. raw:: html

   </form>

| 

--------------

| 
| From that session we could produce an RDF document for the article using Dublin Core and the Bibliographic Ontology. The user will get a generated RDF file that has all the info and no need for them to work out which namespaces/schemas are the most appropriate. This isn't new - it's a little like the `FOAF-a-matic <http://www.ldodds.com/foaf/foaf-a-matic>`__.
| We could also provide an interface with something like

--------------

| 

.. raw:: html

   <form>

| 
| What are you describing?
| A locationAn elementA person

.. raw:: html

   </form>

| 

--------------

| 
| The system can then spit out rdf triples or a link for Peter's word processor. What matters here is that, again, the author can be largely unaware of the underlying rdf complexities.
| This last point leads to Step 4, in which we could throw the article at a system like `OpenCalais <http://www.opencalais.com/>`__ to find content/metadata in the article that may be worth describing in RDF/RDFa. The author can select/deselect elements as they deem sensible and those that remain are either linked via RDFa or put into the associated RDF file.
| Now, all I need is to find the time to try this out....
| \* Not being completely across the spec, RDFa does seem to be limited in terms of some aspects of academic publishing. The issue of author order comes to mind. Using the basic RDFa examples, I link the authors but can't contain them ala an RDF:Seq. This is discussed in `RDFa Containers <http://www.w3.org/2001/sw/BestPractices/HTML/2006-rdfa-containers>`__ and solvable - even in word processors as they have (un)ordered lists....

.. raw:: html

   </p>
