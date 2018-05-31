unit unFrmInputCustomer;

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
  cxDBLookupComboBox, ZDataset, cxCheckBox;

type
  TfrmInputCustomer = class(TfrmTplInput)
    cxtKode: TcxTextEdit;
    cxtNama: TcxTextEdit;
    cxtKontak: TcxTextEdit;
    cxtAlamat1: TcxTextEdit;
    cxtTelepon: TcxTextEdit;
    cxtNegara: TcxTextEdit;
    cxtAlamat2: TcxTextEdit;
    cxtProvinsi: TcxTextEdit;
    cxtHP: TcxTextEdit;
    cxtKota: TcxTextEdit;
    cxtFax: TcxTextEdit;
    cxtEmail: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    cxChkAktif: TcxCheckBox;
    Label13: TLabel;
    procedure btnSimpanClick(Sender: TObject);
    procedure ClearAll;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputCustomer: TfrmInputCustomer;

implementation

uses unTools;

{$R *.dfm}

procedure TfrmInputCustomer.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
  f: Boolean;
begin
  inherited;
  if cxtKode.Text = '' then begin
    MsgBox('Kode Harus di isi.');
    cxtKode.SetFocus;
  end
  else begin

    q := OpenRS('SELECT * FROM tbl_customer WHERE kode =''%s''', [cxtKode.Text] );

    f:= True;
    if Self.Jenis= 'T' then begin
      if not q.IsEmpty then begin
        MsgBox('Kode Customer Sudah Ada');
        cxtKode.SelectAll ;
        cxtKode.SetFocus ;
        f:= False ;
      end
      else begin
        q.Insert;
      end;
    end
    else begin
      if q.IsEmpty then begin
        MsgBox('Kode Customer Belum Ada');
        cxtKode.SelectAll ;
        cxtKode.SetFocus ;
        f:= False ;
      end
      else begin
        q.Edit;
      end;
    end;
  end;

  if f then begin
    with q do begin
      FieldByName('kode').AsString        := cxtKode.Text ;
      FieldByName('nama').AsString        := cxtNama.Text ;
      FieldByName('kontak').AsString      := cxtKontak.Text ;
      FieldByName('alamat').AsString      := cxtAlamat1.Text ;
      FieldByName('alamat2').AsString     := cxtAlamat2.Text ;
      FieldByName('kota').AsString        := cxtKota.Text ;
      FieldByName('provinsi').AsString    := cxtProvinsi.Text ;
      FieldByName('negara').AsString      := cxtNegara.Text ;
      FieldByName('telpon').AsString      := cxtTelepon.Text ;
      FieldByName('fax').AsString         := cxtFax.Text ;
      FieldByName('hp').AsString          := cxtHP.Text ;
      if cxChkAktif.Checked then
        FieldByName('f_aktif').AsInteger := 1
      else
        FieldByName('f_aktif').AsInteger := 0;
      Post;
      Close;
    end;
  end;
  MsgBox('Data Sudah Disimpan');
  ClearAll;
  btnBatalClick(nil);
end;

procedure TfrmInputCustomer.ClearAll;
var
  i: Integer;
begin
  for i := 0 to ComponentCount  - 1 do
  begin
    if Components[i] is TcxTextEdit then
      (Components[i] as TcxTextEdit).Text := '';
  end;
   cxChkAktif.Checked := False;
end;

end.
