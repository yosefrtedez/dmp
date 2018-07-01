unit unFrmLstBarangKeluar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplGrid, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, cxSpinEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, ZAbstractRODataset, ZDataset;

type
  TfrmLstBarangKeluar = class(TfrmTplGrid)
    Label13: TLabel;
    cxgrd1: TcxGrid;
    cxTblReturPembHead: TcxGridDBTableView;
    cxTblDet: TcxGridDBTableView;
    cxColTblDetid: TcxGridDBColumn;
    cxColTblDetid_ref: TcxGridDBColumn;
    cxColTblDetno_bukti: TcxGridDBColumn;
    cxColTblDetkode_brg: TcxGridDBColumn;
    cxColTblDetdeskripsi: TcxGridDBColumn;
    cxColTblDetqty: TcxGridDBColumn;
    cxColTblDetsatuan: TcxGridDBColumn;
    cxColTblDetharga: TcxGridDBColumn;
    cxColTblDetmata_uang: TcxGridDBColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxTblReturPembDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrBarangMasuk: TZReadOnlyQuery;
    dsBarangMasuk: TDataSource;
    zqrBarangMasukDet: TZReadOnlyQuery;
    dsBarangMasukDet: TDataSource;
    cxColPOHeadno_bukti: TcxGridDBColumn;
    cxColPOHeadid_invoice: TcxGridDBColumn;
    cxColPOHeadketerangan: TcxGridDBColumn;
    cxColPOHeadtanggal: TcxGridDBColumn;
    cxColPOHeaduser: TcxGridDBColumn;
    cxColPODetno_bukti: TcxGridDBColumn;
    cxColPODetkode_brg: TcxGridDBColumn;
    cxColPODetdeskripsi: TcxGridDBColumn;
    cxColPODetqty: TcxGridDBColumn;
    cxColPODetketerangan: TcxGridDBColumn;
    cxColPODetid_gdg: TcxGridDBColumn;
    cxColPODetsatuan: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxTblReturPembHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
    mjenis : string;
  public
    { Public declarations }
  end;

var
  frmLstBarangKeluar: TfrmLstBarangKeluar;

implementation

uses unDM, unTools, unFrmInputReturPembelian, unFrmUtama, unFrmInputBarangJasa,
  unFrmInputBarangMasuk;

{$R *.dfm}

procedure TfrmLstBarangKeluar.btnEditClick(Sender: TObject);
var
 f: TfrmInputReturPembelian;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
  if not fu.CekTabOpen('Edit Retur Pembelian') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    if zqrReturPembHead.FieldByName('f_app').AsString = '1' then begin
      MsgBox('Maaf data retur pembelian tidak bisa diedit, karena sudah di approve');
      Abort;
    end;
    f := TfrmInputReturPembelian.Create(Self);
    ts.Caption := 'Edit Retur Pembelian';
    f.Jenis := 'E';
    f.EditKey := zqrReturPembHead.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;


procedure TfrmLstBarangKeluar.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;
  q := OpenRS('select * from tbl_trsreturpemb_head where f_app = ''1'' and no_bukti = ''%s''',[zqrReturPembHead.FieldByName('no_bukti').AsString]);
  if not q.Eof then begin
    MsgBox('Maaf data tidak bisa dihapus, karena sudah di approve atasan');
    Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      DM.zConn.ExecuteDirect('delete  from tbl_trsreturpemb_head where no_bukti = ''' + zqrReturPembHead.FieldByName('no_bukti').AsString + '''');
      DM.zConn.ExecuteDirect('delete  from tbl_trsreturpemb_det where no_bukti = ''' + zqrReturPembDet.FieldByName('no_bukti').AsString + '''');
      DM.zConn.Commit;
      MsgBox('Data berhasil dihapus');
      btnRefreshClick(nil);
    except
       on e : Exception do begin
         MsgBox('Error: ' + E.Message);
         DM.zConn.Rollback;
         mjenis := '';
       end;
    end;
  end;


end;


procedure TfrmLstBarangKeluar.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrReturPembHead.Close;
  zqrReturPembHead.Open;
  zqrReturPembDet.Close;
  zqrReturPembDet.Open;
end;

procedure TfrmLstBarangKeluar.btnTambahClick(Sender: TObject);
var
  f: TfrmInputBarangMasuk;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Barang Masuk') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputBarangMasuk.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangKeluar.cxTblReturPembHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrReturPembDet.Close;
    zqrReturPembDet.ParamByName('id_ref').AsInteger := zqrReturPembHead.FieldByName('id').AsInteger;
    zqrReturPembDet.Open;
  except
  end;
end;

procedure TfrmLstBarangKeluar.FormCreate(Sender: TObject);
begin
  inherited;
  zqrReturPembHead.Open;
end;

end.
