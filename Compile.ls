{SetConfig} = require "GeneralDev"

fs = require "fs"

{markdown} = require "markdown"


White      = "\033[0;37m"
LightGreen = "\033[1;32m"
Green      = "\033[0;32m"
RedLight   = "\033[0;31m"
Red        = "\033[1;31m"
Brown      = "\033[0;33m"

delimit = (require "path").sep

log = (string,replace) ->
	if not replace
		# Normal Log
		console.log string

		return

	process.stdout.clearLine!
	process.stdout.cursorTo 0
	process.stdout.write string
	return

RedHighLight = (x) -> Red + x + RedLight

Config = 
	InitialExt:"md"
	FinalExtention:"html"
	DirToLook:null
	DirToSave:null
	Compile:(FileName)->

		ReadName  =  Config.DirToLook + delimit + FileName + "." + Config.InitialExt

		WriteName =  Config.DirToSave + delimit + FileName + "." + Config.FinalExtention


		try

			ToCompile = ReadName |> fs.readFileSync |> (.toString!) 

			Compiled = markdown.toHTML ToCompile

			fs.writeFileSync WriteName ,Compiled 

			console.log LightGreen + FileName + "." + Config.InitialExt + Green +  " --> " + LightGreen + FileName + "." + Config.FinalExtention + White

		catch Problem 

			ErrorDisplay = Red + FileName + "." + Config.InitialExt + " --> " +  Problem.toString! + White
			log ErrorDisplay,false



WithDir = (Init = true,watch = true,clean = false,DirToSave = process.cwd!,DirToLook = process.cwd!) ->

	Config.DirToSave = DirToSave

	Config.DirToLook = DirToLook

	AutoBuild = SetConfig Config

	AutoBuild Init,watch,clean

	return

module.exports = WithDir
