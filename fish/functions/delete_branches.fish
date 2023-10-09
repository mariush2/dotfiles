
function delete_branches
  echo $protected_branches
  for branch in $(git branch)
    set -l branch_name $(string trim $(string replace '*' ''  $branch))
    if not contains $branch_name {develop, development, main, master, staging}
       if string length --quiet $branch_name
	  echo Deleting branch: $branch_name
	  git branch -D $branch_name
       end
    end
  end
end
