unit uUtils;

// ****************************************************************************
// Unité "uUtils" permettant de definir des types

interface

uses SysUtils;

type
  TStringList = array of string;
  TDoubleList = array of Double;
  TBoolList = array of Boolean;

  TResultat = {packed} record
       Valeur : Double;
       Annalyse : Boolean;
  end;

  TResultats = {packed} record
       Valeur : TDoubleList;
       Annalyse : TBoolList;
  end;

  TResultatsCapa2 = {packed} record
       Valeur : Double;
       Annalyse : TBoolList;
  end;


implementation

end.
