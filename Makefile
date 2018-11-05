MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR  := $(subst Makefile,,$(MKFILE_PATH))

image:
	docker build -t html-translator .

run:	image
	docker run -ti -v "$(MKFILE_DIR)":/src -w /src html-translator