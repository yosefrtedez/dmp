unit unFrmLstInvoicePenjualan;

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
  TfrmLstInvoicePenjualan = class(TfrmTplGrid)
    Label1: TLabel;
    cxTblInvHead: TcxGridDBTableView;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    zqrInvPenjualan: TZReadOnlyQuery;
    dsInvPenjualan: TDataSource;
    cxTblDet: TcxGridDBTableView;
    zqrInvPenjualanDet: TZReadOnlyQuery;
    dsInvPenjualanDet: TDataSource;
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
    cxTblInvDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    btnCetakPO: TButton;
    cxColNo_bukti: TcxGridDBColumn;
    cxColTanggal: TcxGridDBColumn;
    cxColCustomer: TcxGridDBColumn;
    cxColNobukti: TcxGridDBColumn;
    cxColKodeBrg: TcxGridDBColumn;
    cxColNama: TcxGridDBColumn;
    cxColQty: TcxGridDBColumn;
    cxColSatuan: TcxGridDBColumn;
    cxColHarga: TcxGridDBColumn;
    cxColSuratJalan: TcxGridDBColumn;
    btnPosting: TButton;
    cxTblInvHeadColumn1: TcxGridDBColumn;
    cxTblInvHeadColumn2: TcxGridDBColumn;
    cxTblInvHeadColumn3: TcxGridDBColumn;
    cxTblInvHeadColumn4: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxTblInvHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
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
  frmLstInvoicePembelian: TfrmLstInvoicePenjualan;

implementation

uses
  unFrmUtama, unDM,  unTools, unAplikasi, unFrmInputInvoicePenjualan,
  unFrmLapInvoicePenjualan;

{$R *.dfm}

procedure TfrmLstInvoicePenjualan.btnCetakPOClick(Sender: TObject);
var
  q :TZQuery;
  f: TfrmLapInvoicePenjualan;
begin
  inherited;

  q := OpenRS('select * from tbl_invoicepenjualan_head where no_bukti = ''%s''',[zqrInvPenjualan.FieldByName('no_bukti').AsString]);
  if q.Eof  then begin
     MsgBox('Faktur dengna nomer ini tidak ada');
     Abort;
  end;

  f := TfrmLapInvoicePenjualan.Create(Self);
  with f do begin
    zqrRptInvoicePenjualan.Close;
    zqrRptInvoicePenjualan.ParamByName('id').AsInteger := zqrInvPenjualan.FieldByName('id').AsInteger;
    zqrRptInvoicePenjualan.Open;
    rptInvoicePenjualan.ShowReport(True);
  end;
  f.Free;

end;

procedure TfrmLstInvoicePenjualan.btnCtkPOClick(Sender: TObject);
begin
  inherited;
  {
  zqrRptPO.Close;
  zqrRptPO.ParamByName('no_bukti').AsString := zqrPO.FieldByName('no_bukti').AsString;
  zqrRptPO.Open;
  rptPO.ShowReport(True);
  }
end;

procedure TfrmLstInvoicePenjualan.btnEditClick(Sender: TObject);
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
    f.TabSheet := Self.Parent as TcxTabSheet;
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

procedure TfrmLstInvoicePenjualan.btnHapusClick(Sender: TObject);
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

procedure TfrmLstInvoicePenjualan.btnRefreshClick(Sender: TObject);
begin
  inherited;

  zqrInvPenjualan.Close;
  zqrInvPenjualan.Open;
  zqrInvPenjualanDet.Close;
  zqrInvPenjualanDet.Open;

end;

procedure TfrmLstInvoicePenjualan.btnTambahClick(Sender: TObject);
var
  f: TfrmInputInvoicePenjualan;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Input Invoice Penjualan') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputInvoicePenjualan.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstInvoicePenjualan.cxTblInvHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrInvPenjualanDet.Close;
    zqrInvPenjualanDet.ParamByName('id_ref').AsInteger := zqrInvPenjualan.FieldByName('id').AsInteger;
    zqrInvPenjualanDet.Open;
  except
  end;
end;

procedure TfrmLstInvoicePenjualan.FormCreate(Sender: TObject);
begin
  inherited;
  zqrInvPenjualan.Open;

end;

end.
