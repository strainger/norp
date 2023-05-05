# norp
norp (Norp Only Reads a Part) is a command line tool to parse text out of a file using user defined tags.

## Usage

These are the useful parameters

| parameter                              | description                                                                  |
| -------------------------------------- | ---------------------------------------------------------------------------- |
| -t=(str)<br>--tag=(str)               | Enter in the tag you would like norp to pick up. This can only be one tag in the current build of norp, but you can get pretty creative with tag naming and use. For example if you have a tag ##norp##usecase and then many sub-tags like ##norp##usecase##beginning, ##norp##usecase##middle, etc, you will be able to pull call the parent tag and get all of the sub-tags content |
| -F=(str)<br>--field-separator=(str)    | The default field separator is ## and can be overwritten by using this parameter. This will replace the default ## before and after the word norp to define a tag. So if your field separator is set to :) then your tags must look like :)norp:)(your tag). This was done so that norp can be use in a wider array of usecases, such as programming, note writing, documentation, etc. |
| (file path)                            | Entering in a file path will allow norp to read that file. There is no need to enter anything before the file name. If you run norp with no other parameters (or with a tag defiend as an empty string like "" or '') norp will respond with only the names of the tag structure of the input file. |

                               


## Basic Example

To begin norpin' around, run norp on a file and specify a tag to filter on. Norp will output the text as standard output, which then can be processed further to your hearts content.

```bash
$ norp example.txt --tag=subsection_01
> In this example we see a doodle doodle doo doo
>       _______
>      /       \
>   0<( oo weee )
>  /|\ \_______/
>   |
>  / \
> 
```

Would be shown if the example.txt file had the below contents
```
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

## Custom Field Separator Example

If we have the below file...

```
--norp--happy
:)
--norp--happy

--norp--sad
:(
--norp--sad
```

We can redefine the field separator as -- and norp away.

```bash
$ norp custom_field_separator.txt -F="--" -t=happy
> :)
```

## Advanced Example

To see the tag structure of our advanced file.

```bash
$ norp advanced_example.txt
> servers
> servers##linux
> servers##linux
> servers##unix
> servers##unix
> servers##windows
> servers##windows
> servers
```

To see only the linux server tags use the below command

```bash
$ norp advanced_example.txt -t=servers##linux
> ## Norp-corp is a proud owner of several fantastic linux servers.
> 
> | Server Name | Server Purpose         |
> | ----------- | ---------------------- |
> | lin_cash    | Manages money in/out   |
> | lin_web     | Hosts our main website |
> | lin_repo    | Our main linux repo    |
> | lin_san     | Location for backups   |
```

To see all content under the parent tag servers the below should be entered against our advanced example file.

```bash
$ norp advanced_example.txt -t=servers
> # Welcome to norp-corp where we have many servers!
> 
> ## Norp-corp is a proud owner of several fantastic linux servers.
> 
> | Server Name | Server Purpose         |
> | ----------- | ---------------------- |
> | lin_cash    | Manages money in/out   |
> | lin_web     | Hosts our main website |
> | lin_repo    | Our main linux repo    |
> | lin_san     | Location for backups   |
> 
> ## Norp-corp is a proud owner of several fantastic unix servers.
> 
> | Server Name | Server Purpose         |
> | ----------- | ---------------------- |
> | uix_monitor | Main monitoring server |
> | uix_sec     | Security blinky box    |
> | uix_backup  | Backup server app      |
> 
> ## Norp-corp is a owner of several windows servers.
> 
> | Server Name | Server Purpose         |
> | ----------- | ---------------------- |
> | win_users   | Endpoint for employees |
> | win_mgmt    | Endpoint for higherups |
```
