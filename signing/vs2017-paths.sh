find_last() (
	IFS="
"
	local d= out=
	for d in $@; do
		if [ -d "$d" ]; then
			out="$d"
		fi
	done
	[ -n "$out" ] && echo "$out" && return 0
	echo "Can't find: '$d'" >&2
	return 1
)

add_path() {
	PATH="$PATH:$1"
}

msvc_paths() (
	set -e
	x=$(find_last /mnt/*/Program\ Files*/Microsoft\ SDKs/Windows/v*/bin/NETFX\ *\ Tools/x64)
	add_path "$x"

	x=$(find_last /mnt/*/Program\ Files*/Microsoft\ Visual\ Studio/*/*/Common7)
	add_path "$x/IDE"
	add_path "$x/IDE/CommonExtensions/Microsoft/CMake/CMake/bin"
	add_path "$x/IDE/CommonExtensions/Microsoft/CMake/CMake/Ninja"
	add_path "$x/IDE/CommonExtensions/Microsoft/TeamFoundation/Team Explorer"
	add_path "$x/IDE/CommonExtensions/Microsoft/TestWindow"
	add_path "$x/IDE/VC/vcpackages"
	add_path "$x/Tools"

	x=$(find_last /mnt/*/Program\ Files*/Microsoft\ Visual\ Studio/*/*/MSBuild/*/Bin)
	add_path "$x"
	add_path "$x/Roslyn"

	x=$(find_last /mnt/*/Program\ Files*/Microsoft\ Visual\ Studio/*/*/Team\ Tools/Performance\ Tools)
	add_path "$x"
	add_path "$x/x64"

	x=$(find_last /mnt/*/Program\ Files*/Microsoft\ Visual\ Studio/*/*/VC/Tools/MSVC/*/bin/Hostx64/x64)
	add_path "$x"

	x=$(find_last /mnt/*/Program\ Files*/Microsoft\ Visual\ Studio/Shared/Common/VSPerfCollectionTools)
	add_path "$x"
	add_path "$x/x64"

	x=$(find_last /mnt/*/Program\ Files*/Windows\ Kits/*/bin/*/x64)
	add_path "$x"

	x=$(find_last /mnt/*/Program\ Files*/Windows\ Kits/*/bin/x64)
	add_path "$x"

	x=$(find_last /mnt/*/Program\ Files*/SafeNet/Authentication/SAC)
	add_path "$x/x32"
	add_path "$x/x64"

	x=$(find_last /mnt/*/Windows*/Microsoft.NET/Framework64/*)
	add_path "$x"
	
	echo "$PATH"
)

PATH=$(msvc_paths)
