## CatFetch Reborn
Fast fetch program written in bash script!

The ascii cat is made by [me](https://github.com/jhonnyrice).

#### Usage
To use the program you'll need to know these options:
```
-m		Adds the system architecture and graphic session(X11 or WAYLAND) to the output
-d		Adds your dark color palette to the output
-b		Adds your bright color palette to the output
-c		Adds both your dark and bright color palette to the output
-a		Adds all of the above
-h		Shows this help message
```

#### Install
Clone the repo and use `make~ to automatically install the program:
```
git clone https://github.com/JhonnyRice/cat-fetch-reborn
cd cat-fetch-reborn
sudo make install
```
We advice to always check the project's code before running it, we do not take any responsability if something happens.

#### Uninstall
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
