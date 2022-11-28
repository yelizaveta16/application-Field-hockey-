unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, jpeg, ExtCtrls, Menus, ComCtrls,
  Buttons;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    procedure TabControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4;

{$R *.dfm}

procedure TForm2.TabControl1Change(Sender: TObject);
begin
case TabControl1.TabIndex of
0:WebBrowser1.Navigate(extractFilePath(paramstr(0))+'Информация\Хоккей на траве.htm');
1:WebBrowser1.Navigate(extractFilePath(paramstr(0))+'Информация\История возникновения.htm');
2:WebBrowser1.Navigate(extractFilePath(paramstr(0))+'Информация\инвентарь.htm');
3:WebBrowser1.Navigate(extractFilePath(paramstr(0))+'Информация\Правила хоккея на траве.htm');
end;

end;
procedure TForm2.Button1Click(Sender: TObject);
begin
Form3.showmodal;
form2.Close;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
Form4.showmodal;
end;
end.
