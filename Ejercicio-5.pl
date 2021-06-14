use strict;
use warnings;

my ($anotacion) = @ARGV;
my @anotacion = split " " , $anotacion;
# una lista con los operadores posibles
my $operadores = '+/-x*';
# auxiliares
my @auxiliar;
my $primerNumero;
my $segundoNumero;
my $resultado;


foreach my $dato (@anotacion){
  if(index($operadores,$dato) != -1){
  # saco los ultimos 2 numeros y los opero
  # y luego el resultado lo agrego a la lista de numeros
    $segundoNumero = pop(@auxiliar);
    $primerNumero = pop(@auxiliar);
    $resultado = calculate($primerNumero,$segundoNumero,$dato);
    push(@auxiliar,$resultado);
  }else{
  # agrego los numeros en una lista
    push(@auxiliar,$dato);
  }
}

sub calculate{
  my ($primerNumero,$segundoNumero,$operador) = @_ ;
  if('+' eq $operador) { return $primerNumero + $segundoNumero };
  if('-' eq $operador) { return $primerNumero - $segundoNumero };
  if('x' eq $operador) { return $primerNumero * $segundoNumero };
  if('*' eq $operador) { return $primerNumero * $segundoNumero };
  if('/' eq $operador) { return $primerNumero / $segundoNumero };
}

# verifica si solo queda el resultado en la lista auxiliar
# si no tira un error
if ( @auxiliar == 1 ){
  print $auxiliar[0] ."\n";
}else {
  print "hubo un error en la anotacion \n"
}