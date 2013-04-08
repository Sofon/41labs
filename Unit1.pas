unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, Grids, StdCtrls, ComCtrls,
  Series;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    UpDown1: TUpDown;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    UpDown2: TUpDown;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    StringGrid2: TStringGrid;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
func = function (x:double):double;

function f1(x:double):double;
  begin
    f1:=(Exp(1/7*ln(x))-ln(x+0.3))/sqrt(x+1)-x;
  end;

function f2(x:double):double;
  begin
    f2:=(Ln(44.8)-sin(Sqrt(x)))/2-x;
  end;

procedure bisection(a,b,e:double; f:func; out x:double; out it:Byte);
  begin
    it:=0;
    repeat
    begin
      x:=(a+b)/2;
      if f(x)*f(b)>0 then b:=x
      else a:=x;
      inc(it);
    end;
    until ((Abs(a-b)<=e) or (it>=50));
  end;

procedure secants(a,b,e:double; f:func; out x:double; out it:Byte);
  var
    x1,x2:double;
  begin
    x1:=a;
    x2:=b;
    it:=0;
    repeat
      x:=x1-((f(x1))/((f(x2)-f(x1))/(x2-x1)));
      x1:=x2;
      x2:=x;
      inc(it);
    until ((Abs(x1-x2)<=e) or (it>=50));
  end;

procedure TForm1.FormCreate(Sender: TObject);
var
    i,n: integer;
    e: double;
  begin
    StringGrid1.Cells[0,0]:='X';
    StringGrid1.Cells[0,1]:='Y';
    StringGrid2.Cells[0,0]:='  E';
    StringGrid2.Cells[1,0]:='Корень I';
    StringGrid2.Cells[2,0]:='Итераций';
    StringGrid2.Cells[3,0]:='Корень II';
    StringGrid2.Cells[4,0]:='Итераций';
    StringGrid2.RowCount:=strtoint(Edit3.Text)+1;
    n:=UpDown1.Position;
    e:=0.1;

    for i:=1 to n do
    begin
      StringGrid2.Cells[0,i]:=FloatToStrF(e, ffFixed, i+2, i);
      e:=e/10;
    end;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
    a,b,x,dx,y: double;
    k,i: integer;
  begin
    a:=StrToFloat(Edit1.Text);
    b:=StrToFloat(Edit2.Text);
    k:=StrToInt(Edit4.Text);
    x:=a;
    dx:=(b-a)/(k-1);
    StringGrid1.ColCount:=k+1;

    for i := 1 to k do
    begin
      if RadioGroup1.ItemIndex=0 then y:=f1(x)
      else y:=f2(x);
      StringGrid1.Cells[i,0]:=FloatToStr(x);
      StringGrid1.Cells[i,1]:=FloatToStr(y);
      x:=x+dx;
    end;
  end;

procedure TForm1.Button2Click(Sender: TObject);
var
    i,k:byte;
    a,b,x,dx,y: double;
  begin
    a:=StrToFloat(Edit1.Text);
    b:=StrToFloat(Edit2.Text);
    k:=100;

    x:=a;
    dx:=(b-a)/(k-1);
    Series1.Clear;
    Series2.Clear;
    Series3.Clear;

    for i:=1 to k do
    begin
      if RadioGroup1.ItemIndex=0 then y:=f1(x)
      else y:=f2(x);
      Series1.AddXY(x,y);
      Series2.AddXY(x,0);
      Series3.AddXY(0,y);
      x:=x+dx;
    end;
  end;

function CheckRoot(a,b:double; f:func):Boolean;
  begin
    Result:=False;
    if f(a)*f(b)>0 then Result:=True;
  end;

procedure TForm1.Button3Click(Sender: TObject);
var
    a,b,e,x,y: double;
    n,i,it,it2:Byte;
    f:func;
  begin
    a:=StrToFloat(Edit1.Text);
    b:=StrToFloat(Edit2.Text);
    n:=UpDown1.Position;
    e:=0.1;

    StringGrid2.rowCount:=n+1;

    if RadioGroup1.ItemIndex=0 then f:=f1
    else f:=f2;

    if CheckRoot(a,b,f) then
    begin
    StringGrid2.rowCount:=2;
      for i := 1 to 4 do
      StringGrid2.Cells[i,1]:='';
    ShowMessage('Искомый корень не входит в указанный отрезок');
    Edit1.Text:='0,01';
    Edit2.Text:='1,99';
    end

    else for i := 1 to n do
    begin
      bisection(a,b,e,f,x,it);
      secants(a,b,e,f,y,it2);

      StringGrid2.Cells[0,i]:=FloatToStrF(e,ffFixed,i+1,i);
      StringGrid2.Cells[1,i]:=FloatToStr(x);
      StringGrid2.Cells[2,i]:=FloatToStr(it);
      StringGrid2.Cells[3,i]:=FloatToStr(y);
      StringGrid2.Cells[4,i]:=FloatToStr(it2);

      e:=e/10;
    end;
  end;

procedure TForm1.Edit1Exit(Sender: TObject);
var prob_a, prob_b: double;
  begin
  try
    prob_a:=StrToFloat(Edit1.Text);

    prob_b:=StrToFloat(Edit2.Text);
    if not (0<prob_a) then
    begin
      ShowMessage('значение A не удовлетворяет условию: 0<A');
      Edit1.Text:='0,01';
    end;
    if not (prob_a<prob_b) then
    begin
      ShowMessage('значение A не удовлетворяет условию: A<B');
      Edit1.Text:='0,01';
      Edit2.Text:='1,99';
    end;

  except
    ShowMessage('A - не число или нужна . вместо ,');
    Edit1.Text:='0,01';
  end;
  end;

procedure TForm1.Series1Click(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  begin
    ShowMessage('Ближайшая точка ('+
               FloatToStrF(Series1.XValue[ValueIndex], ffFixed, 5, 3) +
               '; '+
               FloatToStrF(Series1.YValue[ValueIndex], ffFixed, 6, 3) +
               ')');
  end;

procedure TForm1.Edit2Exit(Sender: TObject);
var prob_b, s: double; b:boolean;
  begin
  try
    prob_b:=StrToFloat(Edit2.Text);
        s:=2; b:=false;
        if prob_b<s then b:=true;

    if not b then
    begin
      ShowMessage('значение B не удовлетворяет условию: B<2');
      Edit2.Text:='1,99';
    end;

  except
    ShowMessage('B - не число или нужна . вместо ,');
    Edit2.Text:='1,99';

  end;
  end;

end.
