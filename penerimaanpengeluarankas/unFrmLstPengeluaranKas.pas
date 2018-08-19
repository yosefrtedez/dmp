unit unFrmLstPengeluaranKas;

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
  cxCheckBox, cxSpinEdit, cxContainer, cxLabel, frxClass;

type
  TfrmLstPengeluaranKas = class(TfrmTplGrid)
    cxtbPK: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label13: TLabel;
    zqrPK: TZReadOnlyQuery;
    dsPK: TDataSource;
    cxColPKno_bukti: TcxGridDBColumn;
    cxColPKtanggal: TcxGridDBColumn;
    cxColPKkepada: TcxGridDBColumn;
    cxColPKketerangan: TcxGridDBColumn;
    cxColPKjumlah: TcxGridDBColumn;
    cxColPKakun: TcxGridDBColumn;
    cxColPKuser: TcxGridDBColumn;
    cxColPKuser_dept: TcxGridDBColumn;
    Panel3: TPanel;
    cxtbPKDet: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    zqrPKDet: TZReadOnlyQuery;
    dsPKDet: TDataSource;
    cxtbPKDetnoakun: TcxGridDBColumn;
    cxtbPKDetmemo: TcxGridDBColumn;
    cxtbPKDetjumlah: TcxGridDBColumn;
    cxtbPKDetnamaakun: TcxGridDBColumn;
    btnPosting: TButton;
    Button1: TButton;
    cxLabel1: TcxLabel;
    cxtbPKColumn1: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cxtbPKFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPengeluaranKas: TfrmLstPengeluaranKas;

implementation

uses unFrmInputPengeluaranKas, unFrmUtama, unDM, unFrmLapKasMasukKasKeluar,
  unTools;

{$R *.dfm}

procedure TfrmLstPengeluaranKas.btnEditClick(Sender: TObject);
var
  f: TfrmInputPengeluaranKas;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Edit Pengeluaran Kas') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputPengeluaranKas.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.Jenis := 'E';
    f.EditKey := zqrPK.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := 'Edit Pengeluaran Kas';
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPengeluaranKas.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrPK.Close;
  zqrPK.Open;
end;

procedure TfrmLstPengeluaranKas.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPengeluaranKas;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Pengeluaran Kas') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputPengeluaranKas.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := 'Input Pengeluaran Kas';
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPengeluaranKas.Button1Click(Sender: TObject);
var
  f: TfrmLapKasMasukKasKeluar;
  mm: TfrxMemoView;
begin
  inherited;
  f := TfrmLapKasMasukKasKeluar.Create(Self);
  with f do begin
    zqrKasKeluar.ParamByName('id').AsInteger := zqrPK.FieldByName('id').AsInteger;
    zqrKasKeluar.Open;
    mm := rptKasKeluar.FindObject('mmTerbilang') as TfrxMemoView;
    mm.Text := Terbilang(zqrPK.FieldByName('Jumlah').AsString);
    rptKasKeluar.ShowReport(true);
  end;
  f.Free;
end;

procedure TfrmLstPengeluaranKas.cxtbPKFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  with zqrPKDet do begin
    Close;
    ParamByName('id_ref').AsInteger := zqrPK.FieldByName('id').AsInteger;
    Open;
  end;
end;

procedure TfrmLstPengeluaranKas.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPK.Open;
  cxColPKno_bukti.SortOrder := soAscending;
end;

end.
