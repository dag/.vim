.PHONY: all
all: vimproc

.PHONY: vimproc
vimproc: bundle/shougo/vimproc
	$(MAKE) -C $<
