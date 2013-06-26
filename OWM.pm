package OWM;

use strict;
use warnings;
use LWP::UserAgent;

sub new {
	my $class = shift;
	my $self = {};
	$self->{url} = "http://api.openweathermap.org/data/2.5/";
	$self->{ua} = LWP::UserAgent->new;
	bless ($self, $class);
	return $self;
}

sub weather {
	my $self = shift;
	my %args = ref $_[0] eq 'HASH' ? %{$_[0]} : @_;
	my $result;

	my $param = "weather?";
	if (exists($args{q})) {
		$param .= "q=" . $args{q};
	} elsif (exists($args{lat}) && exists($args{lon})) {
		$param .= "lat=" . $args{lat} . "&" . "lon=" . $args{lon};
	} elsif (exists($args{id})) {
		$param .= "id=" . $args{id};
	} else {
		$result = "location param error ／(^o^)＼";
		return $result;
	}

	if (exists($args{mode})) {
		$param .= "&mode=" . $args{mode};
	}

	my $url = $self->{url} . $param;
	print $url;
	return $self->{ua}->get($url);
}

1;
__END__
