use strict;
use warnings;
my $numericBase = 10;
my $maxDecimal = 3;
my $numerosDe0a9 = join ("" ,(0..9));
my $sinIndice = "-1";
my $cantidadCaracteres = 1;


sub toNumber{
  my ($stringNumber) = @_;
  my $finalNumber = 0;
  
  if (tieneDecimales($stringNumber)){
    for my $index(1..$maxDecimal){
      if (esNumero(lastCaracter($stringNumber))){
        $finalNumber += lastCaracter($stringNumber) * ($numericBase ** -$index);
        chop $stringNumber;
      }else{
        last;
      }
    }
  }

  my $stringAux = "";
  for my $char (split //, $stringNumber){
    if (esNumero(lastCaracter($char))){
      $stringAux = $stringAux . $char
    }
  }
  $finalNumber = $stringAux+$finalNumber;
  print("$finalNumber \n");
  return $finalNumber
}

sub tieneDecimales{
  my ($number) = @_;
  my $decimales = reverse substr($number, -$maxDecimal);
  my $caracterAcutal= "" ;
  for my $index (0..$maxDecimal-1){
    $caracterAcutal = substr($decimales,$index,$cantidadCaracteres) ;
    if (not esNumero(lastCaracter($caracterAcutal))){
      return "True"
    }
  }
  return ""
}

sub lastCaracter{
  my ($string) = @_;
  substr($string,-1,$cantidadCaracteres)
}

sub esNumero{
  my ($numero) = @_;
  not index($numerosDe0a9,$numero) eq $sinIndice
}

my ($numeroEnString) = @ARGV;
if(not $numeroEnString){
  print "Escriba el numero : ";
  $numeroEnString = <>;
  chomp($numeroEnString);
}

toNumber($numeroEnString);