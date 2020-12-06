### Windows Makefile for Scinc
### Using MinGW 64bit compiler.
### Change TCL_DIR to meet your setup
### To build :
###	 make -f Makefile

WIN_TARGET=win64

# Tcl/Tk version: it should be "86" for Tcl/Tk 8.6, etc.
TCL_VERSION=86

TCL_DIR=/d/tcl
MINGW_TARGET=x86_64-w64-mingw32

### Compiler and linker
CXX=$(MINGW_TARGET)-g++
RC=windres
LINK=$(CXX)

WARNINGS = -Wall

CXXFLAGS = -fno-rtti -DWIN32 -O2 $(WARNINGS) 
# Debug
# CXXFLAGS = -fno-rtti -DWIN32 -O0 $(WARNINGS) -g3 -ggdb
# Asserts
# CXXFLAGS = -fno-rtti -DWIN32 -O2 $(WARNINGS) -DASSERTIONS

LDFLAGS = -m64
RCFLAGS = --output-format=coff --target=pe-x86-64

### EXECS: all the evecutable programs compiled from C++ files.
EXECS= scidt.exe scinc.exe tcscid.exe

OBJS= src/misc.o src/index.o src/date.o src/namebase.o src/position.o \
      src/game.o src/gfile.o src/matsig.o src/bytebuf.o src/textbuf.o \
      src/myassert.o src/stralloc.o src/mfile.o src/dstring.o src/pgnparse.o \
      src/stored.o src/movelist.o \

### TCLS: all the .tcl files that make up "scinc".
TCLS= \
  tcl/start.tcl \
  tcl/config.tcl \
  tcl/bitmaps.tcl \
  tcl/language.tcl \
  tcl/utils.tcl \
    tcl/utils/date.tcl tcl/utils/font.tcl tcl/utils/graph.tcl tcl/utils/history.tcl \
    tcl/utils/pane.tcl tcl/utils/string.tcl tcl/utils/tooltip.tcl \
    tcl/utils/validate.tcl tcl/utils/win.tcl \
  tcl/misc/misc.tcl tcl/htext.tcl \
  tcl/file.tcl \
    tcl/file/recent.tcl \
    tcl/file/spellchk.tcl tcl/file/maint.tcl \
  tcl/edit.tcl \
  tcl/game.tcl \
    tcl/game/browser.tcl \
  tcl/windows.tcl \
    tcl/windows/gamelist.tcl tcl/windows/pgn.tcl \
    tcl/windows/comment.tcl tcl/windows/eco.tcl \
    tcl/windows/stats.tcl tcl/windows/tree.tcl \
    tcl/windows/pfinder.tcl tcl/windows/switcher.tcl \
  tcl/search/search.tcl \
    tcl/search/board.tcl tcl/search/header.tcl \
    tcl/tools/import.tcl \
    tcl/tools/optable.tcl tcl/tools/preport.tcl tcl/tools/pinfo.tcl \
    tcl/tools/analysis.tcl tcl/tools/wbdetect.tcl \
    tcl/tools/reper.tcl tcl/tools/graphs.tcl \
  tcl/help/help.tcl tcl/help/tips.tcl \
  tcl/menus.tcl tcl/board.tcl tcl/move.tcl tcl/main.tcl \
    tcl/lang/english.tcl tcl/dnd/tkdnd.tcl tcl/dnd/tkdnd_windows.tcl \
  tcl/tools/uci.tcl tcl/end.tcl tcl/tools/calvar.tcl tcl/tools/tactics.tcl


########################################

all: $(EXECS) scinc.gui

scinc.gui: $(TCLS)
	rm -f ./rel/bin/scinc.gui
	cat $(TCLS) > ./rel/bin/scinc.gui

scidt.exe: src/scidt.o $(OBJS)
	$(LINK) -o rel/bin/scidt.exe src/scidt.o $(OBJS) -L$(TCL_DIR)/lib -ltcl$(TCL_VERSION)

scinc.exe: src/scid.o $(OBJS) src/tree.o src/filter.o \
            src/pbook.o src/spellchk.o  \
            src/optable.o src/tkdnd/TkDND_OleDND.o src/tk_selection.o scid.res
	$(LINK) $(LDFLAGS) -o rel/bin/scinc.exe src/scid.o $(OBJS) \
            src/tree.o src/filter.o src/pbook.o \
            src/spellchk.o \
            src/optable.o src/tkdnd/TkDND_OleDND.o src/tk_selection.o rel/bin/scid.res \
	    -mwindows -lole32 -luuid -L$(TCL_DIR)/lib -ltk$(TCL_VERSION) -ltcl$(TCL_VERSION)

tcscid.exe: src/tcscid.o $(OBJS) src/tree.o src/filter.o \
            src/pbook.o src/spellchk.o \
            src/optable.o
	$(LINK) $(LDFLAGS) -o rel/bin/tcscid.exe src/tcscid.o $(OBJS) -ltcl$(TCL_VERSION) \
            src/tree.o src/filter.o src/pbook.o \
            src/spellchk.o \
            src/optable.o \
            -L$(TCL_DIR)/lib -ltcl$(TCL_VERSION)

scid.res: scid.rc
	$(RC) $(RCFLAGS) -o rel/bin/scid.res scid.rc

clean:
	rm -f src/*.o rel/bin/*.exe rel/bin/scinc.gui rel/bin/scid.res
	$(MAKE) -C src/tkdnd/ -f Makefile.mingwx clean

strip:
	$(MINGW_TARGET)-strip $(EXECS)

src/tcscid.o: src/tkscid.cpp
	$(CXX) $(CXXFLAGS) -std=c++0x -I$(TCL_DIR)/include -DTCL_ONLY -c src/tkscid.cpp \
	  -o ./src/tcscid.o

src/scid.o: src/tkscid.cpp
	$(CXX) $(CXXFLAGS) -std=c++0x -I$(TCL_DIR)/include -DSOURCE_TCL_FILE="\"scinc.gui\"" \
	  -c src/tkscid.cpp -o ./src/scid.o

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -I$(TCL_DIR)/include -c $< -o ./$@

src/tkdnd/TkDND_OleDND.o: src/tkdnd/win/TkDND_OleDND.cpp
	$(MAKE) -C src/tkdnd/ -f Makefile.mingwx LINK="$(LINK)" CXXFLAGS="$(CXXFLAGS)" \
              WIN_TARGET="$(WIN_TARGET)" TCL_VERSION="$(TCL_VERSION)" TCL_DIR="$(TCL_DIR)"
