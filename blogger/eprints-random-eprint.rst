EPrints: Random EPrint
######################
:date: 2009-01-28 18:24
:author: Anonymous
:tags: eprints
:slug: eprints-random-eprint
:status: published

| Having an eprint of the day on your IR site is a useful tool. Authors like to see their work come up and it gives people something new to look at. I created a basic script to select a full-text eprint and either redirect the browser or create a citation. The redirection would be useful if you wanted a link along the lines "Find a random eprint" but this maybe isn't overly useful. By outputting a citation you can embed the information into a web page. We needed two types of output: one creates a citation as a snippet of html for use in web pages. The other outputs the citation within the archive's template.
| So, the code below lives in a file called "random" in the cgi folder. You have some options:

-  http://myeprints.org/cgi/random: Displays the random eprint within the archive template
-  http://myeprints.org/cgi/random?insert=1: Displays an HTML snippet
-  http://myeprints.org/cgi/random?redirect=1: Redirects the browser to the full abstract of a random eprint

| 
| You may also notice that, in the code, I search eprints for items with public full text.

Code
----

| 
| Now, here's that code:

::

    ######################################################################
    #
    #  Returns a random eprint
    #
    ######################################################################

    use EPrints;

    use strict;
    use Data::Dumper;

    my $session = new EPrints::Session;
    exit(0) unless ( defined $session );

    #load the archive data set
    my $ds = $session->get_repository->get_dataset("archive");

    my $searchexp = EPrints::Search->new(
        satisfy_all => 1,
        session     => $session,
        dataset     => $ds,
    );
    $searchexp->add_field( $ds->get_field("full_text_status"), 'public' );
    my $results = $searchexp->perform_search;
    my $offset  = rand int( $results->count );

    my @ids = @{ $searchexp->get_ids };
    $searchexp->dispose;

    if ( $session->param("redirect") == 1 ) {
        $session->redirect( "/" . $ids[$offset] );
        exit;
    }

    #prepare a citation string
    my $ep = EPrints::DataObj::EPrint->new( $session, $ids[$offset] );
    my $citation = $ep->render_citation_link("default");

    if ( $session->param("insert") eq '1' ) {
        $session->send_http_header( content_type => "text/plain" );
        print $citation->toString;
    }
    else {

        #Build a display page
        my $title = $session->html_phrase("cgi/random:title");
        my $page  = $session->make_doc_fragment();
        $page->appendChild($citation);
        $session->build_page( $title, $page, "latest" );
        $session->send_page();
    }

    $session->terminate();
    exit;

| 

How?
----

| 
| So, how can you use this? Well, we could have setup a cron job to wget a random citation snippet. One of the library pages accessed this via JSP and inserted it into their page.
| However, we also wanted the eprint of the day on our eprints home page. After a few thoughts on the best way to do this, I settled with phrases. So, in the code below, I request a random eprint in HTML snippet and do 2 things. Firstly (easily) I output this to a text file that can be grabbed over the web. Secondly, I create a phrase file with the citation in it. I can then use this phrase in any xpage with ``<epc:phrase ref="eprint_of_the_day" />``
| This is the script that does the job:

::

    #!/usr/bin/perl -w
    use LWP::UserAgent;
    use HTTP::Request;

    $ua = LWP::UserAgent->new( env_proxy => 1, keep_alive => 1, timeout => 30, );

    my $response = $ua->request(
        HTTP::Request->new( 'GET', 'http://my.eprints/cgi/random?insert=1' ) );

    open( PHRASE_FILE,
    ">/usr/local/eprints/archives/myeprints/cfg/lang/en/phrases/eprint_of_the_day.xml"
    );

    open( INCLUDE_FILE,
        ">/usr/local/eprints/archives/myeprints/cfg/lang/en/static/random.txt" );

    print PHRASE_FILE "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <!DOCTYPE phrases SYSTEM \"entities.dtd\">
    <epp:phrases xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:epp=\"http://eprints.org/ep3/phrase\"
     xmlns:epc=\"http://eprints.org/ep3/control\">
     <epp:phrase id=\"eprint_of_the_day\">";

    print PHRASE_FILE $response->content;
    print INCLUDE_FILE $response->content;

    print PHRASE_FILE "</epp:phrase></epp:phrases>";

    close(PHRASE_FILE);
    close(INCLUDE_FILE);

    `su - eprints -c '/usr/local/eprints/bin/generate_static myeprints'`;

    print $response->content;

| 

--------------

| 
| syntax highlighted by `Code2HTML <http://www.palfrader.org/code2html>`__, v. 0.9.1

.. raw:: html

   </p>
