export GREP_OPTIONS='--color=auto'
alias qfind='find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.proto" -o -name "*.cc" \) -print | xargs fgrep -rn --color=auto $1'
alias st='svn st | grep -v "?"'
alias stadd='svn st | grep ^A'
export LANG=en_US.UTF-8
alias mkctag='ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .'
