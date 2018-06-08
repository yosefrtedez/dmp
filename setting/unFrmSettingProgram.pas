unit unFrmSettingProgram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxLabel, ZDataset;

type
  TfrmSettingProgram = class(TfrmTplInput)
    cxLabel1: TcxLabel;
    Label13: TLabel;
    cxtNamaPerusahaan: TcxTextEdit;
    cxtAlamat: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxtKota: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxtKodePos: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxtNPWP: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxtTelpon: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxtEmail: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxtFax: TcxTextEdit;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettingProgram: TfrmSettingProgram;

implementation

uses unTools;

{$R *.dfm}

procedure TfrmSettingProgram.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_app',[]);
  if not q.IsEmpty then
    q.Edit
  else
    q.Insert;
  q.FieldByName('nama').AsString := Trim(cxtNamaPerusahaan.Text);
  q.FieldByName('alamat').AsString := Trim(cxtAlamat.Text);
  q.FieldByName('kota').AsString := Trim(cxtKota.Text);
  q.FieldByName('kodepos').AsString := Trim(cxtKodePos.Text);
  q.FieldByName('telpon').AsString := Trim(cxtTelpon.Text);
  q.FieldByName('fax').AsString := Trim(cxtFax.Text);
  q.FieldByName('email').AsString := Trim(cxtEmail.Text);
  q.FieldByName('npwp').AsString := Trim(cxtNPWP.Text);
  q.Post;

  MsgBox('Setting Program sudah disimpan.');

end;

procedure TfrmSettingProgram.FormShow(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_app',[]);
  cxtNamaPerusahaan.Text := q.FieldByName('nama').AsString;
  cxtAlamat.Text := q.FieldByName('alamat').AsString;
  cxtKota.Text := q.FieldByName('kota').AsString;
  cxtKodePos.Text := q.FieldByName('kodepos').AsString;
  cxtTelpon.Text := q.FieldByName('telpon').AsString;
  cxtFax.Text := q.FieldByName('fax').AsString;
  cxtEmail.Text := q.FieldByName('email').AsString;
  cxtNPWP.Text := q.FieldByName('npwp').AsString;
  q.Close;
end;

end.

