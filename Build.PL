# Original work (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017-2018.
# Modified work (c) William Belle, 2018.
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
    'Module::Build' => '0.4224',
  },
  build_requires => {
    'File::Copy::Recursive' => '0.44',
    'File::Find::Rule'      => '0.34',
    'IO::All'               => '0.87',
    'Test::JSON'            => '0.11',
    'Test::MockModule'      => '0.170.0',
    'Test::More'            => '0',
  },
  requires => {
    'JSON'                 => '2.97',
    'LWP::Protocol::https' => '6.07',
    'LWP::UserAgent'       => '6.35',
    'Readonly'             => '2.05',
  },
  meta_merge => {
    resources => {
      repository => 'https://github.com/innovativeinnovation/epfl-sciper-list',
    },
  },
  add_to_cleanup     => ['EPFL-Sciper-List-*'],
  create_makefile_pl => 'traditional',
);

$builder->create_build_script();
