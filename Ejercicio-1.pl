
use strict;
use warnings;

sub sortString{
  my $string = @_;
  #Divido el string en una array de chart
  my @listString = split //, $string;
  #La organiso y lo convierto otravez en un string
  join "" , sort @listString;
}

#Funcion del ejercicio 1
sub anagramas{
  my ($primerCadena,$segundaCadena) = @_;
  #Ordeno los strings
  $primerCadena= sortString $primerCadena;
  $segundaCadena= sortString $segundaCadena;
  #Verifico que sean iguales
  return $primerCadena eq $segundaCadena; 
}



#Para correrlo como un script en consola

print "Escriba la primer cadena de caracteres : ";
my $primerCadena = <>;
chomp($primerCadena);

print "Escriba la segunda cadena de caracteres : ";
my $segundaCadena = <>;
chomp($segundaCadena);

if (anagramas($primerCadena,$segundaCadena)){
  print "Verdadero \n"; 
}else{
  print "Falso \n"; 
}