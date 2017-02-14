# Folder Search Bash Script
Suppose you have a few sub-folders (dataA, simA, simB, and simC) inside folder 'targetA', this script accepts the path to 'targetA' as first argument, then display only folders with prefix 'sim', and the option for user to select one folder (e.g. by displaying a number associated to that folder).

For example:

Select one of this:

0 simA

1 simB

2 simC

Type in the number?

Keep printing 'Type in the number?' until the user selects a value in the proper range (e.g. 0-2 in this case).

Once user select a folder, print out the suffix of that folder (with prefix as 'sim'), e.g. if 'simA' is selected, then print out 'A', and exit the script.
