cd rel
md bin
cd bin
copy C:\msys64\mingw64\bin\libgcc_s_seh-1.dll
copy "C:\msys64\mingw64\bin\libstdc++-6.dll"
copy C:\msys64\mingw64\bin\libwinpthread-1.dll
copy D:\tcl\bin\tcl85.dll
copy D:\tcl\bin\tk85.dll
copy D:\tcl\bin\tclpip85.dll
copy ..\..\FIDE.spf

md engines
cd engines
md stockfish
cd stockfish
copy ..\..\..\..\setup\engines\stockfish\*.*
cd ..
md komodo
cd komodo
copy ..\..\..\..\setup\engines\komodo\*.*
cd ..
cd ..
md config
cd config
copy ..\..\..\setup\config\engines.dat
copy ..\..\..\setup\config\options.dat

cd ..
md data
cd data
copy ..\..\..\setup\data\*.*

cd ..
md bitmaps
cd bitmaps
copy ..\..\..\setup\bitmaps\*.*

cd ..
md bitmaps2
cd bitmaps2
copy ..\..\..\setup\bitmaps2\*.*

cd /d C:\msys64
call msys2_shell.cmd -mingw64 -where d:/github/scinc
