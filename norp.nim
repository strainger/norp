import strutils
import os

let delim = "##"
let infile = open(paramStr(1))

var found = false
for line in infile.lines:
  if line.startsWith(delim):
    if found == true:
      found = false
    else:
      found = true
  else:
    if found == true:
      echo line

infile.close()
