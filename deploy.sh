#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# 1. Build the project.
hugo -t academic # if using a theme, replace with `hugo -t <YOURTHEME>`

# 2. Go To Public folder
cd public

# 3. Add changes to git.
git add .

# 4. Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 5. Push source and build repos.
git push origin master

# 6. Come Back up to the Project Root
cd ..