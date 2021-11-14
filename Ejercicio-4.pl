use strict;
use warnings;


my ($filename,$encode) = @ARGV;
my $data; 
if(not $filename and not $encode){
  print "Escriba el nombre del archivo : ";
  $filename = <>;
  chomp($filename);

  print "y hay que decifrar o cifrar : ";
  $encode = <>;
  chomp($encode);
}



$encode = lc($encode);
if($encode eq "cifrar" or $encode eq "decifrar" ){
  open($data,'<',$filename) or die $!;
  my @archivo = <$data>;
  open($data,'>',$filename) or die $!;
  my $newLine;
  
  for my $linea (@archivo){
    $newLine = cifrarydecifrar($linea);
    print $data $newLine;
  }
  close($data);
}else{
  print "Error codigo de desifrado ". $encode ." es incorrecto \n";
}

sub cifrarydecifrar{
  my ($string) = @_;
  $string =~ tr/A-Za-z/N-ZA-Mn-za-m/;
  $string
}

