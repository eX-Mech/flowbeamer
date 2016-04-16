#------------------------------------------------------------------------------
# This is a makefile tailored to work on the latex documents for the beamer
# FLOW template.
#------------------------------------------------------------------------------


# Variables:
#
main = slides

TEX = pdflatex
TEX_FLAGS =

BIB = bibtex
BIB_FLAGS =


# Dependencies:
#
SRCS = beamerthemeflow.sty  \
       $(main).tex

AUXS = $(main).aux      \
       $(main).toc      \
       $(main).nav      \
       $(main).snm

BBLS = #$(main).bbl

# Rules:
#
default: all

all: $(main)
#
$(main): $(SRCS) $(AUXS) $(BBLS)
	@echo building $(main) with $(TEX)
	@$(TEX) $(TEX_FLAGS) -draftmode $(main) #> /dev/null
	@$(TEX) $(TEX_FLAGS) $(main) #> /dev/null

$(AUXS): $(SRCS)
	@echo building $(main) with $(TEX) [for $@]
	@$(TEX) $(TEX_FLAGS) -draftmode $(main) #> /dev/null

%.bbl: %.aux $(main).bib
	@echo building $@ with $(BIB)
	@$(BIB) $(BIB_FLAGS) $(basename $@) #> /dev/null
#
clean:
	@echo cleaning $(main)
	@rm -f *.ps *.dvi *.aux *.auxlock *.toc *.log *.out *.bbl *.blg *.nav *.snm *~ *.syntex.gz
