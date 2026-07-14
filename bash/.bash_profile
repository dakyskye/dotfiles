# ~/.bash_profile — read by LOGIN shells (macOS terminals usually are login shells).
# Login bash reads this instead of ~/.bashrc, so pull ~/.bashrc in explicitly.
# (~/.bashrc itself sources ~/.profile, so PATH/env still gets set up.)
[[ -r ~/.bashrc ]] && source ~/.bashrc
