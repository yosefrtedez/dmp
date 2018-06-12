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
  cxDBLookupComboBox, ZDataset, DB, ZAbstractRODataset, cxSpinEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, cxPC;

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
    Label13: TLabel;
    cxLabel4: TcxLabel;
    cxlSubKategori: TcxLookupComboBox;
    cxLabel5: TcxLabel;
    cxlSatuan: TcxLookupComboBox;
    zqrSubKategori: TZReadOnlyQuery;
    dsSubKategori: TDataSource;
    zqrSatuan: TZReadOnlyQuery;
    dsSatuan: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxtbSatuan: TcxGridTableView;
    cxColSatuan: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColID: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxTabSheet3: TcxTabSheet;
    cxLabel8: TcxLabel;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxSpinEdit4: TcxSpinEdit;
    cxLabel11: TcxLabel;
    cxSpinEdit5: TcxSpinEdit;
    cxLabel12: TcxLabel;
    cxSpinEdit6: TcxSpinEdit;
    cxLabel13: TcxLabel;
    cxSpinEdit7: TcxSpinEdit;
    cxLabel14: TcxLabel;
    cxSpinEdit8: TcxSpinEdit;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbSatuanDataControllerBeforePost(
      ADataController: TcxCustomDataController);
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
  q, qs: TZQuery;
  i, ID: integer;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_barang WHERE kode = ''%s''',[cxtKode.Text]);
  if Self.Jenis = 'T' then
    q.Insert
  else begin
    q.Edit;
    ID := q.FieldByName('id').AsInteger;
  end;
  q.FieldByName('kode').AsString := Trim(cxtKode.text);
  q.FieldByName('deskripsi').AsString := cxtDeskripsi.Text;
  q.FieldByName('id_kategori').AsInteger := cxlKategori.EditValue;
  q.FieldByName('id_subkategori').AsInteger := cxlSubKategori.EditValue;
  q.FieldByName('id_satuan').AsString := VarToStr(cxlSatuan.EditValue);
  q.Post;

  if cxtbSatuan.DataController.RecordCount > 0 then begin
    q := OpenRS('SELECT * FROM tbl_konv_brg WHERE id_barang = %d', [ID]);
    with cxtbSatuan.DataController do begin
      for i := 0 to RecordCount - 1 do begin
        if q.Locate('id_barang;id_satuan',VarArrayOf([ID, Values[i, cxColSatuan.Index]]),[]) then begin
          q.Edit;
        end
        else
          q.Insert;
        q.FieldByName('id_barang').AsInteger := ID;
        q.FieldByName('id_satuan').AsInteger := Values[i, cxColSatuan.Index];
        q.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
        q.Post;
      end;                       
    end;
  end;

  MsgBox('Data barang sudah disimpan.');

end;

procedure TfrmInputBarangJasa.cxtbSatuanDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j: integer;
  v: variant;
begin
  inherited;
  i := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColSatuan.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> i then begin
      if v = ADataController.Values[j, cxColSatuan.Index] then begin
        MsgBox('Satuan tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Break;
      end;
    end;
  end;
end;

procedure TfrmInputBarangJasa.FormCreate(Sender: TObject);
begin
  inherited;
  zqrKategori.Open;
  zqrSubKategori.Open;
  zqrSatuan.Open;
end;

procedure TfrmInputBarangJasa.FormShow(Sender: TObject);
var
  q: TZQuery;
  i, ID: integer;
begin
  inherited;
  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_barang WHERE kode = ''%s''',[Self.EditKey]);
    ID := q.FieldByName('id').AsInteger;
    cxtKode.Text := Self.EditKey;
    cxtKode.Enabled := False;
    cxtDeskripsi.Text := q.FieldByName('deskripsi').AsString;
    cxlKategori.EditValue := q.FieldByName('id_kategori').AsString;
    cxlSubKategori.EditValue := q.FieldByName('id_subkategori').AsString;
    if not q.FieldByName('id_satuan').IsNull then
      cxlSatuan.EditValue := q.FieldByName('id_satuan').AsString;
    q.Close; 

    q := OpenRS('SELECT * FROM tbl_konv_brg WHERE id_barang = %d',[ID]);
    while not q.Eof do begin
      with cxtbSatuan.DataController do begin
        i := AppendRecord;
        Values[i, cxColSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColKeterangan.Index] := q.FieldByName('keterangan').AsString;
      end;
      q.Next;
    end;
    q.Close;
                                                    
  end;
end;

end.
