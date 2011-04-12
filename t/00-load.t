#!perl -T

# /* vim:et: set ts=4 sw=4 sts=4 tw=78: */
#$Id$

use strict;
use warnings;

use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::TasteKid' );
}

diag( "Testing WWW::TasteKid $WWW::TasteKid::VERSION, Perl $], $^X" );
