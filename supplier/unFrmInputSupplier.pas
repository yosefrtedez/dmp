unit unFrmInputSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxLabel, StdCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ZDataset, cxCheckBox, cxSpinEdit, DB, ZAbstractRODataset;

type
  TfrmInputSupplier = class(TfrmTplInput)
    zqrSupplier: TZReadOnlyQuery;
    dsSupplier: TDataSource;
    cxtKode: TcxTextEdit;
    cxlbl1: TcxLabel;
    cxtNama: TcxTextEdit;
    cxtKontak: TcxTextEdit;
    cxtTitle: TcxTextEdit;
    cxtAlamat: TcxTextEdit;
    cxtAlamat2: TcxTextEdit;
    cxtKota: TcxTextEdit;
    cxtProvinsi: TcxTextEdit;
    cxtNegara: TcxTextEdit;
    cxtTelp: TcxTextEdit;
    cxtFax: TcxTextEdit;
    cxtHp: TcxTextEdit;
    cxtDirect: TcxTextEdit;
    cxCboPembayaran: TcxComboBox;
    cxtEmail: TcxTextEdit;
    cxchkAktif: TcxCheckBox;
    cxlbl2: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl4: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxlbl7: TcxLabel;
    cxlbl8: TcxLabel;
    cxlbl9: TcxLabel;
    cxlbl10: TcxLabel;
    cxlbl11: TcxLabel;
    cxlbl12: TcxLabel;
    cxlbl13: TcxLabel;
    cxlbl14: TcxLabel;
    cxlbl15: TcxLabel;
    cxlbl16: TcxLabel;
    cxtKodePos: TcxTextEdit;
    Label1: TLabel;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ClearAll;
  public
    { Public declarations }
  end;

var
  frmInputSupplier: TfrmInputSupplier;

implementation

uses unTools, unFrmLstSupplier;

{$R *.dfm}

procedure TfrmInputSupplier.btnSimpanClick(Sender: TObject);
var
  q : TZQuery;
  f : TfrmLstSupplier;
begin
  inherited;
  if Trim(cxtKode.Text) = '' then begin
    MsgBox('Mohon isi Kode Supplier.');
    cxtKode.SetFocus;
  end
  else if Trim(cxtNama.Text) = '' then begin
    MsgBox('Mohon isi nama supplier.');
    cxtNama.SetFocus;
  end
  else if Trim(cxtAlamat.Text) = '' then begin
    MsgBox('Mohon isi alamat supplier.');
    cxtAlamat.SetFocus;
  end
  else begin
    q := OpenRS('SELECT * FROM tbl_supplier WHERE kode = ''%s''',[cxtKode.Text]);
    if Self.Jenis = 'T' then
      q.Insert
    else
      q.Edit;

    q.FieldByName('kode').AsString := Trim(cxtKode.Text);
    q.FieldByName('nama').AsString := Trim(cxtNama.Text);
    q.FieldByName('kontak').AsString := Trim(cxtKontak.Text);
    q.FieldByName('title').AsString := cxtTitle.Text;
    q.FieldByName('alamat').AsString := cxtAlamat.Text;
    q.FieldByName('Alamat2').AsString := cxtAlamat2.Text;
    q.FieldByName('kota').AsString := cxtKota.Text;
    q.FieldByName('kodepos').AsString := cxtKodePos.Text;
    q.FieldByName('provinsi').AsString := cxtProvinsi.Text;
    q.FieldByName('negara').AsString := cxtNegara.Text;
    q.FieldByName('telpon').AsString := cxtTelp.Text;
    q.FieldByName('fax').AsString := cxtFax.Text;
    q.FieldByName('hp').AsString := cxtHp.Text;
    q.FieldByName('direct').AsString := cxtDirect.Text;
    q.FieldByName('pembayaran').AsString := cxCboPembayaran.Text;
    q.FieldByName('email').AsString := cxtEmail.Text;
    if cxchkAktif.Checked = True then begin
      q.FieldByName('f_aktif').AsInteger := 1;
    end else begin
      q.FieldByName('f_aktif').AsInteger := 0;
    end;

    q.Post;

    MsgBox('Data supplier sudah berhasil disimpan.');
    //ClearAll;

  end;
end;

procedure TfrmInputSupplier.ClearAll;
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do begin
    if Components[i].Tag = 1 then
      (Components[i] as TcxTextEdit).Text := '';
  end;
end;

procedure TfrmInputSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  cxCboPembayaran.Properties.Items.Add('KONTAN');
  cxCboPembayaran.Properties.Items.Add('45 Hari');
  cxCboPembayaran.Properties.Items.Add('90 Hari');
  cxCboPembayaran.Properties.Items.Add('1 (Satu) Minggu');
  cxCboPembayaran.Properties.Items.Add('2 (Dua) Minggu');
  cxCboPembayaran.Properties.Items.Add('1 (Satu) Bulan');
  cxCboPembayaran.Properties.Items.Add('2 (Dua) Bulan');
  cxCboPembayaran.ItemIndex := 0;
  cxchkAktif.Checked := True;
end;

procedure TfrmInputSupplier.FormShow(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_supplier WHERE kode = ''%s''',[Self.EditKey]);
    cxtKode.Text := q.FieldByName('kode').AsString;
    cxtKode.Enabled := False;
    cxtNama.Text := q.FieldByName('nama').AsString;
    cxtKontak.Text := q.FieldByName('kontak').AsString;
    cxtTitle.Text := q.FieldByName('title').AsString;
    cxtAlamat.Text := q.FieldByName('alamat').AsString;
    cxtAlamat2.Text := q.FieldByName('alamat2').AsString;
    cxtKota.Text := q.FieldByName('kota').AsString;
    cxtKodePos.EditValue := q.FieldByName('kodepos').AsString;
    cxtProvinsi.Text := q.FieldByName('provinsi').AsString;
    cxtNegara.Text := q.FieldByName('negara').AsString;
    cxtTelp.Text := q.FieldByName('telpon').AsString;
    cxtFax.Text := q.FieldByName('fax').AsString;
    cxtHp.Text := q.FieldByName('hp').AsString;
    cxtDirect.Text := q.FieldByName('direct').AsString;
    cxCboPembayaran.Text := q.FieldByName('pembayaran').AsString;
    cxtEmail.Text := q.FieldByName('email').AsString;
    q.Close;
  end;
end;

end.
