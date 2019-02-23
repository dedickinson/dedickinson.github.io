#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

PLUGIN_PATHS = ['plugins/']

# Install plugins with:
#   pipenv run pelican-plugin-installer -i <name>
#
# See: https://github.com/getpelican/pelican-plugins/tree/master/asciidoc_reader

PLUGINS = ['asciidoc_reader',]

AUTHOR = 'Duncan Dickinson'
SITENAME = 'Prag-o-matic'
SITE_DESCRIPTION = 'A blog.'
SITEURL = 'https://www.duncan.dickinson.name'

THEME = 'duncan'

PATH = 'content'

TIMEZONE = 'Australia/Brisbane'

DEFAULT_LANG = 'en'

FEED_DOMAIN = SITEURL
FEED_ATOM = 'atom.xml'

STATIC_PATHS = [
    'images', 
    'robots.txt', 
    'favicon.ico'
]

USE_FOLDER_AS_CATEGORY = True
ARTICLE_URL = '{date:%Y}/{date:%m}/{slug}.html'
ARTICLE_SAVE_AS = '{date:%Y}/{date:%m}/{slug}.html'
AUTHOR_SAVE_AS = ''
CATEGORY_SAVE_AS = ''
ARCHIVE_SAVE_AS = ''
# YEAR_ARCHIVE_SAVE_AS = 'archive/{date:%Y}.html'

# Blogroll
LINKS = ()

# Social widget
SOCIAL = (('LinkedIn', 'http://www.linkedin.com/in/dedickinson'),
          ('Github', 'https://github.com/dedickinson'),)

DEFAULT_PAGINATION = 4

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

HEADER_COVER = 'images/title_img.jpg'