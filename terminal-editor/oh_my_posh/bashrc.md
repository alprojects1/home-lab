```sh
1) nano ~/.bashrc
2) scroll down to the bottom
3) copy and paste below script
4) source ~/.bashrc
5) change_theme jandedobbeleer.omp.json
6) should change theme 
```


```sh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init bash --config ~/.poshthemes/jandedobbeleer.omp.json)"

change_theme() {
  local theme=$1
  if [ -f ~/.poshthemes/$theme ]; then
    echo "Changing theme to $theme"
    echo "eval \"\$(oh-my-posh init bash --config ~/.poshthemes/$theme)\"" > ~/.oh-my-posh-current-theme
    source ~/.oh-my-posh-current-theme
  else
    echo "Theme $theme not found in ~/.poshthemes"
  fi
}

# Source the current theme on shell startup
if [ -f ~/.oh-my-posh-current-theme ]; then
  source ~/.oh-my-posh-current-theme
else
  echo "No current theme set"
fi
```
