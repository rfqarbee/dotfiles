#!/usr/bin/env sh

echo "$PWD"
stow_dirs=$(find $PWD -mindepth 1 -maxdepth 1 -not -path "*/.git" -type d)
term="kitty" # change this if using other terminal
prompt="ohmyposh" # change to starship if not using ohmyposh
ignore=""

for folders in $stow_dirs; do
    currentFolder=$(basename $folders)

    if [[ $currentFolder == 'term' ]]; then
        term_folder=$(find $currentFolder -mindepth 2 -maxdepth 2)
        for folder in $term_folder; do
            ignore_folder=$(basename $folder)
            if [[ $ignore_folder != $term && $ignore_folder != $prompt ]]; then
                ignore="$ignore${ignore_folder}|"
            fi
        done
        ignore=$( echo $ignore | sed 's/|$//' )
        echo -e "Stowing $currentFolder"
        stow $currenFolder $ignore
    else
        echo -e "Stowing $currentFolder"
        stow $currentFolder
    fi
done
