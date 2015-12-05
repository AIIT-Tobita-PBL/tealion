# for TEALION
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export ALSADEV="pulse"
export HOYA_API="API_KEY"
export TEALION_ROOT="/opt/tealion"
/usr/sbin/alsactl --file ~/.config/asound.state restore
