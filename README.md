# Linux-bp
Linux-bp is a boilerplate to help you set up a comfortable Linux session with minimal effort.

The provided environment is useful both for developers working on remote environments and for system administrators. 

You can also use it on your local machine, though screen settings won't apply to you.

## Getting started
First off, append the bashrc configuration to your user's ~/.bashrc configuration file:

	cat bashrc >> ~/.bashrc	
	cat profile >> ~/.profile
	exit

Now log in again, and you'll be presented a new prompt:

	[ec2-user@DEV]─[~]
	$ _

Now you can run commands like "l", which will list all files colored by file type and displaying a human readable file size.

	$ l
	total 12K
	drwxrwxr-x 4 ec2-user ec2-user 4.0K Jan 21 15:49 src
	drwxrwxr-x 7 ec2-user ec2-user 4.0K Dec  5 19:51 modules
	drwxrwxr-x 2 ec2-user ec2-user 4.0K Dec  2 16:59 tmp

"la" is the same as above, but displaying all hidden files. 

### Screen
If you work remotely a lot through ssh, you may experience number of connection cuts. Screen can help you keep your sessions alive while you detach and reconnect later on

First, tell screen to give you a better look:

	cat screenrc >> ~/.screenrc	.

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
	[ec2-user@DEV]─[~]
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

### VIM
Vim now comes with syntax highlighting and a status bar with convenient information. 

Give it a better look by running:

	cat screenrc >> ~/.screenrc

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

