# Directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# Prettier, human-readable file lising.
alias l="ls -aFGhl"

# Bcat fix for man pages, etc.
alias bcat="col -b | bcat"


# Show/hide hidden Finder files
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# hub (Github + Git https://github.com/defunkt/hub)
# alias git=hub

# serve current directory (via python)
alias serve="python -m SimpleHTTPServer"

# Ruby on Rails
alias rs="rails server"
alias rc="rails console"
alias rg="rails generate"
alias be="bundle exec"

# Rake
alias r="rake"
alias rdbm="rake db:migrate"
alias rdbtp="rake db:test:prepare"

# Alias commands with `bundle exec $command`
bundle_commands="rake rspec spec cucumber cap watchr rails rackup guard thin unicorn"

function run_bundler_cmd () {
  if [ -r ./Gemfile ]; then
    bundle exec $@
  else
    $@
  fi
}

for cmd in $bundle_commands; do
  alias $cmd="run_bundler_cmd $cmd"
done
