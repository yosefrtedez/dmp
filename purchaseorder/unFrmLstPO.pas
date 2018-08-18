unit unFrmLstPO;

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
  TfrmLstPO = class(TfrmTplGrid)
    Label1: TLabel;
    cxtbPOHead: TcxGridDBTableView;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    zqrPO: TZReadOnlyQuery;
    dsPO: TDataSource;
    cxTblDet: TcxGridDBTableView;
    zqrPoDet: TZReadOnlyQuery;
    dsPoDet: TDataSource;
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
    cxColTblHeadno_fobj: TcxGridDBColumn;
    cxColTblHeadtgl_required: TcxGridDBColumn;
    cxColTblHeaduser: TcxGridDBColumn;
    cxColTblHeaduser_dept: TcxGridDBColumn;
    cxColTblHeadpembayaran: TcxGridDBColumn;
    cxColTblHeadf_approval: TcxGridDBColumn;
    cxColTblHeadnama: TcxGridDBColumn;
    cxColTblHeadkontak: TcxGridDBColumn;
    cxColTblHeadf_completed: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxtbPODet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxtbPODetkode_brg: TcxGridDBColumn;
    cxtbPODetdeskripsi: TcxGridDBColumn;
    cxtbPODetqty: TcxGridDBColumn;
    cxtbPODetsatuan: TcxGridDBColumn;
    cxtbPODetharga: TcxGridDBColumn;
    cxtbPODetmata_uang: TcxGridDBColumn;
    cxtbPODetColumn1: TcxGridDBColumn;
    cxtbPODetColumn2: TcxGridDBColumn;
    btnCetakPO: TButton;
    zqrRptPO: TZReadOnlyQuery;
    dsRptPO: TDataSource;
    fdbPO: TfrxDBDataset;
    rptPO: TfrxReport;
    cxtbPODetColumn3: TcxGridDBColumn;
    btnBatalApproval: TButton;
    btnTutupPO: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxtbPOHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnCtkPOClick(Sender: TObject);
    procedure btnCetakPOClick(Sender: TObject);
    procedure btnBatalApprovalClick(Sender: TObject);
    procedure btnTutupPOClick(Sender: TObject);
  private
    { Private declarations }
    mjenis : string;
  public
    { Public declarations }
  end;

var
  frmLstPO: TfrmLstPO;

implementation

uses
  unFrmUtama, unDM, unFrmInputPO, unTools, unAplikasi;

{$R *.dfm}

procedure TfrmLstPO.btnBatalApprovalClick(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    q := OpenRS('SELECT id_po FROM tbl_pb_det WHERE id_po = %s',[zqrPO.FieldByName('id').AsString]);
    if not q.IsEmpty then begin
      MsgBox('Approval PO tidak bisa dibatalkan karena sudah ada penerimaan.');
      q.Close;
      Abort;
    end;
    q.Close;
    dm.zConn.ExecuteDirect(Format('UPDATE tbl_po_head SET f_app = 0 WHERE id = %s',[zqrPO.FieldByName('id').AsString]));
    MsgBox('Approval PO sudah dibatalkan.');
    btnRefreshClick(nil);
  except

  end;
end;

procedure TfrmLstPO.btnCetakPOClick(Sender: TObject);
var
  q :TZQuery;
begin
  inherited;
  q := OpenRS('select * from tbl_po_head where f_app = 1 and no_bukti = ''%s''',[zqrpo.FieldByName('no_bukti').AsString]);
  if q.Eof  then begin
     MsgBox('PO ini tidak bisa dicetak karena belum di approve');
     Abort;
  end;
  zqrRptPO.Close;
  zqrRptPO.ParamByName('no_bukti').AsString := zqrPO.FieldByName('no_bukti').AsString;
  zqrRptPO.Open;
  rptPO.ShowReport(True);
end;

procedure TfrmLstPO.btnCtkPOClick(Sender: TObject);
begin
  inherited;
  zqrRptPO.Close;
  zqrRptPO.ParamByName('no_bukti').AsString := zqrPO.FieldByName('no_bukti').AsString;
  zqrRptPO.Open;
  rptPO.ShowReport(True);
end;

procedure TfrmLstPO.btnEditClick(Sender: TObject);
var
 f: TfrmInputPO;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
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
end;

procedure TfrmLstPO.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;
  q := OpenRS('select * from tbl_po_head where f_app = 1 and id = %s',[zqrPO.FieldByName('id').AsString]);

  if not q.Eof then begin
    MsgBox('Purchase Order tidak bisa dihapus, karena sudah di-Approval.');
    q.Close;
    Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      DM.zConn.ExecuteDirect(Format('delete  from tbl_po_head where id = %s',[zqrPO.FieldByName('id').AsString]));
      DM.zConn.ExecuteDirect(Format('delete  from tbl_po_det where id_ref = %s',[zqrpodet.FieldByName('id').AsString]));
      DM.zConn.Commit;
      MsgBox('Purchase Order sudah berhasil dihapus');
      btnRefreshClick(nil);
    except
       on e : Exception do begin
         MsgBox('Error: ' + E.Message);
         DM.zConn.Rollback;
         mjenis := '';
       end;
    end;
  end;
  q.Close;

end;

procedure TfrmLstPO.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrPo.Close;
  zqrPO.Open;
  zqrPoDet.Close;
  zqrPoDet.Open;
end;

procedure TfrmLstPO.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPO;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Purchase Order') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputPO.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPO.btnTutupPOClick(Sender: TObject);
var
  q: TZQuery;
  i: integer;
begin
  inherited;
  try
    q := OpenRS('SELECT f_app FROM tbl_po_head WHERE id = %s',[zqrPO.FieldByName('id').AsString]);
    if q.FieldByName('f_app').AsInteger = 0 then begin
      MsgBox('PO tidak bisa ditutup karena belum di-Approval.');
      q.Close;
      Abort;
    end;
    i := QBox(Self, 'Yakin PO ini akan ditutup / komplit ?', 'Tutup PO');
    if i = IDYES then begin
      dm.zConn.ExecuteDirect(Format('UPDATE tbl_po_head SET f_completed = 1 WHERE id = %s',[zqrPO.FieldByName('id').AsString]));
      MsgBox('PO Sudah berhasil ditutup / komplit.');
      btnRefreshClick(nil);
    end;
  except

  end;
end;

procedure TfrmLstPO.cxtbPOHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrPoDet.Close;
    zqrPoDet.ParamByName('id_ref').AsInteger := zqrPO.FieldByName('id').AsInteger;
    zqrPoDet.Open;
  except
  end;
end;

procedure TfrmLstPO.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPO.Open;

  if CheckWewenang('pembatalan-po', Aplikasi.NamaUser) then
    btnBatalApproval.Visible := True
  else
    btnBatalApproval.Visible := False;

  if CheckWewenang('tutup-po', Aplikasi.NamaUser) then
    btnTutupPO.Visible := True
  else
    btnTutupPO.Visible := False;

  if (Aplikasi.NamaUser = 'ADMIN') or (Aplikasi.NamaUser = 'FELGITO') or (Aplikasi.NamaUser = 'HENDRA') then
    btnBatalApproval.Visible := true
  else
    btnBatalApproval.Visible := false;

  if (Aplikasi.NamaUser = 'ADMIN') or (Aplikasi.NamaUser = 'FELGITO') or (Aplikasi.NamaUser = 'HENDRA') then
    btnTutupPO.Visible := true
  else
    btnTutupPO.Visible := false;

  cxColTblHeadno_bukti.SortOrder := soAscending;
end;

end.
