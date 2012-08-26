#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Text::Optional' ) || print "Bail out!\n";
}

diag( "Testing Text::Optional $Text::Optional::VERSION, Perl $], $^X" );
