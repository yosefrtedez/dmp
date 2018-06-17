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
  cxSpinEdit, cxContainer, cxLabel, cxCheckBox;

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
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxtbPOHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
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
    f := TfrmInputPO.Create(Self);
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
  q := OpenRS('select * from tbl_spbb_head where no_po = ''%s''',[zqrPO.FieldByName('no_bukti').AsString]);
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
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
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
end;

end.
