.PHONY: build upload list help

DOC ?= $(DOCUMENT)
REMOTE ?= dxt-gdrive
ARGS = $(if $(DOC),--document "$(DOC)") $(if $(VARIANT),--variant "$(VARIANT)")

build:
	python3 scripts/build.py $(ARGS)

upload:
	python3 scripts/upload.py $(ARGS) --remote "$(REMOTE)" $(if $(MONTH),--month "$(MONTH)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

list:
	python3 scripts/build.py --list

help:
	@echo 'make list | make build | make upload MONTH=YYYY-MM [DOC=buoi-10] [VARIANT=de] [DRY_RUN=1]'
