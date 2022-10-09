#!/bin/sh

git_color_text() {
    text=$1
    gum style --foreground "#f14e32" "$text" 
}

get_branches() {
    gum choose --no-limit $(git branch --format="%(refname:short)")
}


gum style \
    --border double \
    --margin "1" \
    --padding "1" \
    "Git Branch Manager"

if [ -z "$(git branch --format="%(refname:short)")" ]; then
    gum style --foreground "#f14e32" "No branch found"
    exit 0
fi

echo "Choose $(git_color_text "branch") to operate on:"
braches=$(get_branches)

echo ""
echo "Choose a $(git_color_text "command"):"
command=$(gum choose rebase delete update)

# hi :)
