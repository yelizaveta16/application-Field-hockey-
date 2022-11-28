unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPlayer, ExtCtrls, ExtDlgs;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    MediaPlayer1: TMediaPlayer;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
MediaPlayer1.FileName := OpenDialog1.FileName;
MediaPlayer1.Open;
end;
 end;
end.
