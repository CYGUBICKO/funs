# Makefile to keep track of global functions in various directories
### Hooks for the editor to set the default target

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile 

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include makestuff/os.mk

# -include makestuff/perl.def

Ignore += makestuff
## Sources += makestuff
Makefile: makestuff makestuff/Makefile
makestuff:
	git clone $(msrepo)/makestuff

######################################################################

## We will delete pipe soon

######################################################################

#Sources +=  notes.txt 

## Code

Sources += $(wildcard *.R)

######################################################################

## Some analyses

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/wrapR.mk
-include makestuff/texdeps.mk
-include makestuff/pandoc.mk
-include makestuff/autorefs.mk

