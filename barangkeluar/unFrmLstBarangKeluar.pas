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
    cxtbBarangKeluar: TcxGridDBTableView;
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
    cxtbBarangKeluarDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrBarangKeluar: TZReadOnlyQuery;
    dsBarangKeluar: TDataSource;
    zqrBarangKeluarDet: TZReadOnlyQuery;
    dsBarangKeluarkDet: TDataSource;
    cxColPOHeadno_bukti: TcxGridDBColumn;
    cxColPOHeadid_invoice: TcxGridDBColumn;
    cxColPOHeadketerangan: TcxGridDBColumn;
    cxColPOHeadtanggal: TcxGridDBColumn;
    cxColPOHeaduser: TcxGridDBColumn;
    cxColPODetno_bukti: TcxGridDBColumn;
    cxColPODetkode_brg: TcxGridDBColumn;
    cxColPODetdeskripsi: TcxGridDBColumn;
    cxColPODetqty: TcxGridDBColumn;
    cxColPODetid_gdg: TcxGridDBColumn;
    cxColPODetsatuan: TcxGridDBColumn;
    cxtbBarangKeluarDetColumn1: TcxGridDBColumn;
    Button1: TButton;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxtbBarangKeluarFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  unFrmInputBarangMasuk, unFrmInputBarangKeluar, unFrmTmpLap01;

{$R *.dfm}

procedure TfrmLstBarangKeluar.btnEditClick(Sender: TObject);
var
 f: TfrmInputBarangKeluar;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
  if not fu.CekTabOpen('Edit Barang Keluar') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputBarangKeluar.Create(Self);
    ts.Caption := 'Edit Barang Keluar';
    f.Jenis := 'E';
    f.EditKey := zqrBarangKeluar.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;


procedure TfrmLstBarangKeluar.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrBarangKeluar.Close;
  zqrBarangKeluar.Open;
  zqrBarangKeluarDet.Close;
  zqrBarangKeluarDet.Open;
end;

procedure TfrmLstBarangKeluar.btnTambahClick(Sender: TObject);
var
  f: TfrmInputBarangKeluar;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Barang Keluar') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputBarangKeluar.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangKeluar.Button1Click(Sender: TObject);
var
  f: TfrmTmpLap01;
begin
  inherited;
  f := TfrmTmpLap01.Create(Self);
  with f do begin
    zqrSJ01.ParamByName('id').AsInteger := zqrBarangKeluar.FieldByName('id').AsInteger;
    rptSJ01.ShowReport(True);
    rptFakturPenjualan.ShowReport(True);
  end;
end;

procedure TfrmLstBarangKeluar.cxtbBarangKeluarFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrBarangkeluarDet.Close;
    zqrBarangKeluarDet.ParamByName('id_ref').AsInteger := zqrBarangKeluar.FieldByName('id').AsInteger;
    zqrBarangKeluarDet.Open;
  except
  end;
end;

procedure TfrmLstBarangKeluar.FormCreate(Sender: TObject);
begin
  inherited;
  zqrBarangKeluar.Open;
end;

end.
