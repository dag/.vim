.PHONY: all
all:

.PHONY: vimproc
vimproc: bundle/shougo/vimproc
	$(MAKE) -C $<

.PHONY: helptags
helptags:
	vim +Helptags +quit

.PHONY: update
update:
	git submodule foreach git pull --rebase --stat
	$(MAKE) vimproc
	$(MAKE) helptags
