cd rel
md bin
cd bin
copy C:\msys64\mingw64\bin\libgcc_s_seh-1.dll
copy "C:\msys64\mingw64\bin\libstdc++-6.dll"
copy C:\msys64\mingw64\bin\libwinpthread-1.dll
copy I:\tcl\bin\tcl85.dll
copy I:\tcl\bin\tk85.dll
copy I:\tcl\bin\tclpip85.dll
copy ..\..\FIDE.spf
copy ..\..\icons\scinc.gif

md engines
cd engines
md stockfish
cd stockfish
copy ..\..\..\..\engines\stockfish\*.*
cd ..
md komodo
cd komodo
copy ..\..\..\..\engines\komodo\*.*
cd ..
cd ..
md config
cd config
copy ..\..\..\config\engines.dat
copy ..\..\..\config\options.dat

cd ..
md data
cd data
copy ..\..\..\data\*.*

cd /d C:\msys64
call msys2_shell.cmd -mingw64 -where i:/github/scinc
