use strict;
use warnings;


my ($filename,$encode) = @ARGV;
my $data;

$encode = lc($encode);

if($encode eq "cifrar" or $encode eq "descifrar" ){
  # habre el archivo en modo lectura y lo guarda en un array
  open($data,'<',$filename) or die $!;
  # guarda el archivo como un array
  my @data = <$data>;
  # habre el archivo en modo escritura y borra los datos 
  open($data,'>',$filename) or die $!;

  foreach my $line (@data){
    #convierte el string en el string cifrado o descrifrado
    $line =~   tr/A-Za-z/N-ZA-Mn-za-m/;
    #guarda el string en el archivo
    print $data $line;
  }
  # print "Se a logrado " .$encode . " con exito \n";
  close($data);
}else{
  print "Error codigo de desifrado ". $encode ." es incorrecto \n";
}
