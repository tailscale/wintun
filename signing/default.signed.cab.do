exec >&2
redo-ifchange $2.cab
. ./vs2017-paths.sh
cp $2.cab $3
signtool.exe sign /v \
	/sha1 9DD05ECCFEF31D3D0B93E3AFB8DC65F0557E8F0E \
	/tr http://sha256timestamp.ws.symantec.com/sha256/timestamp \
	"$3"
