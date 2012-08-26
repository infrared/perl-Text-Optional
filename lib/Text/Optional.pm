package Text::Optional;

use 5.006;
use strict;
use warnings;
use Carp;
use Text::Abbrev;

our $VERSION = '0.001';

=head1 NAME

Text::Optional - Match text given optional text

=head1 VERSION

Version 0.001

=cut


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Text::Optional;

    my $foo = Text::Optional->new();
 


=head1 METHODS

=head2 new

=cut

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

=head2 check

=cut

sub check {
    my ($self,$answer,$input) = @_;
    
    my @try = ($input =~ /(\S+)/g);
    

    my (@answers) = ($answer =~ /(\S+)/g);

    my $x = 0;
    for my $each (@answers) {

        my @valid;
        my ($first) = ($each =~ /([\+\<\>\^\$\.\-\d\w\/]+)\(?/);
        push (@valid,$first);

        if ($each =~ /\(\S+\)/) {

                my ($extra) = ($each =~ /\((\S+)\)/);
                my %hash = abbrev $extra;

                for (keys %hash) {
                        push @valid, $first . $_;
                }
        }
        return 0 unless grep(lc $try[$x] eq lc $_,@valid);
        $x++;
    }
    return 1;

}

=head1 AUTHOR

Michael Kroher, C<< <infrared at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-text-optional at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-Optional>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::Optional


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Optional>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Text-Optional>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Text-Optional>

=item * Search CPAN

L<http://search.cpan.org/dist/Text-Optional/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Michael Kroher.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Text::Optional
