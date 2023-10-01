#!/bin/bash

# rename to project specific values
NAME="las"
CONST="las"
STRUCT="las"
FN="las"

# will be replaced
las_NAME="las"
las_STRUCT="las"
las_CONST="las"
las_FN="las"

function replace() {
	echo "Replacing $1 with $2"
	find ./ -type f -name '*.c' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.h' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.md' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.lua' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.sh' -exec sed -i "s/$1/$2/g" {} \;
	find ./doc/ -type f -name '*' -exec sed -i "s/$1/$2/g" {} \;
}

replace $las_NAME $NAME
replace $las_CONST $CONST
replace $las_STRUCT $STRUCT
replace $las_FN $FN

mv "include/$las_NAME.h" "include/$NAME.h"
mv "src/$las_NAME.c" "src/$NAME.c"
mv "doc/$las_NAME" "doc/$NAME" 
