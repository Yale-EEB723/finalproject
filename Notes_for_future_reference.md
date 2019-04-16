# SRA Toolkit Tips

After downloading the SRA Toolkit onto your Linux cluster, change the location of where you want the accessions sent upon downloading with the following command:
```
./vbd-config -i
```

A window will open that will allow you to change the Workspace Location (use the tab key to move the cursor). It's easiest to just move to the Goto option and type in the path to the directory.

To get SRA accessions onto Farnam, type the following command for whatever SRR number you're trying to fetch:

```
.\prefetch SRR#######
```
