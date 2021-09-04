# AbBOT

Credit to SeanDaBlack for the basis of the script.

## Discord Server

https://discord.gg/PrAWWCCpDg

## Overview

### Files

- `src/abbot/server.py` is the entrypoint for the program. It creates a local web server that serves up a reCaptcha checkbox and passes the reCaptcha token to the `forms.py` file.
- `src/abbot/forms.py` contains the functions used to interact with the forms on the target's website.
- `src/abbot/data.py` contains generators for realistic randomized data.
- `src/abbot/redirection.py` is used to redirect `prolifewhistleblower.com` to `127.0.0.1`
- `src/abbot/captcha.html` is our simple reCaptcha checkbox page.
- `src/abbot/requirements.txt` contains the required Python3 packages to be installed
- `src/abbot/.style.yapf` is the configuration file for the yapf formatter. Please run this when contributing.



## How to use the project

# AbBOT

req.py is selenium python bot.
sc.js is a the base of the ios shortcut


## Installation 

[Nix is a package management system](https://nixos.org/explore.html) that allows you to hermentically manage entire systems (instead of using PIP for python, cargo for rust, etc, which would potentially risk system-breaking modifications. Using PIP without PIPenv or the equivalent can result in overwritten dependencies and random broken programs on your computer).


### Step 0: (Windows-only)


Windows users will need to install [Windows Subsystem for Linux 2](https://docs.microsoft.com/en-us/windows/wsl/about) (aka WSL). Using WSL will help keep us all in the same POSIX-like family (i.e. MacOS, Windows, Linux users can all work with a common interface).

### Step 1: Install Nix (2.4 or above)

#### Step 1.1: Install Nix
I use the Nix flakes installer at [https://github.com/numtide/nix-flakes-installer](https://github.com/numtide/nix-flakes-installer)

```bash
sh <(curl -L https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.4pre20210823_af94b54/install) daemon
```

*Warning*: One should always look at the source of a script before curl + sh'ing it. This one is safe, but you should verify for yourself :). 

#### Step 1.2: Allow Nix Flakes

Flakes a nice way of declaritively interacting with Nix, but since they're experimental, we have to tell Nix explicitly that we want to use them.

```bash
sudo echo "# Configuration for the Nix package manager.
#
# To read detailed explanations about these options, please see [1].
# [1] - https://nixos.org/manual/nix/unstable/command-ref/conf-file.html
#
# Lets us use the 'nix' command and 'flakes' [2]
# [2] - https://nixos.wiki/wiki/Flakes
#
experimental-features = nix-command flakes

# Good for development
keep-outputs = true

# The default
keep-derivations = true
" >> /etc/nix/nix.conf
```

### Step 3: Checkout the Git repo

#### Step 3.1: Install Git
If you don't already have Git installed, no worries! Just run the following command:

```bash
nix-env -iA nixpkgs.git
```

#### Step 3.2: Checkout the `AbBot` package 

```bash
git clone https://github.com/SeanDaBlack/AbBOT.git
cd AbBot
```

### Step 4: Build the application

From the command line, in the AbBot directory, run the following command: 

`nix build`

The binary to run now exists in the `result` directory.

### Step 5: Run that sucker.

`./result/bin/abbot`


### Clone the repo

```bash
git clone https://github.com/SeanDaBlack/AbBOT.git
cd AbBot
```

### Windows

If you don't already have `python3.exe` and `pip3.exe` installed on Windows, you can install them from the Microsoft Store.

https://www.microsoft.com/store/productId/9P7QFQMJRFP7

Now we can install the required Python 3 packages for this project.

```powershell
pip3.exe install -r .\requirements.txt
```

#### Running the program

Please ensure you're running the script with Adminsitrator rights, or someone with read and write access to `C:\Windows\System32\drivers\etc\hosts`.

```
python3.exe .\server.py
```

Then, you will see the following message, "Starting the web server at http://prolifewhistleblower.com:8000/". You will want to open this URL in your browser (works with browsers' Incognito mode if you want to use it). From there you will see a reCaptcha checkbox. Click or solve the reCaptcha and then submit the form.

If you see a message exactly like the following the following in your terminal, then it was successful. If it was not successful, let us know so we can try to fix the issue.

```text
POST request complete.
{"success":true,"data":{"message":"<p>Thank you, we will be working on this shortly.<\/p>","success":true,"behav":"behaviour-hide"}}
```

To exit the program, please hit <kbd>Ctrl</kbd>+<kbd>C</kbd>.

### Linux

If you don't have `python3` or `pip3` installed, you can install the `python3` package with your preferred package manager.

```bash
sudo apt install python3
# or
brew install python3
```

Now we can install the required Python 3 packages for this project.

```bash
pip3 install -r ./requirements.txt
```

#### Running the program

Please ensure you're running the script with sudo, or someone with read and write access to `/etc/hosts`.

```bash
sudo python3 ./server.py
# or
sudo ./server.py
```

If you installed `python3`/`pip3` with `brew` (or installed Python to your account and not to the system in another way), you will want to keep your `PATH` when using `sudo`.

```bash
sudo env "PATH=$PATH" python3 ./server.py
# or
sudo env "PATH=$PATH" ./server.py
```

Then, you will see the following message, "Starting the web server at http://prolifewhistleblower.com:8000/". You will want to open this URL in your browser (works with browsers' Incognito mode if you want to use it). From there you will see a reCaptcha checkbox. Click or solve the reCaptcha and then submit the form.

If you see a message exactly like the following the following in your terminal, then it was successful. If it was not successful, let us know so we can try to fix the issue.

```text
POST request complete.
{"success":true,"data":{"message":"<p>Thank you, we will be working on this shortly.<\/p>","success":true,"behav":"behaviour-hide"}}
```

To exit the program, please hit <kbd>Ctrl</kbd>+<kbd>C</kbd>.

### OSX

If you don't have `python3` or `pip3` installed you can either download the installer from the [Python 3.9.7 release page](https://www.python.org/downloads/release/python-397/) or install it with `brew`.

```bash
brew install python3
```

Now we can install the required Python 3 packages for this project.

```bash
pip3 install -r ./requirements.txt
```

#### Running the program

Please ensure you're running the script with sudo, or someone with read and write access to `/etc/hosts`.

```bash
sudo python3 ./server.py
# or
sudo ./server.py
```

If you installed `python3`/`pip3` with `brew` (or installed Python to your account and not to the system in another way), you will want to keep your `PATH` when using `sudo`.

```bash
sudo env "PATH=$PATH" python3 ./server.py
# or
sudo env "PATH=$PATH" ./server.py
```

Then, you will see the following message, "Starting the web server at http://prolifewhistleblower.com:8000/". You will want to open this URL in your browser (works with browsers' Incognito mode if you want to use it). From there you will see a reCaptcha checkbox. Click or solve the reCaptcha and then submit the form.

If you see a message exactly like the following the following in your terminal, then it was successful. If it was not successful, let us know so we can try to fix the issue.

```text
POST request complete.
{"success":true,"data":{"message":"<p>Thank you, we will be working on this shortly.<\/p>","success":true,"behav":"behaviour-hide"}}
```

To exit the program, please hit <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## How it looks in action

![reCaptcha in Chrome on the left side. Terminal running server.py and denoting a successful POST request on the right side.](https://cdn.discordapp.com/attachments/883159187666919549/883350251833028668/unknown.png)
