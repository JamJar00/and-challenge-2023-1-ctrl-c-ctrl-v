# Clipboard challenge in a single, gnarly regex
#
# OSX, as with most of its command line tools, ships with a terrible version of sed so we use docker to get a sensible
# version. If you want to run this on OSX without docker you can use the following, but it's not as fun because it's
# not one long statement
#   sed -r -e ':loop' -e 's/(((([^\[]*))\[CTRL\+C\])|(([^\[]*)\[CTRL\+X\]))?([^\[]*)\[CTRL\+V\]/\3\7\4\6/' -e 'tloop'

docker run -i ubuntu sed -r ':loop;s/(((([^\[]*))\[CTRL\+C\])|(([^\[]*)\[CTRL\+X\]))?([^\[]*)\[CTRL\+V\]/\3\7\4\6/;tloop'
