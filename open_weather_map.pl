#!/usr/bin/env perl

use strict;
use warnings;
use LWP::UserAgent;
use Data::Dumper;
use JSON::XS;
use utf8;
use OWM;

# my $ua = LWP::UserAgent->new;
# my $res = $ua->get("http://api.openweathermap.org/data/2.5/weather?q=London,uk");

# my $response = JSON::XS->new->utf8->decode($res->{_content});

my $owm = OWM->new;
my $response = $owm->weather({
	q	=>	"London,uk",
});
print Dumper $response;
