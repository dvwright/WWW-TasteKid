#!perl -T
# /* vim:et: set ts=4 sw=4 sts=4 tw=78: */
#$Id$

use strict;
use warnings;

use Test::More tests => 10;

use WWW::TasteKid;

my $tskd = WWW::TasteKid->new;
{
 $tskd->query({ type => 'music', name => 'bach' });
 $tskd->ask;
 my $res = $tskd->info_resource;
 is $res->[0]->name, 'Johann Sebastian Bach';
 is $res->[0]->type, 'music';
}

$tskd->query({ type => 'music', name => 'bach' });
$tskd->ask({ verbose => 1 });

## start for dev, test locally
#use LWP::Simple;
#$tskd->set_xml_result(
#    get('file:///'.dirname(abs_path(__FILE__)).'/data/bach_verbose.xml')
#);
## end for dev, test locally

my $res = $tskd->info_resource;

# return hash ref, specify by element
is $res->[0]->name, 'Johann Sebastian Bach';
is $res->[0]->type, 'music';

ok $res->[0]->wteaser =~ m/johann sebastian bach/ims;

ok $res->[0]->wurl =~ m{\Ahttp://en\.wikipedia\.org\/wiki\/}xms;
ok $res->[0]->wurl =~ m{bach}ixms;

ok $res->[0]->ytitle =~ m/bach/ixms;

ok $res->[0]->yurl =~ m{\Ahttp://www\.youtube\.com}xms;
ok $res->[0]->yurl =~ m{f=videos&c=TasteKid&app=youtube_gdata\z}xms;

