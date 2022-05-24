find . -type d -name "__tests__"|while read fname;
	set folders $(string split / $fname);
	set parentFolder $folders[2];
	echo $parentFolder;
	# mv $fname/index.tsx ./$parentFolder/index.test.tsx;
	rm -rf ./$parentFolder/__tests__
  end
