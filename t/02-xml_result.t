#!perl -T
# /* vim:et: set ts=4 sw=4 sts=4 tw=78: */
#$Id$

use strict;
use warnings;

use Test::More tests => 5;

use WWW::TasteKid;
use File::Basename qw/dirname/;
use Data::Dumper;
use XML::Simple;

my $tc = WWW::TasteKid->new;
$tc->query({ type => 'music', name => 'bach' });
$tc->ask;

if (!$tc->get_xml_result){fail 'no results returned!'}

my $res = XMLin($tc->get_xml_result);

if (!$res)                                   {fail 'no xml to parse'}
if (!exists $res->{info})                    {fail 'missing expected xml tree'}
if (!exists $res->{info}->{resource})        {fail 'missing expected xml tree'}
if (!exists $res->{info}->{resource}->{name}){fail 'missing expected xml tree'}

is $res->{info}->{resource}->{name}, 'Johann Sebastian Bach';

my @should_exist  = (
                      'George Frideric Handel',
                      'Gustav Mahler',
                      'Maurice Ravel',
                      'Wolfgang Amadeus Mozart'
                    );

foreach my $c (@should_exist){
    ok grep {/$c/} %{$res->{results}->{resource}};
}

