unit unFrmLstPB;

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
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, ExtCtrls, cxCheckBox, cxSpinEdit, cxContainer, cxLabel, cxPC,
  ZAbstractRODataset, ZDataset;

type
  TfrmLstPB = class(TfrmTplGrid)
    Label1: TLabel;
    cxgrd1: TcxGrid;
    cxtbPBHead: TcxGridDBTableView;
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
    cxtbPBDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrPBHead: TZReadOnlyQuery;
    dsPBHead: TDataSource;
    cxtbPBHeadno_bukti: TcxGridDBColumn;
    cxtbPBHeadno_po: TcxGridDBColumn;
    cxtbPBHeadtanggal: TcxGridDBColumn;
    cxtbPBHeaduser: TcxGridDBColumn;
    cxtbPBHeaduser_dept: TcxGridDBColumn;
    zqrPBDet: TZReadOnlyQuery;
    dsPBDet: TDataSource;
    cxtbPBDetkode_brg: TcxGridDBColumn;
    cxtbPBDetqty: TcxGridDBColumn;
    cxtbPBDetharga: TcxGridDBColumn;
    cxtbPBDetketerangan: TcxGridDBColumn;
    cxtbPBDetdeskripsi: TcxGridDBColumn;
    cxtbPBDetsatuan2: TcxGridDBColumn;
    cxtbPBHeadnama_supplier: TcxGridDBColumn;
    cxtbPBHeadColumn1: TcxGridDBColumn;
    cxtbPBDetColumn1: TcxGridDBColumn;
    cxtbPBHeadColumn2: TcxGridDBColumn;
    cxtbPBDetColumn2: TcxGridDBColumn;
    cxtbPBHeadColumn3: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure cxtbPBHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPB: TfrmLstPB;

implementation

uses unFrmInputPB, unFrmUtama, unDM, unTools;

{$R *.dfm}

procedure TfrmLstPB.btnEditClick(Sender: TObject);
var
  f: TfrmInputPB;
  ts: TcxTabSheet;
begin
  inherited;
  MsgBox('Mohon maaf, modul ini belum bisa digunakan.');
  Abort;
  if not fu.CekTabOpen('Edit Penerimaan Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputPB.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    MsgBox('Transaksi tidak hanya bisa dilihat, karena sudah di posting.');
    f.Jenis := 'E';
    f.EditKey := zqrPBHead.FieldByName('id').AsString;
    f.Parent := ts;
    f.Caption := 'Edit Penerimaan Barang';
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPB.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrPBHead.Close;
  zqrPBHead.Open;
end;

procedure TfrmLstPB.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPB;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Penerimaan Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputPB.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPB.cxtbPBHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrPBDet.Close;
    zqrPBDet.ParamByName('id_ref').AsInteger := zqrPBHead.FieldByname('id').AsInteger;
    zqrPBDet.Open;
  except
  end;
end;

procedure TfrmLstPB.FormCreate(Sender: TObject);
begin
  inherited;
  Self.NamaMenu := 'mnPur_PB';
  Self.TerapkanWewenang(Self.NamaMenu);
  zqrPBHead.Open;
end;

end.
