#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/Dante-Dante-alt/shell/blob/master/XCZ.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='axanthics/xcz'
# Display Name.
DAEMON_NAME='Xchainz Core'
# Coin Ticker.
TICKER='XCZ'
# Binary base name.
BIN_BASE='xchainz'
# Directory.
DIRECTORY='.xchainz'
# Conf File.
CONF='xchainz.conf'
# Port.
DEFAULT_PORT=14815
# Explorer URL.
EXPLORER_URL='http://explorer2.lightpaycoin.org/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=1000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1
IPV6=1
# Use addnode and not connect.
USE_CONNECT=0

# Tip Address.
TIPS='Sgz6MUgsbyMZ3WxSv8KX91Xe4YUZYixqtc'
# Dropbox Addnodes.
DROPBOX_ADDNODES='5b17cirn2xdsf5s'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=0
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='0snty45ux3onik3'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=0
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='kre40p2fhji48zt'
USE DROPBOX_BLOCKS_N_CHAINS=0

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "XCHAINZ"
    
 \  /   /~~   ~~|            
  \/   |       / 
  /\   |      /    
 /  \   \__   |__
           
              
XCHAINZ
}


cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$(( COUNTER + 1 ))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null
