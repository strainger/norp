# norp
norp (Norp Only Reads a Part) is a command line tool to parse text out of a file using user defined tags.

## Usage

These are the useful parameters

| parameter                              | description                                                                  |
+========================================+==============================================================================|
| -t=(string)/--tags=(string) |          | Enter in the tag you would like norp to pick up. This can only be one tag    |
|                                        | in the current build of norp, but you can get pretty creative with tag       |
|                                        | naming and use. For example if you have a tag ##norp##usecase and then many  |
|                                        | sub-tags like ##norp##usecase##beginning, ##norp##usecase##middle, etc, you  |
|                                        | will be able to pull call the parent tag and get all of the sub-tags content |
+----------------------------------------+------------------------------------------------------------------------------|
| -F=(string)/--field-separator=(string) | The default field separator is ## and can be overwritten by using this       |
|                                        | parameter. This will replace the default ## before and after the word norp   |
|                                        | to define a tag. So if your field separator is set to :) then your tags must |
|                                        | look like :)norp:)(your tag). This was done so that norp can be use in a     |
|                                        | wider array of usecases, such as programming, note writing, documentation,   |
|                                        | etc.                                                                         |
+----------------------------------------+------------------------------------------------------------------------------|
| (file path)                            | Entering in a file path will allow norp to read that file. There is no need  |
|                                        | to enter anything before the file name.                                      |
                               

To use norp in its current stage, call the norp command, enter a file path as a parameter, then type in your tag you would like to have norp render. Norp will output the text as standard output, which then can be processed further or redirected to a file.

## Example

```bash
$ norp example.txt --tags=subsection_01
In this example we see a doodle doodle doo doo
      _______
     /       \
  0<( oo weee )
 /|\ \_______/
  |
 / \

```

Would be shown if the example.txt file had the below contents
```bash
norp
norp norp
NORP
norp norp norp
##norp##subsection_01
In this example we see a doodle doodle doo doo
      _______
     /       \
  0<( oo weee )
 /|\ \_______/
  |
 / \

##norp##subsection_01

norp no rp norp
don't print this
norp no rp norp
NORP NO RP NORP
norp no rp norp
##norp##cpp
#include<iostream>
int main(){
  #make program work
}
##norp##cpp
```
