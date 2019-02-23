OAI-PMH in ePrints
##################
:date: 2009-03-17 17:12
:author: Anonymous
:tags: eprints
:slug: oai-pmh-in-eprints
:status: published

| I was chatting with Peter Sefton today about OAI-PMH and resource type names so I thought I'd get back to documenting some ePrints work.
| So, to configure OAI-PMH for eprints is straight forward. Within your archive's folder you'll find cfg/cfg.d/oai.pl. You can make some basic alterations such as defining sets and setting up your metadata policy.
| Actually deciding how to represent your PMH data is important. For repositories in Australia, the NLA's `Arrow Discovery Search <http://search.arrow.edu.au/>`__ provides an interesting angle on this. Just because your repository can be harvested doesn't mean it's interoperable. You should try and see if there's a naming scheme for resource types that others around you are using. Check out `Peter Sefton's blog post <http://ptsefton.com/2008/10/20/towards-australian-repository-interoperability-using-oia-pmh.htm>`__ for a more in-depth commentary on this.
| So, what do you do if internally you want to define a Resource Type "Article" but the outside world want to know it as "Journal Article"? Well, for one, you can use the phrase files to call it whatever you want for users of the system. So if eprints internally calls it "Paper" your phrase file can call it "Article" to make the data submission less confusing.
| But, if you want to change the way that the metadata is presented to systems such as OAI-PMH, you need to look at how ePrints deals with Dublin Core. Basically, the OAI-PMH data contains the metadata in DC. Each eprint page also puts the DC into the page's meta tags.
| Under perl\_lib/EPrints/Plugin/Export you'll find DC.pm. Now, this is an important file if you define your own resource type (with non-inbuilt fields) as eprints won't know about them and you'll have to make sure you adapt files such as DC.pm to output your Resource Type's metadata correctly. Look at the convert\_dataobj procedure and you'll see how fields are then put into DC format.
| So, we created a qut\_thesis type to indicate QUT-based theses for collection within the ADT. Now, eprints doesn't know anything about qut\_thesis and we needed to edit DC.pm:

::

    if ($eprint->get_value( "type" ) eq 'thesis' || $eprint->get_value( "type" ) eq 'qut_thesis') {

     push @dcdata, [ "publisher", $eprint->get_value( "institution" ) ] if( $eprint->exists_and_set( "institution" ) );

    } else {
     push @dcdata, [ "publisher", $eprint->get_value( "publisher" ) ] if( $eprint->exists_and_set( "publisher" ) );

    }

| 
| This is a basic example - I just make sure that qut\_thesis DC is the same as the thesis representation. But the MACAR resource types don't include qut\_thesis (funnily enough) and we want to make sure that our DC is what external readers/harvesters expect. So, the DC.pm file changes the DC type to Thesis for qut\_thesis types:

::

    if( $eprint->exists_and_set( "type" ) )
    {
     # We need to map the types to that of MACAR
     # But only if the text displayed in the eprint_types.xml
     # phrases file does not match MACAR
     my $type = $eprint->get_value( "type" );
     if ($type eq 'qut_thesis') {
      push @dcdata, [ "type", "Thesis" ];
     } else {
      push @dcdata, [ "type", EPrints::Utils::tree_to_utf8( $eprint->render_value( "type" ) ) ];
     }
    }

| 
| So, if you visit a `sample eprint <http://eprints.qut.edu.au/18342/>`__, and select the Export Dublin Core link you'll see that the metadata indicates that the document is a Thesis. qut\_thesis is only interesting to QUT so we keep it out of the Dublin Core.
| Nearly there...
| The problem is, qut\_thesis represents theses from QUT and this is harvested by the ADT system. You have to see how eprints delineates OAI-PMH sets to do this. Basically, eprints does a search on various fields such as type, subject and ispublished. It does this search and then formats the DC metadata. The code above only changes the output at this latter step. Check your archive's cfg/cfg.d/oai.pl to see the sets being defined.
| Checkout those import and export plugin folders. If you define your own types and properties you'll need to make sure that the import/export matches your structures. Only enable the plugins that you know work.
| There are better ways for EPrints to do this - e.g. provide an archive mapping system for import/export. However, it doesn't and the work isn't that difficult. Besides, that's part of the strength of a working open source product.

Other PMH Stuff
---------------

| 
| It's also important to make sure that you have a metadata policy so that harvesters know what they can do. OpenDOAR provides a `policies tool <http://www.opendoar.org/tools/en/policies.php>`__ to make this easy - it even exports an eprints compliant file that you can then put in your archive's cfg/cfg.d/oai.pl file. For examples of this, see the `QUT ePrints Policy <http://eprints.qut.edu.au/cgi/oai2/103?verb=Identify>`__ and the one at `UTas <http://eprints.utas.edu.au/cgi/oai2?verb=Identify>`__.
| Once you're ready to go, check out the Open Archives Initiative site and `register as a provider <http://www.openarchives.org/data/registerasprovider.html>`__ . If anything, it gives you a tick that your PMH output conforms. If you get the tick you'll be added to the list of `registered providers <http://www.openarchives.org/Register/BrowseSites>`__. It's quite painless - except for getting people to decide on the actual policy.
| \* I'm often told "we can't do that - it's hacking the source code". I take this comment to mean that Open Source means $free or that the project has no future capacity to maintain the system. This might set off your alarm bell and you really need to read `Just say no to maverick-manager jobs <http://cavlec.yarinareth.net/2009/03/14/just-say-no-to-maverick-manager-jobs/>`__ by Dorothea Salo. Consider this - software such as Peoplesoft and ResearchMaster are often "customised" - then again they also get a squadron of full-time staff. Why isn't your IR getting similar attention?

.. raw:: html

   </p>
