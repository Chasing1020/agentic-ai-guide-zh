# Makefile for The Hitchhiker's Guide
# book.tex (+ parts/*.tex) -> book.pdf  via xelatex + bibtex
#
# We deliberately purge stale intermediates (.aux, .bbl, .toc, .out, ...)
# before every build. With the body split across parts/*.tex, a half-stale
# .aux from a previous run can desync from a freshly-generated .bbl and
# trigger spurious "Extra }, or forgotten \endgroup" errors on the 2nd
# xelatex pass. A from-clean run avoids that without affecting tracked
# artifacts (book.bbl is regenerated each build; book.pdf is the target).
#
# We use the explicit xelatex -> bibtex -> xelatex -> xelatex sequence
# only — no latexmk wrapper. This matches what arXiv (almost) runs and
# avoids latexmk's internal source-rules cache contention with -pdfxe.

MAIN  := book
TEX   := $(MAIN).tex
PDF   := $(MAIN).pdf
BIB   := $(MAIN).bib
PARTS := $(wildcard parts/*.tex)

# Files latex regenerates each run; safe to delete pre-build.
INTERMEDIATES := \
	$(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc $(MAIN).fls \
	$(MAIN).fdb_latexmk $(MAIN).synctex.gz $(MAIN).blg $(MAIN).bbl \
	$(MAIN).bcf $(MAIN).run.xml $(MAIN).xdv

.PHONY: all clean distclean arxiv-check

all: $(PDF)

$(PDF): $(TEX) $(BIB) $(PARTS)
	@rm -f $(INTERMEDIATES)
	xelatex -interaction=nonstopmode -halt-on-error $(TEX)
	-bibtex $(MAIN)
	xelatex -interaction=nonstopmode -halt-on-error $(TEX)
	xelatex -interaction=nonstopmode -halt-on-error $(TEX)

# Remove regenerable intermediates; keep tracked book.bbl and book.pdf.
clean:
	rm -f $(INTERMEDIATES)

# Like `clean` but also drops the built PDF. Useful for a true from-zero run.
distclean: clean
	rm -f $(PDF)

# Sanity-check the arXiv build path (arXiv uses pdflatex; see 00README.json).
# Does NOT replace the main build — only flags fontspec / XeTeX-only usage.
arxiv-check:
	@rm -f $(INTERMEDIATES)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
