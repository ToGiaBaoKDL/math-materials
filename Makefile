.PHONY: build preview list help

DOC ?= $(DOCUMENT)
ARGS = $(if $(DOC),--document "$(DOC)") $(if $(VARIANT),--variant "$(VARIANT)")

build:
	python3 scripts/build.py $(ARGS)

preview:
	python3 scripts/build.py --preview $(ARGS)

list:
	python3 scripts/build.py --list

help:
	@echo 'make list | make build [DOC=phan-boi-chau] [VARIANT=de] | make preview [DOC=nguyen-binh-khiem]'
