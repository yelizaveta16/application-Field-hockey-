unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Menus, Buttons,ShellAPI;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    Image2: TImage;
    N5: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit5;

{$R *.dfm}


procedure TForm1.N3Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Form2.showmodal;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form5.ShowModal;
end;
procedure TForm1.N5Click(Sender: TObject);
begin
ShellExecute(0,PChar('Open'),PChar('Справка.chm'),nil,nil,SW_SHOW);
end;

end.
