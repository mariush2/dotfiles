function change_filenames
  find . -type d|while read foundPath;
      set folders $(string split / $foundPath);
      set parentFolder $folders[-1];
      if test -e $foundPath/index.tsx
	  echo "index.tsx exists in $foundPath, creating new file with $parentFolder as filename";
	  mv $foundPath/index.tsx $foundPath/$parentFolder.tsx;
      end
      if test -e $foundPath/index.test.tsx
	  echo "index.test.tsx exists in $foundPath, creating new file with $parentFolder as filename";
	  mv $foundPath/index.test.tsx $foundPath/$parentFolder.test.tsx;
      end
  end
end
