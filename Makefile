### Windows Makefile for Scinc
### Using MinGW 64bit compiler.
### Change TCL_DIR to meet your setup
### To build :
###	 make -f Makefile

WIN_TARGET=win64

# Tcl/Tk version: it should be "85" for Tcl/Tk 8.5, etc.
TCL_VERSION=85

TCL_DIR=/i/tcl
MINGW_TARGET=x86_64-w64-mingw32

### Compiler and linker
CXX=$(MINGW_TARGET)-g++
CC=$(MINGW_TARGET)-gcc
RC=$(MINGW_TARGET)-windres
LINK=$(CXX)

### SCIDFLAGS: Scid customization flags.
#      Use -DZLIB if your system does not have zlib and you need
#      to include the code in the src/zlib directory.
#      The default is to use the system zlib library.

SCIDFLAGS = -DZLIB

WARNINGS = -Wall

CFLAGS = -DWIN32 -O2 $(WARNINGS) $(DEBUG)

CXXFLAGS = -fno-rtti $(CFLAGS) $(SCIDFLAGS)

LDFLAGS =
RCFLAGS = --output-format=coff

CFLAGS += -m64
#CXXFLAGS+= -m64
LDFLAGS+= -m64
RCFLAGS+= --target=pe-x86-64

### EXECS: all the evecutable programs compiled from C++ files.
EXECS= scidt.exe scinc.exe tcscid.exe

### SCIDOBJS: not all the .o files that make up scid, just the standard
###   files that most of the scid programs use.

SCIDOBJS= src/misc.o src/index.o src/date.o src/namebase.o src/position.o \
      src/game.o src/gfile.o src/matsig.o src/bytebuf.o src/textbuf.o \
      src/myassert.o src/stralloc.o src/mfile.o src/dstring.o src/pgnparse.o \
      src/stored.o src/movelist.o \
      src/polyglot/attack.o src/polyglot/board.o src/polyglot/book.o \
      src/polyglot/book_make.o src/polyglot/book_merge.o src/polyglot/colour.o \
      src/polyglot/fen.o src/polyglot/game.o src/polyglot/hash.o \
      src/polyglot/io.o src/polyglot/line.o src/polyglot/list.o src/polyglot/main.o src/polyglot/move.o \
      src/polyglot/move_do.o src/polyglot/move_gen.o src/polyglot/move_legal.o src/polyglot/option.o \
      src/polyglot/parse.o src/polyglot/pgn.o src/polyglot/piece.o src/polyglot/random.o \
      src/polyglot/san.o src/polyglot/search.o src/polyglot/square.o src/polyglot/util.o

CHARSETCONVOBJS= src/charsetdetector.o src/charsetconverter.o \
      src/universalchardet/CharDistribution.o src/universalchardet/JpCntx.o \
      src/universalchardet/LangBulgarianModel.o src/universalchardet/LangCyrillicModel.o \
      src/universalchardet/LangGreekModel.o src/universalchardet/LangHebrewModel.o \
      src/universalchardet/LangHungarianModel.o src/universalchardet/LangThaiModel.o \
      src/universalchardet/nsBig5Prober.o src/universalchardet/nsCharSetProber.o \
      src/universalchardet/nsEscCharsetProber.o src/universalchardet/nsEscSM.o \
      src/universalchardet/nsEUCJPProber.o src/universalchardet/nsEUCKRProber.o \
      src/universalchardet/nsEUCTWProber.o src/universalchardet/nsGB2312Prober.o \
      src/universalchardet/nsHebrewProber.o src/universalchardet/nsLatin1Prober.o \
      src/universalchardet/nsMBCSGroupProber.o src/universalchardet/nsMBCSSM.o \
      src/universalchardet/nsSBCharSetProber.o src/universalchardet/nsSBCSGroupProber.o \
      src/universalchardet/nsSJISProber.o src/universalchardet/nsUniversalDetector.o \
      src/universalchardet/nsUTF8Prober.o


### ZLIBOBJS: object files in the zlib compression library.

ZLIBOBJS= src/zlib/adler32.o src/zlib/compress.o src/zlib/crc32.o \
      src/zlib/gzio.o src/zlib/uncompr.o src/zlib/deflate.o src/zlib/trees.o \
      src/zlib/zutil.o src/zlib/inflate.o src/zlib/infblock.o \
      src/zlib/inftrees.o src/zlib/infcodes.o src/zlib/infutil.o \
      src/zlib/inffast.o

### OBJS: all standard object files for scid.

OBJS= $(SCIDOBJS) $(ZLIBOBJS)

## LANGUAGES are now source from scidShareDir/lang

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
    tcl/file/bookmark.tcl tcl/file/recent.tcl tcl/file/epd.tcl \
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
    tcl/search/board.tcl tcl/search/header.tcl tcl/search/material.tcl \
    tcl/tools/import.tcl \
    tcl/tools/optable.tcl tcl/tools/preport.tcl tcl/tools/pinfo.tcl \
    tcl/tools/analysis.tcl tcl/tools/wbdetect.tcl \
    tcl/tools/reper.tcl tcl/tools/graphs.tcl \
  tcl/help/help.tcl tcl/help/tips.tcl \
  tcl/menus.tcl tcl/board.tcl tcl/move.tcl tcl/main.tcl \
    tcl/lang/english.tcl tcl/dnd/tkdnd.tcl tcl/dnd/tkdnd_windows.tcl \
  tcl/tools/uci.tcl tcl/end.tcl tcl/tools/calvar.tcl tcl/tools/tactics.tcl tcl/misc/flags.tcl


########################################

all: $(EXECS) scinc.gui

scinc.gui: $(TCLS)
	rm -f ./rel/bin/scinc.gui
	cat $(TCLS) > ./rel/bin/scinc.gui

scidt.exe: src/scidt.o $(OBJS) $(CHARSETCONVOBJS)
	$(LINK) -o rel/bin/scidt.exe src/scidt.o $(OBJS) $(CHARSETCONVOBJS) -L$(TCL_DIR)/lib -ltcl$(TCL_VERSION)

scinc.exe: src/scid.o $(OBJS) $(CHARSETCONVOBJS) src/tree.o src/filter.o \
            src/pbook.o src/spellchk.o src/probe.o \
            src/optable.o src/engine.o src/recog.o src/tkdnd/TkDND_OleDND.o src/tk_selection.o scid.res
	$(LINK) $(LDFLAGS) -o rel/bin/scinc.exe src/scid.o $(OBJS) $(CHARSETCONVOBJS) \
            src/tree.o src/filter.o src/pbook.o \
            src/spellchk.o src/probe.o \
            src/optable.o src/engine.o src/recog.o src/tkdnd/TkDND_OleDND.o src/tk_selection.o rel/bin/scid.res \
	    -mwindows -lole32 -luuid -L$(TCL_DIR)/lib -ltk$(TCL_VERSION) -ltcl$(TCL_VERSION)

tcscid.exe: src/tcscid.o $(OBJS) src/tree.o src/filter.o \
            src/pbook.o src/spellchk.o src/probe.o \
            src/optable.o src/engine.o src/recog.o $(CHARSETCONVOBJS)
	$(LINK) $(LDFLAGS) -o rel/bin/tcscid.exe src/tcscid.o $(OBJS) $(CHARSETCONVOBJS) -ltcl$(TCL_VERSION) \
            src/tree.o src/filter.o src/pbook.o \
            src/spellchk.o src/probe.o \
            src/optable.o src/engine.o src/recog.o \
            -L$(TCL_DIR)/lib -ltcl$(TCL_VERSION)

scid.res: scid.rc
	$(RC) $(RCFLAGS) -o rel/bin/scid.res scid.rc

clean:
	rm -f src/*.o src/zlib/*.o src/polyglot/*.o src/universalchardet/*.o rel/bin/*.exe rel/bin/scinc.gui rel/bin/scid.res
	$(MAKE) -C src/tkdnd/ -f Makefile.mingwx clean

strip:
	$(MINGW_TARGET)-strip $(EXECS)


src/tcscid.o: src/tkscid.cpp
	$(CXX) $(CXXFLAGS) -std=c++0x -I$(TCL_DIR)/include -DTCL_ONLY -c src/tkscid.cpp \
	  -o ./src/tcscid.o

src/tkscid.o: src/tkscid.cpp
	$(CXX) $(CXXFLAGS) -std=c++0x -I$(TCL_DIR)/include -c src/tkscid.cpp \
	  -o ./src/tkscid.o

src/scid.o: src/tkscid.cpp
	$(CXX) $(CXXFLAGS) -std=c++0x -I$(TCL_DIR)/include -DSOURCE_TCL_FILE="\"scinc.gui\"" \
	  -c src/tkscid.cpp -o ./src/scid.o

src/probe.o: src/probe.cpp src/egtb/tbindex.cpp src/egtb/tbdecode.c
	$(CXX) $(CXXFLAGS) -Wno-missing-braces -c src/probe.cpp -o ./src/probe.o

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -I$(TCL_DIR)/include -c $< -o ./$@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o ./$@

src/tkdnd/TkDND_OleDND.o: src/tkdnd/win/TkDND_OleDND.cpp
	$(MAKE) -C src/tkdnd/ -f Makefile.mingwx CC="$(CC)" LINK="$(LINK)" CXXFLAGS="$(CXXFLAGS)" \
              WIN_TARGET="$(WIN_TARGET)" TCL_VERSION="$(TCL_VERSION)" TCL_DIR="$(TCL_DIR)"
