# Linux dot files
Set up a comfortable Linux session with minimal effort.

The provided environment is useful both for developers working on remote environments and for system administrators. 

You can also use it on your local machine, though screen settings won't apply to you.

GTK keybindings will also not apply to you if you are on a server.

## Shell config
First off, append the config files for bash, fish and `.profile` to your home folder:

	cat ./.bashrc >> ~/.bashrc	
	mkdir -p ~/.config/fish
	cat ./.config/fish/config.fish >> ~/.config/fish/config.fish	
	cat ./.profile >> ~/.profile
	exit

Now log in again, and you'll be presented a new prompt:

	[user@server]─[~]
	$ _

Now you can run commands like "l", which will list all files colored by file type and displaying a human readable file size.

	$ l
	total 12K
	drwxrwxr-x 4 user user 4.0K Jan 21 15:49 src
	drwxrwxr-x 7 user user 4.0K Dec  5 19:51 modules
	drwxrwxr-x 2 user user 4.0K Dec  2 16:59 tmp

"la" is the same as above, but displaying all hidden files. 

### VIM
Vim now comes with syntax highlighting and a status bar with convenient information. 

Give it a better look by running:

	cat ./.vimrc >> ~/.vimrc

### Screen
If you work remotely a lot through ssh, you may experience number of connection cuts. Screen can help you keep your sessions alive while you detach and reconnect later on

First, tell screen to give you a better look:

	cat ./.screenrc >> ~/.screenrc

**rescreen** is a wrapper that lets you create named sessions easily and reconnect to them even if screen thinks that you are already attached. 

	rescreen
	Screen options:
	
	  0:  No screen
	  1:  Create a new session
	
	> 1
	Give it a name: DEV

Create a new session, perform some commands on it, and hit **\`** plus **D** 

Your session will be detached and you'll be back to the previous shell. 

Now run rescreen again:

	[detached]
	[user@server]─[~]
	$ rescreen
	Screen options:
	
	  0:  No screen
	  1:  Attach to 13948.DEV
	  2:  Create a new session
	
	> 1

And voilà! Your session will be back. 

Try also to create tabs on your sessions. For that, type **\`** plus **C**.

Use **\`** plus **N** to switch to the next one and **\`** plus **P** to go back.

Finally, use **\`** + **1** to jump to tab #1,  **\`** + **2** to jump to tab #2 and so on.

## Utilities
Other commands that you can now run on bash:
### extract
Pass it any any package file and this command will do the trick for you (tar.bz2, tar.gz, bz2, rar, gz, tar, tbz2, tgz, zip, Z and 7z)

	extract <file-name>

### files
Enumerate all the files inside the current directory. Pass it a number to limit the depth to explore (optional)

	files 2


### folders
Enumerate all the folders inside the current directory. Pass it a number to limit the depth to explore (optional)

	folders 1
	
### fawk
Pipe data to this command to get a specific column. This will use awk to return the N-th column of the input passed to it.

	$ l / | fawk 3
	
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root
	root

## GTK key bindings

Depending on your environment, you can set GTK apps to use different keybindings:

```
mkdir -p ~/.config/gtk-3.0/
mkdir -p ~/.local/share/nautilus-python/extensions/
# mkdir -p ~/.config/Code/User/
# mkdir -p ~/.config/VSCodium/User/

cp ./.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
cp ./.local/share/nautilus-python/extensions/KeybindingRemap.py ~/.local/share/nautilus-python/extensions/KeybindingRemap.py
# cp ./.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
# cp ./.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json
```

Source: 
- https://www.foell.org/justin/windows-xcv-cut-copy-paste-in-ubuntu/
- https://askubuntu.com/questions/294953/gtk-key-theme-emacs-what-keystroke-is-for-select-all/851055#851055

