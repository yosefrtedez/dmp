unit unFrmInputBarangJasa;

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
  cxDBLookupComboBox, ZDataset, DB, ZAbstractRODataset;

type
  TfrmInputBarangJasa = class(TfrmTplInput)
    cxLabel1: TcxLabel;
    cxtKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxtDeskripsi: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxlKategori: TcxLookupComboBox;
    zqrKategori: TZReadOnlyQuery;
    dsKategori: TDataSource;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputBarangJasa: TfrmInputBarangJasa;

implementation

uses unTools, unDM;

{$R *.dfm}

procedure TfrmInputBarangJasa.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_barang WHERE kode = ''%s''',[cxtKode.Text]);
  if Self.Jenis = 'T' then
    q.Insert
  else
    q.Edit;
  q.FieldByName('kode').AsString := Trim(cxtKode.text);
  q.FieldByName('deskripsi').AsString := cxtDeskripsi.Text;
  q.FieldByName('id_kategori').AsInteger := cxlKategori.EditValue;
  q.Post;

  MsgBox('Data barang sudah disimpan.');

end;

procedure TfrmInputBarangJasa.FormCreate(Sender: TObject);
begin
  inherited;
  zqrKategori.Open;
end;

end.
