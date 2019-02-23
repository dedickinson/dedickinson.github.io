Eprints: Context sensitive labels and help
##########################################
:date: 2009-01-27 18:39
:author: Anonymous
:tags: eprints
:slug: eprints-context-sensitive-labels-and
:status: published

| As a part of the QUT ePrints upgrade we held several meetings to discuss the submission workflow. As we were integrating the data with other systems we had to make sure that those undertaking the data entry (researchers, admin officers) wouldn't be thrown off by the language. One thing that came up was the need to have fields given a diferent label based on the resource type. For example, a book has an author but a painting may have an artist. You don't want to create an extra field because the data is the same, it's just the human interface that needs to be flexible. Likewise, the help text should change based on resource type.
| So, the idea was to provide a sub-phrase within the phrases file. The system would default to a base phrase if none was found.
| This would mean that we can have the following in our phrases file:
| ``<epp:phrase id="eprint_fieldname_volume">Volume</epp:phrase><epp:phrase id="eprint_fieldname_volume#book">Series Volume</epp:phrase><epp:phrase id="eprint_fieldhelp_volume">    Enter the volume number of the journal or series in which your item appeared. Please just use the number, do not include text such as "vol".</epp:phrase><epp:phrase id="eprint_fieldhelp_volume#book">    If this book is a part of a series, please provide the volume number here. Please just use the number, do not include text such as "vol".</epp:phrase>``
| As I hope you can see, if you're entering the information for a book, you get a contextual label and help. Any other resource types that use the volume field will fall back to the default text.
| As usual, when the doco falls short, I hit the mailing list. This can go one of two ways. You can get a good answer or you can get ignored. My question got a discussion going and a solution was reached. My final message can be read `here <http://www.eprints.org/tech.php/10085.html>`__.
| The biggest difficulty we faced was working out which objects were available from within the given piece of code...
| So, in perl\_lib/EPrints/MetaField.pm, I changed the render\_name and render\_help to check for a resource type specific phrase. I've used the hash (#) to denote the separation but you could change this.

::

    sub render_name {
        my ( $self, $session ) = @_;

        if ( defined $self->{title_xhtml} ) {

            return $self->{title_xhtml};
        }
        my $phrasename = $self->{confid} . "_fieldname_" . $self->{name};

        # START: Changes made to provide context sensitive names
        if ( defined $session->{query} ) {

            my $eprintid = $session->{query}->{eprintid}->[0];

            if ( $eprintid eq "" ) {

                $eprintid = $session->{query}->{param}->{eprintid}->[0];
            }

            my $ep = EPrints::DataObj::EPrint->new( $session, $eprintid );

            if ($ep) {

                my $eptype = $ep->get_type;
                $phrasename .= "#$eptype"
                  if $session->get_lang->has_phrase("$phrasename#$eptype");
            }

        }

        # END: Changes made to provide context sensitive names

        return $session->html_phrase($phrasename);
    }

    sub render_help {
        my ( $self, $session ) = @_;

        if ( defined $self->{help_xhtml} ) {

            return $self->{help_xhtml};
        }
        my $phrasename = $self->{confid} . "_fieldhelp_" . $self->{name};

        # START: Changes made to provide context sensitive help
        my $eprintid = $session->{query}->{eprintid}->[0];

        if ( $eprintid eq "" ) {

            $eprintid = $session->{query}->{param}->{eprintid}->[0];
        }

        my $ep = EPrints::DataObj::EPrint->new( $session, $eprintid );

        if ($ep) {

            my $eptype = $ep->get_type;
            $phrasename .= "#$eptype"
              if $session->get_lang->has_phrase("$phrasename#$eptype");
        }

        # END: Changes made to provide context sensitive help

        return $session->html_phrase($phrasename);
    }

| 

--------------

| 
| syntax highlighted by `Code2HTML <http://www.palfrader.org/code2html>`__, v. 0.9.1
| The code base modified was 3.1.1.
| Naturally, no warranty is offered.

.. raw:: html

   </p>
