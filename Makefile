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
-include $(ms)/os.mk

# -include $(ms)/perl.def

Ignore += $(ms)
## Sources += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git clone $(msrepo)/$(ms)

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

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/wrapR.mk
-include $(ms)/texdeps.mk
-include $(ms)/pandoc.mk
-include $(ms)/autorefs.mk

