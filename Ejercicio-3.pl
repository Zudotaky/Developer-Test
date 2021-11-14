use strict;
use warnings;
use JSON;
use HTTP::Tiny;

my $apikey = "18e4ba1d71a0d81144b87e1b0c822f28";#"apikey";

sub obtenerTemperatura{
  my ($city) = @_;
  my $response = HTTP::Tiny->new->get(
  'http://api.openweathermap.org/data/2.5/weather?q=' . $city . 
  '&units=metric&sort=population&appid='. $apikey);
  
  status($response, $city);


  $response = decode_json($response->{'content'});
  my $dayData = $response->{'main'};
  my $temp =  $dayData->{'temp'};
  return $temp;
} 

sub status{
  my ($response, $city) = @_;
  if($response->{'status'} == 404){
    print "No se encontro la ciudad $city \n" ;
    exit "status 404";
  }
}

my ($primeraCiudad, $segundaCiudad) = @ARGV;

if(not $primeraCiudad and not $segundaCiudad ){
  print "Escriba el primera ciudad : ";
  $primeraCiudad = <>;
  chomp($primeraCiudad);
  print "Escriba el segunda ciudad : ";
  $segundaCiudad = <>;
  chomp($segundaCiudad);  
}

my $primeraCiudadTemp = obtenerTemperatura($primeraCiudad);
my $segundaCiudadTemp = obtenerTemperatura($segundaCiudad);

if ($primeraCiudadTemp > $segundaCiudadTemp){
  print "en $primeraCiudad ($primeraCiudadTemp ºc) hace mas calor que en $segundaCiudad ($segundaCiudadTemp ºc) \n";
}else{
  print "en $segundaCiudad ($segundaCiudadTemp ºc) hace mas calor que en $primeraCiudad ($primeraCiudadTemp ºc) \n";

}


