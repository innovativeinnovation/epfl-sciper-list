#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'EPFL::Sciper::List' ) || print "Bail out!\n";
}

diag( "Testing EPFL::Sciper::List $EPFL::Sciper::List::VERSION, Perl $], $^X" );
