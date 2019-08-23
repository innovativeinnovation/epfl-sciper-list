# Original work (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017-2018.
# Modified work (c) William Belle, 2018-2019.
# See the LICENSE file for more details.

package MockSite;

use strict;
use warnings;

use File::Temp qw/tempdir/;
use File::Copy::Recursive qw/dircopy/;

# copy a local test directory
sub mockLocalSite {
  my $localdir = shift;

  my $tmpDir = tempdir( CLEANUP => 1 );
  dircopy( $localdir, $tmpDir );
  return "file:///$tmpDir";
}

1;
