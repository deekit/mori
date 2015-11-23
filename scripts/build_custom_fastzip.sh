#!/bin/sh

set -e

./bin/lein_prefer deps
./bin/lein_prefer cljsbuild once release-custom-fastzip

echo "Finalizing mori.fastzip.js"

(cat support/wrapper.beg.txt; cat mori.bare.js; cat support/wrapper.end.txt) > mori.fastzip.js

echo "Deleting mori.bare.js"

rm mori.bare.js

echo "Build finished."
