unit unFrmLstPenerimaanKas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplGrid, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxPC, ZAbstractRODataset, ZDataset,
  cxCheckBox, cxContainer, cxLabel, cxSpinEdit;

type
  TfrmLstPenerimaanKas = class(TfrmTplGrid)
    cxtbPK: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label13: TLabel;
    zqrPK: TZReadOnlyQuery;
    dsPK: TDataSource;
    cxtbPKno_bukti: TcxGridDBColumn;
    cxtbPKtanggal: TcxGridDBColumn;
    cxtbPKdari: TcxGridDBColumn;
    cxtbPKsebesar: TcxGridDBColumn;
    cxtbPKmemo: TcxGridDBColumn;
    cxtbPKuser: TcxGridDBColumn;
    cxtbPKf_posting: TcxGridDBColumn;
    Panel3: TPanel;
    cxtbPKDet: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    zqrPKDet: TZReadOnlyQuery;
    dsPKDet: TDataSource;
    btnPosting: TButton;
    cxLabel1: TcxLabel;
    cxtbPKDetnoakun: TcxGridDBColumn;
    cxtbPKDetmemo: TcxGridDBColumn;
    cxtbPKDetjumlah: TcxGridDBColumn;
    cxtbPKDetColumn1: TcxGridDBColumn;
    Button1: TButton;
    procedure btnTambahClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxtbPKFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure btnPostingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPenerimaanKas: TfrmLstPenerimaanKas;

implementation

uses unFrmInputPenerimaanKas, unFrmUtama, unDM, unFrmLapKasMasukKasKeluar,
  unTools;

{$R *.dfm}

procedure TfrmLstPenerimaanKas.btnEditClick(Sender: TObject);
var
  f: TfrmInputPenerimaanKas;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Edit Penerimaan Kas') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputPenerimaanKas.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.Jenis := 'E';
    f.EditKey := zqrPK.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := 'Edit Penerimaan Kas';
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPenerimaanKas.btnPostingClick(Sender: TObject);
var
  qh, qdet, qj: TZQuery;
  sNoJ: string;
begin
  inherited;

  if zqrPK.FieldByName('f_posting').AsInteger = 1 then Abort;

  try
    sNoJ := GetLastFak('jurnal');
    UpdateFaktur(Copy(sNoJ,1,7));

    qj := OpenRS('SELECT tbl_jurnal WHERE no_jurnal = ''%s''',[])
  except

  end;
end;

procedure TfrmLstPenerimaanKas.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrPK.Close;
  zqrPK.Open;
end;

procedure TfrmLstPenerimaanKas.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPenerimaanKas;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Penerimaan Kas') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputPenerimaanKas.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := 'Input Penerimaan Kas';
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPenerimaanKas.Button1Click(Sender: TObject);
var
  f: TfrmLapKasMasukKasKeluar;
begin
  inherited;

  f := TfrmLapKasMasukKasKeluar.Create(Self);
  with f do begin
    zqrKasMasuk.ParamByName('id').AsInteger := zqrPK.FieldByName('id').AsInteger;
    zqrKasMasuk.Open;
    rptKasMasuk.ShowReport(true);
  end;
  f.Free;
end;

procedure TfrmLstPenerimaanKas.cxtbPKFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  with zqrPKDet do begin
    Close;
    ParamByname('id_ref').AsInteger := zqrPK.FieldByName('id').AsInteger;
    Open;
  end;
end;

procedure TfrmLstPenerimaanKas.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPK.Open;
  cxtbPKno_bukti.SortOrder := soAscending;
end;

end.
