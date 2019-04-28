exec >&2
grep -v '^\.[A-Za-z]\|^;' $2.ddf | xargs redo-ifchange $2.ddf
. ./vs2017-paths.sh
makecab.exe /f $2.ddf
mv $2.cab.tmp $3
