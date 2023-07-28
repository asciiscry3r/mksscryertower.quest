AUTHOR = 'Klimenko Maxim Sergievich'
SITENAME = 'asciiscry3r.github.io'
SITEURL = 'https://asciiscry3r.github.io/'

THEME = 'nmnlist/'

PATH = 'content'

TIMEZONE = 'Europe/Kiev'

DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

STATIC_PATHS = [
    'images',
    'extra',
]
EXTRA_PATH_METADATA = {
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/favicon.ico': {'path': 'favicon.ico'},
    'extra/LICENSE': {'path': 'LICENSE'},
}

# Blogroll
LINKS = (('Pelican', 'https://getpelican.com/'),
         ('Python.org', 'https://www.python.org/'),
         ('Jinja2', 'https://palletsprojects.com/p/jinja/'),)

# Social widget
SOCIAL = (('My GitHub', 'https://github.com/asciiscry3r'),)

LICENSE='CC BY-ND 4.0'

LOAD_CONTENT_CACHE = False

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True
DISPLAY_PAGES_ON_MENU = False

INDEX_SAVE_AS = 'index.html'

ARTICLE_TRANSLATION_ID = 'slug'
