# multi-tsh-script

Allows accessing and quick changing of configs in multiple remote server instances through use of tsh for accessing clusters through the command line and tmux panel synchronization

# How to run?

1. Install tmux https://github.com/tmux/tmux/wiki/Installing.
2. Install tsh https://get.gravitational.com/teleport-v4.1.10-darwin-amd64-bin.tar.gz (mac) https://get.gravitational.com/teleport-v4.1.10-linux-amd64-bin.tar.gz (linux).
3. Clone this repo, open terminal and cd into the script folder inside the repo.
4. Do *tsh login --proxy=teleportproxyname:3080 --auth=gsuite* to login to teleport account.
5. Do *chmod +x get-hostname.zsh* and *chmod +x multi-tsh.zsh* (first run only, to make the scripts executable)
6. Do *./get-hostname.zsh* followed by part of the hostname for servers you want to access. This will fetch and grep the hostname of those servers and write it in *host.txt*. 
   - e.g. *./get-hostname.zsh mockhost* will get all hostnames containing 'mockhost', while *./get-hostname.zsh mockhost-testapp* will get all hostnames containing 'mockhost-testapp'. 
   - (Alternatively you can copy and paste the hostname from teleport manually into *host.txt*, **however make sure to add a newline after the last hostname otherwise it won't be read by *multi-tsh.zsh*.** You can also manually edit and remove hostnames from *host.txt* after running the get script).
7. Do *./multi-tsh.zsh*. Tmux will open multiple panels, each logged into a interactive shell on one of the remote servers posted in *host.txt*.
8. Do *C-b C-x* (ctrl-b ctrl-x) to synchronize keyboard input on all open panels. Make sure that all panels are synchronized properly before running any commands on the remote server, and use the command *exit* to exit tmux after session.
