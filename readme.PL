use strict;
use warnings;
use Pod::Select 'podselect';

print "Generating README.pod\n";

podselect {-output => 'README.pod'}, 'bin/pollen';

exit 0;
