#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;

use EPFL::Sciper::List qw/retrieveSciper toJson toTsv/;

=head1 NAME

epfl-sciper-list.pl

=head1 DESCRIPTION

Get a list of all public active sciper from EPFL

=head1 VERSION

Version 0.01

=head1 USAGE

  epfl-sciper-list.pl --help

  epfl-sciper-list.pl --output=json > sciper.json

  epfl-sciper-list.pl --output=tsv > sciper.tsv

=head1 OPTIONS

=over 2

=item --output=tsv|json

Output format in TSV or Json.

=back

=cut

our $VERSION = '0.01';

my ( $help, $output );

GetOptions(
  'output=s' => \$output,
  'help'     => \$help,
) || pod2usage(2);

if ($help) {
  pod2usage(1);
  exit 0;
}

my @listPersons = retrieveSciper();

if ( $output eq 'json' ) {
  print toJson(@listPersons);
}
else {
  print toTsv(@listPersons);
}

=head1 AUTHOR

William Belle, C<< <william.belle at gmail.com> >>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests here L<https://github.com/epfl-devrun/epfl-sciper-list/issues>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc epfl-sciper-list.pl

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/EPFL-Sciper-List>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/EPFL-Sciper-List>

=item * Search CPAN

L<http://search.cpan.org/dist/EPFL-Sciper-List/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    L<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

1;
