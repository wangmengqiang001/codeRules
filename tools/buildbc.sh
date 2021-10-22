#!/usr/bin/env bash
#
# Run jekyll builder to build the site(output folder:_site)
docker run --rm --name jbuild -it \
-v $PWD:/srv/jekyll \
 jekyll/builder /bin/bash -c "chmod a+w /srv/jekyll && jekyll build --future"
