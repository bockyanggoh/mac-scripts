## How to use

In your `.bashrc` or `.zshrc`, add the following lines of code.

```bash
extra_script="<YOUR_DIRECTORY>/mac-scripts/main"
if [ -f $extra_script ]; then
	. $extra_script
fi
```

Source your rc file afterwards to use this config file. Enjoy!

```bash
# for zshrc
source ~/.zshrc

# for bashrc
source ~/.bashrc
```
