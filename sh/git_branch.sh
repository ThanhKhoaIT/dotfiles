git_branch() {
  branch=`git rev-parse --abbrev-ref HEAD`
  echo "$branch" | awk '{printf $0}'
}
git_branch
