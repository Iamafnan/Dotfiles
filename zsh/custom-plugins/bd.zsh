bd () {
  (($#<1)) && {
    print -- "usage: $0 <name-of-any-parent-directory>"
    print -- "       $0 <number-of-folders>"
    return 1
  } >&2
  local num_folders_we_are_in=${#${(ps:/:)${PWD}}}
  local dest="./"

  local parents
  local i
  for i in {$num_folders_we_are_in..2}
  do
    parents=($parents "$(echo $PWD | cut -d'/' -f$i)")
  done
  parents=($parents "/")
  local parent
  foreach parent (${parents})
  do
    dest+="../"
    if [[ $1 == $parent ]]
    then
      cd $dest
      return 0
    fi
  done

  dest="./"
  if [[ "$1" = <-> ]]
  then
    if [[ $1 -gt $num_folders_we_are_in ]]
    then
      print -- "bd: Error: Can not go up $1 times (not enough parent directories)"
      return 1
    fi
    for i in {1..$1}
    do
      dest+="../"
    done
    cd $dest
    return 0
  fi

  print -- "bd: Error: No parent directory named '$1'"
  return 1
}
_bd () {
  local num_folders_we_are_in=${#${(ps:/:)${PWD}}}
  local i
  for i in {$num_folders_we_are_in..2}
  do
    reply=($reply "`echo $PWD | cut -d'/' -f$i`")
  done
  reply=($reply "/")
}
compctl -V directories -K _bd bd
