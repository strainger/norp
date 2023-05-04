import strutils
import os
import parseopt

var filePath: string
var tag: string
var verbose = false
var delim = "##"
var params = initOptParser(quoteShellCommand(commandLineParams()))
var tags = newSeq[string]()
var found = false
var tagsonly = false

while true:
  params.next()
  case params.kind
  of cmdEnd: break
  of cmdShortOption, cmdLongOption:
    if params.val == "":
      if params.key == "v":
        verbose = true
      elif params.key == "verbose":
        verbose = true
    else:
      if params.key == "t":
        tag = params.val
      elif params.key == "tag":
        tag = params.val
      elif params.key == "F":
        delim = params.val
      elif params.key == "field-separator":
        delim = params.val
  of cmdArgument:
    filePath = params.key

if filePath == "":
  echo "You must enter a file"
  quit(1)

let infile = open(filePath)

if tag == "":
  tagsonly = true
for line in infile.lines:
  if line.startsWith(delim & "norp" & delim & tag):
    tags.add(line.replace(delim & "norp" & delim, ""))
    if found == true:
      found = false
    else:
      found = true
  else:
    if found == true:
      if tagsonly == false:
        echo line
infile.close()
if tag == "":
  for entry in tags:
    echo entry
