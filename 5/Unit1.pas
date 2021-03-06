{
 ������� ����������� ������� ������ �������
 ������ ������������ �������� �������
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    strngrd1: TStringGrid;
    lbl2: TLabel;
    xpmnfst1: TXPManifest;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  mas = array of Integer;

implementation

{$R *.dfm}

function SetMas(n: integer): mas;
var
  i: Integer;
begin
  Randomize;
  for i := 1 to n do
    Result[i - 1] := Random(50);
end;

procedure SetGrid(A: mas; n: Integer);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    Form1.strngrd1.ColCount := n;
    Form1.strngrd1.Cells[i - 1, 0] := IntToStr(i);
    Form1.strngrd1.Cells[i - 1, 1] := IntToStr(A[i - 1]);
  end;
end;

{function FindIndex(A: mas; i, n, min: Integer): integer;
begin
  if i < n then
  begin
    if A[i] < min then
    begin
      min := A[i];
      Result := i + 1;
    end;
    FindIndex(A, i + 1, n, min);
  end;
end; }

procedure FindIndex(A: mas; i, n, min: Integer; var Otvet: integer);
begin
  if i < n then
  begin
    if A[i] < min then
    begin
      min := A[i];
      Otvet := i + 1;
    end;
    FindIndex(A, i + 1, n, min, Otvet);
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  n, otvet: integer;
  A: mas;
begin
  n := StrToInt(edt1.Text);
  SetLength(A, n);
  A := SetMas(n);
  SetGrid(A, n);

  FindIndex(A,0,n,100000,otvet);
  
  lbl2.Caption := '����������� �������� � ��������: ' + IntToStr(otvet);
  //lbl2.Caption := '����������� �������� � ��������: ' + IntToStr(FindIndex(A, 0, n, 10000));
end;

end.

