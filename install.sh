#!/usr/bin/env bash
root=$PWD
export DOTFILE=$root
stow_dirs=$(find $PWD -mindepth 1 -maxdepth 1 -not -path "*/.git" -type d)
term="kitty"
prompt="ohmyposh"
ignore=""

# if [[ -f "$DOTFILE/init_complete" ]]; then
#     exit
# fi
#
# if [ ! $(find "_logs" -type d) ]; then
#     mkdir _logs
#     touch _logs/logs
# fi
#
# for folders in $stow_dirs; do
#     currentFolder=$(basename $folders)
#
#     if [[ $currentFolder == 'term' ]]; then
#         term_folder=$(find $currentFolder -mindepth 2 -maxdepth 2)
#         for folder in $term_folder; do
#             ignore_folder=$(basename $folder)
#             if [[ $ignore_folder != $term && $ignore_folder != $prompt ]]; then
#                 ignore="$ignore${ignore_folder}|"
#             fi
#         done
#         ignore=$(echo $ignore | sed 's/|$//')
#         echo "Ignoring $(echo $ignore | sed 's/|/ /g')"
#         echo -e "Stowing $currentFolder"
#         stow $currentFolder --ignore "$ignore"
#     else
#         echo -e "Stowing $currentFolder"
#         stow $currentFolder
#     fi
# done
#
# cd $root
# # echo -e "\nInit submodule"
# # git submodule update --init --recursive --remote
# # wait
# # git submodule foreach git checkout main
# # wait
# echo "Done clone"
#
# sleep 1
echo "Init script"
./init.sh
# touch init_complete
echo "Done"
