function styled_components
  find . -type f -name '**'.tsx |while read foundFile;
    set -l propNames $(ack "\(props\) => props\.(\w+)" $foundFile --output='$1')
    for prop in $propNames
      echo $(string join '' 'Found styled components prop: "' $prop '"!')
      gsed -Ei $(string join '' 's/(\.| )(' $prop ')(((\?:|:) \w+)|}|=)/\1\$' $prop '\3/g') $foundFile
      echo 'Done updating variable name and references.'
      echo \n
    end
  end
end
