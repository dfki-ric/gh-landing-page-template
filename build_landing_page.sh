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


#pandoc --standalone index.md -o $LANDING_PAGE_BUILD_PATH/index.html --mathjax --css $STYLE --template $HTML

# this builds a totally self contained html (which can be quite large due to mathjax, images, etc. being included)
# However, maybe this is required to comply with DSGVO
pandoc --self-contained index.md -o $LANDING_PAGE_BUILD_PATH/index.html --mathjax --css $CSS --template $HTML

# copy over stylesheet (probably not needed for --self-contained)
rsync -a ${CSS} $LANDING_PAGE_BUILD_PATH


# show the page using pythons simple http server
#cd ../build/ 
#python3 -m http.server
