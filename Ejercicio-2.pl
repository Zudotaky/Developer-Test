
use strict;
use warnings;

#Todas las letras posibles en un numero de base 25
my @listaDeLetras = ("a".."o");
my $stringDeLetras = join ("", @listaDeLetras);

# creo dos hash uno con la equivalencia de numeros en base 10  a las letras
# y otro con la equivalencia de letras a numeros en base 10
my %numerosALetras;
my %letrasANumero;
foreach my $indice (10..24){
  my $aux =$indice - 10;
  $letrasANumero{$listaDeLetras[$aux]} = $indice ;
  $numerosALetras{$indice} = $listaDeLetras[$aux] ;
}

sub transfomarABase10{
  my ($base, $numeroBase )=@_;
  my @ListaDeDigitos = reverse split "",$numeroBase;
  my $numeroNuevo = 0;
  foreach my $indice (0.. $#ListaDeDigitos) {
    if(esUnaLetra($ListaDeDigitos[$indice])){
      $ListaDeDigitos[$indice] = $letrasANumero{$ListaDeDigitos[$indice]};
    }
    $numeroNuevo += $ListaDeDigitos[$indice] * $base ** $indice;
  }
  return $numeroNuevo
}

sub esUnaLetra{
  my ($numero) = @_;
  index($stringDeLetras,$numero) != -1;
}

sub transformarDeBase10{
  my ($base, $numeroBase )=@_;
  my @listaDeRestos;
  my $resto;
  until ($numeroBase == 0) {
    $resto = $numeroBase % $base;
    unshift(@listaDeRestos,$resto);
    $numeroBase = int ($numeroBase / $base);
  }
  if ($base > 10 ){
    @listaDeRestos = convertirNumerosALetras(@listaDeRestos);
  }
  return join ( "" , @listaDeRestos);
}

sub convertirNumerosALetras{
  my (@listaNumeros)=@_;
  my @newNumeber;
  for my $numeroActual (@listaNumeros){
    if ($numeroActual >= 10) {
      push(@newNumeber,$numerosALetras{$numeroActual});
    }else{
      push(@newNumeber,$numeroActual);
    }
  }
  return @newNumeber
}

# Funcion del ejercicio 2
sub conversorDeBases{

  my ($base,$primerNumero,$segundoNumero) = @_;
  
  $primerNumero = transfomarABase10($base,$primerNumero);
  $segundoNumero = transfomarABase10($base,$segundoNumero);
  my $resultado = $primerNumero + $segundoNumero;
  $resultado = transformarDeBase10($base,$resultado);
  
  return $resultado
}

#Para correrlo como un script en consola
print "Escriba la base de su numero(entre 2 y 25) : ";
my $base = <>;
chomp($base);
verificarBase($base);
print "Escriba el primer numero : ";
my $primerNumero = <>;
chomp($primerNumero);
print "Escriba el segundo numero : ";
my $segundoNumero = <>;
chomp($segundoNumero);
print conversorDeBases($base,$primerNumero,$segundoNumero) . "\n";


sub verificarBase{
  my ($base) = @_;
  if( $base > 25 or $base < 2) { 
    print "la base tiene que ser entre 2 y 25 \n" ;
    exit 42; 
  }
}
