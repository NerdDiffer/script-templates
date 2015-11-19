# Finding files by name, relative to CWD, but excluding certain dirs.
# This is less of a working script than a reference to one-liners.

# use the `prune` switch. (however, it does not exclude the CWD)
# `http://stackoverflow.com/a/4210072/2908123`
# to exclude the 'misc' directory, add: `-path ./misc -prune -o`
find . -path ./misc -prune -o -name '*.txt' -print

# to exclude multiple directories, where directories are between ( )
find . -type d\( -path dir1 -o path dir2 -o path dir3 \) -prune -o -print

# another way, without `prune`
# `http://stackoverflow.com/a/15736463/2908123`
find -name "*.txt" -not -path "./directory"
