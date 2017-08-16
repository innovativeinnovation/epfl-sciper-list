package EPFL::Sciper::List;

use 5.006;
use strict;
use warnings;

use JSON;
use Readonly;
use LWP::UserAgent;

=head1 NAME

EPFL::Sciper::List - Retrieve a list of all sciper

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use EPFL::Sciper::List;

    my $foo = EPFL::Sciper::List->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=cut

use base 'Exporter';
our @EXPORT_OK = qw/p_createUserAgent p_getUrl/;

Readonly::Scalar my $TIMEOUT => 1200;

Readonly::Scalar my $MAXREDIRECT => 10;

=head1 SUBROUTINES/METHODS

=head1 PRIVATE SUBROUTINES/METHODS

=head2 p_createUserAgent

Return a LWP::UserAgent.
LWP::UserAgent objects can be used to dispatch web requests.

=cut

sub p_createUserAgent {
  my $ua = LWP::UserAgent->new;

  $ua->timeout($TIMEOUT);
  $ua->agent('DevRunBot');
  $ua->env_proxy;
  $ua->max_redirect($MAXREDIRECT);

  return $ua;
}

=head2 p_getUrl

Dispatch a GET request on the given $url
The return value is a response object. See HTTP::Response for a description
of the interface it provides.

=cut

sub p_getUrl {
  my ( $ua, $url ) = @_;

  return $ua->get($url);
}

=head1 AUTHOR

William Belle, C<< <william.belle at gmail.com> >>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests here L<https://github.com/epfl-devrun/epfl-sciper-list/issues>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc EPFL::Sciper::List


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

1;    # End of EPFL::Sciper::List
