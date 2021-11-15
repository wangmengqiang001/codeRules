#!/usr/bin/env bash
#
# Run jekyll builder to build the site(output folder:_site)

# run it in the source folder instead of tool

SOURCE_FOLDER=$PWD
if [ ! -z $JENKINS_VOLUME ]; then
  SOURCE_FOLDER=$JENKINS_VOLUME/workspace/$JOB_NAME/codeRules
  echo ' building in jenkins container'
fi

docker run --rm  \
-env JEKYLL_ENV=production \
-v $SOURCE_FOLDER:/srv/jekyll \
-v $SOURCE_FOLDER/vendor/bundle:/usr/local/bundle \
 jekyll/builder /bin/bash -c "chmod a+w /srv/jekyll && jekyll build --future"
