use strict;
use warnings;
use JSON;
use HTTP::Tiny;
use Data::Dumper;

my ($city) = @ARGV;

# la query
my $response = HTTP::Tiny->new->get(
  'http://api.openweathermap.org/data/2.5/weather?q=' . $city . 
  '&units=metric&sort=population&appid=c1ca09002908d35b2cdbd9ee19c1a482');

## error si no encuenta una cuidad con el nombre o codigo
if($response->{'status'} == 404){
  print "No se encontro la ciudad ". $city ." \n" ;
  exit 42;
}
#convierto el json en un hash
$response = decode_json($response->{'content'});

# daco los datos del hash
my $weather = $response->{'weather'};
$weather = $weather->[0];
$weather = $weather->{'description'};

my $dayData = $response->{'main'};

my $temp =  $dayData->{'temp'};
my $humedad= $dayData->{'humidity'};

#imprimo los datos
print $weather."\n";
print $temp . "ºc " . $humedad . "% RH \n";

