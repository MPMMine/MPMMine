In order to correct the Fzn_Ozn File in the "File Conversion Pipeline" from LPP-Utilities (example 001)

Add:
```
include "/Applications/MiniZincIDE.app/Contents/Resources/share/minizinc/linear/redefinitions.mzn";
```

Delete:
 - lines that redefine functions `reverse_map_ab2si` and `reverse_map`: lines `7, 10`

 - lines that redefine variables: `2, 5, 11, 13, 15, 17, 19`

Save and reload from disk.