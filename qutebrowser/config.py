## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
config.load_autoconfig()

## Force `prefers-color-scheme: dark` colors for websites.
## Type: Bool
c.colors.webpage.prefers_color_scheme_dark = True

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '11pt "mononoki Nerd Font"'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = '11pt "mononoki Nerd Font"'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'default_size sans-serif'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '11pt "mononoki Nerd Font"'

c.url.start_pages = ["https://algorithm79.github.io"]
c.url.default_page = "https://google.com"
c.url.searchengines = {"DEFAULT": "https://google.com/search?q={}"}
c.downloads.location.directory = "~/Hämtningar"

# Bindings for normal mode
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

config.bind("Z", "hint links spawn mpv {hint-url}")
config.bind("Xa", "hint links userscript youtube_mp3_downloader.sh")
config.bind("Xv", "hint links userscript youtube_downloader.sh")

#Get colours from pywal
config.source('qutewal.py')
