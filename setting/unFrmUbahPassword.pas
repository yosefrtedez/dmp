unit unFrmUbahPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, cxTextEdit, cxLabel, ZDataset;

type
  TfrmUbahPassword = class(TForm)
    cxLabel1: TcxLabel;
    cxtPasswordLama: TcxTextEdit;
    cxtPasswordBaru: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxtKonfirmasi: TcxTextEdit;
    btnSimpan: TButton;
    btnBatal: TButton;
    procedure btnBatalClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUbahPassword: TfrmUbahPassword;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmUbahPassword.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmUbahPassword.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
  sPassLama, sPassBaru, sKonfirmasi: string;
begin
  q := OpenRS('SELECT CAST(password(''%s'') AS CHAR(500)) as pass',[UpperCase(cxtPasswordLama.Text)]);
  sPassLama := q.FieldByname('pass').AsString;
  q.Close;

  q := OpenRS('SELECT * FROM tbl_user WHERE nama = ''%s'' AND password = ''%s''',
    [Aplikasi.NamaUser, sPassLama]);
  if q.IsEmpty then begin
    MsgBox('Password lama salah.');
    q.Close;
    Abort;
  end;
  q.Close;

  sPassBaru := UpperCase(Trim(cxtPasswordBaru.Text));
  sKonfirmasi := UpperCase(Trim(cxtKonfirmasi.Text));

  if Length(sPassBaru) < 6 then begin
    MsgBox('Password minimal 6 karakter.');
    cxtPasswordBaru.SetFocus;
    cxtPasswordBaru.SelectAll;
    Abort;
  end;

  if sPassBaru <> sKonfirmasi then begin
    MsgBox('Konfirmasi tidak sama dengan password baru.');
    Abort;
  end;

  dm.zConn.ExecuteDirect(
    Format('UPDATE tbl_user SET password = password(''%s'') WHERE nama = ''%s''',
    [sPassBaru, Aplikasi.NamaUser])
  );

  MsgBox('Password sudah berhasil diubah.');

  ModalResult := mrOk;
end;

end.
