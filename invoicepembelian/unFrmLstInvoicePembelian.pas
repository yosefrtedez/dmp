unit unFrmLstInvoicePembelian;

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
  TfrmLstInvoicePembelian = class(TfrmTplGrid)
    Label1: TLabel;
    cxtbPIHead: TcxGridDBTableView;
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
    cxColTblHeadno_bukti: TcxGridDBColumn;
    cxColTblHeadtgl_required: TcxGridDBColumn;
    cxColTblHeaduser: TcxGridDBColumn;
    cxColTblHeaduser_dept: TcxGridDBColumn;
    cxColTblHeadf_approval: TcxGridDBColumn;
    cxColTblHeadnama: TcxGridDBColumn;
    cxColTblHeadkontak: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxtbPIDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxtbPIDetkode_brg: TcxGridDBColumn;
    cxtbPIDetdeskripsi: TcxGridDBColumn;
    cxtbPIDetqty: TcxGridDBColumn;
    cxtbPIDetsatuan: TcxGridDBColumn;
    cxtbPIDetharga: TcxGridDBColumn;
    cxtbPIDetmata_uang: TcxGridDBColumn;
    cxtbPIDetColumn1: TcxGridDBColumn;
    cxtbPIDetColumn2: TcxGridDBColumn;
    btnCetakPO: TButton;
    zqrRptPO: TZReadOnlyQuery;
    dsRptPO: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxtbPIHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
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
  frmLstInvoicePembelian: TfrmLstInvoicePembelian;

implementation

uses
  unFrmUtama, unDM, unFrmInputPO, unTools, unAplikasi, unFrmInputPembayaranPembelian,
  unFrmInputInvoicePembelian;

{$R *.dfm}

procedure TfrmLstInvoicePembelian.btnCetakPOClick(Sender: TObject);
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

procedure TfrmLstInvoicePembelian.btnCtkPOClick(Sender: TObject);
begin
  inherited;
  {
  zqrRptPO.Close;
  zqrRptPO.ParamByName('no_bukti').AsString := zqrPO.FieldByName('no_bukti').AsString;
  zqrRptPO.Open;
  rptPO.ShowReport(True);
  }
end;

procedure TfrmLstInvoicePembelian.btnEditClick(Sender: TObject);
var
 f: TfrmInputPembayaranPembelian;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;

  if not fu.CekTabOpen('Edit Purchase Invoice') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    if zqrPembayaranPembelian.FieldByName('f_app').AsString = '1' then begin
      MsgBox('Maaf data tidak bisa diedit, karena sudah di approve');
      Abort;
    end;
    f := TfrmInputPembayaranPembelian.Create(Self);
    f.FormInduk := Self;
    ts.Caption := 'Edit Purchase Invoice';
    f.Jenis := 'E';
    f.EditKey := zqrPembayaranPembelian.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;

end;

procedure TfrmLstInvoicePembelian.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;

  q := OpenRS('select * from tbl_invoicepembelian_head where f_app = 1 and no_bukti = ''%s''',[zqrPembayaranPembelian.FieldByName('no_bukti').AsString]);
  if not q.Eof then begin
    MsgBox('Maaf data tidak bisa dihapus, karena sudah di Approveg');
    Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      DM.zConn.ExecuteDirect('delete  from tbl_invoicepembelian_head where no_bukti = ''' + zqrPembayaranPembelian.FieldByName('no_bukti').AsString + '''');
      DM.zConn.ExecuteDirect('delete  from tbl_invoicepembelian_det where no_bukti = ''' + zqrPembayaranPembelian.FieldByName('no_bukti').AsString + '''');
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

procedure TfrmLstInvoicePembelian.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrPembayaranPembelian.Close;
  zqrPembayaranPembelian.Open;
  zqrPembayaranPembelianDet.Close;
  zqrPembayaranPembelianDet.Open;

end;

procedure TfrmLstInvoicePembelian.btnTambahClick(Sender: TObject);
var
  f: TfrmInputInvoicePembelian;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Invoice Pembelian') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputInvoicePembelian.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstInvoicePembelian.cxtbPIHeadFocusedRecordChanged(
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

procedure TfrmLstInvoicePembelian.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPembayaranPembelian.Open;
end;

end.
