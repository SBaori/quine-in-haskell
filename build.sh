src=$(cat src.hs)
blob=$(echo -n "$src" | sed 's/\\/\\\\\\\\/g; s/"/\\\\"/g' | sed ':a;N;$!ba;s/\n/\\\\n/g')
echo -n "$src" | sed "s/?/$blob/g" > quine.hs
echo "Generated quine.hs"
