.PHONY: build upload sheet sheets-auth list check format help

DOC ?= $(DOCUMENT)
REMOTE ?= dxt-gdrive
ARGS = $(if $(DOC),--document "$(DOC)") $(if $(VARIANT),--variant "$(VARIANT)")

build:
	uv run python scripts/build.py $(ARGS)

upload:
	uv run python scripts/upload.py $(ARGS) --remote "$(REMOTE)" $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

sheet:
	uv run scripts/sheets.py $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(DOC),--document "$(DOC)") $(if $(DATE),--date "$(DATE)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

sheets-auth:
	uv run scripts/sheets.py --authorize $(if $(CLIENT),--client "$(CLIENT)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)")

list:
	uv run python scripts/build.py --list

check:
	uv run ruff check scripts
	uv run ruff format --check scripts
	uv run pyright

format:
	uv run ruff check --fix scripts
	uv run ruff format scripts

help:
	@echo 'make list | make build | make upload DRIVE_MONTH=YYYY-MM [DOC=buoi-10] [VARIANT=de] [DRY_RUN=1] | make sheet DRIVE_MONTH=YYYY-MM DATE=YYYY-MM-DD [DOC=buoi-11] [DRY_RUN=1]'
