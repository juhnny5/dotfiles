#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
export GIT_AUTHOR_NAME="Julien BRIAULT"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"

git config --global user.name "$GIT_AUTHOR_NAME"

export GIT_AUTHOR_EMAIL="julien.briault@outlook.com"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

git config --global user.email "$GIT_AUTHOR_EMAIL"

export GIT_EDITOR="vim"
git config --global core.editor "$GIT_EDITOR"