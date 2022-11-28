unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Menus;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Label5: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button7: TButton;
    Button5: TButton;
    Label2: TLabel;
    Button6: TButton;
    Edit3: TEdit;
    Button8: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
       

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  
implementation

uses Unit4, Unit1;

{$R *.dfm}


procedure TForm3.FormCreate(Sender: TObject);
var
f:TextFile;
Fm,a,b,c,d,e:string;
n:integer;
begin
StringGrid1.Cells[0,0]:='Фамилия';
StringGrid1.Cells[1,0]:='Имя';
StringGrid1.Cells[2,0]:='Год рождения';
StringGrid1.Cells[3,0]:='Разряд';
StringGrid1.Cells[4,0]:='Занимается';
StringGrid1.Cells[5,0]:='Кол-во забитых голов';
StringGrid2.Cells[0,0]:='Фамилия';
StringGrid2.Cells[1,0]:='Имя';
StringGrid2.Cells[2,0]:='Год рождения';
StringGrid2.Cells[3,0]:='Разряд';
StringGrid2.Cells[4,0]:='Занимается';
StringGrid2.Cells[5,0]:='Кол-во забитых голов';
AssignFile(f,'1.txt');
Reset(F);
n:=0;
while not(Eof(f))do
begin
Readln(f,Fm);
Readln(f,a);
Readln(f,b);
Readln(f,c);
Readln(f,d);
Readln(f,e);
if A<>'' then n:=n+1;
with StringGrid1 do
begin
Cells[0,RowCount-2]:=Fm;
Cells[1,RowCount-2]:=a;
Cells[2,RowCount-2]:=b;
Cells[3,RowCount-2]:=c;
Cells[4,RowCount-2]:=d;
Cells[5,RowCount-2]:=e;
RowCount:=RowCount+1;
end;
end;
CloseFile(f);
StringGrid1.RowCount:=StringGrid1.RowCount-2;
Label4.Caption:='Участников: '+IntToStr(n);
end;

//вывод информации по году рождения
procedure TForm3.Button1Click(Sender: TObject);
var
f:TextFile;
Fm,a,b,c,d,e:string;
r:integer;
begin
AssignFile(f,'1.txt');
Reset(F);
StringGrid2.RowCount:=2;
while not(Eof(f))do
begin
Readln(f,Fm);
Readln(f,a);
Readln(f,b);
Readln(f,c);
Readln(f,d);
Readln(f,e);
r:=StrToInt(b);
if b=Edit1.Text  then
with StringGrid2 do
begin
Cells[0,RowCount-1]:=Fm;
Cells[1,RowCount-1]:=a;
Cells[2,RowCount-1]:=b;
Cells[3,RowCount-1]:=c;
Cells[4,RowCount-1]:=d;
Cells[5,RowCount-1]:=e;
RowCount:=RowCount+1;
end;
end;
CloseFile(f);
StringGrid2.RowCount:=StringGrid2.RowCount-1;
end;

//информация об игроке по фамилии
procedure TForm3.Button2Click(Sender: TObject);
var
f:TextFile;
Fm,a,b,c,d,e:string;
r:integer;
begin
AssignFile(f,'1.txt');
Reset(F);
StringGrid2.RowCount:=2;
while not(Eof(f))do
begin
Readln(f,Fm);
Readln(f,a);
Readln(f,b);
Readln(f,c);
Readln(f,d);
Readln(f,e);
r:=StrToInt(b);
if  Fm=Edit2.Text  then
with StringGrid2 do
begin
Cells[0,RowCount-1]:=Fm;
Cells[1,RowCount-1]:=a;
Cells[2,RowCount-1]:=b;
Cells[3,RowCount-1]:=c;
Cells[4,RowCount-1]:=d;
Cells[5,RowCount-1]:=e;
RowCount:=RowCount+1;
end;
end;
CloseFile(f);
StringGrid2.RowCount:=StringGrid2.RowCount-1;
end;

//запись в файл
procedure TForm3.Button3Click(Sender: TObject);
var
   f: TextFile;
   i, k: Integer;
 begin
 with stringgrid1 do
Options:=Options-[goediting];
   AssignFile(f,'1.txt');
   Rewrite(f);
   with StringGrid1 do
   begin
   for i:=1 to rowcount-1 do  begin
         Writeln(F, Cells[0,i]);
         Writeln(F, Cells[1,i]);
         Writeln(F, Cells[2,i]);
         Writeln(F, Cells[3,i]);
         Writeln(F, Cells[4,i]);
         Writeln(F, Cells[5,i]);
         end;
   end;
   CloseFile(F);
   with stringgrid1 do
   begin
   Label4.Caption:='Участников: '+inttostr(Rowcount-1);
   end;
 end;
 
//изменить данные
procedure TForm3.Button4Click(Sender: TObject);
begin
with stringgrid1 do
Options:=Options+[goediting];
end;

//сортировка по фамилии
procedure TForm3.Button7Click(Sender: TObject);
var
  i, j: integer;
  tmpRow: TStringList;
begin
  tmpRow:= TStringList.Create;
  try
    for i:=1 to StringGrid1.RowCount-1 do
      for j:=i+1 to StringGrid1.RowCount-1 do
        // сортируем по возрастанию.
        if AnsiCompareStr(StringGrid1.Cells[0, i], StringGrid1.Cells[0, j])>0 then
          begin
            tmpRow.Assign(StringGrid1.Rows[i]);
            StringGrid1.Rows[i]:=StringGrid1.Rows[j];
            StringGrid1.Rows[j]:=tmpRow;
          end;
  finally
    tmpRow.Free;
  end;
end;
//добавить игрока
procedure TForm3.Button5Click(Sender: TObject);
begin
StringGrid1.RowCount:=stringgrid1.RowCount+1;
with stringgrid1 do
Options:=Options+[goediting];
end;
//удаление игрока
procedure TForm3.Button6Click(Sender: TObject);
var
position:integer;
i:integer;
begin
position:=stringgrid1.Row;
if(position=0)or(position>stringgrid1.RowCount-1)then exit;
for i:=position to StringGrid1.RowCount-1 do
  begin
    StringGrid1.Cells[0,i]:=StringGrid1.Cells[0,i+1];
    StringGrid1.Cells[1,i]:=StringGrid1.Cells[1,i+1];
    StringGrid1.Cells[2,i]:=StringGrid1.Cells[2,i+1];
    StringGrid1.Cells[3,i]:=StringGrid1.Cells[3,i+1];
    StringGrid1.Cells[4,i]:=StringGrid1.Cells[4,i+1];
    StringGrid1.Cells[5,i]:=StringGrid1.Cells[5,i+1];
  end;
  StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;
//кол-во голов
procedure TForm3.Button8Click(Sender: TObject);
var
s,i:integer;
begin
s:=0;
for i:=1 to StringGrid1.RowCount-1 do
s:=s+strtoint(StringGrid1.Cells[5,i]);
edit3.Text:=inttostr(s);
end;

procedure TForm3.N2Click(Sender: TObject);
begin
Form3.Close;
form1.close;
end;

end.
