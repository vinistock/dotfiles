EDITOR=vim

alias brails="./bin/rails"
alias brake="./bin/rake"
alias byarn="./bin/yarn"
alias bspoom="./bin/spoom"
alias btapioca="./bin/tapioca"

alias gitl="git log --oneline --no-decorate"
alias gits="git show --name-status"
alias pull="git pull -p --rebase"
alias push="git push"
alias amend="git commit --amend"
alias be="bundle exec"
alias push_branch="push origin (git rev-parse --abbrev-ref HEAD)"
alias compile_sorbet="./bazel build //main:sorbet --config=dbg"

whitequark() {
  ruby -e "require 'parser/current'; puts Parser::CurrentRuby.parse('$@')"
}

bazel_test_find() {
  ./bazel query 'tests(//...)' | grep $@ | xargs ./bazel test --config=dbg
}

git_find() {
  git log -G "$1" --oneline
}

sorbet_test() {
  ./bazel test //test/$1 --config=dbg
}

comp_run() {
  compile_sorbet && sorbet_run $@
}

main_and_delete() {
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    master_exists=$(git branch --list master)

    if [ -n "${master_exists}" ]; then
        git switch master
    else
        git switch main
    fi

    git branch -D $current_branch
}
