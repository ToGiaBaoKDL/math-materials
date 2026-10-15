.PHONY: build upload sheet sheets-auth list help

DOC ?= $(DOCUMENT)
REMOTE ?= dxt-gdrive
ARGS = $(if $(DOC),--document "$(DOC)") $(if $(VARIANT),--variant "$(VARIANT)")

build:
	python3 scripts/build.py $(ARGS)

upload:
	python3 scripts/upload.py $(ARGS) --remote "$(REMOTE)" $(if $(MONTH),--month "$(MONTH)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

sheet:
	uv run scripts/sheets.py $(if $(DOC),--document "$(DOC)") $(if $(MONTH),--month "$(MONTH)") $(if $(DATE),--date "$(DATE)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

sheets-auth:
	uv run scripts/sheets.py --authorize $(if $(CLIENT),--client "$(CLIENT)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)")

list:
	python3 scripts/build.py --list

help:
	@echo 'make list | make build | make upload MONTH=YYYY-MM [DOC=buoi-10] [VARIANT=de] [DRY_RUN=1] | make sheet MONTH=YYYY-MM DATE=YYYY-MM-DD [DOC=buoi-11] [DRY_RUN=1]'
