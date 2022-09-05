#!/bin/bash

# add an alias to run this script in a convenient manner. E.g. add this to you .bashrc:
# alias gen_landing_page='~/path/to/this/dir/build_landing_page.sh'
# run this script from within the directory where the index.md is placed!

LANDING_PAGE_RESOURCE_PATH=$(dirname -- "${BASH_SOURCE}")/resources
LANDING_PAGE_BUILD_PATH=${PWD}/../build
TEMPLATE=default.html
STYLE=default.css

# make build/static folder if not exists
mkdir -p ../build

# copy content of templates 'static' folder (this includes logos. etc) 
rsync -a $LANDING_PAGE_RESOURCE_PATH/static $LANDING_PAGE_BUILD_PATH

# do the same for the users static folder
rsync -a ${PWD}/static $LANDING_PAGE_BUILD_PATH

# run pandoc (for now only with the default template) and put everything into the build folder
HTML=$LANDING_PAGE_RESOURCE_PATH/templates/$TEMPLATE
CSS=$LANDING_PAGE_RESOURCE_PATH/templates/$STYLE
pandoc --self-contained --standalone index.md -o $LANDING_PAGE_BUILD_PATH/index.html --mathjax --css $CSS --template $HTML

# copy over stylesheet
#rsync -a ${CSS} $LANDING_PAGE_BUILD_PATH

# show the page using pythons simple http server
#cd ../build/ 
#python3 -m http.server
