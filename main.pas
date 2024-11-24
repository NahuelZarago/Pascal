program Barrios;
const
  MaxBarrios = 100;

type
  Tbarrio = record
    Nombre: String;
    Cloacas: String;
    Familias: integer;
    IntegrantesFamilia: integer;
  end;

var
  Barrio: array[1..MaxBarrios] of Tbarrio;
  TotalBarrios : integer;

Procedure CargarDatos(var barrio : array of Tbarrio; var TotalBarrios : integer);
var 
i : integer;

begin
  Writeln('Ingrese la cantidad de barrios que hay en el lugar "X": ');
  Readln(TotalBarrios);

  // Carga de datos
  for i := 1 to TotalBarrios do
  begin
    Writeln('Ingrese el nombre del barrio: ');
    Readln(Barrio[i].Nombre);
    Writeln('Tiene cloacas ese barrio? Si/No ');
    Readln(Barrio[i].Cloacas);
    Writeln('Cantidad de familias: ');
    Readln(Barrio[i].Familias);
    Writeln('Integrantes por familia: ');
    Readln(Barrio[i].IntegrantesFamilia);
  end;
  end;

Procedure Ordenamiento(var barrio : array of tbarrio; var TotalBarrios : integer);
var
i, j : integer;
aux : tbarrio;
  // Ordenar barrios alfabéticamente
  begin
  for i := 1 to TotalBarrios - 1 do
    for j := i + 1 to TotalBarrios do
      if Barrio[i].Nombre > Barrio[j].Nombre then
      begin
        Aux := Barrio[i];
        Barrio[i] := Barrio[j];
        Barrio[j] := Aux;
      end;
      

  Writeln('Barrios ordenados alfabéticamente:');
  for i := 1 to TotalBarrios do
    Writeln(Barrio[i].Nombre);
end;


procedure Verificar(var barrio : array of tbarrio; var TotalBarrios : integer);
var
encontrado: boolean;
i : integer;

  // Verificar si "San Sebastián" está cargado
  begin
  Encontrado := False;
  for i := 1 to TotalBarrios do
    if Barrio[i].Nombre = 'San Sebastian' then
    begin
      Encontrado := True;
      Break;
    end;

  if Encontrado then
    Writeln('El barrio San Sebastian se encuentra cargado.')
  else
    Writeln('El barrio San Sebastian no se encuentra cargado.');
end;

procedure CalcularPorcentaje(var barrio : array of tbarrio; var TotalBarrios : integer);
var
FamiliasSanSebastian : integer;
TotalFamilias : integer;
porcentaje : real;
i : integer;

  // Calcular porcentaje de familias de "San Sebastián"
  begin
  FamiliasSanSebastian := 0;
  TotalFamilias := 0;
  for i := 1 to TotalBarrios do
  begin
    TotalFamilias := TotalFamilias + Barrio[i].Familias;
    if Barrio[i].Nombre = 'San Sebastian' then
      FamiliasSanSebastian := Barrio[i].Familias;
  end;

  if TotalFamilias > 0 then
    Porcentaje := (FamiliasSanSebastian * 100) / TotalFamilias
  else
    Porcentaje := 0;

  Writeln('Porcentaje de familias de San Sebastian: ', Porcentaje:0:2, '%');
end;


procedure contadorbarrio(var barrio : array of tbarrio; var TotalBarrios : integer);
var
i : integer;
ContadorCloacas : integer;

  // Contar barrios sin cloacas
  begin
  ContadorCloacas := 0;
  for i := 1 to TotalBarrios do
    if Barrio[i].Cloacas = 'No' then
      ContadorCloacas := ContadorCloacas + 1;

  Writeln('Cantidad de barrios sin cloacas: ', ContadorCloacas);
  end;

procedure listado(var barrio : array of tbarrio; var TotalBarrios : integer);
var
i : integer;

  // Listar barrios con familias de más de 4 integrantes
  begin
  Writeln('Barrios con familias que tienen más de 4 integrantes:');
  for i := 1 to TotalBarrios do
    if Barrio[i].IntegrantesFamilia > 4 then
      Writeln(Barrio[i].Nombre, ': ', Barrio[i].Familias, ' familias.');
      end;
      
      begin
      CargarDatos(barrio , TotalBarrios);
      ordenamiento(barrio , TotalBarrios);
      Verificar(barrio , TotalBarrios);
      CalcularPorcentaje(barrio , TotalBarrios);
      Contadorbarrio(barrio , TotalBarrios);
      listado(barrio , TotalBarrios);

end.
