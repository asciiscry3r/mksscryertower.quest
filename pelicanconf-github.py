AUTHOR = 'Klimenko Maxim Sergievich'
SITENAME = 'backup.mksscryertower.quest'
SITEURL = 'https://backup.mksscryertower.quest/'

THEME = 'nmnlist/'

PATH = 'content'

TIMEZONE = 'Europe/Kiev'

DEFAULT_LANG = 'en'

LOCALE = ('en_US', 'uk_UA')

PLUGIN_PATHS = ["plugins", ".venv/lib/python3.13/site-packages/pelican/plugins/"]

PLUGINS = ["sitemap", "series"] #, "i18n_subsites"]

I18N_SUBSITES = {
    'ua': {
    'SITENAME': 'mksscryertower.quest',
    }
}

JINJA_ENVIRONMENT = {
'extensions': ['jinja2.ext.i18n'],
}

ARTICLE_URL = '{slug}.html'
ARTICLE_SAVE_AS = '{slug}.html'
ARTICLE_LANG_URL = '{slug}-{lang}.html'
ARTICLE_LANG_SAVE_AS = '{slug}-{lang}.html'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

SITEMAP = {
    "format": "xml",
    "priorities": {
        "articles": 0.5,
        "indexes": 0.5,
        "pages": 0.5
    },
    "changefreqs": {
        "articles": "monthly",
        "indexes": "daily",
        "pages": "monthly"
    }
}

STATIC_PATHS = [
    'images',
    'extra',
]

EXTRA_PATH_METADATA = {
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/favicon.ico': {'path': 'favicon.ico'},
    'extra/LICENSE': {'path': 'LICENSE'},
    'extra/.nojekyll': {'path': '.nojekyll'},
    'extra/CNAME': {'path': 'CNAME'},
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
