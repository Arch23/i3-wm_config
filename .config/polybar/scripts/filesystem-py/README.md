[module/filesystem-py]
type = custom/script
exec = ~/.config/polybar/scripts/filesystem-py/filesystem.py / /home
tail = true
format = <label>
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
label = %output%