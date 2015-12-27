##MarkDownWatch - Watches MarkDown Files


###Why

1. Simpler to use than Gulp/Grunt.
	```
	> npm install JoyKrishnaMondal/MarkdownWatch
	> node -p "require('MarkdownWatch')()"
	```

2. Only functional API based on my other  [module](https://github.com/JoyKrishnaMondal/GeneralDev)

	+ For example if you want to do a `.html` cleanup (getting rid of all `.html` files that got compiled from markdown)
	```
	> node -p "require('MarkdownWatch')(0,0,1)"
	```
	+ Or if you want to **only** compile files that you edit.
	```
	> node -p "require('MarkdownWatch')(0,1,0)"
	```
	+ Or if you want to compile all your `html` files to a distribution directory.
	```
	> node -p "require('MarkdownWatch')(1,0,0,"../distribution")"
	```

### Default Setting
When running without any argument:

> node -p "require('LiveScriptWatch')()"
```
it does the same as:
 ```
> "require('LiveScriptWatch')(1,1,0,process.cwd(),process.cwd())"
```
The first three arguments are flags for :

1. Initial Compilation *regardless* of file change.
2. passing `true` sets up watches
3. passing `true` does a clean up for compiled files.

The last two arguments specify the path for save for compiled files and lookup for source files in that order - for default its the directory where the script is being run from.

The details are more throughly explained in [GeneralDev](https://github.com/JoyKrishnaMondal/GeneralDev)




