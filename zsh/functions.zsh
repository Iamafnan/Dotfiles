cd() {
	if [ -n "$1" ]; then
		builtin cd "$@" && exa -a
	else
		builtin cd ~ && exa -a
	fi
}

h() {
	history 0 | grep $1
}

ya() {
	for pkg in $@; do
		yarn add $pkg
		yarn add -D @types/$pkg &>/dev/null || echo "No separate types for $pkg"
	done
}

yr() {
	for pkg in $@; do
		yarn remove $pkg
		yarn remove @types/$pkg &>/dev/null
	done
}

mkc() {
	mkdir -p "$1" && cd "$1" || return 1
}

batdiff() {
	git diff --name-only --diff-filter=d | xargs bat --diff
}

gitignore() {
	touch .gitignore
	for files in $@; do
		echo "${files}" >>.gitignore
	done
}

ga() {
  git add "$@" 
}

gc() {
  git commit -m "$@" 
}

gac() {
	git commit -a -m "$@"
}

gp() {
	git push
}
