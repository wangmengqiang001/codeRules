#!/usr/bin/env bash
#
# Run jekyll/jekyll  to build&run the site(output folder:_site)
docker run --rm --name jserver -it -p 8260:4000 \
-v $PWD:/srv/jekyll \
 jekyll/jekyll /bin/bash -c "chmod a+w /srv/jekyll && jekyll  server -H 0.0.0.0"
