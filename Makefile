PY?=
PELICAN?=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
CONFFILE_GTIHUB=$(BASEDIR)/pelicanconf-github.py
PUBLISHCONF=$(BASEDIR)/publishconf.py
OUTPUTDIR_GITHUB=$(BASEDIR)/docs

SSH_HOST=mksscryertower.quest
SSH_PORT=22
SSH_USER=linuxuser
SSH_TARGET_DIR=/var/www/mksscryertower.quest

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

SERVER ?= "0.0.0.0"

PORT ?= 0
ifneq ($(PORT), 0)
	PELICANOPTS += -p $(PORT)
endif


help:
	@echo 'Makefile for a pelican Web site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make html                           (re)generate the web site          '
	@echo '   make clean                          remove the generated files         '
	@echo '   make regenerate                     regenerate files upon modification '
	@echo '   make publish                        generate using production settings '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000'
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80    '
	@echo '   make devserver [PORT=8000]          serve and regenerate together      '
	@echo '   make devserver-global               regenerate and serve on 0.0.0.0    '
	@echo '   make ssh_upload                     upload the web site via SSH        '
	@echo '   make sftp_upload                    upload the web site via SFTP       '
	@echo '   make html-github                                                       '
	@echo '   make rsync_upload                   upload the web site via rsync+ssh  '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

html:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

html-github:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR_GITHUB)" -s "$(CONFFILE_GTIHUB)" $(PELICANOPTS)

clean:
	[ ! -d "$(OUTPUTDIR)" ] || rm -rf "$(OUTPUTDIR)"

	[ ! -d "$(OUTPUTDIR_GITHUB)" ] || rm -rf "$(OUTPUTDIR_GITHUB)"

regenerate:
	"$(PELICAN)" -r "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

serve:
	"$(PELICAN)" -l "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

serve-global:
	"$(PELICAN)" -l "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS) -b $(SERVER)

devserver:
	"$(PELICAN)" -lr "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

devserver-global:
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -b 0.0.0.0

publish:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(PUBLISHCONF)" $(PELICANOPTS)

ssh_upload: publish
	ssh -p $(SSH_PORT) $(SSH_USER)@$(SSH_HOST) "sudo mkdir -p /var/www/mksscryertower.quest/ && sudo chown ${SSH_USER}:${SSH_USER} -R /var/www/mksscryertower.quest/"
	scp -P $(SSH_PORT) -r "$(OUTPUTDIR)"/* "$(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)"
	ssh -p $(SSH_PORT) $(SSH_USER)@$(SSH_HOST) "sudo chown www-data:www-data -R /var/www/mksscryertower.quest/ && sudo rm -rf /var/www/mksscryertower.quest/index2.html"

sftp_upload: publish
	printf 'put -r $(OUTPUTDIR)/*' | sftp $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

rsync_upload: publish
	ssh -p $(SSH_PORT) $(SSH_USER)@$(SSH_HOST) "sudo mkdir -p /var/www/mksscryertower.quest/ && sudo chown ${SSH_USER}:${SSH_USER} -R /var/www/mksscryertower.quest/"
	rsync -e "ssh -p $(SSH_PORT)" -P -rvzc --include tags --cvs-exclude --delete "$(OUTPUTDIR)"/ "$(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)"
	ssh -p $(SSH_PORT) $(SSH_USER)@$(SSH_HOST) "sudo chown www-data:www-data -R /var/www/mksscryertower.quest/ && sudo rm -rf /var/www/mksscryertower.quest/index2.html"


.PHONY: html help clean regenerate serve serve-global devserver publish ssh_upload rsync_upload
