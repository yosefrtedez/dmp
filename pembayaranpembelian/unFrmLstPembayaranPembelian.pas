unit unFrmLstPembayaranPembelian;

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
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  ZAbstractRODataset, ZDataset, cxGridLevel, cxClasses, cxGridCustomView, cxPC, cxGrid,
  cxSpinEdit, cxContainer, cxLabel, cxCheckBox, Menus, frxClass, frxDBSet,
  cxButtons;

type
  TfrmLstPembayaranPembelian = class(TfrmTplGrid)
    Label1: TLabel;
    cxtbPP: TcxGridDBTableView;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    zqrPembayaranPembelian: TZReadOnlyQuery;
    dsPembayaranPembelian: TDataSource;
    cxTblDet: TcxGridDBTableView;
    zqrPembayaranPembelianDet: TZReadOnlyQuery;
    dsPembayaranPembelianDet: TDataSource;
    cxColTblDetid: TcxGridDBColumn;
    cxColTblDetid_ref: TcxGridDBColumn;
    cxColTblDetno_bukti: TcxGridDBColumn;
    cxColTblDetkode_brg: TcxGridDBColumn;
    cxColTblDetdeskripsi: TcxGridDBColumn;
    cxColTblDetqty: TcxGridDBColumn;
    cxColTblDetsatuan: TcxGridDBColumn;
    cxColTblDetharga: TcxGridDBColumn;
    cxColTblDetmata_uang: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxtbPPDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    zqrRptPO: TZReadOnlyQuery;
    dsRptPO: TDataSource;
    fdbPO: TfrxDBDataset;
    rptPO: TfrxReport;
    cxtbPPid: TcxGridDBColumn;
    cxtbPPno_bukti: TcxGridDBColumn;
    cxtbPPtanggal: TcxGridDBColumn;
    cxtbPPid_cust: TcxGridDBColumn;
    cxtbPPid_akun: TcxGridDBColumn;
    cxtbPPuser: TcxGridDBColumn;
    cxtbPPuser_dept: TcxGridDBColumn;
    cxtbPPnama_customer: TcxGridDBColumn;
    cxtbPPDetid: TcxGridDBColumn;
    cxtbPPDetid_ref: TcxGridDBColumn;
    cxtbPPDetid_invoice: TcxGridDBColumn;
    cxtbPPDetjml_pembayaran: TcxGridDBColumn;
    cxtbPPDetno_invoice: TcxGridDBColumn;
    cxtbPPDetno_bukti: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxtbPPFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnCtkPOClick(Sender: TObject);
    procedure btnCetakPOClick(Sender: TObject);
  private
    { Private declarations }
    mjenis : string;
  public
    { Public declarations }
  end;

var
  frmLstPembayaranPenjualan: TfrmLstPembayaranPembelian;

implementation

uses
  unFrmUtama, unDM, unTools, unAplikasi, unFrmInputPembayaranPenjualan,
  unFrmInputPembayaranPembelian;

{$R *.dfm}

procedure TfrmLstPembayaranPembelian.btnCetakPOClick(Sender: TObject);
var
  q :TZQuery;
begin
  inherited;
  {
  q := OpenRS('select * from tbl_po_head where f_app = 1 and no_bukti = ''%s''',[zqrpo.FieldByName('no_bukti').AsString]);
  if q.Eof  then begin
     MsgBox('PO ini tidak bisa dicetak karena belum di approve');
     Abort;
  end;
  zqrRptPO.Close;
  zqrRptPO.ParamByName('no_bukti').AsString := zqrPO.FieldByName('no_bukti').AsString;
  zqrRptPO.Open;
  rptPO.ShowReport(True);
  }
end;

procedure TfrmLstPembayaranPembelian.btnCtkPOClick(Sender: TObject);
begin
  inherited;
  {
  zqrRptPO.Close;
  zqrRptPO.ParamByName('no_bukti').AsString := zqrPO.FieldByName('no_bukti').AsString;
  zqrRptPO.Open;
  rptPO.ShowReport(True);
  }
end;

procedure TfrmLstPembayaranPembelian.btnEditClick(Sender: TObject);
var
  ts: TcxTabSheet;
  q: TZQuery;
begin
  inherited;
  {
  if not fu.CekTabOpen('Edit Purchase Order') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    if zqrPO.FieldByName('f_app').AsString = '1' then begin
      MsgBox('Maaf data tidak bisa diedit, karena sudah di approve');
      Abort;
    end;
    f := TfrmInputPO.Create(Self);
    f.FormInduk := Self;
    ts.Caption := 'Edit Purchase Order';
    f.Jenis := 'E';
    f.EditKey := zqrPO.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
  }
end;

procedure TfrmLstPembayaranPembelian.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;
  {
  q := OpenRS('select * from tbl_po_head where f_app = 1 and no_bukti = ''%s''',[zqrPO.FieldByName('no_bukti').AsString]);
  if not q.Eof then begin
    MsgBox('Maaf data tidak bisa dihapus, karena sudah ada penerimaan barang');
    Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      DM.zConn.ExecuteDirect('delete  from tbl_po_head where no_bukti = ''' + zqrPO.FieldByName('no_bukti').AsString + '''');
      DM.zConn.ExecuteDirect('delete  from tbl_po_det where no_bukti = ''' + zqrpodet.FieldByName('no_bukti').AsString + '''');
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
  }

end;

procedure TfrmLstPembayaranPembelian.btnRefreshClick(Sender: TObject);
var
  bm: Variant;
begin
  inherited;
  try
    bm := zqrPembayaranPembelian.Bookmark;
    zqrPembayaranPembelian.Close;
    zqrPembayaranPembelian.Open;
    zqrPembayaranPembelian.Bookmark := bm;
  except
  end;
end;

procedure TfrmLstPembayaranPembelian.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPembayaranPembelian;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Input Pembayaran Pembelian') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputPembayaranPembelian.Create(Self);
    f.TabSheet := Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPembayaranPembelian.cxtbPPFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrPembayaranPembelianDet.Close;
    zqrPembayaranPembelianDet.ParamByName('id_ref').AsInteger := zqrPembayaranPembelian.FieldByName('id').AsInteger;
    zqrPembayaranPembelianDet.Open;
  except
  end;
end;

procedure TfrmLstPembayaranPembelian.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPembayaranPembelian.Open;
end;

end.
