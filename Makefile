.PHONY: format-typst check-typst notify build upload google-auth sheet list check format help

SELECTION = $(if $(DOC),--document "$(DOC)")
PUBLICATION_ARGS = $(SELECTION) $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)
AUTH_ARGS = $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)")

build:
	uv run python scripts/build.py $(if $(DOC),--document "$(DOC)") $(if $(VARIANT),--variant "$(VARIANT)")

upload:
	uv run python scripts/upload.py $(PUBLICATION_ARGS) $(AUTH_ARGS)

google-auth:
	uv run python scripts/google_auth.py $(if $(CLIENT),--client "$(CLIENT)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)")

sheet:
	uv run python scripts/sheets.py $(PUBLICATION_ARGS) $(AUTH_ARGS) $(if $(DATE),--date "$(DATE)")

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
	@echo 'make list | make build DOC=... [VARIANT=...] | make google-auth | make upload DOC=... [DRY_RUN=1] | make sheet DOC=... [DRY_RUN=1]'

notify:
	uv run python scripts/notify.py $(SELECTION) $(if $(STARTS_AT),--starts-at "$(STARTS_AT)") $(if $(LOCATION),--location "$(LOCATION)") $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)") $(if $(SECRET),--secret "$(SECRET)") $(if $(filter 1 true,$(SEND)),--send)

# Typstyle 0.15.2; Python and Typst formatting are deliberately separate.
TYPSTYLE ?= typstyle
format-typst:
	$(TYPSTYLE) -i -l 120 templates

check-typst:
	$(TYPSTYLE) --check -l 120 templates
