Upgrading QUT ePrints
#####################
:date: 2009-01-13 18:28
:author: Anonymous
:tags: eprints
:slug: upgrading-qut-eprints
:status: published

| One of the main reasons I wanted to start this blog was to document the work I recently completed in upgrading the `QUT ePrints <http://eprints.qut.edu.au/>`__ system. I did not do this alone so will state outright that there was a team of Librarians, a couple of developers and other QUT staff. I won't name them here for privacy reasons.
| So, this is my attempt to feed back to the eprints community with some code and discussion about the work.
| What is QUT ePrints?
  QUT operates its institutional repository out of the Library. There is `high-level support <http://www.mopp.qut.edu.au/F/F_01_03.jsp>`__ for the repository - not just rhetoric. The insitution alo has some key people - one of whom lives and breathes this stuff - they're fun to work with :)
| Chances are that if you don't know what `ePrints <http://www.eprints.org/>`__ is then you have moved away from this page for now. QUT was a member of the now defunct `ARROW <http://arrow.edu.au/>`__ group and bought into the VITAL software. However, due to a variety of reasons, we chose to upgrade from eprints v2 to v3. I won't go into the whys...
| What we did
| A fair bit... Whilst the eprints team provides a complete out of the box solution, the beauty of its open sourciness is that we could adapt it to QUT and Australian higher-ed requirements.
| So the main items we produced were:

-  Integrate QUT's `ESOE <http://www.esoeproject.org/>`__ infrastructure for single sign on
-  Transfer the data from ePrints 2 to a new server running ePrints 3
-  Bring over the ADT theses to be served from our IR
-  Expand the metadata to capture data for the HERDC collection - this could reduce a fair bit of work for researchers
-  ... and some general user interface work

The data data transfer gave us a chance to normalise our metadata - the system had grown "organically" over several years so needed a little landscaping

-  We were also able to fall in line with the `MACAR resource types <http://macar.wikidot.com/>`__
-  This was a job for XSLT

| 
| What we didn't do
| Well, there were a few things dropped along the way:

-  Oracle integration: We'd thought about using the university's corporate Oracle infrastructure but, after battling with the rather new database layer, killed the idea off so as to meet the deadline.
-  We'd really wanted to link into QUT's Identity system but it wasn't ready yet. This would give us a name authority that could ensure that systems with which we share data were all on the same page

| On that last point, I received a bit of flack as I was talking of using a QUT-local name authority. I tended to disagree with people on this one. For one, we actually had a name authority at QUT (though the SOAP interface was delayed). The NLA have the `People Australia <http://www.nla.gov.au/initiatives/peopleaustralia/>`__ work that would meet our needs but it sin't there yet. There was talk of other projects but it all started to sound rather overly crowded in terms of scope. Secondly, the SOA interface could easily provide any info needed once given that unique QUT ID - we all know that one ID won't be enough, especially for the public sector.
| Moving on
| Well, enough of a ramble. I'll start posting code and overviews shortly.

.. raw:: html

   </p>
