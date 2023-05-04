# norp
norp (Norp Only Reads a Part) is a command line tool to parse text out of a file using user defined tags.


## Usage

To use norp in its current stage, call the norp command and pass in a file path as the only parameter.

```bash
$ norp example.txt
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
```
