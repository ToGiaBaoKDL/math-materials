.PHONY: format-typst check-typst notify build upload upload-rclone google-auth sheet list check format help

DOC ?= $(DOCUMENT)
REMOTE ?= dxt-gdrive
ARGS = $(if $(DOC),--document "$(DOC)") $(if $(VARIANT),--variant "$(VARIANT)")

build:
	uv run python scripts/build.py $(ARGS)

upload:
	uv run python scripts/upload.py $(ARGS) $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)") $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

upload-rclone:
	uv run python scripts/upload_rclone.py $(ARGS) --remote "$(REMOTE)" $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

google-auth:
	uv run python scripts/google_auth.py $(if $(CLIENT),--client "$(CLIENT)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)")

sheet:
	uv run python scripts/sheets.py $(if $(DRIVE_MONTH),--drive-month "$(DRIVE_MONTH)") $(if $(DOC),--document "$(DOC)") $(if $(DATE),--date "$(DATE)") $(if $(CATEGORY),--category "$(CATEGORY)") $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)") $(if $(filter 1 true,$(DRY_RUN)),--dry-run)

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
	@echo 'make list | make build | make google-auth [CLIENT=...] | make upload DRIVE_MONTH=YYYY-MM [DOC=buoi-10] [VARIANT=de] [DRY_RUN=1] | make sheet DRIVE_MONTH=YYYY-MM DATE=YYYY-MM-DD [DOC=buoi-11] [DRY_RUN=1]'

notify:
	uv run python scripts/notify.py --config "$(CONFIG)" $(if $(CREDENTIALS),--credentials "$(CREDENTIALS)") $(if $(filter 1 true,$(SEND)),--send)

# Typstyle 0.15.2; Python and Typst formatting are deliberately separate.
TYPSTYLE ?= typstyle
format-typst:
	$(TYPSTYLE) -i -l 120 templates

check-typst:
	$(TYPSTYLE) --check -l 120 templates
