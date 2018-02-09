unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BRestart: TButton;
    Player1: TButton;
    Player2: TButton;
    textButton: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    procedure BRestartClick(Sender: TObject);
    procedure ButtonsClick(b: TButton);
    procedure FormCreate(Sender: TObject);

  private
  public
  end;

const
  X = #10052;
  O = #9731;
  WINNER_FIRST = 'Игрок 1 выиграл!';
  WINNER_SECOND = 'Игрок 2 выиграл!';
  DRAW = 'Победила дружба!';

var
  Form1: TForm1;
  countStep: byte;
  controlPicture: boolean;
  b11: byte;
  b12: byte;
  b13: byte;
  b21: byte;
  b22: byte;
  b23: byte;
  b31: byte;
  b32: byte;
  b33: byte;
  isWinner2: boolean;


function XandO(c: boolean): byte;
function isClick(b: TButton):boolean;
procedure finCompare(c: byte);
procedure GameField(b: TButton; c: boolean);
procedure IsWinner();
procedure currentStep(c: boolean; b: TButton);

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var r: byte;
begin
  r:=Random(2);
  if r = 1 then
  controlPicture := True
  else
  controlPicture:= False;
  currentStep(controlPicture, textButton);
  b11 := 11; Button11.Caption := '';
  b12 := 12; Button12.Caption := '';
  b13 := 13; Button13.Caption := '';
  b21 := 21; Button21.Caption := '';
  b22 := 22; Button22.Caption := '';
  b23 := 23; Button23.Caption := '';
  b31 := 31; Button31.Caption := '';
  b32 := 32; Button32.Caption := '';
  b33 := 33; Button33.Caption := '';
end;

function isClick(b: TButton):boolean;
begin
  case b.Tag of
    11: if b11 <> b.Tag then
      Result:= True
      else
      Result:= False;
    12: if b12 <> b.Tag then
      Result:= True
    else
      Result:= False;
    13: if b13 <> b.Tag then
      Result:= True
      else
      Result:= False;
    21: if b21 <> b.Tag then
      Result:= True
      else
      Result:= False;
    22: if b22 <> b.Tag then
      Result:= True
      else
      Result:= False;
    23: if b23 <> b.Tag then
      Result:= True
      else
      Result:= False;
    31: if b31 <> b.Tag then
      Result:= True
      else
      Result:= False;
    32: if b32 <> b.Tag then
      Result:= True
      else
      Result:= False;
    33: if b33 <> b.Tag then
      Result:= True
      else
      Result:= False;
    else Result:= False;
  end;
end;

procedure currentStep(c: boolean; b: TButton);
begin
  if c then
    b.Caption:= 'Ходит 1 игрок'
  else
    b.Caption:= 'Ходит 2 игрок';
end;

procedure TForm1.ButtonsClick(b: TButton);
begin
  if isClick(b) = False then
  begin
    GameField(b, controlPicture);
    if controlPicture then
    begin
      b.Caption := X;
      controlPicture := False;
    end
    else
    begin
      b.Caption := O;
      controlPicture := True;
    end;
    currentStep(controlPicture, textButton);
    IsWinner()
  end;
end;

procedure TForm1.BRestartClick(Sender: TObject);
begin
  FormCreate(Sender);
end;

function XandO(c: boolean): byte;
begin
  if c then
    Result := 1
  else
    Result := 0;
end;

procedure GameField(b: TButton; c: boolean);
begin
  case b.Tag of
    11: b11 := XandO(c);
    12: b12 := XandO(c);
    13: b13 := XandO(c);
    21: b21 := XandO(c);
    22: b22 := XandO(c);
    23: b23 := XandO(c);
    31: b31 := XandO(c);
    32: b32 := XandO(c);
    33: b33 := XandO(c);
  end;
end;

procedure IsWinner();
begin
  if (b11 = b12) and (b12 = b13) then
    finCompare(b11)
  else if (b21 = b22) and (b22 = b23) then
    finCompare(b21)
  else if (b31 = b32) and (b32 = b33) then
    finCompare(b31)
  else if (b11 = b21) and (b21 = b31) then
    finCompare(b11)
  else if (b12 = b22) and (b22 = b32) then
    finCompare(b12)
  else if (b13 = b23) and (b23 = b33) then
    finCompare(b13)
  else if (b11 = b22) and (b22 = b33) then
    finCompare(b11)
  else if (b13 = b22) and (b22 = b31) then
    finCompare(b13)
  else if (b11 <> 11) and (b12 <> 12) and (b13 <> 13) and (b21 <> 21) and
    (b22 <> 22) and (b23 <> 23) and (b31 < 31) and (b32 <> 32) and (b33 <> 33) then
    finCompare(2);
end;

procedure finCompare(c: byte);
begin
  if c = 1 then
  begin
    Form1.textButton.Caption := WINNER_FIRST;
  end
  else if c = 0 then
  begin
    Form1.textButton.Caption := WINNER_SECOND;
  end
  else
  begin
    Form1.textButton.Caption := DRAW;
  end;
end;

end.
