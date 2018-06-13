echo "activating git hooks"
for hooksfile in "$PWD"/hooks/*
do
  filename=$(basename "$hooksfile")
  #copying customized hooks files into git hooks folder
  echo "adding customized git hook: $(echo $filename)"
  cp "$PWD"/hooks/"$filename" "$PWD"/.git/hooks/"$filename"
done
