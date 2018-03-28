### help.tcl: Help pages for Scid.

set helpTitle(Contents) "$::scidName"
set helpText(Contents) "<h1>$::scidName</h1>

  <ht><img icon></ht>
  <ht><a Intro>Introduction</a></ht>
  <ht><a GUI>Using the GUI</a></ht>
  <ht><a BrowsingPGN>PGN Files and Scid</a></ht>
  <ht><a Analysis>Running Chess Engines</a></ht>
  <ht><a Scid>Databases and General Use</a></ht>
  <ht><a Related>Links</a></ht>
  <ht><a Author>About</a></ht>
  <br>
  <p><footer>$::scidName  version $::scidVersion</footer></p>
"
set helpTitle(Intro) "$::scidName"
set helpText(Intro) {<h1>Introduction</h1>

<p>
<url http://scidvspc.sourceforge.net/>Scid vs. PC</url>
is a usability and bug-fix fork of <b>Shane's Chess Information Database</b>. With
it you can play chess online or against the computer, browse tournaments
downloaded in pgn format, create huge chess databases, and generate opening and player reports.
</p>
<p><i>
See <run ::tip::show 0><green>Tip of the Day</green></run> for some helpful hints.
</i></p>
</p>

<h3>Features</h3>
<ul>
<li>Overhauled and customizable interface</li>
<li>Engine versus engine computer tournaments</li>
<li>Extra search features, including move, end-of-game, and stalemate/checkmate searches</li>
<li>Drag+Drop file opens for Windows and Linux</li>
<li>Rewritten Gamelist widget with convenient context menus and buttons, and integrated Database Switcher</li>
<li>Many chess engine improvements, including max-ply option, an unlimited number of engines running, and the function hot-keys can be explicitly set.
<li>Tri-coloured Tree bar-graphs, and options for more or less statistics</li>
<li>Ratings Graph can show multiple players, and Score graph is an attractive bar graph</li>
<li>Redone Button and Tool bars</li>
<li>Recent Game and Player-info histories</li>
<li>Bug tested Undo and Redo features</li>
<li>The Help index is meaningful to new users, with links to the game's main features</li>
<li>Clickable Variation Arrows, and Paste Variation feature</li>
<li>A user friendly Annotation feature, with search-to-depth feature</li>
<li>Better support for UTF and Latin character sets in PGN export/imports</li>
<li>Improved and more powerful Tree Mask feature</li>
<li>
<li>Chess variants are unsupported except for Chess960/Fischer Chess - which is supported by a source-code patch.<li>
</ul>
  <p><footer>Updated: Scid vs. PC 4.18 July 2017</footer></p>
}

set helpTitle(GUI) {Scid's GUI}
set helpText(GUI) {<h1>Scid's User Interface</h1>

  <br>
  <ht><a Docking><b>Docked Windows</b></a></ht>
  <ht><a MainWindow>The <b>Main Board</b></a></ht>
  <ht><a Menus><b>Main Menus</b></a></ht>
  <ht><a Moves>Entering <b>Moves</b></a></ht>
  <br>
  <p><footer>Updated: Scid vs. PC 4.14 Dec 2014</footer></p>
}

set helpTitle(BrowsingPGN) "PGN"
set helpText(BrowsingPGN) {<h1>PGN Files and Scid</h1>

<p>PGN is the standard format for chess games, and Scid will happily open and display large game archives.
<i>But PGN is not the native format of Scid's Databases. It takes a little
learning, but using <a Scid>Scid Databases</a> instead of PGN is highly recommended.</i></p>

<p>To open PGN files, use the <run ::file::Open><green>File-<gt>Open</green></run> dialog,
<a Switcher draganddrop>Drag and Drop</a>, or the
<a Pgnscid>Pgnscid</a> utility for quick imports and troubleshooting.</p>


<h3>Viewing Games</h3>

<p>Once you have loaded a game, open the <a PGN>PGN Window</a>
to browse the game. Clicking on moves will advance the game, or 
use the wheel-mouse in the main window. Clicking on <a Comment>comments</a>
allows you to edit them.</p>

<p>In the <a MainWindow GameInfo>Game Info</a> window, you will see the names of the players and
tournament. These names are also clickable, and display information about
the tournament and how the player performed. This is the start of Scid's
database capabilities.</p>

<p>If you have opened a multigame PGN, the <a GameList>Game List</a>
widget allows you to browse the games and select those of interest.
<i>The Game List also serves to select and delete games from Scid's
databases.</i></p>

<h3>Editing Games</h3>

<p>Changes made to a single game PGN file may be saved back to PGN via <run
::pgn::savePgn .><green>File--<gt>Save PGN</green></run>. 

But If you wish to change a file with multiple games, it must first be
converted to a <a Scid>Scid Database</a>. The easiest way to do this is by
opening the <a GameList>Game List</a> and dragging the PGN file to the Clipbase.
After making changes in the Clipbase, then use <a Export>Export</a> to write them
back to PGN.
</p>

<p><footer>Updated: Scid vs. PC 4.8 May 2012</footer></p>
}

set helpTitle(Scid) {General Use}
set helpText(Scid) {<h1>Databases and General Use</h1>

  <p><i>
  Databases are implemented via a fast <a Formats>three file format</a>,
  and populated by importing PGN archives or other databases using the <a
  Clipbase>Clipbase</a> as a cut and paste tool.
  </i></p>

  <p><i>
  Kingbase free database <url http://www.kingbase-chess.net/>http://www.kingbase-chess.net/</url>
  </i></p>

  <h4>Using Databases</h4>
  <ul>
  <li><a Clipbase><b>Clipbase</b> - the default database</a></li>
  <li><a Sorting><b>Sorting</b> databases</a></li>
  <li><a Flags><b>Game Flags</b></a></li>
  <li><a Searches><b>Searches</b></a></li>
  <li><a Reports><b>Reports</b></a></li>
  <li><a Formats><b>Database</b> file formats</a></li>
  </ul>

  <h4>Main Features/Windows</h4>
  <ul>
  <li><a Analysis><b>Analysis</b> Window</a></li>
  <li><a Comment><b>Comment Editor</b></a></li>
  <li><a GameList><b>Game List</b> Window</a></li>
  <li><a PGN><b>PGN (Moves)</b> Window</a></li>
  <li><a PList><b>Player Finder</b> Window</a></li>
  <li><a PInfo><b>Player Info</b> Window</a></li>
  <li><a Tree><b>Tree</b> Window</a></li>
  <li><a Graphs><b>Graph</b> Windows</a></li>
  </ul>

  <h4>Other Utilities and Information</h4>
  <ul>
  <li><a Analysis Annotating>Annotating games</a> automatically</li>
  <li><a CalVar><b>Calculation of Variations</b> training</a></li>
  <li><a Cmdline><b>Command-line</b> options</a></li>
  <li><a Compact><b>Compacting</b> a database</a></li>
  <li><a Maintenance><b>Database maintenance</b> tools</a></li>
  <li><a ECO><b>ECO</b> codes</a></li>
  <li><a EPD><b>EPD</b> files</a></li>
  <li><a Export><b>Exporting</b> games</a></li>
  <li><a Import><b>Import game</b> Window</a></li>
  <li><a LaTeX>Using <b>LaTeX</b> with Scid</a></li>
  <li><a Options><b>Options</b> and preferences</a></li>
  <li><a Pgnscid><b>Pgnscid</b>: converting PGN files</a></li>
  <li><a NAGs>Standard <b>NAG</b> annotation values</a></li>
  <</ul>

  <h2><a Hints>Hints</a></h2>

  <p><footer>Updated: Scid vs. PC 4.7, January 2012</footer></p>
}

set helpTitle(Index) "Scid Help Topic Index"
set helpText(Index) "<h1>$::scidName Help Index</h1>"
append helpText(Index) {
<br>
<a Index A>  A</a> <a Index B>  B</a> <a Index C>  C</a> <a Index D>  D</a> <a Index  E> E</a> <a Index F>  F</a> <a Index G>  G</a> <a Index H>  H</a> <a Index I>  I</a> <a Index  J> J</a> <a Index K>  K</a> <a Index L>  L</a> <a Index M>  M</a> <a Index N>  N</a> <a Index O>  O</a> <a Index P>  P</a> <a Index Q>  Q</a> <a Index R>  R</a> <a Index S>  S</a> <a Index T>  T</a> <a Index U>  U</a> <a Index V>  V</a> <a Index W>  W</a> <a Index X>  X</a> <a Index Y>  Y</a> <a Index Z>  Z</a>
<br>
  <h4><name A>A </name></h4>
  <ul>
  <li><a Analysis>Analysis</a> window</li>
  <li><a Comment>Annotating games</a></li>
  <li><a Analysis Annotating>Annotating games</a> automatically</li>
  <li><a Comment Annotation>Annotation symbols</a></li>
  <li><a NAGs>Annotation symbols</a> (NAGs)</li>
  <li>Entering <a Moves Informant>annotation symbols</a></li>
  <li><a Comment Diagrams>Arrows</a></li>
  <li><a Author>Author, contacting</a></li>
  <li><a Maintenance Autoload>Autoloading</a> a game</li>
  <li><a MainWindow Autoplay>Autoplay mode</a></li>
  </ul>

  <h3><name B>B</name></h3>
  <ul>
  <li><a Finder>Backups</a></li>
  <li><a Tree Best>Best games</a> window</li>
  <li><a Board>Board options</a> (textures and pieces)</li>
  <li><a Searches Board>Board searches</a></li>
  <li><a GameList Browsing>Browsing games</a></li>
  <li><a MainWindow>Button Bar</a></li>
  </ul>

  <h3><name C>C</name></h3>
  <ul>
  <li><a Changelog>Changelog</a></li>
  <li><a Analysis>Chess Engines</a></li>
  <li><a Analysis List>Chess Engine</a> configuration</li>
  <li><a Analysis Debugging>Chess Engine</a>  debugging</li>
  <li><a Maintenance Cleaner>Cleaner</a></li>
  <li><a Clipbase>Clipbase</a></li>
  <li><a Menus Colours>Colours</a> (various colour options)</li>
  <li><a Cmdline>Command-line options</a></li>
  <li><a Comment>Comment Editor</a></li>
  <li><a Maintenance Twins>Comparing games</a> with the Twin Game Checker</li>
  <li><a ComputerGame>Computer Game</a></li>
  <li><a Tourney>Computer Tournament</a></li>
  <li><a Compact>Compacting a database</a></li>
  <li><a Import CCRL>Computer Chess (CCRL) game imports</a></li>
  <li><a Author>Contact information</a></li>
  <li><a Contents>Contents</a></li>
  </ul>

  <h3><name D>D</name></h3>
  <ul>
  <li><a Compact>Database compaction</a></li>
  <li><a Formats>Database file formats</a></li>
  <li><a Maintenance>Database maintenance</a></li>
  <li><a Sorting>Database sorting</a></li>
  <li><a Switcher>Database switcher</a> window</li>
  <li><a GameList Del>Deleted and Filtered games.</a>
  <li><a Flags>Delete flag</a></li>
  <li><a Maintenance Twins>Deleting twin games</a></li>
  <li>Configuring <a HardwareConfig>DGT Electronic Chess Board</a></li>
  <li><a InputEngine>DGT Usage</a></li>
  <li><a Comment Diagrams>Diagrams</a></li>
  <li><a Comment Diagrams>Drawing arrows</a></li>
  <li><a Docking>Docked Windows</a></li>
  <li><a Switcher draganddrop>Drag and Drop</a></li>
  </ul>

  <h3><name E>E</name></h3>
  <ul>
  <li><a ECO>ECO codes</a></li>
  <li><a ECO Browser>ECO Browser</a> window</li>
  <li><a ECO Codes>ECO codes specification</a></li>
  <li><a Menus Edit>Edit menu</a></li>
  <li>Adding <a Maintenance Ratings>Elo Ratings</a></li>
  <li>Character <a Encoding>Encoding</a></li>
  <li><a Analysis>Engines, Chess</a></li>
  <li><a Analysis List>Engines</a> - configuring</li>
  <li><a Analysis Debugging>Engines</a> - debugging</li>
  <li><a Moves>Entering Moves</a></li>
  <li><a EPD>EPD Files</a></li>
  <li><a EPD opcodes>EPD Opcodes</a></li>
  <li><a Export>Exporting Games</a></li>
  </ul>

  <h3><name F>F</name></h3>
  <ul>
  <li><a Formats>File formats</a></li>
  <li><a Menus File>File menu</a></li>
  <li><a Filter>Filter</a></li>
  <li><a Export>Filter, exporting</a></li>
  <li><a Graphs Filter>Filter graph</a></li>
  <li><a FindBestMove>Find Best Move</a> training</li>
  <li><a Flags>Flags</a></li>
  <li><a Options Fonts>Fonts</a></li>
  </ul>

  <h3><name G>G</name></h3>
  <ul>
  <li><a Flags>Game flags</a></li>
  <li><a MainWindow GameInfo>Game Information</a> window</li>
  <li><a GameList>Game List</a> window</li>
  <li><a Menus Game>Game menu</a></li>
  <li><a Searches Header>General searches</a></li>
  <li><a Maintenance Editing>Global substitutions</a></li>
  <li><a Graphs>Graph windows</a></li>
  <li>Using the <a GUI>GUI</a></li>
  </ul>

  <h3><name H>H</name></h3>
  <ul>
  <li><a Searches Header>Header searches</a></li>
  <li><a Menus Help>Help menu</a></li>
  <li><a Hints>Hints</a></li>
  </ul>

  <h3><name I>I</name></h3>
  <ul>
  <li><a Moves Trial>Immediate Threat</a></li>
  <li><a Import>Import</a> window</li>
  <li><a Moves Informant>Informant Symbols</a></li>
  </ul>

  <h3><name J>J</name></h3>
  <ul>
  </ul>

  <h3><name K>K</name></h3>
  <ul>
  <li><a ShortCuts>Keyboard shortcuts</a></li>
  <li><a ShortCuts alpha>Keyboard shortcuts (alphabetical)</a></li>
  </ul>

  <h3><name L>L</name></h3>
  <ul>
  <li><a LaTeX>LaTeX</a> output format</li>
  <li><a Related>Links</a></li>
  </ul>

  <h3><name M>M</name></h3>
  <ul>
  <li><a MainWindow>Main window</a></li>
  <li><a Maintenance>Maintenance tools</a></li>
  <li>Tree <a TreeMasks>Masks</a></li>
  <li><a Searches Material>Material/pattern searches</a></li>
  <li><a Searches Move>Move searches</a></li>
  <li><a Formats>Maximum</a> number of games</li>
  <li><a Menus>Menus</a></li>
  <li><a GameList Browsing>Merging games</a></li>
  <li><a Moves>Move entry</a> and options</li>
  </ul>

  <h3><name N>N</name></h3>
  <ul>
  <li><a NAGs>NAG annotation values</a></li>
  <li><a Maintenance Editing>Names, editing</a></li>
  <li><a Maintenance Spellcheck>Names, spellchecking</a></li>
  <li><a Novag>Novag Citrine</a></li>
  <li><a Variations Null>Null moves</a></li>
  </ul>

  <h3><name O>O</name></h3>
  <ul>
  <li><a ECO>Opening classification</a> (ECO)</li>
  <li><a Reports Opening>Opening Reports</a></li>
  <li><a Options>Options</a></li>
  </ul>

  <h3><name P>P</name></h3>
  <ul>
  <li><a PGN>PGN</a> window</li>
  <li><a BrowsingPGN>PGN and Scid</a></li>
  <li><a Variations Paste>Paste variation</a></li>
  <li><a Export PDF>PDF</a> support</li>
  <li><a Pgnscid>Pgnscid</a></li>
  <li><a PInfo Photos>Photos</a></li>
  <li><a Board>Pieces</a></li>
  <li><a PList>Player Finder</a> window</li>
  <li><a PInfo>Player Information</a> </li>
  <li><a PInfo Photos>Player Photos</a></li>
  <li>Spell Checking <a Maintenance Spellcheck>Player Names</a></li>
  <li><a Reports Player>Player Reports</a></li>
  </ul>

  <h3><name Q>Q</name></h3>
  <ul>
  </ul>

  <h3><name R>R</name></h3>
  <ul>
  <li><a Graphs Rating>Rating graph</a></li>
  <li><a Moves Undo>Redo</a></li>
  <li><a Reports>Reports</a></li>
  <li><a Import CCRL>Round Name</a> problems</li>
  </ul>

  <h3><name S>S</name></h3>
  <ul>
  <li><a Analysis Annotating>Scoring</a> games</li>
  <li><a Graphs Score>Score Graph</a></li>
  <li><a Searches>Searches</a></li>
  <li><a Menus Search>Search menu</a></li>
  <li><a ShortCuts>Shortcuts</a></li>
  <li><a ShortCuts alpha>Shortcuts (alphabetical)</a></li>
  <li><a Formats>si4</a> database format</li>
  <li><a Sorting>Sorting a database</a></li>
  <li><a Maintenance Spellfile>Spellcheck File</a></li>
  <li><a Maintenance Spellcheck>Spellchecking</a> names</li>
  <li>Editing Name <a Maintenance Editing>Spelling</a></li>
  <li><a MainWindow Status>Status bar</a></li>
  <li><a CalVar>Stoyko Exercise</a></li>
  <li><a Switcher>Switcher</a> window</li>
  </ul>

  <h3><name T>T</name></h3>
  <ul>
  <li>Finding extra PGN <a Maintenance Tags>Tags</a>
  <li>The <a MainWindow Toolbar>Toolbar</a></li>
  <li><a Menus Tools>Tools menu</a></li>
  <li><a FindBestMove>Training: Find best move</a></li>
  <li><a CalVar>Training: Calculation of Variations</a></li>
  <li><a Tree>Tree window</a></li>
  <li><a Moves Trial>Trial mode</a></li>
  <li><a Maintenance Twins>Twin (duplicate) games</a></li>
  </ul>

  <h3><name U>U</name></h3>
  <ul>
  <li><a Analysis UCI>UCI Engine</a> Options</li>
  <li><a Moves Undo>Undo</a></li>
  <li><a Encoding>UTF-8</a> character encoding</li>
  </ul>

  <h3><name V>V</name></h3>
  <ul>
  <li><a Variations>Variations</a></li>
  </ul>

  <h3><name W>W</name></h3>
  <ul>
  <li><a Menus Windows>Windows menu</a></li>
  <li><a Docking>Window docking</a></li>
  </ul>

  <h3><name X>X</name></h3>
  <ul>
  <li><a CCXfcc>Xfcc support</a></li>
  </ul>

  <h3><name Y>Y</name></h3>
  <ul>
  </ul>

  <h3><name Z>Z</name></h3>
  <ul>
  </ul>

  <p><footer>Updated: Scid vs PC 4.0, June 2010</footer></p>
}



set helpTitle(Hints) "Scid Hints"
set helpText(Hints) {<h1>Scid Hints</h1>

  <h4>Can I load automatically load a databases</h4>
  <p>
  Only by adding databases, PGN files or <a EPD>EPD files</a>
  to the command line. For example:
  <ul>
  <li> <b>scid  mybase  games.pgn.gz</b> </li>
  </ul>
  will load the database <b>mybase</b> and the gziped PGN file <b>games.pgn.gz</b>.
  </p>

  <h4>How can i change the board size?</h4>
  <p>
  Use the shortcut keys <b>Control+Shift+LeftArrow</b> and
  <b>Control+Shift+RightArrow</b>, or <b>Control+Wheelmouse</b> (in undocked mode).
  </p>

  <h4>Can I hide the next move?</h4>
  <p>
  You can hide the next move via the main context (right-click) menu, <b>Hide next move</b>.
  </p>

  <h4>How can I see the ECO opening code for the current position?</h4>
  <p>
  The ECO code is displayed on the bottom line of the game
  information box, below the chessboard in the <a MainWindow>main window</a>,
  if you have the ECO classification file (<b>scid.eco</b>) loaded. <br>
  The <a ECO>ECO codes</a> help page explains how to load the ECO classification
  file and save options so it will be loaded every time you start Scid.
  </p>

  <h4>While entering a game, I entered an incorrect move half-way though. Can I easily correct it?</h4>
  <p>
  You must use the <a Import>Import</a> window. See <a Moves Mistakes>entering moves</a> for more information.
  </p>

  <h4>How do I copy games from one database to another?</h4>
  <p>
  Use the <a Switcher>Database Switcher</a> to drag and drop (<a Filter>filter</a>)
  games between databases.
  </p>

  <h4>Every time I enter a move to replace another, I get a
  "Replace Move?" dialog. Can I avoid this?</h4>
  <p>
  De-select the <b>Ask before replacing moves</b> option in the <green>Options: Moves</green> menu.
  </p>

  <h4>How can I use the tree window on a selection of games, not my whole database?</h4>
  <p>
  Using the Filter and <a Switcher>Database Switcher</a>, copy the relevant games to <a Clipbase>Clipbase</a>.
  Then open the tree window in the Clipbase.
  </p>

  <h4>The Tree is slow for large databases. How do I speed it up?</h4>
  <p>
  Save the Tree cache often, to save tree results for future use.
  See the caching section of the <a Tree>Tree</a> help page for details.
  </p>

  <h4>Can I edit the PGN representation of the game directly?</h4>
  <p>
  No. Yo must edit its PGN representation using the <a Import>Import game</a> window.
  Just open it (shortcut key: <b>Control+Shift+I</b>) , select
  <b>Paste current game</b>, edit the game and then <b>Import</b>.
  </p>

  <h4>My database has several spellings for some player names. How do I
  correct them?</h4>
  <p>
  You can edit individual names or spellcheck all the names in a database
  with the commands in the <green>File: Maintenance</green> menu.
  See the <a Maintenance Editing>maintenance</a> page.
  </p>

  <h4>I have two databases open: one with my own games, and a large database of
  grandmaster games. How do I compare one of my games to those in the large
  database?</h4>
  <p>
  Just open the <a Tree>Tree</a> window for the reference database and
  switch back to the game to compare by means of the database
  switcher. Alternatively, a base can directly be opened as tree via
  the <term>File</term> menu.
  </p>

  <p><footer>Updated: Scid vs. PC 4.3, December 2010</footer></p>
}


set helpTitle(MainWindow) "Scid Main Window"
set helpText(MainWindow) {<h1>Scid Main Window</h1>
  <p>
  This section explains the main board (showing the current game), the game information area, and a few other widgets.
  Separate help pages describe the <a Menus>menus</a>, <a Menus Colours>colours</a>, how-to <a Moves>enter chess moves</a>,
  <a ShortCuts General>keyboard shortcuts</a> for navigating games, and <a Comment Diagrams>drawing arrows and marks</a>
  </p>
  <p>
  <i>See Scid's <run ::tip::show><green>Tip of the Day</green></run> for mmore helplful hints.</i>
  </p>

  <h4>Main Button Bar</h4>
  <p>
  Key bindings for each button are shown in brackets.
  <ul>
  <li> <button tb_start> Move to the start of the game  [home] </li>
  <li> <button tb_prev> Move back one move  [left] </li>
  <li> <button tb_next> Move forward one move  [right] </li>
  <li> <button tb_end> Move to the end of the game  [end] </li>
  <li> <button tb_invar> Move into a <a Variations>variation</a>  [v] (Holding button shows a menu of available variations)</li>
  <li> <button tb_outvar> Move out of the current variation  [z] (Right-click exits all vars)</li>
  <li> <button tb_addvar> Add a new variation  [control+a]</li>
  <li> <button autoplay_off> Start/stop <a MainWindow Autoplay>Autoplay mode</a> [control+z] (Right-click autoplays all filter games)</li>
  <li> <button tb_trial> Start/stop <a Moves Trial>Trial mode</a> [control+space] </li>
  <li> <button tb_flip> Flip the board [control+f]</li>
  <li> <button tb_windows> Raise open windows [tab]. This feature may only work if you disable your window-manager's focus stealing policy.</li>
  </ul>
  </p><p>
  Additionally, right-clicking Autoplay will autoplay all filter games. Right-clicking 
  </p>

  <h4><name Toolbar>Toolbar</name></h4>
  <p>
  At the top of the main window is a row of small icons called the Toolbar.
  Hovering the mouse over each will show their name.
  Right-clicking the Replace Game icon does a quick save.
  </p>

  <h4><name GameInfo>Game Information Window</name></h4>

  <p><i>The Game Info window can be hidden/unhidden by pressing Control-i</i></p>

  <p>
  Below the Chessboard is general information about the current game. 
  It includes the <b>Player Names</b> and <b>Ratings</b>,
  <b>Event</b> and <b>Site</b> fields, and <b>ECO</b> codes.
  </p>
  <p>
  If Scid can find a suitable <a PInfo Photos>photo file</a>  then player photos will appear here. Clicking on them will make them smaller.
  </p>
  <p>
  The game information area also displays <a PInfo Photos>player photos</a>
  </b>.
  </p>
  <p>
  Display options for this window are in <green>Options-<gt>Game Information</green>.
  </p>

  <h4>Material Values</h4>
  <p>
  On the right hand side of the board the <b>material</b> balance is displayed by small chess pieces.
  One may also right-click the board and select 'Toggle Material' to display all taken pieces.
  </p>

  <h4><name Status>The Status Bar</name></h4>
  <p>
  The Status Bar shows information about the current database and game -
  including game number, game flags, and whether the game has been altered or the DB is read-only.
  Occasionally other information is be shown - such as matching moves (when entering moves with the keyboard).
  </p>

  <h4><name Autoplay>Autoplay Mode</name></h4>
  <p>
  In autoplay mode, Scid automatically plays the moves in the current game,
  moving forward until the end of the game. The time delay between moves can
  be set from the <green>Options--<gt>Moves</green> menu
  </p>
  <p>
  Pressing Control-Autoplay, allows autoplay to progress through all filter games.
  </p>
  <p>
  Autoplay is also started when the
  game is being <a Analysis Annotating>annotated</a>, and pressing the autoplay button will stop annotation.
  </p>

  <p><footer>Updated: Scid vs. PC 4.14 Dec 2014 </footer></p>
}

set helpTitle(Docking) "Docked Windows"
set helpText(Docking) {<h1>Docked Windows</h1>
<p>
Scid can work in two modes. In Docked Windows mode (the default), most windows
are tiled - or docked - into a single large window. 
Docking is enabled or disabled in <b>Options-<gt>Windows</b>,
where you can also load any of the three built-in layouts, or save your own Window
arrangements.  The current window arrangement can also be saved via <b>Options-<gt>Save Layout</b>.
</p><p>
Arranging Docked Windows is a little difficult. One can right-click any tab (except the main
board) and select to move to the side of the current pane, or one can
drag the tab and group it with other tabs in another paned window.
Windows can also be undocked by right-clicking the tab, though Mac OS X does not support undocking windows.</p>
<p>
Window focus automatically follows the mouse around, and also impacts which keyboard bindings are active.
Most bindings are active when the mouse is over the Main Board.</p>
<p>
The window's menus are accessible via clicking the arrow in the window tab.
</p><p>
With the focus on a window tab, one can press the Tab key to move between window panes. Control+Tab switches between active tabs.
</p>
<p><i>
If Scid fails to start, use the </i><b>-nodock</b><i> command-line option to start in undocked mode.
</i></p>
<p><footer>Updated: Scid vs. PC 4.14, Dec 2014</footer></p> }

set helpTitle(Menus) "Menus"
set helpText(Menus) {<h1>Scid Menus</h1>

  <h3><name File>File</name></h3>
  <ul>
  <li><green>New</green>  Creates a new empty Scid Database.</li>
  <li><green>Open</green>  Opens an existing Scid Database.</li>
  <li><green>Save Pgn</green>  Save this game as a PGN file.</li>
  <li><green>Close</green>  Closes the current Scid Database.</li>
  <li><green>Read-Only</green>  Makes the current database read-only.</li>
  <br>
  <li><green>Switch to Base</green>  Switch between the nine available databases (including the <a Clipbase>Clipbase</a>).</li>
  <li><green>Open Base as Tree</green></li>
  <li><green>Open Recent as Tree</green>  Open database in a <a Tree>tree window</a>. The databases will be closed when the tree is closed.</li>
  <br>
  <li><green>Exit</green>  Exit Scid. </li>
  </ul>

  <h3><name Edit>Edit</name></h3>
  <ul>
  <li><green>Setup Board</green>  Set a (non-standard) start position for the current game.</li>
  <li><green>Copy FEN</green>  Set the clipboard to the FEN representing current position.</li>
  <li><green>Copy PGN</green>  Set the clipboard to the game PGN.</li>
  <li><green>Paste FEN</green>  Set-up board according to FEN in clipboard.</li>
  <li><green>Paste PGN</green>  Import a game from PGN in clipboard.</li>
  <br>
  <li><green>Empty Clipbase</green>  Clear the temporary database (<a Clipbase>Clipbase</a>).</li>
  <li><green>Copy to Clipbase</green>  Copies the current game to the <a Clipbase>Clipbase</a> database.</li>
  <li><green>Paste from Clipbase</green>  Pastes the active game of the <a Clipbase>Clipbase</a> to be the active game of the current database.</li>
  <br>
  <li><green>Strip</green>  Strips all comments or variations from the current game.</li>
  <li><green>Undo</green>  Undo changes to this game. The undo buffer holds 20 positions.</li>
  <li><green>Redo</green>  Redo changes.</li>
  <br>
  <li><green>Add Variation</green>  Adds a new empty variation for the
  next move, or for the previous move if there is no next move yet.</li>
  <li><green>Paste Variation</green>  Pastes the current text selection as a variation.</li>
  <li><green>Delete Variation</green>  Provides a submenu of variations for
  the current move, so one can be deleted.</li>
  <li><green>Make First Variation</green>  Promotes a variation to be the
  first variation of the current move.</li>
  <li><green>Promote Variation to Main line</green>  Promotes a variation
  to be the main line, swapping it with its parent.</li>
  <li><green>Try Variation</green>  Enters <a Moves Trial>trial mode</a> for
  testing a temporary variation without altering the current game.</li>
  </ul>

  <h3><name Game>Game</name></h3>
  <ul>
  <li><green>New Game</green>  Resets the active game to an empty state, discarding any unsaved changes.</li>
  <li><green>Replace Game</green>  Saves the current game, replacing it in the database.</li>
  <li><green>Add Game</green>  Save this game, adding one to the database.</li>
  <br>
  <li><green>Set Game Info</green>  Set various detials about the current game.</li>
  <li><green>Browse Games</green>  Show a list of games in this database.</li>
  <br>
  <li><green>Delete Game</green>  Mark as deleted (for removal during compaction).</li>
  <li><green>Reload this game</green>  Reloads the current game, discarding any changes made.</li>
  <br>
  <li><green>Load First/Previous/Next/Last Game</green>  These load the first, previous, next or last game in the <a Filter>filter</a>.</li>
  <li><green>Load Game Number</green>  Loads the game given its game number
  in the current database.</li>
  <br>
  <li><green>Identify opening</green>  Finds the deepest
  position in the current game that is in the ECO file.</li>
  <li><green>Goto move number</green>  Goes to the specified move number in
  the current game.</li>
  <li><green>Find novelty</green>  Finds the first move of the current game
  that has not been played before.</li>
  </ul>

  <h3><name Search>Search</name></h3>
  <ul>
  <li><green>Reset Filter</green>  Resets the <a Filter>filter</a> so all games are included.</li>
  <li><green>Negate filter</green>  Inverts the filter to only include games that were excluded.</li>
  <li><green>Filter to Last Move</green>  Make all games show the last move when loaded.</li>
  <br>
  <li><green>General</green>  Searches by <a Searches Header>header</a> information such as player names.</li>
  <li><green>Current board</green>  Searches for the <a Searches Board>current board</a> position.</li>
  <li><green>Material/Pattern</green>  Searches by <a Searches Material>material</a> or chessboard patterns.</li>
  <li><green>Move</green> Find a certain move or <a Searches Move>move combination</a>.</li>
  <br>
  <li><green>Player Finder</green>  Search for a player name.</li>
  <br>
  <li><green>Load search file</green>  Searches using
  <a Searches Settings>settings</a> from a SearchOptions file.</li>
  </ul>

  <h3><name Windows>Windows</name></h3>
  <ul>
  <li><green>Game Info</green>  Show/Hide the Game information window.</li>
  <li><green>Comment Editor</green>  Opens/closes the <a Comment>Comment Editor</a>.</li>
  <li><green>Game List window</green>  Opens/closes the <a GameList>Game List</a>.</li>
  <li><green>PGN window</green>  Opens/closes the <a PGN>PGN window</a>.</li>
  <li><green>Player Finder</green>  Opens/closes the <a PList>Player Finder</a> window.</li>
  <br>
  <li><green>Maintenance window</green>  Opens/closes the <a Maintenance>Maintenance</a> Window.</li>
  <br>
  <li><green>ECO Browser</green>  Opens/closes the <a ECO browser>ECO Browser</a> window.</li>
  <li><green>Statistics window</green>  Opens/closes the
  <term>Filter statistics window</term> which gives a win/loss summary
  of the games in the <a Filter>filter.</a></li>
  <li><green>Tree window</green>  Opens/closes the <a Tree>tree window</a>.</li>
  </ul>

  <h3><name Tools>Tools</name></h3>
  <ul>
  <li><green>Analysis Engines</green>  Configure Analysis Engines.</li>
  <li><green>Analysis engine #1</green>
  <li><green>Analysis engine #2</green>  Start/stops <a Analysis>analysis engines</a>,
 displaying the evaluation of the current position.</li>
  <br>
  <li><green>Maintenance</green>  Database <a Maintenance>maintenance</a> functions.</li>
  <ul>
  <li><green>Maintenance window</green>  Opens/closes the database maintenance window.</li>
  <li><green>Name editor</green>  Replaces all occurrences of a player,
  <li><green>Compact Database</green>  Perform database compaction.</li>
  <li><green>Sort</green>  Sort base by name, rating, etc.</li>
  <li><green>Spellcheck</green>  Search the spelling file for possible Name corrections.</li>
  <li><green>Delete twin games</green>  Finds <a Maintenance Twins>twin</a> games in the database.</li>
  event site or round name.</li>
  <li><green>Repair Base</green>  Repair broken database.</li>
  </ul>

  <li><green>Player report</green>  Generates an <a Reports Player>opening report</a>.</li>
  <li><green>Opening report</green>  Generates an <a Reports Opening>opening report</a> for the current position.</li>
  <br>
  <li><green>Rel Filter Graph Ratings</green></li>
  <li><green>Abd Filter Graph Ratings</green>  Displays the <a Graphs Filter>filter graphs</a>.</li>
  <li><green>Player Ratings</green>  Displays the <a Graphs Rating>rating graph</a>.</li>
  <li><green>Score Graph</green>  Displays the <a Graphs Score>score graph</a>.</li>
  <br>
  <li><green>Export current game</green>  Saves the current game to a text
  file in PGN, HTML or LaTeX format. See the <a Export>export</a> help
  page.</li>
  <li><green>Export all filter games</green>  Saves all games in the
  search <a Filter>filter</a> to a text file in PGN, HTML or
  LaTeX format. See the <a Export>export</a> help page.</li>
  <br>
  <li><green>Import PGN text</green>  Opens the <a Import>Import window</a>
  for entering a game by typing or pasting its text in
  <a PGN>PGN format</a>.</li>
  <li><green>Import PGN file</green>  Imports a whole file containing
  games in PGN format to the current database. Note, that several PGN
  files can be selected in this dialogue at once.</li>
  <br>
  <li><green>Board Screenshot</green>  Save a screenshot of the board to a file.</li>
  </ul>

  <h3><name Options>Options</name></h3>
  <p>
  The option file is <b>$HOME/.scidvspc/config/options.dat</b>
  (and a few other files in the same directory).</p>
  <p><i>
  On Windows the options directory is (unfortunately) in the program installation directory</i>, <b>bin/config</b>.
  </p>
  <p>
  Options are saved automatically at program exit, or when <b>Options-<gt>Save Options</b> is selected.</p>
  <p>
  The <a Docking>Docked Windows</a> layout is not saved automatically, but may be done manually using <b>Options-<gt>Save Layout</b>.
</p>
  <h3><name Colours>Colours</name></h3>
  <p>
    A few colour settings are available in <b>Options-<gt>Colours</b>.
</p><p>
  The <b>Rows</b> colour is for the highlighted row in the Tree, Books, PlayerFinder windows.
  The Board arrows and drawables' colours are set in the <a Comment Diagrams>Comment Editor</a>.

  <p><footer>Updated: Scid vs. PC 4.17, Mar 2016</footer></p>
}


set helpTitle(Moves) "Entering Moves"
set helpText(Moves) {<h1>Move Entry and Options</h1>
  <p>Scid uses the arrow keys and wheelmouse to move forward and back through a game. And at any time, moves can be entered using the mouse or keyboard.
</p><p>
  Use the mouse to click on a piece, then the destination square. Alternatively one may drag the piece.
  </p>
  <p>
  Keyboard moves are made using standard San or UCI notations.
  Castling is done with <b>OO</b>, or <b>OK</b> and <b>OQ</b>
  for King and Queenside respectively. For more info, see below.
  </p>

  <h4>Replacing Moves</h4>
  <p>
  When you enter a move where a move already exists,
  Scid will ask if you want to replace the
  move (when the old move and all after it will be lost), or
  add the new move as a variation or new mainline. If one finds this annoying, 
  it is possible to skip this dialog by unchecking the
  <green>Options--<gt>Moves--<gt>Ask Before Replacing Moves</green> menu option
  </p>
  <p>
  If the same move already exists, Scid will merely move into this move.
  <i>This behaviour is different when it is end-of-game. Now, Scid will automatically
  create a new variation. This allows one to easily add end-of-game variations.</i>
  </p>

  <h4><name Undo>Undo</name></h4>
  <p>
  Scid vs. PC has Undo and Redo features which store up to 20 
  Move, Variation, Comment or Game Information changes. The Undo and Redo commands are 
  bound to <b>Control-z</b> and <b>Control-y</b> (when the mouse is over the main board),
  but they should be used carefully as these shortcuts
  are also the defaults for editing text windows such as the Comment Editor.
  </p>

  <h4><name Trial>Trial Mode</name></h4>
  <p>
  Trial Mode allows one to make temporary moves and changes to a game.
  Pressing the Trial Mode button a second time ends Trial Mode, and reverts the game to it's original form.
  </p>
  <p>
  Control-Button enters Trial Mode, and automatically adds a <a Variations Null>null move</a>. This is handy to see immediate threats with chess engines.
  </p>
  <p><i>
  Game Saves, Undo and Redo are disabled in Trial Mode.
  When switching databases - Trial Mode automatically exits.
  </i></p>
  

  <h4><name Mistakes>Correcting Mistakes</name></h4>
  <p>
  If you are entering a game and suddenly see an incorrect move several
  moves earlier, it is possible to correct it without losing the extra
  moves you have added. This is done by editing the PGN representation
  of the game. Open the <a Import>Import</a> window, select "Paste Current
  Game", correct the incorrect move, then select "Import".
  </p>

  <h3>Keyboard Move Entry</h3>
  <p>
  To enter moves from the keyboard, simply press letter and digit
  keys - in long or short algbraic notation - and
  without the capture "x" or promotion "=" symbols.
  Moves are matched case-insensitively, so you can type
  nf3 instead of Nf3, for example.
  </p>
  <p>
  As you enter a move, the status bar will show the list of matching moves.
  </p>
  <p>
  The notation for castling is [O][O], but Kingside and Queenside castling
  can also be stipulated explicitly with [O][K] and [O][Q].
  </p>
  <p>
  Lower-case letter matches to a pawn first, so a
  [b] can match to a pawn or Bishop. If there is a conflict
  you must use a capital [B] for the Bishop move.
  </p>

  <h4>Coordinate Move Entry</h4>
  <p>
  This move option allows one to input moves in UCI notation (such as
  a2a4 and g1f3). This feature is enabled default, but it
  interferes with the Auto-Completion feature (which is off by default).
  </p>

  <h4>Auto-Completion</h4>
  <p>
  Is enabled via <green>Options--<gt>Moves--<gt>Keyboard Completion</green>.
  and it makes a move as soon as you have typed enough
  to distinguish it from any other legal move. For example,
  you would only need to type [n][f] instead
  of [n][f][3] in the starting position.
  This feature only works with pawn moves if Coordinate Move Entry
  is disabled.
  </p>

  <h4>Suggested Moves</h4>
  <p>
  The Suggested Move feature, if enabled, highlights all squares
  to which there is a legal move. This can be confusing at times, as is disabled by default in Scid vs. PC.
  </p> 

  <h3><name Null>Entering Null Moves</name></h3>
  <p>
  <a Variations Null>Null Moves</a> (or empty moves) can be useful in variations where
  you want to skip a move for one side. You can enter a null move with the
  mouse by capturing one king with the other king, or with the keyboard by
  typing "<b>--</b>" (that is, pressing the minus key twice).
  </p>

  <h3><name Informant>Common Annotation Symbols</h3>
  <p>
  One may add annotation symbols (or <a NAGs>NAGs</a>) using the keyboard
  (and without the <a Comment>comment editor)</a>. Below are the relevant shortcuts.
  </p>
  <p>
  Scid also uses some of these symbols for <a Analysis Annotating>Automatic
  Annotations</a>. To this end, the symbols are associated
  with a certain pawn value which can be set via 
  <run configInformant><green>Options-<gt>Configure Informant Values</green></run>. 
  </p>

  <ul>
  <li> !	[!][Return]</li>
  <li> ?	[?][Return]</li>
  <li> !?	[!][?][Return]</li>
  <li> ?!	[?][!][Return]</li>
  <li> !!	[!][!][Return]</li>
  <li> ??	[?][?][Return]</li>
  <li></li>
  <li> +-	[+][-]</li>
  <li> +/-	[+][/]</li>
  <li> +=	[+][=]</li>
  <li> =	[=][Return]</li>
  <li> -+	[-][+]</li>
  <li> -/+	[-][/]</li>
  <li> =+	[=][+]</li>
  </ul>

  <p><footer>Updated: Scid vs. PC 4.17 March 2016 </footer></p>
}

set helpTitle(Searches) "Searches"
set helpText(Searches) {<h1>Searches in Scid</h1>
  <p>
  Scid can perform several different types of searches. The main ones are:
  <ul>
  <li><a Searches Header>General</a> (or Header) searches - such as Players, Result or Date</li>
  <li><a Searches Board>Game Positions</a> - matching the Current Board</li>
  <li><a Searches Material>Material and Piece Pattern</a> searches.</li>
  </p>
  <p>
  Searches display their results by adjusting the <a Filter>Filter</a> with matching games.
  By default they will <b>Reset</b> the Filter (ie - search the whole database). But one may also
  <b>Add to</b>, or <b>Restrict</b> the Filter, allowing complex searches to be built up.
  </p>
  <p>
  With Position, Tree, and Material/Pattern searches, when you load a matching game
  it will automatically show the relevant game position, (except
  - in the unlikely event - that the position occurred after move 255 which causes a byte overflow).
  </p>
  <p>
  <i>Most searches only apply to the mainline of a game, and not to variations</i>.
  <br>
  <br>
  <i>Positional Searches can also be performed by the <a Tree>Tree Window</a>.</i>
  </p>

  <h3><name Header>General (Header) Search</name></h3>
  <p>
  This search is for information stored in the game header (such as Player Names, Date etc) or PGN text of a game.
  <br>
  For a successful match, <b>all fields must match</b>.
  </p>
  <p>
  The name fields (White, Black, Event, Site and Round) match on any text.
  They are case-insensitive and ignoring spaces. Eg - <b>Michael</b> will match a host of christian and surnames.
  But more precise matches can be got using wild-cards (<b>?</b> for 1 character, <b> * </b> for
  zero or more characters) - and enclosing the search in double quotes.
  For example - a search for the site <b>USA</b>
  will find American cities but also <b>Lausanne SUI</b>, which is probably
  not what you wanted! <b>"*USA"</b> (note the double-quotes)
  is how to find sites ending with USA.
  Another example - to find only games played in Round 1, use <b>"1"</b>. 
  Without the double-quotes, the Round field will also match 10, 21 etc.
  </p>
  <p>
  If you are searching for a particular player (or pair of opponents) as White
  or Black and it does not matter what color they played, select the
  <b>Ignore Colors</b> option.
  </p>
  <p>
  Finally, the Header search can be used to find any text
  (case-sensitive and without wildcards) in the PGN representation of
  each game.  You may enter up to three text phrases, and they must
  all appear in a game for it to be a match.  This search is very
  useful for searching in the comments or extra tags of a game (such
  as <b>lost on time</b> or <b>Annotator</b>), or for a move sequence
  like <b>Bxh7+</b> and <b>Kxh7</b> for a bishop sacrifice on h7 that
  was accepted.  However, this type of search can be <i>very</i> slow
  since all the games that match other criteria must be decoded and
  scanned for the text phrases.  So it is a good idea to limit these
  searches as much as possible.  Here are some examples.  To find
  games with under-promotions to a rook, search for <b>=R</b> and also
  set the <b>Promotions</b> flag to Yes.  When searching for text that
  would appear in comments, set the <b>Comments</b> flag to Yes.  If
  you are searching for the moves <b>Bxh7+</b> and <b>Kxh7</b>, you
  may want to restrict the search to games with a 1-0 result and at
  least 40 half-moves, for example, or do a material/pattern search
  first to find games where a white bishop moves to h7.
  </p>
  <p>
  <i>Note - if a search by <a ECO>ECO</a> code is performed, games
  that have no ECO code attached are ignored</i>.
  </p>
  <p>
  <i>Searching for extra PGN tags (such as "Annotator") can be done 
  within the <a Maintenance Tags>Maintenance Strip Tags</a> feature.
  </p>

  <h3><name Board>Current Board Searches</name></h3>
  <p>
  This search finds games that contain the currently displayed position,
  ignoring castling and <i>en passant</i> rights.
  </p>
  <p>
  There are four different board searches:
  <ul>
  <li> <b>Exact</b> - the two positions must match on every square </li>
  <li> <b>Pawns</b> - the pawn structure must match exactly, but other pieces
  can be anywhere </li>
  <li> <b>Files</b> - the number of white and black pawns on each file must match
  exactly, but other pieces can be anywhere </li>
  <li> <b>Material</b> - pawns and pieces can be anywhere </li>
  </ul>
  <p>
  The pawns search is useful for studying openings by pawn structure, and
  the files and material searches are useful for finding similar positions
  in an endgame.
  </p>
  <p>
  To search for an arbitrary position, set the board position 
  via <green>Edit--<gt>Setup Board</green> before running the search.
  </p>
  <p>
  You can request that the search look in variations (instead of only
  examining actual game moves) by selecting <b>Look in variations</b>
  , but this may slow the search if your database
  is large with many games and variations.
  </p>

  <h3><name Material>Material / Pattern Searches</name></h3>
  <p>
  This powerful feature is useful for finding end-game or middle-game themes.
  You can specify minimum and maximum amounts of each type of material,
  and patterns such as a bishop on f7, or a pawn on the f-file.
  </p>
  <p>
  A number of common material and pattern settings are provided, such
  as Rook vs. Pawn endings, or isolated Queens pawns.
  </p>
  <p>
  Scid vs. PC allows one to perform material searches that match the end position only;
  though these searches do not match games with non-standard starts and <i>zero length</i>.
  </p>
  <p>
  <i>Hint -
  The speed of pattern searches can vary widely, and be reduced 
  by setting restrictions intelligently. For example,
  if you set the minimum move number to 20 for an ending, all games that
  end in under 20 moves can be skipped</i>.
  </p>

  <h3><name Move>Move Searches</name></h3>
  <p>
  Move Searches allow one to search for particular moves and combinations.
  Enter the move(s) in the entry box, and matching positions will be 
  found. Move combinations can extend unlimited, and to match any
  move, use a '?' character.</p>
  <p> For example, use <b>Rh8 ? R1h7</b> to find doubling of rooks on the H file.</p>
  <p>The <b>Check Test</b> option allows one to input moves of the form <b>Qh7+</b>
  (or <b>Rh8#</b>, but these checks slow the search down a little. Judicious
use of <b>Side to Move</b> can speed up the search.</p>
  </p>

  <h3><name Settings>Saving Search Settings</name></h3>
  <p>
  The Material/Pattern and Header Search windows provide a
  <b>Save</b> button, enabling one to save the current
  search settings to a SearchOptions file (<b>.sso</b>).
  Loading this file is done from <green>Search--<gt>Load Search File</green> menu.
  </p>

  <h3>Search Times and Skipped Games</h3>
  <p>
  Most searches produce a message indicating the time taken and the number
  of games that were skipped. A <b>skipped</b> game is one that can
  be excluded from the search without decoding any of its moves, based on
  information stored in the index. See the help page on
  <a Formats>file formats</a> for more information.
  </p>

  <p><footer>Updated: Scid vs. PC 4.15 June 2015</footer></p>
}

set helpTitle(Filter) "The Filter"
set helpText(Filter) {<h1>The Filter</h1>
  <p>
  Scid's Filter represents a subset of games in the current base or pgn archive. At any time, each game is either
  included in or excluded from the filter, as displayed by the <a GameList>Game List</a> widget.
  </p>
  <p>
  The Filter is often used to show <a Searches>Search</a> results.
  </p>
  <p><i>Do not confuse Filtered games with Deleted games. They are <a GameList Del>separate things.</a></i></p>
  <p>
  You can also copy all games in the Filter of one Database to another
  using the <a Switcher>Database Switcher</a>.
  </p>

  <p><footer>Updated: Scid vs. PC 4.6 October 2011</footer></p>
}

set helpTitle(Clipbase) "The Clipbase"
set helpText(Clipbase) {<h1>The Default Database</h1>
  <p>
  In addition to physical databases existing on disk, Scid provides
  a temporary one known as the <b>Clipbase</b>. It is always open, and
  can be used to cut and paste games between other bases via the <a
  Switcher>Database Switcher</a>. Additionally, each base has a game numbered 0
  which also acts as a scratch game.
  </p>
<h3>Use</h3>
  <p>
  The Clipbase is useful for merging
  the results of searches on more than one database or for treating the
  results of a search as a separate database.
  </p>
  <p>
  For example, assume you want to prepare for an opponent and have searched
  a database so the <a Filter>filter</a> contains only games where
  the opponent played white.
  You can copy these games to the Clipbase by opening the Gamelist / <a Switcher>Switcher</a> and
  dragging from the database to the Clipbase.
  Then, click on the Clipbase, and open
  the <a Tree>Tree Window</a> to examine that players repertoire.
  </p>
<h3>Notes</h3>
  <p>
  You can copy games from one open database directly to another
  without using the Clipbase as an intermediary.
  </p>
  <p>
  The Clipbase cannot be closed; selecting <green>File--<gt>Close</green> is equivalent
  to emptying it with <green>Edit--<gt>Empty Clipbase</green>.
  </p>
  <p>
  Games in the Clipbase consume your computers memory. So please consider this when copying a large number of games.
  </p>

  <p><footer>Updated: Scid vs. PC 4.15 September 2015</footer></p>
}

set helpTitle(Variations) "Variations"
set helpText(Variations) {<h1>Variations</h1>

  <p>
  A Variation is an alternative sequence of
  moves at a particular point in a game. They can contain
  comments and recursive subvariations.
  </p>
  <p>The <button tb_outvar 32> <button tb_invar 32>  <button tb_addvar 32>
  buttons are used to exit, enter and add variations respectively.
  And in the <b>Edit Menu</b>, and <a PGN>PGN</a> context menu, are further useful commands.
  </p>
  <p><i>
  If you want to enter a variation without being asked for a
  confirmation, use the middle mouse button of the mouse to enter the
  move.
  </i></p>

  <h4>Variation Arrows</h4>
  <p>
  Scid vs. PC has clickable Variation Arrows (enabled via
  Options / Moves / Show Variation Arrows). But for this feature to work, the
  <b>Variations Window</b> (Options / Moves / Show Variation Window) must first
  be disabled.
  </p>

  <h4><name Paste>Paste Variation</h4>
  <p>
  This feature (in the Edit Menu) will try to add the currently selected text as a variation.
  It is not very sophisticated; but very useful when adding a <b>single line of MulitPV analysis</b>
from a paused engine.
  </p>
  <p>
  <i>Please see <a Variations Null>below</a> in regards to adding null moves.</i>
  </p>

  <h4>Keyboard Shortcuts</h4>
  <p>
  When a move has variations they are shown in the game information
  area. You can click on a variation to enter it, or press "v", whence
  the <b>Variation Window</b> will pop up.
  Setting Options-<gt>Moves-<gt>ShowVariationWindow will automatically show
  this window when a variation is found.</p>
  <p>In the variation window one can select a variation with the up/down
  keys and then hitting enter, or pressing 0, 1, 2 etc for each variation.
  Additionally, 'vv' will enter the first var.
  </p><p>
  To leave a variation, use "z" or up-arrow.
  </p>

  <h3><name Null>Null Moves</name></h3>
  <p>
  Null moves are used to skip a move by one side. This is of course illegal,
  but is a well known idea, and useful for analyzing your opponent's immediate threats.
  </p>
  <p>
  Null moves are displayed as "<b>--</b>" and can be made by typing this string, or by
  using the mouse to make a <b>King</b> x <b>King</b> capture.
  They are not a part of the PGN Standard, so when
  <a Export>exporting games</a> to PGN, Scid provides (among
  other options) one to convert null moves to comments - for compatibility with other software.
  </p>
  <p><i>
  Some other programs use <term>Z0</term> as a null move, and Scid will successfully import this move.
  </i></p>
  <p>
  One final issue arises with Engine Analysis. If you have null move <b>at then
end</b> of a game or variation , the <a Analysis>analysis window</a> will not
successfully add a variation to it. Instead, one should <b>first add a single
move</b>, then variations may be added. This note also applies to the <b>
<b>Paste Variation</b> feature.
  </p>

  <p><footer>Updated: Scid vs. PC 4.8 June 2012</footer></p>
}

set helpTitle(Comment) "Comment Editor"
set helpText(Comment) {<h1>The Comment Editor</h1>
  <p>
  The <run ::commenteditor::Open><green>Comment Editor</green></run> lets you add
  comments and <a NAGs>annotations</a>, and also includes a small board for drawing arrows (etc). <i>These three sections can be shown/hidden by pressing the <img bookmark_down> button.</i>
  </p>

  <h3>Comments</h3>
  <p>
  Comments are text associated with individual moves.
  You can add comments by typing them in the entry box (where
  the Control-A, Control-Z and Control-Y shortcuts can be used to
  manipulate text and undo changes).
  Comments are <b>automatically stored</b> whenever you move to another position in the game,
  or move the mouse away from the Comment Editor.
  </p>

  <p>
  Comments may also exist at the start of a game or variation.
  To add a comment <b>prefixing a variation</b>
  go to the variation's first move; then move back one move before entering the comment.
  </p>

  <p><i>With the focus in the Comment Editor, one can move the game forward and back by pressing the control+left/right keys. Control-Enter saves the comment and closes the window.</i></p>
  

  <h3><name Annotation>Annotation Symbols</name></h3>
  <p>
  Scid uses the <a PGN>PGN Standard</a>
  and <a NAGs>NAGs</a> for annotation symbols.
  While the most common symbols  are displayed
  as Ascii characters (such as "!" or "+-"), others must be entered as the appropriate
  numeric value (ie - a number from 1 to 255).
  For example, the NAG value 36 means "White has the initiative" and will
  be displayed as "$36" in the PGN window.
  </p>
  <p>
  The most common move evaluation symbols (!, ?, !!,
  ??, !? and ?!) can be added firectly from the main window by typing the symbol followed by
  the [Return] key.  This is especially useful if you are <a Moves>entering chess moves</a>
  using the keyboard.
  </p>

  <h3><name Diagrams>Diagrams</name></h3>
  <p>
  In addition to text comments, Scid can also draw colour symbols and arrows on the board.
  In the Comment Editor, press <img bookmark_down> to see a small board and diagrams.
  </p>

  <h4>Drawing Arrows</h4>
  <p>
  Arrows can be done in two ways. In the Main Board, while holding Control, click on the start square then end square.
  Alternatively in the Comment Editor, arrows can be drawn (and erased) by dragging between two squares.
  </p>
  <p>
  The technical format of arrows is:
  <b>[%arrow fromSquare toSquare color]</b>
  where <b>fromSquare</b> and <b>toSquare</b> are square names like d4.
  </p>
  <p> Normally, the comments associated with these diagrams are hidden in the PGN
window, but can be viewed by deselecting "Hide Square/Arrow Codes" in the PGN window
options.</p>
  <h4>Colouring Squares</h4>
  <p>
  Click on any square in the Comment Editor board to add the selected colour/mark.
  The technical format is:
  <b>[%mark square color]</b>
  where <b>square</b> is a square name like d4 and <b>color</b> is any
  recognized color name (such as red, blue4, darkGreen, lightSteelBlue)
  or RGB code (six hexadecimal digits such as #a0b0c8).
  If the color is omitted, it defaults to red.
  </p>
  <p>
  A comment may contain any number of color commands, but each must have
  in its own <b>[%mark ...]</b> tag.
  For example, the comment text
  <b>Now d6 [%mark d6] is weak and the knight can attack it
  from b5. [%mark b5 #000070]</b>
  will color d6 red and b5 with the dark-blue color #000070.
  </p>

  <p><footer>Updated: Scid vs. PC 4.14, Nov 2014</footer></p>
}

set helpTitle(Switcher) "Database Switcher"
set helpText(Switcher) {<h1>The Database Switcher</h1>
  <p>
  The Database Switcher, located at the bottom of the <a GameList>Game List</a>,
  gives visual feedback on open databases. 
  The name, <a Filter>filter</a> state, and icon
  of each database is displayed, and the active database is highlighted
  with a coloured background.
  </p>
  <p>
  Right-clicking a database produces a popup menu. From this, one can perform <a Filter>filter</a> ops, mark base as Read-Only or
  close the database. There is also an extra menu which shows <a Tree>Tree</a> or <a Tree Best>Best Games</a>, or changes the icon.
  Middle clicking a base will show/hide the icons.
  </p>
  <h2><name draganddrop>Drag and Drop</name></h2>
  <p>
  Two separate forms of Drag and Drop are enabled.
  <br> <br>
  * Files can be opened from the Windows, KDE or Gnome file managers by dropping
  them onto the Switcher at the bottom of the Game List. Files can also be dropped to the Gameinfo widget in the main board.
  <br> <br>
  * Dragging within the Switcher from one base to another, copies filtered games.
  This is an important way to manage and copy games within databases.
  </p>

  <p><footer>Updated: Scid vs. PC 4.16, January 2016</footer></p>
}


set helpTitle(GameList) "Game List window"
set helpText(GameList) {<h1>The Game List</h1>

<p>The <run ::windows::gamelist::Open><green>Game List</green></run>
shows all filter games in the currently open database/PGN file.</p>
<p>Below the Game List are various buttons and entries,
and at the bottom you'll find the <a Switcher>Database Switcher</a>.</p>
<p>Clicking a game will select it. Select multiple games using Control+Click and Shift+Click.
Right-clicking game(s) presents a context menu for various actions. Double-clicking loads a game.</p>
<p>Right-clicking a Column Title allows one to reorder them, or change the alignment.</p>
<p>Quick searches can be performed by entering text in the combo-box and pressing Enter, or clicking the <b>Filter</b> button.
Use "+" as a logical AND with the <b>Filter</b> button. For example: "Kasparov+Karpov".
Similarly, the entry-box allows finding a particular game by number. Both these widgets will load the current game by pressing Control+Enter.</p>
<p><i>To see games matching the current position, set 'adjust filter' in the <a Tree>Tree window</a>.
For more info about Searches and Filters, <a Searches>see here</a> or below.
</i></p>
<h3>Sorting the Game List</h3>
<p>The database can be <b>permanently sorted</b> by clicking column titles.
Sorting is not undoable, and may affect search and tree performance. For more details see <a Sorting>Sorting Database</a>.
</p>

  <h3><name Del>Filtered and Deleted Games</name></h3>
  <p>Scid has two notions of removed games - which can be confusing.</p>

  <p>The first is <b>Filtered Games</b>.  In the Game List widget,
  right-clicking some games and selecting <b>Remove</b>
  will remove those games from the filter. They will disappear from the Game List,
  but can easily be seen again by reseting the filter with <b>Reset</b>. Filtering games
  has no effect on the database.</p>

  <p><b>Deleted</b> games on the other hand, are not removed from the Game List.
  They are simply marked as deleted, and no further action is taken until
  the database is compacted - whence they will be <b>permanently deleted</b> from the database.
  This can be done by the <b>Compact</b> button, or 
  from the <a Maintenance>maintenance</a> window.</p>
<p><i>The Game List only deletes (up to) a page of games at a time. Deleting or manipulating ALL filtered games,
is also done from the Maintenance window.</i></p>


<p><i>The default database (Clipbase) cannot be compacted</i>.</p>

<h3>Buttons</h3>
<ul>
<li><img tb_save> - replace current game</li>
<li><img tb_bkm> - show bookmarks</li>
<li><img tb_gfirst> - load first filter game</li>
<li><img tb_gprev> - load previous filter game</li>
<li><img tb_gnext> - load next filter game</li>
<li><img tb_glast> - load last filter game</li>
<li><b>Reset</b> - resets game filter</li>
<li><b>Negate</b> - negate game filter</li>
<li><b>Filter</b> - performs a general filter for entered text</li>
<li><b>Find</b> - (Press 'Enter' in the entrybox) perform a (slow) general find for entered text</li>
<br>
<li><b>Current</b> - highlights the current game (if it has not been filtered)</li>
<li><b>Compact</b> -  database (game) compaction.</li>
</ul>
</p>
<h3>Other Features</h3>
<ul>
<li>Pressing Delete removes selected game(s) from filter</li>
<li>Control+Delete - Toggle 'Delete' flag.</li>
<li>Control+a - Select all visible games</li>
<li>Control+n - Negate the filter</li>
<li>Control+r - Reset the filter</li>
<li>Control+c - Copy game to clipbase</li>
<li>Control+v - Paste game from clipbase to current base</li>
<li>Control+Enter load selected game</li>
<br>
<li>Resize column widths by dragging the column edge.</li>
<li>Drag and Drop files in the switcher (from Windows/KDE/Gnome).</li>
<li>Middle-click the Game List to hide the button bar.</li>
</ul>

  <h3><name Browsing>Browsing and Merging Games</name></h3>
  <p>
  From the Gamelist context menu, one may <b>Browse</b> a game. This is a game
  preview which displays in a separate window, without comments or variations.
  </p>
  <p>
  From this preview, one may <b>Merge</b> the game back into the
  current one as a variation. The merge starts from where the games differ (taking transpositions into account),
  and you can change the last move number to be merged, according to whether
  you are interested in adding the whole game or just its next few moves.
  </p>
<p><i>The board size can be resized by Control+Wheelmouse or Control+Shift+Left/Right.</i></p>
  

  <p><footer>Updated: Scid vs. PC 4.14, March 2015</footer></p>
}


set helpTitle(Import) "Import window"
set helpText(Import) {<h1>The Import Window</h1>
  <p>
  The <run importPgnGame><green>Import Window</green></run> provides an easy way for you to paste a game
  into Scid from some other application or window.
  </p>
  <p>
  The top-most frame is where to enter or paste
  the game in PGN format, and the lower frame 
  provides feedback of any errors or warnings.
  </p>

  <p>
  <i>Scid provides several ways to access games in PGN. As well as the Import
  Window, games can be opened via <run ::file::Open><green>File-<gt>Open</green></run>.
  Large PGN archives can sometimes give Scid problems. A more reliable import method is the
  <a Pgnscid>Pgnscid</a> utility</i>
  </p>

  <h3>Editing the Current Game</h3>
  <p>
  The Import window also doubles as a way to make changes or corrections
  to a game. First paste the current game
  with <b>Paste Current Game</b>, then edit the moves
  , and click <b>Import</b> when done.
  </p>

  <h3>Notes</h3>
  <p>
  Scid expects to see PGN header tags such as
  <ul>
  <li> <b>[Result "*"]</b> </li>
  </ul>
  before any moves, but pasting a game fragment such as
  <ul>
  <li> <b>1.e4 e5 2.Bc4 Bc5 3.Qh5?! Nf6?? 4.Qxf7# 1-0</b> </li>
  </ul>
  (without any header tags) is generally ok.
  </p>

  <h3><name CCRL>CCRL Imports / Round Name issues</name></h3>
  <p>
  The Computer Chess Rating Lists distributes PGN archives which can cause Scid problems.
  They use the Round field to represent unique game numbers, and Scid only supports 262,143 Round Names.
  You may wish to replace the "Round" field with "Rd", or some other tag.
  </p>
  <p>
  This can be achieved using the <b>sed</b> utility and the command
  <ul><li>sed -e "s/\[Round /[Rd /" <lt> CCRL.pgn <gt> new.pgn</li></ul>
  Sed comes with Linux and OSX, but Windows users may wish to try this version.
  <url http://sed.sourceforge.net/grabbag/ssed/sed-3.59.zip>http://sed.sourceforge.net/grabbag/ssed/sed-3.59.zip</url>.
</p>

  </p>

  <p><footer>Updated: Scid vs. PC 4.3, February 2011</footer></p>
}

set helpTitle(Export) "Exporting Games"
set helpText(Export) {<h1>Exporting Games</h1>
  <p>
  Commands to export games to other formats are found in the <b>Tools</b> menu.
  Four file formats are supported:
  <ul>
  <li><a PGN>PGN</a> The default chess game format</li>
  <li><b>HTML</b> for web pages</li>
  <li><b>HTML and JavaScript</b> for interactive web pages</li>
  <li><b>LaTeX</b> a popular typesetting system</li>
  </ul>
  Additionally, on Unix systems, LaTeX can be converted to <a Export PDF>PDF</a>.
  </p>

  <h3><name Null>PGN Compatability Issues</name></h3>
  <p>
  Scid's si4 database format does not enforce any particular character encoding. Scid vs. PC now exports PGN 
  to either Latin-1 or Utf-8 format. For more information, see the <a Encoding>Encoding</a> section.
  </p>
  <p>
  The <url http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm>PGN Standard</url>
  has no <a Variations Null>null move</a> concept. So
  if you export games including them to PGN, other
  software may not be able to read these games correctly.
  </p>
  <p>
  To solve this problem, one should enable the <b>Convert null moves to comments</b> option.
  Of course, if you wish to later reimport the PGN file
  , with null moves preserved, disable this option.
  </p>
  <p>
  Scid's use of Ascii strings (such as <b>+=</b> to represent annotations is also against the PGN standard.
  For compatability, <b>Symbolic annotation style</b> should be set to <b>$2 $14</b>.
  </p>
  <p>
  The use of '{' and '}' inside comments is also against the standard, and Scid vs. PC replaces these with parenthesis when exporting PGN.
  </p>


<p>
  Diagrams are drawn (in HTML or LaTeX formats),
  wherever a <b>D</b> nag, or a comment (starts with <b>#</b>) appears.
  In the case of HTML, Scid's bitmaps directory should be placed alongside your exported file.
  </p>

  <h3>HTML with JavaScript</h3>
  <p>
  While the HTML export generates a static file that may contain
  static board diagrams, this format offers dynamic HTML, that allows
  to move through the game interactively with the mouse.
  </p>
  <p>
  This format consists of several files that need to be stored in a
  specific structure. Therefore, it is advisable to first generate a
  empty folder that will contain these files. The name of the main
  file can be specified and it will get the extension html (e.g.
  mygame.html). This file should be loaded by the web browser. The
  other files are required to exist in exactly the position the export
  filter places them. However, the whole folder can easily be uploaded
  to some web server.
  </p>

  <h3>LaTeX</h3>
  <p>
  Scid can export games to a LaTeX file.  Games are printed two columns
  to a page, and moves are in figurine algebraic notation with proper
  translation of the nag symbols. </p>
  <p>
  See <a LaTeX>Using LaTeX with Scid</a> for more information.
  </p>
  <h3><name PDF>Converting LaTeX to PDF</name></h3>
<p>
  can be achieved on Unix systems with the <b>pdflatex</b> command.
  A quick conversion is of the form:
<br>
<ul><li>pdflatex -interaction batchmode mytexfile.tex</li></ul>
</p>

  <p><footer>Updated: Scid vs. PC 4.15 June 2015</footer></p>
}

set helpTitle(Encoding) "PGN Encoding"
set helpText(Encoding) {<h1>PGN Encoding</h1>
  <h3>PGN Encoding and UTF-8</h3>
  <p>
Scid vs. PC can <a Export>export PGN</a> to UTF-8 or Latin-1 (ISO 8859/1) character sets.
English speakers will generally prefer Latin-1 
(the <url http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm>PGN</url> standard)
, but other locales may find UTF-8 a better choice.
</p>
<p>
Enforcing selection of one of these is necessary because <a Formats>si4</a> has weaknesses concerning the
internationalization of game data. Player, Site, Event names, etc, and PGN comments,
can be stored with <b>any</b> character-set encoding. 
</p>

<h3>Technical Details</h3>
<p>These factors affect the encoding of Scid databases.</p>
<ul>
<li>Older Linux/Unix distributions were installed with Latin-1 encoding as
default, and older MS Windows used CP1252. But UTF-8 is now the <i>default</i> system encoding for both Linux and Windows.
Currently Scid interprets PGN files as system encoded, without actually checking if this is correct.</li>
<br>
<li>Many applications produce PGN files with unsuitable character
encodings. It is not uncommon that a PGN file has extended ASCII (CP850 for
example), or is UTF-8 encoded but without a leading UTF-8 BOM.
When importing these PGN, Scid is interpreting the content as system encoded,
which may result in the games not being displayed properly.</li>
</ul>

<p>
The PGN export will be done with the use of a character-set detector. This
detector examines the content of the text, and
converts it to either Latin-1 or UTF-8 (depending on the user's choice).
In many cases it is even able to convert defective encodings into a proper character-set.</p>
<p>
Implementing this feature in Scid vs. PC is also an important step towards the support of the <b>C/CIF archive</b> format,
which only allows valid UTF-8, and the character-set detector will be used for a proper conversion.
</p>

  <p><footer>Updated: Scid vs. PC 4.15 June 2015</footer></p>
}

set helpTitle(LaTeX) "Scid and LaTeX"
set helpText(LaTeX) {<h1>Using LaTeX with Scid</h1>
  <p>
  Latex is an attractive and comprehensive documentation system -
  used by Scid for previewing player and opening reports and exporting games -
  but it is tough to install and use.
  </p>
  <p><i>
  Scid vs. PC no longer uses Chess12 for LaTeX output. The new Skak implementation is mostly complete,
but not quite. It remains todo: Implement comments inside variations, castling diagrams, and adding a
"Compact" option which disables diagrams and score graphs and restricts the game header to (half the page width).
  </i></p>
  <h2>Installation</h2>
  The author installed texlive on Linux Mint 17 (Ubuntu 14.04), and additonally these packages
  </p>
  <ul>
<li>latex-xcolor (xcolor.sty)</li>
<li>texlive-games (xskak.sty)</li>
<li>texlive-generic-extra, (lambda.sty) </li>
<li>texlive-latex-extra (xifthem.sty)</li>
<li>pgf (pgfcore.sty)</li>
<li>lmodern (lmodern.sty)</li>
<li>texlive-pstricks (pstricks-add.sty)</li>
<li>texlive-xetex (xelatex)</li>
  </ul>
<h2>Generating PDF</h2>
<p>Latex will generally need to be converted to PDF. Scid's Latex preview function will do this, but for manually
converting to pdf, use this command <b>xelatex file.tex</b></p>

<p>The older method for doing this is<ul>
<li>latex file.tex       // This will create a file.dvi file</li>
<li>dvi2ps file.dvi     // Then this will create a file.ps file</li>
<li>ps2pdf file.ps     // Then this will create a file.pdf</li>
</ul></p>
<h2>Viewing</h2>
  <p>
  To use the Latex preview options for the Opening and Player Reports,
  it is recommend to have a pdf viewer available in your 
  environment/system. Compatible viewers are
  </p>
  <ul>
        <li><b>Linux</b> - evince, okular, etc</li>
        <li><b>OS X</b> - TODO</li>
        <li><b>Windows</b> - TODO</li>
  </ul>
</p><p>
More generally, on Linux the tex output generated by Scid is first converted into pdf format using 
"pdflatex -interaction=nonstopmode" , and then opened by the viewer (default evince).
</p>
<p>
Both the renderer and viewer are configurable in <run setExportText Latex><green>Options-<gt>Exporting-<gt>Latex</green></run>
</p>
<h2>OS X Notes</h2>
<p>
Ileano writes<ul>
<li>On El Capitan ...  It is necessary to add in the Latex options "\usepackage{auto-pst-pdf}"
, and  call the pdflatex tool  with "pdflatex -shell-escape myfile.tex".
Also ...  add "PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin" to the startup scripts</li></ul>
</p>

  <p><footer>Updated: Scid vs. PC 4.17, Sept 2016</footer></p>
}

set helpTitle(PGN) "PGN Window"
set helpText(PGN) {<h1>PGN Window</h1>

  <p>
  This section explains how to use Scid's <run ::pgn::Open><green>PGN Window</green></run>.
  </p>

  <p> <i>Other help subjects include <a BrowsingPGN>PGN files and Scid</a>,
  <a Export>Exporting</a>, and <a Import>Importing games</a></i> </p>

  <p>
  <i>Portable Game Notation is a common 
  <url http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm>standard</url>
  for representing chess games.  A PGN file consists of two
  sections - a 'Header' containing tags such as
  [White "Kasparov, Gary"] and
  [Result "1/2-1/2"], and a 'Body' containing the actual moves in standard
  algebraic notation (SAN) along with any <a Variations>variations</a>, <a NAGs>annotation
  symbols</a> and <a Comment>comments</a></i>.
  </p>

  <h3>General Use</h3>
  <p>
  The PGN Window allows one to navigate around the game. Clicking 
  on moves will jump to them, clicking on comments edits them.
  (And just like the main window, the <b>arrow keys</b>, <b>v</b> and <b>z</b> allow for
  game navigation).  Using the middle button displays a small
  board. Right-clicking displays a context menu.
  </p>

  <h3>Options</h3>
  <p>
  The PGN menu contains options about how the game is displayed.
  Some of them include: Colour or Plain text, Short Header, Column Style and <b>Scrollbar</b>.
  Personalised <b>Colours</b> may also be selected.
  </p>
  <p>
  One slow systems, deselecting <b>Color Display</b>, will speed things up but with reduced features.
  You can also alter the format of comments and variations, choosing
  to display them indented on a separate line for greater visibility.
  </p>

  <h3>Context Menu</h3>
  <ul>
     <li><term>Delete Variation:</term> Deletes the current variation </li>
     <li><term>Make First Variation:</term>
     Moves the current variation to the first position of all variations on that level </li>
     <li><term>Promote Variation to Mainline</term>
     Promotes the current variation to the mainline and demotes the
     current mainline to a variation.  </li>
     <li><term>Strip:Comments</term> Removes all comments </li>
     <li><term>Strip:Variations</term> Removes all variations </li>
     <li><term>Strip:Moves from the beginning</term> </li>
     <li><term>Strip:Moves to the End</term> </li>
  </ul>

  <p><footer>Updated: Scid vs. PC 4.10, July 2013</footer></p>
}


set helpTitle(Tree) "Tree Window"
set helpText(Tree) {<h1>Tree Window</h1>
  <p>
  The <run ::tree::Open><green>Tree Window</green></run> is an powerful Scid
  feature. It shows the success rates of moves from the current
  position; in the form of statistics, and a tri-coloured graph representing
  white-wins, draws, and black-wins.
  </p>
  <p><i>
  Scid's Tree search is fast because of a novel idea - we
search for games that do not reached this position!
  </i></p>
  <h3>Opening a Tree</h3>
  <p>One can open a database and then select <b>Windows--<gt>Tree Window</b>,
  use the <b>Control-T</b> short-cut, or <b>Open Base as Tree</b> from the file menu.
  This last method means games in one database can be examined via the tree from a different database.</p>

  <h3>General Use</h3>
  <p>
  The Tree Window shows statistics about the next move, as calulated from all games in the current base.
  One may choose to show extended info by pressing <button tb_info>
  <br>
  The Score is always computed from white's perspective, so 100% means all White wins and 0% means all black
  wins. Games with no result do not contribute to the percentage drawn, but as half-won/half-loss.
  </p>
  <p>
  Clicking on a move adds that move to the game.
  </p>
  <p>
  The moves in the tree window can be sorted by
  Move (alphabetically), ECO code, Frequency, or Score.
  </p>
  <p>
  The Adjust-Filter checkbox alters the gamelist/filter so that only games matching the current position are displayed.
  Its behaviour is a little complicated. Deselecting Adjust-Filter will set the regular filter to the <i>current</i>
  (adjusted) filter. But closing the Tree, will restore the regular filter to how it was when Adjust-Filter was selected.
</p>
  <h3><name Best>Best Games Window</name></h3>
  <p>
  The <button b_list> button in the Tree window, shows games matching the current position.
  </p><p>
  Normally, the highest rated games are displayed first, but by changing the
  'Sort' button, games will be shown in their normal database order.
  (The default for this feature can be altered in the Tree options menu).
  </p>
  <p>
  You can also restrict the list to show games with a particular result,
  and alter the displayed columns by right-clicking the column titles.
  </p>

  <h3>Tree Masks</h3>
  <p> Tree Masks
  provide additional information beyond pure statistical data, and can be
  imagined as a transparent layer above the current tree that holds additional
  data. For more info see <a TreeMasks>here</a>.
  </p>

  <h3><name Lock>Locking the Tree Window</name></h3>
  <p>
  Each tree window is associated with a specific base, that is, if
  several bases are opened simultaneously, several tree windows may
  exist. If the <term>Lock</term> button in the tree window is
  enabled, closing the tree window will also close the database
  associated with this specific tree. Additionally, this also closes
  associated graph or best games windows. If the <term>Lock</term>
  button is not checked closing the tree will leave all these windows
  opened and just close the tree view of the base.
  </p>
  <p>
  Note that opening a base as tree from the file menu will
  automatically lock the database by default.
  </p>

  <h3><name Training>Training</name></h3>
  <p>
  When the Training button <button tb_training> is selected,
  Scid will randomly make a move every time you add a move to the game.
  The move Scid chooses depends on database statistics, so a move played
  in 80% of database games will be chosen by Scid with 80% probability.
  Turning on this feature, then hiding (or iconifying) the Tree window and
  playing openings against a large database, is a great way to test your
  knowledge of your opening repertoire.
  </p>

  <h3>Caching for Faster Results</h3>
  <p>
  Scid maintains a cache of tree search results for the positions with the
  most matching games. If you move forward and back in a game in tree mode,
  you will see the tree window update almost instantly when the position
  being searched for is in the cache.
  </p>
  <p>
  The tree window has a file menu command named <term>Save Cache</term>.
  When you select this, the current contents of the tree cache in memory
  are written to a file (with the suffix <b>.stc</b>, in the same directory as the database)
  to speed up future use of Tree mode with this database.
  </p>
  <p>
  The <term>Fill cache file</term> command in the file menu of the tree
  window fills the cache file with data for many opening positions.
  It does a tree search for about 100 of the most common opening positions,
  then saves the cache file.
  </p>
  <p>
  The maximum number of lines in the Cache can be configured by File /
  Cache size. The default are up to 1000 lines.
  </p>
  <p>
  Alternatively, one can fill the cache also with the content of a
  base or a game by choosing File / Fill Cache with base and File /
  Fill Cache with game, respectively. The cache will be filled with
  the contents of these including all variations. This is most helpful
  if one has one or more repertoire bases that can serve as input. 
  <p>
  Tree refresh can be dramatically enhanced if the database is sorted
  by ECO code then compacted (see the <a Maintenance>maintenance</a>
  window). Once this is achieved (the whole process can last several
  hours), turn on the option <term>Fast mode</term>. The refresh of
  the Tree window will be 20 times faster in average at the cost of
  some inaccuracies (games not in current filter will not be taken
  into account). By turning off the <term>Fast mode</term> option you
  will see the difference in the number of games when all the
  transpositions are taken into account.  If you want to get a preview
  of statistics then get a precise Tree, use the option <term>Fast and
  slow mode</term> 
  </p>
  <p>
  Note that a tree cache (.stc) file is completely redundant; you can remove
  it without affecting the database, and in fact it is removed by Scid
  whenever an action occurs that could leave it out of date; for example,
  adding or replacing a game, or sorting the database.
  </p>

  <p><footer>Updated: Scid vs. PC 4.18, July 2017</footer></p>
}

set helpTitle(TreeMasks) "Tree Masks"
set helpText(TreeMasks) {<h1>Tree Masks</h1>
  <p>
  The <a Tree>Tree window</a> displays information on all the moves in the
  database made from the current position.  <b>Masks</b> add additional
  information, and can be imagined as a transparent layer above the Tree that
  holds data such as commentaries for moves or positions, own
  evaluations, and ones Opening Repertoir.
  </p>
  <p>
  They are stored in a Mask file (<b>.stm</b> - Scid Tree Mask) and are independent of any
  database. That is - once created, a Mask can be used with any database by
  loading it from the Tree Mask menu.
  </p>
  <p>
  When a Mask is opened, the display of the Tree window changes. First of all,
  all moves present in the mask are highlighted in purple.  Additionally, nags and
  markers are shown in front of a move, and Comments concerning the move are
  shown afterwards.  Finally, the current postition may also hold a comment.
  </p>
  <p>
  <i>The indepencence of Masks from a database
  make them a very powerful tool for handling opening repertoires.
  Contrary to the traditional way of opening lines, Masks
  have the advantage to handle transpositions transparently, simply
  because they are based on the current positions instead of a line
  leading to it.</i>
  </p>
  <h3>Using Masks</h3>
  <p>
  The Tree window has a Mask sub-menu, where Masks are opened or created (as well as other features).
  </p><p>
  Once a Mask is opened, commentary can be added 
  by <b>right-clicking moves</b> and adding comments/nags/markers (etc, see below).
  </p>
  <p>
  Whole lines may be marked by <b>holding the Control key</b> down while right-clicking.
  I.E. - for most operations, all *preceding* moves will be marked this way. The exception is
  RemoveFromMask, which will remove all *following* moves.
  </p>
  <p>
  Moves not displayed in the Tree may be added to the Mask via
  the "Add Move to Mask" context menu.
  </p>
  <p>
  Don't forget to save the Mask! You will be prompted to do it
  if you close a Mask that has been modified, or if a Tree Window is closed.
  The most recent Mask file may be automatically opened via Tree-<gt>Options-<gt>Auto-Load-Mask.
  </p>
  <p><i>
  For an opening repertoire , one might consider having
  two masks, one for White, and one for Black openings.
  </i></p>
  <h3>Configuring Masks</h3>
  <ul>
  <li><term>Markers</term> (1 and 2) allow two graphical markers to be attached to a move. They
  are mainly meant to handle opening repertoires. The available options
  are:
     <ul>
     <li> <img ::rep::_tb_include> Include line in repertoire</li>
     <li> <img ::rep::_tb_exclude> Exclude line from repertoire</li>
     <li> <img ::tree::mask::imageMainLine> Main Line</li>
     <li> <img tb_bkm> Bookmark</li>
     <li> <img ::tree::mask::imageWhite> White</li>
     <li> <img ::tree::mask::imageBlack> Black</li>
     <li> <img tb_new> New line</li>
     <li> <img tb_rfilter> To be verified by further analysis</li>
     <li> <img tb_msearch> To train</li>
     <li> <img tb_help_small> Dubious line</li>
     <li> <img tb_cut> To remove</li>
     <li> No Marker</li>
     </ul>
  </li>
  <br>
  <li><term>Color</term> Allows to add a little coloured square in
  front of the move for ones own highlighting. To remove it again
  select <b>White</b></li>
  <br>
  <li><term>NAG</term> symbols are the simplest annotation symbol. The
  menu displays only those nags sensible for a move (not a position)
  which results in the following symbols possible <term>!!, !, !?, ?!,
  ?, ??, ~</term>
  </li>
<br>
  <li><term>Comment Move</term> adds a text comment for
  the move/line. Double-clicking comments allows easy editing.
  associated. Note that only a part of the first line shows up there
  to give some visual feedback that commentary exists. The whole
  comment shows up in a tooltip once the mouse is moved over the line
  in question.
  </li>
  <br>
  <li><term>Comment Position</term> can be used to add a comment for the
  current position. This comment is shown on top of Tree
  window once the commented position is reached.
  </li>
  </ul>
  <h3>Mask Searches</h3>
  <p>
  <i>When using Mask Searches, enabling the Tree </i><b>Adjust Filter</b><i> checkbox is recommended.</i>
  </p>
  <p>
  The Mask Search feature enables searches for commentary, symbols etc.
  Selecting the <b>Search</b> button displays a list of all positions found 
  in FEN notation, followed by the move in question and commentary if any.
  </p>
  <h3>Mask Display</h3>
  <p>
  The Mask Display feature shows the current Mask in a line
  style. Starting at the current position all subsequent moves are
  sorted into some unfoldable tree to give an overview of the current
  lines of play - similar to what is found in many repertoire books.
  Not all information is displayed (e.g. Comments are
  shorted to fit the display). Additionally, as Masks
  work on positions rather than move sequences, they may contain loops
  (ie. transpositions) which can't be properly unfolded in a line wise
  display. i.e this display may be cut at a certain point.
  </p>
  <h3>Conversion to Masks</h3>
  <p>
  Setting up a mask can be a tedious task, especially for complex
  opening repertoires. However, if such a repertoire is available as a
  Scid Database or a number of PGN games, or lines stored in usual
  chess games, Scid can use that information to set up suitable
  Masks automatically.
  </p>
  <p>
  First of all one has to load the information into a Scid Database.
  In case the information is already available as a Scid Database this
  is as easy as opening it. In case a PGN file is use it should be
  either imported into a Scid Database or one can use the
  Clipbase to import it temporarily (In which case one
  should make sure the Clipbase is empty before
  importing).
  </p>
  <p>
  The next step is to open the tree for the just opened Scid Database.
  Then a new Mask should be created or an existing one
  opened. <i>This function may be used to consolidate
  serveral bases into a single Mask</i>.
  </p>
  <p>
  Now, the Mask can be filled automatically with the game content of the
  database. In this process, comments within the games will be converted to move
  comments (appending to those existing eventually) in the Mask. NAGs will be
  added as well. To initiate this process one can chose either <b>Fill with
  game</b> to fill the Mask with the contents of a single game, or <b>Fill with
  Database</b> to loop over all games in the database.
  </p>
  <p>
  <b>Note</b> filling a Mask with an entire base can be quite time consuming.
  </p>
  <p>
  <b>Note</b> The Mask is filled with all moves till the
  end of the game including all variations within a game. Therefore,
  it is sensible to use only bases for this procedure that end the
  games as soon as the middle game is reached.
  </p>

  <p><footer>(Updated: Scid vs. PC 4.14, March 2015)</footer></p>
}


set helpTitle(Compact) "Database compaction"
set helpText(Compact) {<h1>Database Compaction</h1>
  <p>
  Database Compaction is a specific type of
  <a Maintenance>maintenance</a> that keeps a database as small and
  efficient as possible.
  It involves removing any unused space in its files.
  </p>
  <p><i>
  File Compaction is irreversible. After compaction, deleted Names/Games are gone forever.
  </i></p>

  <h3>Name File Compaction</h3>
  <p>
  Over time, you may find a database starts to contain a number of Player,
  Event, Site or Round names that are no longer used in any game. This will
  often happen after you spellcheck names. The unused names waste space in
  the name file, and can slow down name searches.
  Name File compaction removes all names that are not used in any games.
  </p>

  <h3>Game File Compaction</h3>
  <p>
  Whenever a game is replaced or deleted, wasted space is left in the game
  file (the largest of the three files in a Scid Database). Game File
  compaction removes these deleted games.
  </p>
  <p>
  Game File compaction is recommended after a database <a Sorting>sort</a>
  , to keep the order of the Game File consistent with the sorted Index File.
  </p>

  <p><footer>Updated: Scid vs. PC 4.13, August 2014</footer></p>
}


set helpTitle(Maintenance) "Database Maintenance"
set helpText(Maintenance) {<h1>Database Maintenance</h1>
  <p>
  Most Scid Database maintenance can be done from the
<green><run ::maint::Open>Maintenance Window</b></run></green> (Control+m).
  </p>
  <p>
  Operations include - using <a Flags>Delete (and other Game Flags)</a>, <a Maintenance Spellcheck>Spellcheck Names</a>,
  <a Compact>Compact</a> and <a Sorting>Sort</a> databases, and delete PGN Tags, Comments and Variations.
  </p>
  <p><i>
  <a Flags>Flags</a>, <a Compact>Compaction</a> and <a Sorting>Sorting</a> features are documented separately.
  </i></p>

  <h3><name Twins>Deleting Twin Games</name></h3>
  <p>
  <run markTwins><green>Delete Twin Games</green></run> facilitates removal of duplicate
  games.  It identifies game twins, and flags one as deleted.
  Two games are considered twins if their Players, and
  any other tags that you specify, exactly match.
  If you specify the "Same moves" option (strongly recommended) each pair must have the
  same moves; up to the length of the shorter game , or 60 moves maximum.
  </p>
  <p>
  When you have identified twins, it is good practice
  to confirm they have been correctly marked. Selecting "Set filter to twins to be deleted" 
  allows easy perusal through the <b>Twin Game Checker</b> window
  (which automatically appears). Here, tag differences are highlighted, and
  Scid vs. PC shows a inline comparison of game variations and comments.
  </p>
  <p>
  Use the Arrow Keys to progress through the games, "1", "2" and "t" keys to
  toggle the Delete Fields, and "u" to Undelete both games.
  </p>
  <p>
  <i>To actually delete the games, you must <a Compact>compact</a> the database.</i>
  </p>

  <h3><name Editing>Editing Names</name></h3>
  <p>
  The 
  <run nameEditor><green>Name Editor</green></run>
  is a tool to selectively edit entity names (eg Player names).
  </p>
  <p>
  Each unique name is only stored once in the <a Formats>name file</a>, so changing a name
  actually changes all occurrences of it. Similarly, some names in the name file may not actually be used. To remove such names, 
perform a <a Compact>namebase compaction</a>.
  </p>
  <p>
  An single asterisk '*' may be used to match <b>any</b> name. This global substitution is only available for 
  the Event, Site and Round names - not the Player, Elo or Date names.
  </p>
  <p>
  Date and Eventdate fields must be of the form YYYY.MM.DD (year, month, day)
  </p>
  <p>
  <i>Please take care when using the Name Editor. Changes are not properly undoable if the new name already exists. There is also a safety mechanism - Using '*' or '?' is not allowed with 'All games in database'.</i>
  </p>

  <h3><name Spellfile>Spellcheck File</name></h3>
  <p>
  The spellcheck file <b>spelling.ssp</b> contains information about Player Names, Titles, Birth & Death dates, and Country(s) of origin.
  <b>Please use with caution</b>. The names it contains may not be
  unique, and player initials may be incorrectly identified.
  It is also possible to substitute the larger <b>ratings.ssp</b>, which includes Elo ratings and FIDE Biographical data.
  </p>
  <p>
  The file should be loaded on startup, or can be <run
  readSpellCheckFile><green>loaded manually</green></run>.<i>
  Updated versions are available at the
  <url http://sourceforge.net/projects/scid/files/Player Data/>Scid Website</url>.
  </i></p>
  
  <h3><name Spellcheck>Spell Checking</name></h3>
  <p>
  Scid's Spell Checking feature is used to standardize Player, Event, Site and Round names throughout a database.
  To do so, a <a Maintenance Spellfile>spelling</a> file must be loaded.
  </p>
  <p>
  When Spell Check is run, a list of proposed corrections is produced. These
  should be perused and edited before actually making the corrections on disk.
  <i>The normal keyboard shortcuts for Cut, Copy, Paste, Undo and Redo apply</i>.
  </p>
  <p>
  The format of each correction is:
  <br><b>"Old Name" <gt><gt> "New Name"</b> (<b>N</b>) <b>Birthdate</b>--<b>Deathdate</b><br>
  There should be no space before "Old Name", and "N" represents the number of games matching the original player name.
  </p>
  <p>
  One may discard any correction by deleting it, or adding a
  space or any other character at the start of the line.  Player names with a
  <b>surname only</b> do not get corrected by default.
  Simliarly , <b>Ambiguous</b> name substitutions are not performed unless one
  manually removes the Ambiguous prefix from each line.
  </p>
  <p>
  Name substitution will not occur in games dated before the Player's birth, or after death - unless the birth and death dates are removed from the translation.
  </p>
<p>
For problematic PGN files, it may be necessary to use regexps and a word processor such as "vi".
For example - the first two examples remove four digit ELOs from player names. The last removes trailing spaces from all tags.
<br>
:%s/\(White .*\) *[[:digit:]][[:digit:]][[:digit:]][[:digit:]].*"/\1"/g
<br>
:%s/\(Black .*\) *[[:digit:]][[:digit:]][[:digit:]][[:digit:]].*"/\1"/g
<br>
:%s/ *"]$/"]/
</p>

  <h3><name Ratings>Adding Elo Ratings</name></h3>
  <p>
  The spelling file <b>ratings.ssp</b> contains ELO / Date information for rated players.
  The <b>Add Elo Ratings</b> button (in the Maintenance window) searches games and adds the appropriate
  ELO rating <b>at the date of the game<b>. There is also the option to overwrite existing ratings.
  </p>
  <p>
  The <a Maintenance Spellfile>spellcheck file</a> provided with Scid does not contain
  the Elo rating information needed for this function. Instead,
  the larger ratings.ssp file should be used.
  </p>
  <p>
  <i>Ratings are not added to games with known aliases.
  One may wish to run the Spell Checker first, which changes names using player aliases.
  </i>
  </p>


  <h3><name Cleaner>The Cleaner</name></h3>
  <p>
  The <run cleanerWin><green>Cleaner</green></run> window
  is a tool for doing a number of maintenance tasks at one time.
  You can choose which tasks you want to do, and Scid will
  perform them on the current database without requiring user interaction.
  This is especially useful for maintenance of large databases.
  </p>

  <h3><name Autoload>Autoloading a Game</name></h3>
  <p>
  When a database is opened, one may automatically load a particular game
  using the Maintenance <b>Autoload game</b> feature. 
  <i>Note: Because of design of si4 header, this number's upper limit is 16,777,214 (Approximately 2^(8*3)).</i>
  </p>
  </p>

  <h3><name Tags>Strip Comments/Variations</name></h3>
  <p>
  <b>Use with caution</b>. Bulk stripping Comments and Variations cannot be undone.
  </p>

  <h3><name Tags>Strip Extra Tags</name></h3>
  <p>
  This feature scans the database for extra PGN tags (such as "Annotator").
  Then, one may strip these tags, or adjust the filter to
  show the matching games.
  </p>

  <h3><name Check>Check Games</name></h3>
  <p>
  This feature performs basic checks on every game/filter games.
  </p>
  <p>
  Each Game 
  <br>
  * Has index entry fetched
  <br>
  * Read from disk
  <br>
  * And is Decoded.
  </p>
  <p>
  Any errors are reported.
  </p>

  <h3>Repair a Base</h3>
  <p>
  In the rare case that a Scid Database is corrupted, one might try to
  repair it using Tools--<gt>Maintenance--<gt>Repair base. For this to work,
  the base in question must not be opened (which is not possible in
  most cases anyway). Scid will then try its best to get the database
  back in a consistent and usable state.
  </p>

  <p><footer>Updated: Scid vs. PC 4.17, August 2016</footer></p>
}

set helpTitle(Sorting) "Sorting a database"
set helpText(Sorting) {<h1>Sorting Databases</h1>
  <p>
  Scid has a fast and powerful <run makeSortWin><green>Sort Database</green></run>
  feature. Sorts can be performed on single fields (eg: Dates, Names and ECO codes),
  or multiple fields, with the first field having priority, and so-on.
  </p>

  <p>
  The available criteria/fields are
  </p>
  <ul>
  <li> Date (oldest games first)
  <li> Year (same as date, but using the year only)
  <li> Event name
  <li> Site name
  <li> Country (last 3 letters of Site name)
  <li> Round name
  <li> White name
  <li> Black name
  <li> Rating (average of White and Black ratings, highest first)
  <li> Result
  <li> Length (number of full moves in the game)
  <li> ECO (<a ECO>Encyclopedia of Chess Openings code</a>)
  <li> Variations (number of variations in game)
  <li> Comments (number of comments in game)
  <li> Random
  </ul>

  <h3>Sorting is Permanent</h3>
  <p>
  When you sort a database which is not read-only, the
  results are saved immediately and the <b>order of games is
  permanently changed</b>.  If this is not desired,
  one may first make the database <b>read-only</b> from the
  <a Maintenance>maintenance</a> window, or sort the games in the clipbase.
  </p>
  <p>
  When sorting a read-only database (or PGN archive)
  , the results cannot be saved and the order of games
  is lost when the file is closed.
  </p>

  <h3>Database Performance</h3>
  <p>
  When a database is sorted the Index File is altered but the Game File
  is not (leaving the game file records out of order relative to the Index File).
  This can result in slow <a Tree>tree</a>, position and material/pattern
  <a Searches>searches</a>. After sorting, one should reorder the game file by
  <a Compact>compacting</a> it to maintain good search performance.
  </p>
  <p>
  Additionaly, only databases sorted by <a ECO>ECO</a> codes (and subsequently
compacted) can use <b>fast tree searches<b>. 
  </p>

  <p><footer>Updated: Scid vs. PC 4.10 August 2013</footer></p>
}

set helpTitle(Flags) "Game Flags"
set helpText(Flags) {<h1>Game Flags</h1>

  <p>
  Game Flags are indicators of some characteristic, such as <b>Brilliant Play</b> or <b>White Opening</b>,
  and are used for classifying games and enabling fast database searches.
  There are <b>12 user flags</b> and <b>6 custom flags</b>
  </p>
  <p>
  Additionally, <b>Delete</b> is just a special-case flag, which
  indicates games will be removed when the database it is next <a Compact>compacted</a>.
  </p>
  <p>
  The 12 user flags are
  </p>

  <ul>
  <li>W - White opening</li>
  <li>B - Black opening</li>
  <li>M - Middlegame</li>
  <li>E - Endgame</li>
  <li>N - Novelty</li>
  <li>P - Pawn structure</li>
  <li>T - Tactics</li>
  <li>Q - Queenside play</li>
  <li>K - Kingside play</li>
  <li>! - Brilliancy</li>
  <li>? - Blunder</li>
  <li>U - User-defined</li>
  </ul>
  <p>
  The 6 custom flags (1 to 6) are user changeable, and can have labels up to eight characters long.
  </p>

  <p>
  Flags are set in the <a Maintenance>Maintenance Window</a>. Scid vs. PC also allows quick flag tagging via the <a
  GameList>Game List</a> context menu.
  </p>
  <p>
  You can use a <a Searches Header>Header Search</a> to find all
  games in a database that have a particular flag turned on or off,
  or use flags as part of more complex searches.
  </p>
  <p>
  Since all the user flags (except Delete) have
  no special significance, one may use them for any purpose.
  For example, you could use the Kingside (K)
  flag for kingside pawn storms, or kingside heavy piece attacks,
  or even for endgames with all pawns on the kingside.
  </p>
  <p>
  Note, sensible handling of flags can speed up searches significantly!
  </p>
  <p>
  The following functions of Scid set or require flags:
  <ul>
     <li><a Analysis Annotating>Mark tactical exercise</a>: sets the (T) flag
     <li><a FindBestMove>Training-<gt>Find best move</a>: evaluates the (T) flag
  </ul>

  <p><footer>Updated: Scid vs. PC 4.4, May 2011</footer></p>
}

set helpTitle(Analysis) "Analysis Window"
set helpText(Analysis) {<h1>Analysis Windows</h1>

  <p> Scid vs. PC has powerful chess analysis features. Multiple engines can
run simultaneously; they can be matched against each other in a <a
Tourney>Computer Tournament</a>, and log files can be browsed from within the app -
making for easier <a Analysis Debugging>Debugging</a>.
</p>

  <h3>Getting Started</h3>

  <p>A few engines come preinstalled, while others can be added via the <a
  Analysis List>Engine Configuration</a> window.</p>

  <p>Starting them can be done in various ways
  By <run ::startAnalysisWin F2><green>pressing F2</green></run>
  , F3 or F4 from the Configuration Widget, or via the <b>Tools--<gt>Start Engine</b> menu.
  Additionally, Engine 1 can be start/stopped by <b>double-clicking the statusbar</b>.
  Right-clicking the Statusbar will dock/undock the engine,
  which, when running docked, will run at low CPU priority.<p>

  <p>
  <b>Space Bar</b> is bound to engine start/stop. Pressing <b>Enter</b> will add the engine's current best move, and <b>Control+Enter</b>, the whole line.
  </p>
  <p>
  At the top of the window are some useful Buttons.
  <a Analysis Moves>Engine Analysis</a> occupy most of the space,
  and at the bottom is some <a Analysis Info>Extra Information</a> (which may be hidden).
  </p>

  <p>
  <i>The analysis output has three modes: No wrap, Word wrap, and Hidden.
  These are toggled between by right-clicking the analysis window.</i>
  </p>

  <h3><name Buttons>Buttons</h3>
  <p>
  At the top you'll find many cryptic buttons...
  <p>
  <ul>
  <li> <button tb_play 32> <b>Play</b> / <button tb_pause 32> <b>Pause</b>. Start and stop engine analysis.
  <li> <button tb_addmove 32> <b>Add Move</b> 
  adds the engine's best move to the current game.  (Right clicking adds the Engine Score).</li>
  <li> <button tb_addvar 32> <b>Add Variation</b>  adds the whole main line.  (Right clicking adds the second variation if multi-pv enabled)</li>
  <li> <button tb_addallvars 32> <b>Multi-PV</b>  if the engine supports multi-pv, add all principal variations.</li>

  <li> <button tb_lockengine 32> <b>Lock Analysis</b> to a certain position.
  Hover cursor over this button to see stats for locked game.
  After a while, to add this analysis to game, return to the locked position, 
  press Pause, Unlock, and Add Variation.</li>
  <li> <button tb_annotate 32> <b>Annotate</b> game (see below).</li>
  <li> <button tb_exclude 32> <b>Exclude Move(s)</b> helps refine the engine's search list (mainly UCI engines only). Hovering mouse shows the current excluded moves.</li>
  <li> <button tb_cpu 32> <b>Low CPU priority</b> 
  give the engine a low priority for CPU
  scheduling. On Windows, engines are run on low priority by default.
  On Unix systems the engines priority can not be set back to normal.  </li>
  <li> <button tb_info 32> <b>Show Info</b> show additional information.</li>
  <li> <button tb_coords 32> <b>Show Board</b> displays a small working board.
  If engine is locked, the board displays the locked position.</li>
  <li> <button autoplay_off 32> <b>Shoot out</b>, or "demo", mode allows the engine to play out the game. (Engine must be running first).</li>
  <li> <button tb_training 32> <b>Training</b> feature (see below).</li>
<br>
  <li> And for Xboard engines only:</li>
  <li> <button tb_update 32> <b>Update</b> gets the engine to display a statistics line,
with the format "stat01: time nodes ply mvleft mvtot mvname". The results can be found in the engine's log file.</li>
  </ul>
  </p>

  <h3><name Moves>Moves</name></h3>
  <p>
  Each line of the main text widget contains an <b>Engine Analysis Info</b>.
  The first number is the current <b>Search Depth</b>. The next (prefixed with
  a +/-), is a <b>Move Score</b>.  It is measured in pawn units from the
  perspective of white - a positive score means white is ahead, a negative score
  means black. Then follows the move predictions.  </p>
  <p>
  Many recent <term>UCI</term> engines also allow to analyse several lines at
  once. Using this <term>Multi-PV</term> feature, the user can see the second or
  third (etcetera) best continuations.  The best line is always on top and
  highlighted.  If an engine allows for <term>Multi-PV analysis</term>, the spin
  box can be used to set the number of principal variations shown.  In this case,
  instead of the calculation history, only the resulting principal lines are
  shown. The spin box is disabled if an engine does offer this feature.
  </p>

  <h3><name Info>Extra Information</h3>
  <p>
  At the bottom is some additional technical info. If this is hidden, it
  can been seen by pressing the <b>Engine Info</b> button.
  <br>
  <br>
  <b>Depth</b>: the search depth already reached by
  the engines calculations (in half moves).
  <br><b>Nodes</b>: the number of positions analyzed for the current
  result (and the number of positions per second).
  <br><b>Time</b>: the amount of time spent for the current analysis.
  </p><p>
  Additional information includes the number of tablebase hits, a
  more exact number of nodes analyzed per second, the watermark of the
  engines hash and the current CPU load.
  </p>

  <h1>Features</h1>

  <h3><name Annotating>Annotating Games</name></h3>
  <p>
  Games can be automatically analyzed using
  the Annotate Button <button tb_annotate> (in the <a Analysis>Analysis Engine</a> toolbar).
  This feature adds Scores, <a Comment>Comments</a>, <a Moves Informant>Informants</a>,
  Bestlines to games. </p>

  <p>
  There is also a new option to add <b>Missed Mates</b>. This adds all missed
  and shorter mates which are at least a few ply shorter of the 'Depth per move'
  setting (as at higher ply, the engine's results are not too reliable).
  Additionally, the added line may not be complete - ie. it may not end in mate.
  This is due to the engine reporting "Mate in n", but not actually giving the
  whole line/PV, which is a common UCI engine oddity.
  </p>

  <p><i>
  The Annotate button is only shown in the </i><b>first</b><i> engine window.
  </i></p>

  <p>After configuring the options and pressing OK, Autoplay
  Mode is enabled, tree updating is disabled, and the engine starts its analysis.
  A variation and/or score is
  automatically added for each position as the engine processes the game.
  Only positions from the current one until the end of the game
  are annotated, so you can skip annotation of opening moves
  by moving to a mid-game position before starting.
  Pressing the Annotate Button a second time cancels annotation.
  </p>

  <p><b>Options</b>
  <ul>
     <li><b>Move Control</b> Whether to process each move for a fixed time, or fixed depth (UCI only).</li>
     <li><b>Depth per move</b> Number of half-moves engine spends on analysing each move (UCI only).</li>
     <li><b>Seconds per move</b> Number of seconds engine spends on analysing each move.</li>
     <li><b>Blunder Threshold</b> A Score which determines whether it's a bad move or not,
     representing pawns (i.e. 0.5 means an evaluation drop of half a pawn).  </li>
     <li><b>Cut Off Threshold</b> Above this score, dont worry about adding variations, as game is won.</li>
<br>
     <li><b>Add Scores/Variations</b> Choose when to add Scores and Variations.
     (Scores can then be utilized by the <a Graphs Score>Score Graph</a>)</li>
     <li><b>Which Side</b> Select which side(s) should be annotated.</li>
<br>
     <li><b>Score format</b> Select how single scores will be formatted. The square bracket options will hide comments in the PGN window if PGN-<gt>Hide Codes is selected.</li>
     <li><b>Add annotator tag</b>
     Store engine name as an "Annotator" tag in the PGN header.</li>
     <li><b>Process variations</b> Recursively process variations.</li>
     <li><b>Batch annotation</b> 
     Automatically process multiple games, saving them as we go.</li>
     <li><b>Opening errors only</b> Only check for opening errors.
     (up to the move specified).</li>
     <li><b>Mark tactical exercises</b> This can be used to
     generate exercises for the training function <a FindBestMove>Find
     Best Move</a>. (UCI only).</li>
  </ul>
<p><i>
  Informant values are also <run configInformant><green>configurable</green></run>.                     
</i></p>

  <h3>Training</h3>
  <p>
  The Training Button <button tb_training> (only available for engines 1 and 2) allows
  one to play against the engine.  The engine moves first (from the current position) and may be stopped
  by pressing the button again.
  The time for each move is fixed, and analysis results are not updated while training mode is on.
  </p>

  <h2><name List>Configuring Engines</name></h2>
  <p>
  The <run ::enginelist::choose><green>Tools--<gt>Analysis Engines</green></run>
  widget is where you can <b>Configure</b>, <b>Add</b>, and <b>Start</b> Chess Engines.
  </p>

<p>
  Scid vs. PC installs a few engines by default. To install new ones you'll need to know
  the program's <b>Command</b>, any <b>Parameters</b> it takes,
  whether it is uses the <b>UCI or Xboard</b> protocol, and also the
  <b>Directory</b> it should be run in.
  This sounds complicated, but is not too hard :-)
  Sticking points are likely to be the choice of
  which directory to use, and whether it's UCI or not.</p>


  <h3>Details</h3>
<p> Many engines require an
  initialization in their start directory to run
  properly.  Other engines, like Crafty, write log files to the
  directory they start in, so write access will be required.
  If the directory setting for an engine
  is ".", Scid will just start the engine in the current directory.
  </p>

  <p>
  If an engine fails to start, try
  changing its directory setting. To avoid engines creating log files
  in many different directories, I recommend trying the <b>~/.scidvspc</b>
  button. Engines necessitating opening books and/or .ini files, will need
  a directory of their own however.
  </p>
  <p>
  UCI and Xboard (also known as Winboard) are two protocols
  for communicating with engines, and it is necessary to set this flag accordingly.
  If you're not sure, try one then the other, as nothing will break. Some chess
engines support both formats.
  </p>
  <p>
  If an engine needs additional parameters for startup they can be specified in the
  <b>Parameters</b> field. ... Please refer to the engines documentation.
  </p>
  <p><b>Webpage</b> allows you to set the engines homepage. This
  comes in handy to check for updates e.g. or to have a look at recent
  developments. Pressing the <term>Open...</term> button will open
  this page in the web browser.
  </p>
  <p>After the engine is configured, Scid vs PC will give it a <b>Date</b> stamp, according to the
  executable's modification time.</p>

  <h2><name UCI>UCI Configuration Options</name></h2>

  <p>
  UCI Engines can be configured by pressing <button uci> or <b>Configure</b> in the Edit Window, whence
  a dialog with the engines parameters will be shown. (Gilles - where is the help section :|).
  Scid generally ignores options of the format UCI_* , according to the
<url http://wbec-ridderkerk.nl/html/UCIProtocol.html>UCI standard</url>. Additionally, Chess960 support is not enabled
because implementation is very problematic.</p>

  <h2><name Debugging>Debugging Engine Crashes</name></h2>
  <p>
  If an engine fails to start, or crashes, one may examine its log file.
  These are kept in the Scidvspc's log directory and can be viewed
via the <button tb_annotate> button in the <run ::enginelist::choose><green>engine configuration</green></run> widget.
The <b>Log Size</b> is the max number of lines in the log. Setting it to zero disables logging altogether.</p>

  <p><footer>Updated: Scid vs. PC 4.15, September 2015</footer></p>
}

set helpTitle(CalVar) "Calculation of variation"
set helpText(CalVar) {<h1>Calculation of Variations</h1>
  <p>
   This training exercise (also known as the <b>Stoyko Exercise</b>)
   involves analysing a complex position, to find and evaluate as many sound
   lines as possible.
  </p> 
  <p>
  Configuration is fairly straight-forward, and involves
  <ul>
     <li>* The UCI engine to use</li>
     <li>* <b>Initial thinking time</b> - seconds for the engine to analyse the position</li>
     <li>* <b>Variation thinking time</b> - seconds for the engine to analyse each variation entered by the user</li>
  </ul>
  Clicking Start begins the exercise.
  </p>

  <p>
  After the engine's initial thinking time, the "Done with Position" button will become active,
  and the player should click on the board to enter a variation.
  <i>The board is not responsive, but moves are instead entered into the text widget.</i>
  </p>

  <p>
  To finalise the move, one should click one of the NAG codes buttons.
  The engine will evaluate the move, after which the user may enter more good moves.
  When the user has finished entering their best moves, click
  <b>Done with position</b>. The engine will append (any) missed lines to the game PGN.
  </p>
  <h4>Bugs</h4>
  <p>This feature does not work from within an existing variation, of at the end of a game.
  Program flow probably needs refining too.
  </p>

  <p><footer>Updated: Scid vs. PC 4.7, January 2012</footer></p>
}

set helpTitle(EPD) "EPD files"
set helpText(EPD) {<h1>EPD Files</h1>
  <p>
  An <b>Extended Position Description</b> file is a text file with chess positions;
  each having some associated text.
  <br>
  Like <a PGN>PGN</a>, it is a common standard for chess information.
  </p>
  <p>
  EPD files contain <a EPD opcodes>Opcodes</a> , or fields, which are separated by semicolons in the file,
  but shown on separate lines in Scid's EPD Window.
  (Semicolons within an EPD field are stored as "<b>\s</b>" to distinguish them from end-of-field markers).
  They have a number of uses. Scid uses an EPD file to classify
  games according to the <a ECO>ECO</a> system, and you can create an EPD file for your opening repertoire,
  adding comments for positions you regularly reach in games [Feature removed].
  </p>
  <p>
  At most four EPD files can be open at any time.
  </p>
  <p><i>
  Scid vs PC will automatically save changes to all EPD positions on the fly. 
  To avoid dataloss, please backup EPD files before using them.
  </i></p>

  <h3>Navigating EPD files</h3>
  <p>
  To browse the positions in an EPD file, use  the <b>Control+Down</b>,
  <b>Control+Up</b>, <b>Control+Home</b> or <b>Control+End</b> keys.
  These commands move to the next/previous position in the file, clearing
  the current game and setting its start position.
  </p>

  <h3>Annotating</h3>
  <p>
  EPD files can be automatically annotated by the <b>Tools--<gt>Annotate Positions</b> menu.
  A dialogue will ask for the Analysis Time 
  , and the first analysis engine will start.
  The EPD tags used are <b>acd</b>, <b>acn</b>, <b>ce</b> and <b>pv</b>.
  </p>

  <h3>Stripping out EPD fields</h3>
  <p>
  EPD files you find on the Internet may contain fields that do not
  interest you, and they can waste a lot of space in the file.
  For example, an EPD file of computer evaluations might have ce, acd,
  acn, pm, pv and id fields but you may only need the ce and pv fields.
  </p>
  <p>
  You can strip out an EPD opcode from all positions in the EPD file using
  the <b>Tools--<gt>Strip out EPD field</b> menu.
  </p>

  <h3>The EPD window status bar</h3>
  <p>
  The status bar of each EPD window shows:
  <ul>
  <li>- the file status (<b>--</b> means unchanged, <b>XX</b> means
  changed, and <b>%%</b> means read-only); </li>
  <li>- the file name; </li>
  <li>- the number of positions in the file; </li>
  <li>- legal moves from the current position reach another position
  in this EPD file.</li>
  </ul>

  <h3><name opcodes>Standard EPD Opcodes</name></h3>
  <ul>
  <li> <b>acd</b> Analysis count: depth searched.</li>
  <li> <b>acn</b> Analysis count: number of nodes searched.</li>
  <li> <b>acs</b> Analysis count: search time in seconds.</li>
  <li> <b>bm</b> Best moves: move(s) judged best for some reason.</li>
  <li> <b>ce</b> Centipawn evaluation: evaluation in hundredths of a
  pawn from the perspective of the <b>side to move</b> -- note this
  differs from the Analysis window which shows evaluations in pawns from
  Whites perspective. </li>
  <li> <b>cX</b> Comment (where <b>X</b> is a digit, 0-9).</li>
  <li> <b>eco</b> <a ECO>ECO</a> system opening code.</li>
  <li> <b>id</b> Unique Identification for this position.</li>
  <li> <b>nic</b> <i>New In Chess</i> system opening code.</li>
  <li> <b>pm</b> Predicted move: the first move of the PV.</li>
  <li> <b>pv</b> Predicted variation: the line of best play.</li>
  </ul>

  <p><footer>Updated: Scid vs. PC 4.15, August 2015</footer></p>
}

set helpTitle(Reports) "Reports"
set helpText(Reports) {<h1>Reports</h1>
  <p>
  There are two types of reports: Opening and <a Reports Player>Player Reports</a>.
  </p>

  <h2><name Opening>Opening Reports</name></h2>
  <p>
  Scid's <run ::optable::makeReportWin><green>Opening Report</green></run>
  displays various information about the current position.
  </p>
  <p><i>
  Some features are affected by an internal limit of 10,000 games.
  For large reports statistics will be complete, but clicking on hyperlinks (for example)
  may not always show *all* matching games.
  </i></p>
  <p>
  The <b>first few sections</b> show matching games and subsequent moves.
  One can see if the opening is becoming more popular, if it has many short draws,
  and what move orders (transpositions) are used to reach it.
  </p>
  <p>Section 4, <b>Moves and Themes</b>, reports the move orders leading to the position,
  and also positional themes within the first 20 moves.
  To be counted , a game must match a theme
  in at least 4 positions of its first 20 moves.
  This avoids the brief occurrence of a theme (such as an isolated
  Queen pawn which is quickly captured) distorting results.
  </p>
  <p>
  The final and largest part of the report is the <b>Theory Table</b>.
  When saving the report to a file, you can choose to save just the table, a compact
  report without the table, or the whole report. The hyper-links (in red) reference diverging games.
  </p>
  <p><i>
  The Theory Table has a game limit of 500 by default (but configurable in Report Options).
  If the report position occurs more often, only games with the highest
  average Elo are used to generate the Theory Table.
  </i></p>

  <h4>Features</h4>
  <p>
  Clicking on the board will flip it. Right-clicking will resize it.
  Most coloured items in the report window are clickable, and
  invoke some relevant action. For example - clicking a game reference
  will load that game, or clicking a positional theme will set the filter
  to matching games.
  </p>
  <p>
  <b>Merge Games</b> merges the 50 best games from the
  Opening Report into the current game as variations, including full references.
  </p>
  <p>
  <b>Exclude</b> allows removal of a move from the Theory Table.
  </p>
  <p>
  Almost all the report sections can be turned on or off or adjusted in
  the Opening Report Options.
  </p>

  <h4><name Favorites>Favorites</name></h4>
  <p>
  The <b>Favorites Menu</b> in the Report Window allows one to maintain a
  collection of favorite opening positions.
  </p>
  <p>
  <b>Add Report</b> adds the current position as a favourite, and
  <b>Generate Reports</b> generates a report
  for each of these favorites. A dialog-box
  will appear allowing you to specify the report type and format, and
  a directory where report files will be saved. A suitable suffix for the
  format you selected (e.g. ".html" for HTML format) will be added to each
  report file name.
  </p>

  <h2><name Player>Player Reports</name></h2>
  <p>
  Player Reports are similar to <a Reports Opening>Opening Reports</a>, but 
  contain information about the games of a single player with the White or
  Black pieces. One can generate a Player Report from
  <run ::preport::preportDlg><green>Tools-<gt>Player Report</green></run>
  or from the <a PInfo>Player Info</a> window.
  </p>
  <p>
  Player Reports can be generated for all games (with the specified player and pieces),
  or for games matching the current position.
  </p>

  <p><footer>Updated: Scid vs. PC 4.13, August 2014</footer></p>
}


set helpTitle(PList) "Player Finder window"
set helpText(PList) {<h1>The Player Finder Window</h1>
  <p>
  The <run ::plist::Open><green>Player Finder</green></run> window displays a list of names of
  players in the current database. Selecting a player will open the
  <a PInfo>Player Info</a> window to display more detailed information
  about that player.
  </p>
  <p>
  Five columns are displayed showing each player's name, peak Elo
  rating, number of games played and the year of their oldest and
  newest game.
  Click on any column title to sort the list by that column.
  </p>
  <p>
  The controls below the list allow you to filter the list contents.
  You can alter the maximum list size, enter a case-insensitive player
  name prefix (such as "ada" to search for "Adams"), and restrict the
  ranges of Elo rating and number of games played.
  </p>

  <p><footer>Updated: Scid 3.6.2, December 2006</footer></p>
}

set helpTitle(PInfo) "Player Information"
set helpText(PInfo) {<h1>Player Information</h1>
  <p>

  The Player Information window shows basic information when available.
  It draws upon the <a Maintenance Spellfile>spelling.ssp file</a>,
  and includes Ratings, Country of Origin,  Official Titles and even Photos.</p>

  <p><b>Please use with caution</b>. <i>The names it contains may not be
  unique, and player initials may be incorrectly identified. Mainline SCID uses a
  more specific name match algorithm - which is less useful - but also less likely
  to make erroneous matches.  The larger </i><b>ratings.ssp</b><i> file (which may be
substituted), includes FIDE IDs and biographical data which help clarify unique
players.
</i></p>

  <p>Also displayed are statistics about
  success with white and black, favorite openings (by <a ECO>ECO code</a>),
  and rating history.
  All percentages displayed are an expected score (success rate), from the
  player's perspective -- so higher is always better for the player, whether they
  are White or Black.
  Clicking the numbers displayed in green will set the <a Filter>filter</a>
  according to the statistic it represents.
  </p>

  <h4>Features</h4>
  <p>
  You can see a player's rating history by pressing 
  <a Graphs Rating>Rating Graph</a> , and perform rating assignments.
  </p>
  <p>
  There are also buttons to help browse similar Player Names, 
  perform <a Maintenance Editing>name substitutions</b> in the whole (or part) database, or run the 
  <a Reports Player>Player Report</a> feature.
  </p>
  <p>
  Right-clicking shows a menu of recently viewed players.
  </p>

<h3><name Photos>Player Photos</name></h3>
<p>To enable player photos, place Scid Photo Files (such as "FIDE.spf" from 
<url http://scid.sourceforge.net/download.html>Scid download page</url>),
into Scid vs. PC's user directory.
On Linux and Macs this is "$HOME/.scidvspc", or "Scid vs PC/bin" on Windows.
The <green><run raiseSplashWindow>Help--<gt>Startup Window</run></green> will help you find it's location, and
will also indicate if the photo files have been loaded correctly.
</p>
<p>Custom gifs can be placed into a "photos" directory beneath the user dir.
They should preferably be 100x100, with the file name being the same as the player it portrays.
Eg - a photo for Magnus should be placed in 'photos/Carlsen, Magnus.gif'.
These photos will override any found in the .spf files.
</p>
<p>Once installed, available player photos are shown in the <a MainWindow GameInfo>game information</a> widget.
Clicking on the photos makes them smaller. To disable them, deselect <green>Options--<gt>Game Information--<gt>Show Photos</green>.

</p>

  <p><footer>Updated: Scid vs. PC 4.17 March 2016</footer></p>
}

set helpTitle(Graphs) "Graph windows"
set helpText(Graphs) {<h1>Graph Windows</h1>
  <p>
  Scid has a number of graph features, displaying information about Player Ratings, Game Frequencies and Score Evaluation.
  </p>

  <h3><name Filter>Filter Graph Windows</name></h3>
<p>
  <b>Relative Filter Graph</b>
  <p>
  The <green><run ::tools::graphs::filter::Open>Relative Filter Graph</run></green> shows trends by Date,
  Elo Rating or Moves for games in the current filter compared to the
  entire database. For example; when the <a Tree>tree</a>
  is open it shows how the current opening has changed
  in popularity in recent years, or whether it is especially
  popular among higher-rated players.
  Each point on the graph represents the number of games in the filter
  per 1000 games in the entire database, for a particular date or Elo
  rating range.
  </p><p>
  <b>Absolute Filter Graph</b>
  <p>
  The <green><run ::tools::graphs::absfilter::Open>Absolute Filter Graph</run></green> 
  shows the quantity of games in the filter according to the selected criteria.
</p><p>
<b>Usage</b>
  <p>
  The iconic button near the bottom opens a dialog to configure
  the graph. You can select the range and interval for the X axis. The "Decade" criteria can't be configured,
  use "Year" instead. If "Estimate" is selected, a missing rating will be
  estimates as described below. Otherwise no estimation is done
  and missing ratings are count as zero. This matches the Min. Elo
  evaluation in the statistic-window.</p>
  <p>
  <i>Note: the calculation can take some time on large ranges and
  small intervals</i>.
  </p>
  <p>
  When plotting the Filter graph by rating, Scid uses the average
  rating for each game. Estimate ratings (such as those in the spelling file)
  are not used. If one player in a game has a rating but the opponent
  does not, the opponent is presumed to have the same up to a limit of 2200.
  For example, if one player is rated 2500 and the opponent has no rating,
  the mean rating is (2500+2200)/2=2350.
  </p>

  <h3><name Rating>Player Rating Graph</name></h3>
  <p>
  The <green><run ::tools::graphs::rating::Refresh both>Rating
Graph</run></green> shows the ELO history of one, or many, players.
You can access the graph by pressing the "Rating Graph" button
in the <a PInfo>Player Information</a> window, or by selecting "Player Ratings"
from the Tools menu. Right-clicking the graph will refresh it.
  </p>

  <h3><name Score>Score Graph</name></h3>
  <p>
  The <green><run ::tools::graphs::score::Raise>Score Graph</run></green> (Control-Shift-Z)
  shows the move evaluations (stored as comments in the current game) as a graph. </p>
  <p>
  The first step in using the Score Graph is to add scores to a game with Scid's <a Analysis Annotating>annotation feature</a>.
  These scores have one of the formats +0.25, [% +0.25] , or [%eval +0.25]. The later two formats allow these scores to be hidden in  the PGN window by enabling PGN-<gt>Hide Codes.
  The values are represented from White's perspective (so a negative value means black is ahead).
  In cases when the scores are not from White's perspective, one can select an option
  (in the Options Menu) for an inverted perspective.
  </p>
  <h4>Features</h4>

  <p>Left Click positionally in the graph to go to the corresponding move.</p>

  <p>Right Clicking anywhere in the score graph will perform a refresh.</p>

  <p>The current move is now highlighted a different colour, though for performance reasons (on OS X mainly), this can be disabled.

  <p><footer>Updated: Scid vs. PC 4.15 Sept 2015</footer></p>
}

set helpTitle(Cmdline) "Command-line options"
set helpText(Cmdline) {<h1>Command-line Options</h1>
  <p>
  When you start Scid from a shell or console, there are command-line
  options you can specify. Scid-format databases (with or without a
  file suffix such as ".si4") and PGN files to be opened can be given
  (for example)
  <ul>
  <li><b>scid mybase newgames.pgn</b></li>
  </ul>
  will immediately open the Scid Database "mybase" and the
  PGN file "newgames.pgn".
  </p>
  <p>
  There are also optional arguments to control which files Scid should
  search for and use when it starts. You can avoid loading the <a ECO>ECO openings classification</a> file with
  <b>-xeco</b> or <b>-xe</b>, and avoid loading the
  <a Maintenance Spellcheck>spelling</a> file
  with <b>-xspell</b> or <b>-xs</b>. Also, the option <b>-fast</b>
  or <b>-f</b> does all three, so <b>scid -f</b> is equivalent
  to <b>scid -xeco -xspell -xtb</b>.
  </p>

  <p>
  Additionally, a filter file (.sso) can be used on the command line.
  <ul>
  <li>scid mybase myfilter</li>
  </ul>
  will open mybase and run myfilter immediately against it to select a
  set of games. This can e.g. be used to select a list of unfinished
  games in a pgn file.
  </p>

  <p><footer>Updated: Scid 3.6.26, October 2008</footer></p>
}

set helpTitle(Formats) "File Formats"
set helpText(Formats) {<h1>Scid File Formats</h1>
  <p>
  Scid Databases consist of three files - an index file (file suffix .si4), a name file (.sn4) and a game file (.sg4).
</p>
<p><i>Scid only allocates three bytes for some data fields. This means si4's maximum number of games is 16,777,214.</i>
</p>

  <h3>The Index File (.si4)</h3>
  <p>
  The Index File contains a description for the database and a small fixed-size
  entry for each game. Each game entry includes essential information such as the result,
  date, player/event/site name IDs (the actual names are in the
  Name File), and some redundant but useful information 
  that is used to speed up searches (see <a Formats Fast>fast searches</a> for more information).
  </p>

  <h3>The Name File (.sn4)</h3>
  <p>
  Contains all Player, Event, Site and Round names used in the
  database. Each name is stored only once even if it occurs in many games, and there is
  a database restriction on the number of unique names. The limits are - 
</p>
<ul><ul>
    <li>Player names:	2^20 - 1</li>
    <li>Event  names:	2^19 - 1</li>
    <li>Site   names:	2^19 - 1</li>
    <li>Round  names:	2^18 - 1</li>
</ul></ul>
  and are defined in <b>namebase.h</b>
  The name file is usually the smallest of the three database files.
  </p>

  <h3>The Game File (.sg4)</h3>
  <p>
  This file contains the actual moves, variations and comments of each game.
  </p>
  <p><i>
  The move encoding format is very compact: most moves take only a single byte (8 bits)!
  This is done by storing the piece to move in 4 bits (2^4 = 16 pieces) and the
  move direction in another 4 bits. Only Queen diagonal moves cannot be stored in this small space.
  This compactness is the reason Scid does not support chess variants.
  </i></p>
  <p>
  When a game is *replaced* a new version is - in fact - created,
  so wasted space does accumulate over time. The database may
  be restored to its minimal size by <a Compact>compaction</a>.
  </p>

  <h3>Other file formats</h3>
  <p>
  An <a EPD>EPD</a> file (<b>.epd</b>)
  contains a number of chess positions, each with a text comment.
  The EPD file format is described in the <a Related>PGN Standard</a>.
  </p>
  <p>
  A SearchOptions (<b>.sso</b>) file contains Scid
  <a Searches Header>header</a> or
  <a Searches Material>material/pattern</a> search settings.
  </p>

  <h3><name Fast>Fast Searches in Scid</name></h3>
  <p>
  The Index File stores some redundant but useful
  information about each game to speed up position or material searches.
  </p>
  <p>
  For example, the material of the final position is stored. If you search
  for rook and pawn endings, then all games that end with a queen, bishop
  or knight on the board (and have no pawn promotions) will be quickly
  skipped over.
  </p>
  <p>
  Another useful piece of information stored is the order in which pawns
  leave their home squares (by moving, or by being captured). This is used
  to speed up tree or exact position searches, especially for opening
  positions. For example, when searching for the starting position of the
  French Defence (1.e4 e6), every game starts with 1.e4 c5, or 1.d4, etc, will
  be skipped, but games starting with 1.e4 e5 will still need to be searched.
  </p>

  <p><footer>Updated: Scid vs. PC 4.2 November 2010 </footer></p>
}

set helpTitle(Options) "Options"
set helpText(Options) {<h1>Options and Preferences</h1>
  <p>
  Scid's options are stored in Scid-User-Directory/<b>config/options.dat</b>.
  These are generally saved when Scid closes, but can also be saved by the <b>Save Options</b> menu
  </p>
  <p>
  The options themselves are very numerous, and are generally dealt with in
  their own Help items, but below you'll find a few items explained.
  </p>

  <h3><name Fonts>Fonts</name></h3>
  <p>
  Scid has four basic fonts; <b>Regular</b>, <b>Menu</b>, <b>Small</b> and <b>Fixed</b>,
  which can be customized via the <green>Options-<gt>Fonts</green> menus.
  </p>
  <p><i>Many windows can quickly resize fonts by using Control+WheelMouse</i>
  </p>
  <p>
  The <b>Fixed</b> font is used by the <a Tree>Tree</a> window, and requires a fixed-width font to make text allign nicely.
  </p>
  <p>
  The new <b>PGN Figurines</b> feature require the truetype font ScidChessBerin.ttf to be installed on your operating system. Scid vs. PC attempts to do this, but issues may arise in which case this feature will be disabled in the PGN Options Menu.
  </p>

  <p><footer>Updated: Scid vs. PC 4.6 September 2011</footer></p>
}

set helpTitle(NAGs) "NAG values"
set helpText(NAGs) {<h1>NAG Values</h1>
  <h3>Standard NAGs</h3>
  <p>
  Standard <b>Numeric Annotation Glyphs</b> are defined in the
  <a Related>PGN Standard</a> and are listed below.
  <br>
  <i>Scid's use of Ascii strings to represent annotations is common, but against the PGN standard.</i>
  </p>
  <cyan>
  <ul>
  <li>  1     Good move                                                      : !       </li>
  <li>  2     Poor move                                                      : ?       </li>
  <li>  3     Excellent move                                                 : !!      </li>
  <li>  4     Blunder                                                        : ??      </li>
  <li>  5     Interesting move                                               : !?      </li>
  <li>  6     Dubious move                                                   : ?!      </li>
  <li>  7     Forced move                                                    : forced  </li>
  <li>  8     The only move. No reasonable alternatives                      : □       </li>
  <li>  9     Worst move                                                     : worst   </li>
  <li> 10     Drawish position                                               : =       </li>
  <li> 11     Equal chances, quiet position                                  : =, quiet</li>
  <li> 12     Equal chances, active position                                 : ↹       </li>
  <li> 13     Unclear position                                               : ~       </li>
  <li> 14     White has a slight advantage                                   : +=      </li>
  <li> 15     Black has a slight advantage                                   : =+      </li>
  <li> 16     White has a moderate advantage                                 : +/-     </li>
  <li> 17     Black has a moderate advantage                                 : -/+     </li>
  <li> 18     White has a decisive advantage                                 : +-      </li>
  <li> 19     Black has a decisive advantage                                 : -+      </li>
  <li> 20     White has a crushing advantage                                 : +--     </li>
  <li> 21     Black has a crushing advantage                                 : --+     </li>
  <li> 22     White is in zugzwang                                           :  ⊙      </li>
  <li> 23     Black is in zugzwang                                           :  ⊙      </li>
  <li> 24     White has a slight space advantage                             :  ◯      </li>
  <li> 25     Black has a slight space advantage                             :  ◯      </li>
  <li> 26     White has a moderate space advantage                           :  ◯◯     </li>
  <li> 27     Black has a moderate space advantage                           :  ◯◯     </li>
  <li> 28     White has a decisive space advantage                           :  ◯◯◯    </li>
  <li> 29     Black has a decisive space advantage                           :  ◯◯◯    </li>
  <li> 30     White has a slight time (development) advantage                :  ↻      </li>
  <li> 31     Black has a slight time (development) advantage                :  ↺      </li>
  <li> 32     White has a moderate time (development) advantage              :  ↻↻     </li>
  <li> 33     Black has a moderate time (development) advantage              :  ↺↺     </li>
  <li> 34     White has a decisive time (development) advantage              :  ↻↻↻    </li>
  <li> 35     Black has a decisive time (development) advantage              :  ↺↺↺    </li>
  <li> 36     White has the initiative                                       :  ↑      </li>
  <li> 37     Black has the initiative                                       :  ↓      </li>
  <li> 38     White has a lasting initiative                                 :  ⇑      </li>
  <li> 39     Black has a lasting initiative                                 :  ⇓      </li>
  <li> 40     White has the attack                                           :  →      </li>
  <li> 41     Black has the attack                                           :  ←      </li>
  <li> 42     White has insufficient compensation for material deficit       :  &/-    </li>
  <li> 43     Black has insufficient compensation for material deficit       :  &/+    </li>
  <li> 44     White has sufficient compensation for material deficit         :  =/&    </li>
  <li> 45     Black has sufficient compensation for material deficit         :  =/&    </li>
  <li> 46     White has more than adequate compensation for material deficit :  +/&    </li>
  <li> 47     Black has more than adequate compensation for material deficit :  -/&    </li>
  <li> 48     White has a slight center control advantage                    :  ⊞      </li>
  <li> 49     Black has a slight center control advantage                    :  ⊞      </li>
  <li> 50     White has a moderate center control advantage                  :  ⊞⊞     </li>
  <li> 51     Black has a moderate center control advantage                  :  ⊞⊞     </li>
  <li> 52     White has a decisive center control advantage                  :  ⊞⊞⊞    </li>
  <li> 53     Black has a decisive center control advantage                  :  ⊞⊞⊞    </li>
  <li> 54     White has a slight kingside control advantage                  :  ⟩      </li>
  <li> 55     Black has a slight kingside control advantage                  :  ⟩      </li>
  <li> 56     White has a moderate kingside control advantage                :  ⟫      </li>
  <li> 57     Black has a moderate kingside control advantage                :  ⟫      </li>
  <li> 58     White has a decisive kingside control advantage                :  ⋙      </li>
  <li> 59     Black has a decisive kingside control advantage                :  ⋙      </li>
  <li> 60     White has a slight queenside control advantage                 :  ⟨      </li>
  <li> 61     Black has a slight queenside control advantage                 :  ⟨      </li>
  <li> 62     White has a moderate queenside control advantage               :  ⟪      </li>
  <li> 63     Black has a moderate queenside control advantage               :  ⟪      </li>
  <li> 64     White has a decisive queenside control advantage               :  ⋘      </li>
  <li> 65     Black has a decisive queenside control advantage               :  ⋘      </li>
  <li> 66     White has a vulnerable first rank  </li>
  <li> 67     Black has a vulnerable first rank  </li>
  <li> 68     White has a well protected first rank  </li>
  <li> 69     Black has a well protected first rank  </li>
  <li> 70     White has a poorly protected king  </li>
  <li> 71     Black has a poorly protected king  </li>
  <li> 72     White has a well protected king  </li>
  <li> 73     Black has a well protected king  </li>
  <li> 74     White has a poorly placed king  </li>
  <li> 75     Black has a poorly placed king  </li>
  <li> 76     White has a well placed king  </li>
  <li> 77     Black has a well placed king  </li>
  <li> 78     White has a very weak pawn structure  </li>
  <li> 79     Black has a very weak pawn structure  </li>
  <li> 80     White has a moderately weak pawn structure  </li>
  <li> 81     Black has a moderately weak pawn structure  </li>
  <li> 82     White has a moderately strong pawn structure  </li>
  <li> 83     Black has a moderately strong pawn structure  </li>
  <li> 84     White has a very strong pawn structure  </li>
  <li> 85     Black has a very strong pawn structure  </li>
  <li> 86     White has poor knight placement  </li>
  <li> 87     Black has poor knight placement  </li>
  <li> 88     White has good knight placement  </li>
  <li> 89     Black has good knight placement  </li>
  <li> 90     White has poor bishop placement  </li>
  <li> 91     Black has poor bishop placement  </li>
  <li> 92     White has good bishop placement                                :  ↗      </li>
  <li> 93     Black has good bishop placement                                :  ↖      </li>
  <li> 94     White has poor rook placement  </li>
  <li> 95     Black has poor rook placement  </li>
  <li> 96     White has good rook placement                                  :  ⇈      </li>
  <li> 97     Black has good rook placement                                  :  ⇊      </li>
  <li> 98     White has poor queen placement  </li>
  <li> 99     Black has poor queen placement  </li>
  <li>100     White has good queen placement  </li>
  <li>101     Black has good queen placement  </li>
  <li>102     White has poor piece coordination  </li>
  <li>103     Black has poor piece coordination  </li>
  <li>104     White has good piece coordination  </li>
  <li>105     Black has good piece coordination  </li>
  <li>106     White has played the opening very poorly  </li>
  <li>107     Black has played the opening very poorly  </li>
  <li>108     White has played the opening poorly  </li>
  <li>109     Black has played the opening poorly  </li>
  <li>110     White has played the opening well  </li>
  <li>111     Black has played the opening well  </li>
  <li>112     White has played the opening very well  </li>
  <li>113     Black has played the opening very well  </li>
  <li>114     White has played the middlegame very poorly  </li>
  <li>115     Black has played the middlegame very poorly  </li>
  <li>116     White has played the middlegame poorly  </li>
  <li>117     Black has played the middlegame poorly  </li>
  <li>118     White has played the middlegame well  </li>
  <li>119     Black has played the middlegame well  </li>
  <li>120     White has played the middlegame very well  </li>
  <li>121     Black has played the middlegame very well  </li>
  <li>122     White has played the ending very poorly  </li>
  <li>123     Black has played the ending very poorly  </li>
  <li>124     White has played the ending poorly  </li>
  <li>125     Black has played the ending poorly  </li>
  <li>126     White has played the ending well  </li>
  <li>127     Black has played the ending well  </li>
  <li>128     White has played the ending very well  </li>
  <li>129     Black has played the ending very well  </li>
  <li>130     White has slight counterplay                                   :  ⇄      </li>
  <li>131     Black has slight counterplay                                   :  ⇆      </li>
  <li>132     White has moderate counterplay                                 :  ⇄⇄     </li>
  <li>133     Black has moderate counterplay                                 :  ⇆⇆     </li>
  <li>134     White has decisive counterplay                                 :  ⇄⇄⇄    </li>
  <li>135     Black has decisive counterplay                                 :  ⇆⇆⇆    </li>
  <li>136     White has moderate time control pressure                       :  ⊕      </li>
  <li>137     Black has moderate time control pressure                       :  ⊖      </li>
  <li>138     White has severe time control pressure                         :  ⊕⊕     </li>
  <li>139     Black has severe time control pressure                         :  ⊖⊖     </li>
  </ul>
  </cyan>

  <h3>Proposed NAGs</h3>
  <p>
  NAG values proposed by the Chess Informant publication.
  </p>
  <cyan>
  <ul>
  <li>140     With the idea ...           : △  </li>
  <li>141     Aimed against ...  </li>
  <li>142     Better move                 : ⌓  </li>
  <li>143     Worse move  </li>
  <li>144     Equivalent move             : R  </li>
  <li>145     Editor's Remark             : RR </li>
  <li>146     Novelty                     : N  </li>
  <li>147     Weak point                  : ×  </li>
  <li>148     Endgame                     : ⊥  </li>
  <li>149     Line                        : ⟺  </li>
  <li>150     Diagonal                    : ⇗  </li>
  <li>151     White has a pair of Bishops : ◫  </li>
  <li>152     Black has a pair of Bishops  </li>
  <li>153     Bishops of opposite color   : ◨  </li>
  <li>154     Bishops of same color       : ⊶  </li>
  </ul>
  </cyan>

  <h3>Other Suggested Values</h3>
  <cyan>
  <ul>
  <li>190     Etc.            : ǁ </li>
  <li>191     Doubled pawns   : ⡁ </li>
  <li>192     Isolated pawn   : ⚯ </li>
  <li>193     Connected pawns : ⚮ </li>
  <li>194     Hanging pawns  </li>
  <li>195     Backwards pawn  </li>
  </ul>
  </cyan>

  <h3>Scid NAGs</h3>
  <p>
  Defined by Scid for its own use.
  </p>
  <cyan>
  <ul>
  <li>201   Diagram        : D or #</li>
  <li>210   see            : —     </li>
  <li>211   mate           : #     </li>
  <li>212   passed pawn    : ⚨     </li>
  <li>213   more pawns  </li>
  <li>214   with           : ⌊     </li>
  <li>215   without        : ⌋     </li>
  </ul>
  </cyan>

  <p><footer>Updated: Scid vs. PC 4.10 July 2013</footer></p>
}


set helpTitle(ECO) "ECO Guide"
set helpText(ECO) {<h1>ECO Codes</h1>
  <p>
  ECO stands for <b>Encyclopedia of Chess Openings</b>. They are codes identifying chess opening,
  each consisting of a letter from A to E, followed by two digits. For example -
  <b>C33</b> represents the <b>King's Gambit Accepted</b>.
  There are five hundred distinct ECO codes.
  </p>

  <p>
  To see a game's ECO code, select 
  <run IdentifyOpening><green>Game-<gt>Identify Opening</green></run>
  and examine the <a MainWindow GameInfo>Game Information</a> window.
  </p>

  <h3>Scid Extensions to ECO</h3>
  <p>
  The ECO system is however fairly limited, and insufficient for modern games.
  Some codes are never used, while others are overly frequent.
  To improve this, Scid allows an optional
  extension to the basic ECO codes. Codes may be extended with a
  letter from a to z, with a further extension - a digit from 1 to 4 - being
  possible but not yet used.
  So an extended code may look like <b>A41e</b> or <b>E99b2</b>.
  Many of the codes common in modern master-level games have
  extensions defined in the Scid ECO file.
  </p>

  <h3><name Browser>The ECO Browser Window</name></h3>
  <p>
  Scid's
  <run ::windows::eco::Open><green>ECO Browser</green></run> shows positions associated
  with each ECO code, and their frequency and performance amongst <b>ECO classified games</b> in the current database. 
  </p>
  <p>
  The upper pane shows a bar graph with three sections: the lowest
  (light blue) represents White wins, the middle represents draws, and the top (dark blue), the number of Black wins.
  The graph illustrates at a glance an openings characteristics - whether
  draws are common or White or Black is winning.
  To go to a deeper ECO level click on a bar in the graph, or to go higher
  right-click, press the <button bookmark_up> button, or left-arrow.
  </p>
  <p>
  You can also navigate with keys, writing the ECO code you are interesting in. For instance, if you want to see the ECO code B75
  (for the Yugoslav Attack in the Sicilian Dragon), you just press the key combination 'b75' (or 'B75'). 
  If you want to go up to a more general code, like B7, you can just press Left-Arrow. 
  </p>
  <p>
  The bottom pane shows the positions for a particular ECO code according to the ECO file loaded.
  </p>
  <p>
  The <b>ECO classify games</b> button will permanently add ECO classifications to selected games in the current database.
  </p>

  <h3>Loading an ECO File</h3>
  <p>
  Scid will attempt to load the default <b>scid.eco</b> at start up.
  If it cannot, or you wish to use another file, one may be loaded manually via the
  <run ::windows::eco::LoadFile><green>Load ECO File</green></run> feature,
  after which this will be loaded automatically.
  </p>

  <h3><name Codes>ECO Code System</name></h3>
  <p>
  The basic structure of the ECO system is:
  </p>
  <p>
  <b><blue><run ::windows::eco::Refresh A>A</run></blue></b>
  1.d4 Nf6 2...;  1.d4 ...;  1.c4;  1.various
  <ul>
  <li>  <b>A0</b>  1.<i>various</i>
  (<b>A02-A03</b> 1.f4: <i>Bird's Opening</i>,
  <b>A04-A09</b>  1.Nf3: <i>Reti, King's Indian Attack</i>) </li>
  <li>  <b>A1</b>  1.c4 ...: <i>English</i> </li>
  <li>  <b>A2</b>  1.c4 e5: <i>King's English</i> </li>
  <li>  <b>A3</b>  1.c4 c5: <i>English, Symmetrical </i> </li>
  <li>  <b>A4</b>  1.d4 ...: <i>Queen's Pawn</i> </li>
  <li>  <b>A5</b>  1.d4 Nf6 2.c4 ..: <i>Indian Defence </i> </li>
  <li>  <b>A6</b>  1.d4 Nf6 2.c4 c5 3.d5 e6: <i>Modern Benoni</i> </li>
  <li>  <b>A7</b>  A6 + 4.Nc3 exd5 5.cxd5 d6 6.e4 g6 7.Nf3 </li>
  <li>  <b>A8</b>  1.d4 f5: <i>Dutch Defence</i> </li>
  <li>  <b>A9</b>  1.d4 f5 2.c4 e6: <i>Dutch Defence</i> </li>
  </ul>

  <p>
  <b><blue><run ::windows::eco::Refresh B>B</run></blue></b>
  1.e4 c5;  1.e4 c6;  1.e4 d6;  1.e4 <i>various</i>
  <ul>
  <li>  <b>B0</b>  1.e4 ...
  (<b>B02-B05</b>  1.e4 Nf6: <i>Alekhine Defence</i>;
  <b>B07-B09</b>  1.e4 d6: <i>Pirc</i>) </li>
  <li>  <b>B1</b>  1.e4 c6: <i>Caro-Kann</i> </li>
  <li>  <b>B2</b>  1.e4 c5: <i>Sicilian Defence </i> </li>
  <li>  <b>B3</b>  1.e4 c5 2.Nf3 Nc6: <i>Sicilian</i> </li>
  <li>  <b>B4</b>  1.e4 c5 2.Nf3 e6: <i>Sicilian</i> </li>
  <li>  <b>B5</b>  1.e4 c5 2.Nf3 d6: <i>Sicilian</i> </li>
  <li>  <b>B6</b>  B5 + 3.d4 cxd4 4.Nxd4 Nf6 5.Nc3 Nc6 </li>
  <li>  <b>B7</b>  B5 + 4.Nxd4 Nf6 5.Nc3 g6: <i>Sicilian Dragon</i> </li>
  <li>  <b>B8</b>  B5 + 4.Nxd4 Nf6 5.Nc3 e6: <i>Sicilian Scheveningen</i> </li>
  <li>  <b>B9</b>  B5 + 4.Nxd4 Nf6 5.Nc3 a6: <i>Sicilian Najdorf</i> </li>
  </ul>

  <p>
  <b><blue><run ::windows::eco::Refresh C>C</run></blue></b>
  1.e4 e5;  1.e4 e6
  <ul>
  <li>  <b>C0</b>  1.e4 e6: <i>French Defence</i> </li>
  <li>  <b>C1</b>  1.e4 e6 2.d4 d5 3.Nc3: <i>French, Winawer/Classical</i> </li>
  <li>  <b>C2</b>  1.e4 e5: <i>Open Game</i> </li>
  <li>  <b>C3</b>  1.e4 e5 2.f4: <i>King's Gambit</i> </li>
  <li>  <b>C4</b>  1.e4 e5 2.Nf3: <i>Open Game</i> </li>
  <li>  <b>C5</b>  1.e4 e5 2.Nf3 Nc6 3.Bc4: <i>Italian; Two Knights</i> </li>
  <li>  <b>C6</b>  1.e4 e5 2.Nf3 Nc6 3.Bb5: <i>Spanish (Ruy Lopez)</i> </li>
  <li>  <b>C7</b>  1.e4 e5 2.Nf3 Nc6 3.Bb5 a6 4.Ba4: <i>Spanish</i> </li>
  <li>  <b>C8</b>  C7 + 4...Nf6 5.O-O: <i>Spanish, Closed and Open</i>
  (<b>C80-C83</b>  5.O-O Nxe4: <i>Spanish, Open System</i>;
  <b>C84-C89</b>  5.O-O Be7: <i>Spanish, Closed System</i>) </li>
  <li>  <b>C9</b>  C8 + 5...Be7 6.Re1 b5 7.Bb3 d6: <i>Spanish, Closed</i> </li>
  </ul>

  <p>
  <b><blue><run ::windows::eco::Refresh D>D</run></blue></b>
  1.d4 d5; 1.d4 Nf6 2.c4 g6 with 3...d5
  <ul>
  <li>  <b>D0</b>   1.d4 d5: <i>Queen's Pawn</i> </li>
  <li>  <b>D1</b>   1.d4 d5 2.c4 c6: <i>Slav Defence</i> </li>
  <li>  <b>D2</b>  1.d4 d5 2.c4 dxc4: <i>Queen's Gambit Accepted (QGA)</i> </li>
  <li>  <b>D3</b>  1.d4 d5 2.c4 e6: <i>Queen's Gambit Declined (QGD)</i> </li>
  <li>  <b>D4</b>  D3 + 3.Nc3 Nf6 4.Nf3 c5/c6: <i>Semi-Tarrasch; Semi-Slav</i> </li>
  <li>  <b>D5</b>  D3 + 3.Nc3 Nf6 4.Bg5: <i>QGD Classical</i> </li>
  <li>  <b>D6</b>  D5 + 4...Be7 5.e3 O-O 6.Nf3 Nbd7: <i>QGD Orthodox</i> </li>
  <li>  <b>D7</b>  1.d4 Nf6 2.c4 g6 with 3...d5: <i>Grunfeld</i> </li>
  <li>  <b>D8</b>  1.d4 Nf6 2.c4 g6 3.Nc3 d5: <i>Grunfeld</i> </li>
  <li>  <b>D9</b>  1.d4 Nf6 2.c4 g6 3.Nc3 d5 4.Nf3: <i>Grunfeld</i> </li>
  </ul>

  <p>
  <b><blue><run ::windows::eco::Refresh E>E</run></blue></b>
  1.d4 Nf6 2.c4 e6; 1.d4 Nf6 2.c4 g6 </li>
  <ul>
  <li>  <b>E0</b>  1.d4 Nf6 2.c4 e6: <i>Catalan, etc</i> </li>
  <li>  <b>E1</b>  1.d4 Nf6 2.c4 e6 3.Nf3 (b6): <i>Queen's Indian, etc</i> </li>
  <li>  <b>E2</b>  1.d4 Nf6 2.c4 e6 3.Nc3 (Bb4): <i>Nimzo-Indian, etc</i> </li>
  <li>  <b>E3</b>  E2 + 4.Bg5 or 4.Qc2: <i>Nimzo-Indian</i> </li>
  <li>  <b>E4</b>  E2 + 4.e3: <i>Nimzo-Indian, Rubinstein</i> </li>
  <li>  <b>E5</b>  E4 + 4...O-O 5.Nf3: <i>Nimzo-Indian, main line</i> </li>
  <li>  <b>E6</b>  1.d4 Nf6 2.c4 g6: <i>King's Indian</i> </li>
  <li>  <b>E7</b>  1.d4 Nf6 2.c4 g6 3.Nc3 Bg7 4.e4: <i>King's Indian</i> </li>
  <li>  <b>E8</b>  E7 + 4...d6 5.f3: <i>King's Indian, Samisch</i> </li>
  <li>  <b>E9</b>  E7 + 4...d6 5.Nf3: <i>King's Indian, main lines</i> </li>
  </ul>

  <p><footer>Updated: Scid vs. PC 4.18, Dec 2016</footer></p>
}


set helpTitle(Author) "About"
set helpText(Author) "<h1>Scid vs. PC</h1>
  <ht><img icon></ht>
  <ul> <ul> <ul> <ul> <ul> <ul> <ul>
  <li>$::scidName  version $::scidVersion</li>
  <br>
  <li><url http://scidvspc.sourceforge.net/>http://scidvspc.sourceforge.net/</url></li>
  <li>Mailing list: <url http://www.mail-archive.com/scidvspc-users@lists.sourceforge.net/>archive</url>,
  <url https://lists.sourceforge.net/lists/listinfo/scidvspc-users>subscribe</url></li>
  <br>
  <li>Based on:</li>
  <li>Shane's Chess Information Database 3.6.26</li>
  <li>(C) Steven Atkinson (stevenaaus@yahoo.com), Shane Hudson,</li>
  <li>Pascal Georges and others.</li>
  <br>
  <li>Licenced under the GNU General Public License.</li>
  <br>
  <li>Using Tcl/Tk version [info patchlevel]</li>

</ul> </ul> </ul> 
  <p><footer>(Project Updated: $::scidVersionDate)</footer></p>
  </p>
"

set helpTitle(Related) "Links"
set helpText(Related) {<h1>Links</h1>
  <p>
  <ul>
  <li>Scid vs. PC  <url http://scidvspc.sourceforge.net/>http://scidvspc.sourceforge.net/</url></li>
  <li>Project page  <url http://sourceforge.net/projects/scidvspc>http://sourceforge.net/projects/scidvspc</url></li>
  <li>Online documentation <url http://scidvspc.sourceforge.net/doc/Contents.htm>http://scidvspc.sourceforge.net/doc/Contents.htm</url></li>
  <br>
  <li>Kingbase database <url http://www.kingbase-chess.net/>http://www.kingbase-chess.net/</url></li>
  <li>Player Information resources  <url http://sourceforge.net/projects/scid/files/Player Data/>http://sourceforge.net/projects/scid/files/Player Data/</url></li>
  <li>Scid vs. 960/variants (Chess960 support) <url https://github.com/brittonf/scid-vs-variants>https://github.com/brittonf/scid-vs-variants</url></li>
  <li>Debian/Mint/Ubuntu installation how-to <url http://www.linuxx.eu/2012/11/scid-vs-pc-installation-guide-ubuntu.html>http://www.linuxx.eu/2012/11/scid-vs-pc-installation-guide-ubuntu.html</url></li>
  <li>Ed Collins' Scid vs. PC page <url http://edcollins.com/chess/scidvspc/index.html>http://edcollins.com/chess/scidvspc/index.html</url></li>
  <li>Gorgonian's custom pieces <url http://gorgonian.weebly.com/scid-vs-pc.html>http://gorgonian.weebly.com/scid-vs-pc.html</url></i>
  <li>The PGN and EPD standards <url http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm>www.saremba.de/chessgml/standards/pgn...</url></li>
  <li>Common PGN extensions <url http://www.enpassant.dk/chess/palview/enhancedpgn.htm>http://www.enpassant.dk/chess/palview/enhancedpgn.htm</url></li>
  <li>Pgn of players <url http://www.pgnmentor.com/files.html#players>www.pgnmentor.com/files.html#players</url></li>
  <li>Pgn of events <url http://www.pgnmentor.com/files.html#events>www.pgnmentor.com/files.html#events</url></li>
<br>
  <li>Mailing list subscribe (must be a member to post to list) <url https://lists.sourceforge.net/lists/listinfo/scidvspc-users>https://lists.sourceforge.net/lists/listinfo/scidvspc-users</url></li>
  <li>Mailing list archive <url http://www.mail-archive.com/scidvspc-users@lists.sourceforge.net/>http://www.mail-archive.com/scidvspc-users@lists.sourceforge.net/</url></li>
  <li>Programmer's reference <url http://scidvspc.sourceforge.net/doc/progref.html>http://scidvspc.sourceforge.net/doc/progref.html</url></li>
  <li>UCI engine protocol <url http://wbec-ridderkerk.nl/html/UCIProtocol.html>http://wbec-ridderkerk.nl/html/UCIProtocol.html</url></li>
  <li>Xboard engine protocol <url http://www.open-aurec.com/wbforum/WinBoard/engine-intf.html>http://www.open-aurec.com/wbforum/WinBoard/engine-intf.html</url></li>
  <br>
  <li>Popular chess portals.</li>
  <ul>
  <li>  <url http://www.chessbase.com>www.chessbase.com </url></li>
  <li>  <url http://www.theweekinchess.com>www.theweekinchess.com </url></li>
  <li>  <url http://www.chesschat.org>www.chesschat.org </url></li>
  </ul>
  <li><url http://www.jrsoftware.org/isinfo.php>Inno setup</url> (used to make windows installer)</li>
  <li>Professional quality chess icons  <url http://www.virtualpieces.net>www.virtualpieces.net</url></li>
  <li>Tango icons <url http://tango.freedesktop.org/Tango_Desktop_Project>http://tango.freedesktop.org/Tango_Desktop_Project</url></li>

  </ul>
<p><footer>Updated: Scid vs PC 4.10, August 2013</footer></p>
}

set helpTitle(FindBestMove) "Find best move"
set helpText(FindBestMove) {<h1>Find Best Move</h1>
  <p>
  The Find Best Move feature uses specially prepared databases
  to help you train to find tactical shots (non-obvious and unique winning moves).
  </p>
  <p>
  Scid will initially jump to the first relevant position in the current database,
  allowing the player to study for the tactical shot. The PGN window will close, and Hide Next Move is enabled.
  </p>
  <h2>Compatible Databases</h2>
  <p>
  All relevant games must be flagged with the tactics <b>T</b> flag.
  Thereafter, there are two ways a game can be marked.
 </p><p>
  Traditionally, databases are prepared by <a Analysis Annotating>annotating games</a> with a UCI engine and enabling
  "Mark tactical exercises".
<br><br>
  <i>This marks relevant moves a special comment (beginning with <b>****D-<gt></b> and commented in the analysis.tcl source file).
<br>
  For a move to be regarded as a Tactical Shot, it must be a unique winning move, that is not obvious - ie found at depth <lt>= 3.</i>
 </p><p>
  But ScidvsPC will now also assume the game is a tactical exercise, if it has a non-standard start.
  A good example is the <url http://gorgonian.weebly.com/uploads/1/7/2/2/17221082/auerswald.pgn>Auerswald Collection</url>
<br>
(Note - games must first be copied to si4 database and flagged with the tactics <b>T</b> flag from the maintenance window).</p>

  <p><footer>Updated: Scid vs. PC 4.17 Feb 2016</footer></p>
}

set helpTitle(Changelog) "Scid vs PC Changelog"
set helpText(Changelog) {<h1>Changelog</h1>

<h4>0.01 (April 1, 2018)</h4>
<ul>
<li>First Version</li>
</ul><br>
}

set helpTitle(ShortCuts) "Shortcuts"
set helpText(ShortCuts) {<h1>Keyboard Shortcuts</h1>
<p>
Shortcuts are <b>case sensitive</b>, and can be overided by altering standardShortcuts() in Scid.gui (end.tcl).
<br>
The window manager may interfere with some shortcuts.
<br>
<br>
<a ShortCuts alpha>Sorted Alphabetically</a>
</p>

<h4>General</h4>
<ul>
<li><i>Use standard notation to input moves with the keyboard (eg <b>e4</b>)</i></li>
<li></li>
<li><b>left</b> - Back one move</li>
<li><b>right</b> - Forward one move</li>
<li><b>up</b> - Back five moves/exit variation</li>
<li><b>down</b> - Forward five moves</li>
<li><b>home</b> - Goto start</li>
<li><b>end</b> - Goto end</li>
<li><b>control-g</b> - Goto move number</li>
<li><b>control-f</b> - Flip Board</li>
<li><b>escape</b> - Clear move entry</li>
<li><b>enter</b> - Add move from chess engine</li>
<li><b>space</b> - Start/stop chess engine</li>
<li><b>delete</b> - Delete trailing moves from game or variation</li>
<li><b>control-enter</b> - Add line from chess engine</li>
<li><b>control-delete</b> - Delete current game</li>
<li></li>
<li><b>F1</b> - Help</li>
<li><b>control-shift-F7</b> - Dump all Images as base64 (developer only)</li>
<li><b>control-shift-F8</b> - Dump all Images as jpegs  (developer only)</li>
<li><b>control-shift-F12</b> - Screenshot</li>
<li><b>alt-KEY</b> - Menu shortcut (*nix only)</li>
</ul>

<h4>Scid Windows</h4>
<ul>
<li><b>control-p</b> - PGN window</li>
<li><b>control-l</b> - Gamelist window</li>
<li><b>control-e</b> - Comment editor</li>
<li><b>control-m</b> - Maintenance window</li>
<li><b>control-i</b> - Gameinfo window</li>
<li><b>control-t</b> - Tree window</li>
<li><b>control-B</b> - Setup board</li>
<li><b>control-Z</b> - Score graph</li>
<li><b>escape</b> - Close window</li>
</ul>

<h4>Engines</h4>
<ul>
<li><b>control-A</b> - Configure analysis engines</li>
<li><b>F2</b> - Toggle engine 1</li>
<li><b>F3</b> - Toggle engine 2</li>
<li><b>F4</b> - Toggle engine 3</li>
<li><b>enter</b> - Add move from chess engine</li>
<li><b>space</b> - Start/stop chess engine</li>
<li><b>control-enter</b> - Add line from chess engine</li>
<li><b>control-space</b> - Toggle trial mode</li>
</ul>

<h4>Copy / Paste</h4>
<ul>
<li><b>control-c</b> - Copy game to Clipbase</li>
<li><b>control-v</b> - Paste game from Clipbase</li>
<li><b>control-C</b> - Copy FEN</li>
<li><b>control-V</b> - Paste FEN</li>
<li><b>control-I</b> - Import PGN</li>
</ul>

<h4>Games and Databases</h4>
<ul>
<li><b>control-s</b> - Save game</li>
<li><b>control-S</b> - Add game</li>
<li></li>
<li><b>control-up</b> - Previous game</li>
<li><b>control-down</b> - Next game</li>
<li><b>control-home</b> - First game</li>
<li><b>control-end</b> - Last game</li>
<li><b>control-N</b> - New game</li>
<li><b>control-u</b> - Load game number</li>
<li><b>control-?</b> - Load random game</li>
<li></li>
<li><b>control-o</b> - Open database</li>
<li><b>control-w</b> - Close database</li>
<li></li>
<li><b>control-1</b> - Switch to first open base</li>
<li><b>control-2</b> - Switch to second open base</li>
<li>....</li>
<li><b>control-9</b> - Switch to Clipbase</li>
</ul>

<h4>Search / Filter</h4>
<ul>
<li><b>control-G</b> - General (header) search</li>
<li><b>control-M</b> - Material search</li>
<li></li>
<li><b>control-r</b> - Reset filter</li>
<li><b>control-n</b> - Negate Filter</li>
<li></li>
<li><b>control-P</b> - Player finder</li>
<li><b>control-T</b> - Tournament finder</li>
<li><b>control-Z</b> - Score graph</li>
</ul>

<h4>Variations</h4>
<ul>
<li><b>control-a</b> - Add variation</li>
<li><b>v</b> - Enter variation</li>
<li><b>z</b> - Exit variation</li>
</ul>
-------------------------------------------------------------------------

<h2><name alpha>Alphabetical</name></h2>
<ul>

<li><b>control-a</b> - Add variation</li>
<li><b>control-A</b> - Analysis engines</li>
<li><b>control-B</b> - Setup board</li>
<li><b>control-c</b> - Copy game to Clipbase</li>
<li><b>control-C</b> - Copy FEN</li>
<li><b>control-e</b> - Comment editor</li>
<li><b>control-f</b> - Flip Board</li>
<li><b>control-g</b> - Goto move number</li>
<li><b>control-G</b> - General (header) search</li>
<li><b>control-i</b> - Gameinfo window</li>
<li><b>control-I</b> - Import PGN</li>
<li><b>control-l</b> - Gamelist window</li>
<li><b>control-m</b> - Maintenance window</li>
<li><b>control-M</b> - Material search</li>
<li><b>control-n</b> - Negate Filter</li>
<li><b>control-N</b> - New game</li>
<li><b>control-o</b> - Open database</li>
<li><b>control-p</b> - PGN window</li>
<li><b>control-P</b> - Player finder</li>
<li><b>control-r</b> - Reset Filter</li>
<li><b>control-s</b> - Save game</li>
<li><b>control-S</b> - Add game</li>
<li><b>control-t</b> - Tree window</li>
<li><b>control-T</b> - Tournament finder</li>
<li><b>control-u</b> - Load game number</li>
<li><b>control-v</b> - Paste game from Clipbase</li>
<li><b>control-V</b> - Paste FEN</li>
<li><b>control-w</b> - Close database</li>
<li></li>

<li><b>control-?</b> - Load random game</li>
<li><b>control-space</b> - Toggle trial mode</li>
<li><b>control-delete</b> - Delete current game</li>
<li><b>control-up</b> - Load previous game</li>
<li><b>control-down</b> - Load next game</li>
<li><b>control-home</b> - Load First game</li>
<li><b>control-end</b> - Load last game</li>
<li></li>

<li><b>control-1</b> - Switch to first open base</li>
<li><b>control-2</b> - Switch to second open base</li>
<li>....</li>
<li><b>control-9</b> - Switch to Clipbase</li>
<li></li>

<li><b>enter</b> - Add move from chess engine</li>
<li><b>space</b> - Start/stop chess engine</li>
<li><b>delete</b> - Delete trailing moves from game or variation</li>
<li><b>v</b> - Enter variation</li>
<li><b>z</b> - Exit variation</li>
<li><b>left</b> - Back one move</li>
<li><b>right</b> - Forward one move</li>
<li><b>up</b> - Back five moves/exit variation</li>
<li><b>down</b> - Forward five moves</li>
<li><b>home</b> - Goto start</li>
<li><b>end</b> - Goto end</li>
<li></li>

<li><b>F1</b> - Help</li>
<li><b>F2</b> - Toggle engine 1</li>
<li><b>F3</b> - Toggle engine 2</li>
<li><b>F4</b> - Toggle engine 3</li>
<li><b>control-shift-F7</b> - Dump all Images as base64 (developer only)</li>
<li><b>control-shift-F8</b> - Dump all Images as jpegs  (developer only)</li>
<li><b>control-shift-F12</b> - Screenshot</li>

</ul>
<p><footer>Updated:</b> - Scid vs. PC 4.9 April 2013</footer></p>
}

set helpTitle(Board) "Board Options"
set helpText(Board) {<h1>Board Options</h1>
<p>
   Tk (and Scid) only support the GIF image format by default -
   but PNG and JPG images (and pieces) are supported by the TkImg
   package. TkImg is included with  Windows and OS X, and can be compiled
   from the
   <url https://sourceforge.net/project/downloading.php?group_id=263836&filename=tkimg1.3.tar.bz2>source tarball</url>
   on Linux (if not already installed).
</p>
<h3><name Textures>Custom Textures</name></h3>
<p>
   Up to ten custom board textures can be loaded.
   These must be placed in the directory <b>Scid vs PC/bin/textures</b> (windows) or <b>$HOME/.scidvspc/textures</b>,
   and be of the form <b>wood_l.gif</b> / <b>wood_d.gif</b>  or <b>steel_l.png</b> / <b>steel_d.png</b> , for example.
</p>
<h3><name Textures>Custom Pieces</name></h3>
<p>
<i>The Merida1 pieces now have high-quality larger sizes.</i>
</p><p>
Place custom piece sets in the directory <b>$HOME/.scidvspc/pieces</b>, and they will be added to the 
Board Options window. These can be found at our 
<url https://sourceforge.net/projects/scidvspc/files/support files/chess pieces/>pieces page</url>.
</p>
<p>Some of these include high detail pieces suitable for large displays.
notably Ken's and Paul's, and the FritzSWS pieces at
<url http://gorgonian.weebly.com/scid-vs-pc.html>Gorgonian's Chess Site</url>
</p>
<p>
Paul's also include instructions for making high detail pieces from svg using Inkscape
You can find the older instructions to make Scid pieces in scid_chess_pieces.tgz.
</p>
<p><i>
   Examine <green><run raiseSplashWindow>Startup Window</run></green> for the status of loading user textures and pieces.
</i></p>

</p>
<p><footer>Updated:</b> - Scid vs. PC 4.17 October 2016</footer></p>
}
