#!/bin/bash

# Author: Nixawk
# OS X - Install metasploit-framework dev

export MSF_HOME="$HOME/metasploit-framework"

# /* brew is a application manager on MAC OS X */
# /* url - http://brew.sh/ */
function install_homebrew {
    curl_brew="curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install"
    [[ ! -e "$(which brew)" ]] && /usr/bin/ruby -e "$($curl_brew)"
}


# /* git is a free and open source distributed version control system */
# /* url - https://git-scm.com/book/en/v2 */
function install_git {
    [[ ! -e "$(which git)" ]] && brew install git git-flow
}


# /* rvm is a command-line tool which allows you to easily install, manage,
#    and work with multiple ruby env from interpreters to sets of gems. */
# /* url - https://rvm.io/ */
function install_rvm {
    [[ ! -e "$(which gpg)" ]] && brew install gpg
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

    if [ "$(alias | grep rvm | wc -l)" -eq "0" ]; then
        curl -sSL https://rvm.io/mpapis.asc | gpg --import -
        curl -L https://get.rvm.io | bash -s stable
    fi

    RVM_SOURCE='source ~/.rvm/scripts/rvm'
    [[ "$SHELL" == "/bin/zsh" ]] && SHELL_RC="$HOME/.zshrc"
    [[ "$SHELL" == "/bin/bash" ]] && SHELL_RC="$HOME/.bash_profile"

    [[ "$(cat $SHELL_RC | grep \"~/.rvm/scripts/rvm\" | wc -l)" -eq "0" ]] && echo "$RVM_SOURCE" >> ~/.zshrc
}


# /* metasploit-framework is a open-source project that provides information about security vulnerabilities
#    and aids in penetration testing and IDS signature development. */
# /* url - https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment */
function download_msf {
    [[ ! -e "$MSF_HOME" ]] && git clone https://github.com/rapid7/metasploit-framework/ "$MSF_HOME"
}


# /* ruby is a dynamic, open source programming language with a focus on simplicity and productivity. */
# /* url - https://www.ruby-lang.org/ */
function install_ruby {
    [[ -e "$MSF_HOME" ]] && cd "$MSF_HOME"
    [[ "$(rvm list | grep $(cat .ruby-version) | wc -l)" -eq "0" ]] && rvm --install .ruby-version
}


# /* Gem is a ruby application package format, like: .deb in linux */
# /* url - https://rubygems.org/ */
function install_bundled_gems
{
    [[ -e "$MSF_HOME" ]] && cd "$MSF_HOME" && gem install bundler && bundle install
}


# /* config metasploit-framework postgresql database */
# /* url - https://www.postgresql.org/ */
function msfdb_config_file
{
cat <<EOF> $HOME/.msf4/database.yml
# Please only use postgresql bound to a TCP port.
# Only postgresql is supportable for metasploit-framework
# these days. (No SQLite, no MySQL).
#
# You will often want to seperate your databases between dev
# mode and prod mode. Absent a production db, though, defaulting
# to dev is pretty sensible for many developer-users.
production:
  adapter: postgresql
  database: msfdb
  username: msfuser
  password: msfpass
  host: localhost
  port: 5432
  pool: 75
  timeout: 5
EOF
}


function msfdb_init
{
  postgres -D /usr/local/var/postgres/ &

  # Mac OSX default postgres username: _postgres
  createuser --pwprompt msfuser
  psql -c "ALTER USER msfuser with ENCRYPTED PASSWORD 'msfpass';" msfdb
  createdb --owner msfuser msfdb

  # sudo -u postgres createuser msfuser -dRS
  # sudo -u postgres psql -c "ALTER USER msfuser with ENCRYPTED PASSWORD 'msfpass';" msfdb
  # sudo -u postgres createdb --owner msfuser msfdb
}


function install_postgresql
{
    [[ ! -e "$(which postgres)" ]] && brew install postgresql
    [[ ! -e "$HOME/.msf4" ]] && mkdir -p "$HOME/.msf4/"
    [[ ! -e "$HOME/.msf4/database.yml" ]] && msfdb_config_file
}


function main
{
    echo "[*] DATE: $(date)"
    echo "[*] OS  : $(uname -a)"

    echo "[*] Install Homebrew"
    install_homebrew

    echo "[*] Install git"
    install_git

    echo "[*] Install RVM"
    install_rvm

    echo "[*] Download metasploit-framework"
    download_msf

    echo "[*] Install ruby"
    install_ruby

    echo "[*] Install Bundled Gems"
    install_bundled_gems

    echo "[*] Install Postgresql"
    install_postgresql
}

main
