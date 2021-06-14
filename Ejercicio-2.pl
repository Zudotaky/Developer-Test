
use strict;
use warnings;

#Todas las letras posibles en un numero de base 25
my @listaDeLetras = ("a".."o");
my $stringDeLetras = join ("", @listaDeLetras);

#creo dos hash uno con la equivalencia de numeros en base 10  a las letras
my %numerosALetras;
# y otro con la equivalencia de letras a numeros en base 10
my %letrasANumero;

foreach my $indice (10..24){
  my $aux =$indice - 10;
  $letrasANumero{$listaDeLetras[$aux]} = $indice ;
  $numerosALetras{$indice} = $listaDeLetras[$aux] ;
}


# Funcion del ejercicio 2
sub conversorDeBases{

  my ($baseInicial,$numero,$baseFinal) = @_;
  
  my $resultado = transfomarABase10($baseInicial,$numero);

  $resultado = transformarDeBase10($baseFinal,$resultado);
  
  return $resultado
}


# Se separa el numero en digitos y a estos de los multiplica
# por la base actual de ese numero elevada a la posicion del
# caracter en el numero inicial. a los digitos multiplicados
# se los suma dando la equivalencia en base 10
sub transfomarABase10{
  my ($base, $numeroBase )=@_;
  #paso el numero base a una lista
  my @ListaDeDigitos = reverse split "",$numeroBase;
  my $numeroNuevo = 0;
  foreach my $indice (0.. $#ListaDeDigitos) {
    if(index($stringDeLetras,$ListaDeDigitos[$indice]) != -1){
      #se tranforman las letras a su equivalencia en numeros de base 10
      $ListaDeDigitos[$indice] = $letrasANumero{$ListaDeDigitos[$indice]};
    }
    $numeroNuevo += $ListaDeDigitos[$indice] * $base ** $indice;
  }
  return $numeroNuevo
}

# Se divide el numero por la base en la que se quiere llegar
# hasta que se llega a una divicion con el resultado 0
# luego se concatenen los restos de esas diviciones y 
# se invierte esto da el numero en la otra base
sub transformarDeBase10{
  my ($base, $numeroBase )=@_;
  my @listaDeRestos;
  until ($numeroBase == 0) {
    #junta los restos en una lista 
    push(@listaDeRestos,$numeroBase % $base);
    $numeroBase = int ($numeroBase / $base);
  }
  # se convierten los numeros mayores a 10 un su equivalencia en letra
  @listaDeRestos = map( { 
    $_ >= 10 ?
      $numerosALetras{$_ } 
      : $_ } 
    @listaDeRestos);
  return join ( "" , reverse @listaDeRestos);
}




# Convierto el numero a base 10
# y luego lo convierto a la base deceada
sub conversorDeBases{

  my ($baseInicial,$numero,$baseFinal) = @_;

  my $resultado = transfomarABase10($baseInicial,$numero);

  $resultado = transformarDeBase10($baseFinal,$resultado);
  
  return $resultado
}


#Para ingresar los datos como argumentos
# my ($baseInicial, $numero, $baseFinal) = @ARGV;
# verificarBase($baseInicial);
# verificarBase($baseFinal);
# print conversorDeBases($baseInicial,$numero,$baseFinal) . "\n";

#Para correrlo como un script en consola
print "Escriba la base de su numero(entre 2 y 25) : ";
my $baseInicial = <>;
chomp($baseInicial);
verificarBase($baseInicial);
print "Escriba el numero : ";
my $numero = <>;
chomp($numero);
print "Escriba la base que quiere cambiar(entre 2 y 25) : ";
my $baseFinal = <>;
chomp($baseFinal);
verificarBase($baseFinal);
print conversorDeBases($baseInicial,$numero,$baseFinal) . "\n";


sub verificarBase{
  my ($base) = @_;
  if( $base > 25 or $base < 2) { 
    print "la base tiene que ser entre 2 y 25 \n" ;
    exit 42; 
  }
}




