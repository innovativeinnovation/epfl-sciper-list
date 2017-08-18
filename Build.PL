# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017.
# See the LICENSE file for more details.

use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name        => 'EPFL::Sciper::List',
  license            => 'apache_2_0',
  dist_author        => q{William Belle <william.belle@gmail.com>},
  dist_version_from  => 'lib/EPFL/Sciper/List.pm',
  release_status     => 'stable',
  configure_requires => {
    'Module::Build' => 0,
  },
  build_requires => {
    'Test::More'            => 0,
    'File::Copy::Recursive' => 0.38,
    'Test::MockModule'      => 0.12,
  },
  requires => {
    'Readonly'             => 2.05,
    'JSON'                 => 2.94,
    'LWP::Protocol::https' => 6.07,
    'LWP::UserAgent'       => 6.26,
  },
  add_to_cleanup     => ['EPFL-Sciper-List-*'],
  create_makefile_pl => 'traditional',
);

$builder->create_build_script();
