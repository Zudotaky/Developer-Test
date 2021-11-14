use strict;
use warnings;

sub stringToList{
  my ($string) = @_;
  @_ = split(//, $string);
}

#Funcion del ejercicio 1
sub palindromo{
  my ($palabra) = @_;
  my @listCharacters = stringToList($palabra);
  my $number = int(@listCharacters/2);
  foreach my $i (1..$number){
    if (not $listCharacters[$i-1] eq $listCharacters[-$i]) {
      return '' #false
    }
  }
  'True'
}



#Para correrlo como un script en consola

print "Escriba el posible palindromo : ";
my $palabra = <>;
chomp($palabra);

if (palindromo($palabra)){
  print "Verdadero \n"; 
}else{
  print "Falso \n"; 
}