unit unFrmLstTransferBarang;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ZAbstractRODataset, ZDataset,cxPC,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel;

type
  TfrmLstTransferBarang = class(TfrmTplGrid)
    Label1: TLabel;
    cxTblTransBarang: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    zqrTransBarang: TZReadOnlyQuery;
    dsTransBarang: TDataSource;
    cxTblTransBarangno_bukti: TcxGridDBColumn;
    cxTblTransBarangtanggal: TcxGridDBColumn;
    cxTblTransBarangketerangan: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxdTgl2: TcxDateEdit;
    btnProses: TButton;
    Panel3: TPanel;
    cxLabel3: TcxLabel;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    zqrTransBarangDet: TZReadOnlyQuery;
    dsTransBarangDet: TDataSource;
    cxTblTransBarangDet: TcxGridDBTableView;
    cxTblTransBarangDetno: TcxGridDBColumn;
    cxTblTransBarangDetkode: TcxGridDBColumn;
    cxTblTransBarangDetdeskripsi: TcxGridDBColumn;
    cxTblTransBarangDetasal: TcxGridDBColumn;
    cxTblTransBarangDettujuan: TcxGridDBColumn;
    cxTblTransBarangDetsatuan: TcxGridDBColumn;
    cxTblTransBarangDetqty: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure cxTblTransBarangFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstTransferBarang: TfrmLstTransferBarang;

implementation

uses
  unDM, unTools, unAplikasi, unFrmInputTransferBarang, unFrmUtama;

{$R *.dfm}

procedure TfrmLstTransferBarang.btnEditClick(Sender: TObject);
var
  f: TfrmInputTransferBarang;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Edit Transfer Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputTransferBarang.Create(Self);
    f.Jenis := 'E';
    f.EditKey := zqrTransBarang.FieldByName('no_bukti').AsString;
    f.Parent := ts;
    f.Caption := 'Edit Transfer Barang';
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstTransferBarang.btnHapusClick(Sender: TObject);
begin
  inherited;
  try
    dm.zConn.StartTransaction;
    dm.zConn.ExecuteDirect('DELETE from tbl_trsmutasi_head WHERE no_bukti = ''' + zqrTransBarang.FieldByName('no_bukti').AsString + '''');
    dm.zConn.ExecuteDirect('DELETE from tbl_trsmutasi_det WHERE no_bukti = ''' + zqrTransBarang.FieldByName('no_bukti').AsString + '''');
    dm.zConn.ExecuteDirect('DELETE from tbl_history WHERE no_bukti = ''' + zqrTransBarang.FieldByName('no_bukti').AsString + '''');
    dm.zConn.Commit;
    MsgBox('No.Transfer: ' + zqrTransBarang.FieldByName('no_bukti').AsString + ' sudah berhasil di Hapus.');
    zqrTransBarang.Close;
    zqrTransBarang.Open;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
  end;
end;

procedure TfrmLstTransferBarang.btnProsesClick(Sender: TObject);
begin
  inherited;
   with zqrTransBarang do begin
    if Active then Close;
    Screen.Cursor := crSQLWait;
    ParamByName('tgl1').AsDateTime := cxdTgl1.Date;
    ParamByName('tgl2').AsDateTime := cxdTgl2.Date;
    Open;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLstTransferBarang.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrTransBarang.Close;
  zqrTransBarang.Open;
end;

procedure TfrmLstTransferBarang.btnTambahClick(Sender: TObject);
var
  f: TfrmInputTransferBarang;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Input Transfer Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputTransferBarang.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstTransferBarang.cxTblTransBarangFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrTransBarangDet.Close;
    zqrTransBarangDet.ParamByName('id_ref').AsInteger := zqrTransBarang.FieldByName('id').AsInteger;
    zqrTransBarangDet.Open;
  except
  end;
end;

procedure TfrmLstTransferBarang.FormCreate(Sender: TObject);
begin
  inherited;
  zqrTransBarang.Open;
  cxdTgl1.Date := FDOM(Date);
  cxdTgl2.Date := LDOM(Date);
end;


end.
