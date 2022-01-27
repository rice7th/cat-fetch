## CatFetch Reborn
Fast fetch program written in bash!

v. 0.5.1

The ascii cat is made by [me](https://github.com/jhonnyrice).

## MACOS BETA IS OUT!
Go and try the new mac os beta!
please if you encounter an issue, report that in a github issue

### Features
* Fast. Not as fast as the old cat-fetch, but still really fast
* Good WM detection. It can still have bugs, but its ultra fast, because it doesn't need to search processes for the WM's in a process list, wich is a very slow method
* Cute. Cats are cute.
* Lots of info. There are lots of info that this fetch can display, and we're adding even more! from the current shell to the graphical session to RAM usage.
The fetch does not work? you encounter some bugs? Create a github issue and we will fix it!*


*Fixes can take up to a day or more

#### Screenshots

###### Catfetch on fedora
![Catfetch on fedora](https://user-images.githubusercontent.com/93940240/150697310-db887fa1-530d-4a53-807b-e13fe11d2a27.png)

###### Catfetch on Ubuntu
![Catfetch on Ubuntu](https://user-images.githubusercontent.com/93940240/150697445-912577ec-b374-4936-9668-f14820b8184a.png)


#### Usage
To use the program you'll need to know these options:
```
-m		Adds more info, like the system architecture and graphic session(X11 or WAYLAND) to the output
-d		Adds your dark color palette to the output
-b		Adds your bright color palette to the output
-c		Adds both your dark and bright color palette to the output
-a		Adds all of the above
-h		Shows this help message
```

#### Install
Clone the repo and cd into the cloned repo:
```
git clone https://github.com/JhonnyRice/cat-fetch-reborn
cd cat-fetch-reborn
```
Now to install it system-wide using make:
```
sudo make install	# Normal install
sudo make installmacos	# Macos install
sudo make installposix	# Posix-compliant install (WIP)
```
We advice to always check the project's code before running it, we do not take any responsability if something happens.

#### Uninstall
To uninstall the program run:
```
sudo make uninstall
```

## Contributors
[JhonnyRice](https://github.com/JhonnyRice/) Owner

[Francicoria](https://github.com/Francicoria/) Wrote half of the code

[SpyLima](https://github.com/SpyLima) created the install.sh

[Viper](https://github.com/viperML) suggested using a makefile instead of install.sh

[Kazoku](https://github.com/K4zoku) perfectioned the wm detection scipt, adding wayland support and making it way shorter

[Alberto Salvia Novella](es20490446e.wordpress.com) created the original Xorg WM detection script
#### Notes
Uses some GNU core utils and xprop to work.

This program is licensed under the GPLv3 license.

If you encounter any issue or want a feature to be added please open an issue on this GitHub page. 

### TODO
fetching

- [x] OS
- [x] WM
- [x] Shell
- [x] Uptime
- [x] Kernel
- [x] Arch
- [x] Graphic Session
- [x] CPU
- [x] RAM
- [x] GPU
- [x] Terminal
- [ ] Current Time & date (???)
- [ ] Terminal Font
- [ ] DE (separated from WM)
- [ ] GTK Theme
- [ ] GTK Icons
- [x] Resolution
- [ ] Host
- [x] Disk Usage
- [x] Packages (experimental)
