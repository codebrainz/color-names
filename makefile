#
# Make the various output format files for the color list
#

DATAFILE = input/wiki-color-list.text
SCRIPT = format-colors
COMMAND = python $(SCRIPT)
OUT=output
BUILT_SOURCES_BASE = colors.c colors.conf colors.csv colors.html colors.json colors.sexp colors.xml
BUILT_SOURCES = $(addprefix $(OUT)/,$(BUILT_SOURCES_BASE))

all: $(BUILT_SOURCES)

$(OUT)/colors.c: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f ccode -o $@ $<

$(OUT)/colors.conf: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f conf -o $@ $<

$(OUT)/colors.csv: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f csv -o $@ $<

$(OUT)/colors.html: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f html -o $@ $<

$(OUT)/colors.json: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f json -o $@ $<

$(OUT)/colors.sexp: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f sexp -o $@ $<

$(OUT)/colors.xml: $(DATAFILE) $(SCRIPT)
	$(COMMAND) -f xml -o $@ $<

clean:
	rm -f $(BUILT_SOURCES) printcolors

.PHONY: all clean
