use strict;
use warnings;

use lib 't/';
use MockSite;
use EPFL::Sciper::List qw/p_buildUrl retrieveSciper/;

use Test::MockModule;
use Test::More tests => 7;

is(
  p_buildUrl('k'),
  'https://search.epfl.ch/json/autocompletename.action?maxRows=99999999&term=k',
  'correct url'
);

my $urlRoot = MockSite::mockLocalSite('t/resources/epfl-search');

my $module = Test::MockModule->new('EPFL::Sciper::List');
$module->mock(
  'p_buildUrl',
  sub {
    my $letter = shift;
    return $urlRoot . q{/} . $letter . '.json';
  }
);

my @personsList = retrieveSciper();
is( scalar @personsList,           62,        'number of persons' );
is( $personsList[0]->{sciper},     100654,    'sciper of first person' );
is( $personsList[0]->{name},       'Klum',    'name of first person' );
is( $personsList[22]->{sciper},    168745,    'sciper of first person' );
is( $personsList[22]->{firstname}, 'Rebecca', 'name of first person' );

$urlRoot = MockSite::mockLocalSite('t/resources/epfl-search-empty');
$module->mock(
  'p_buildUrl',
  sub {
    my $letter = shift;
    return $urlRoot . q{/} . $letter . '.json';
  }
);

@personsList = retrieveSciper();
is( scalar @personsList, 0, 'number of persons' );
