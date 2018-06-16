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
    cxtbPBHeadnopol: TcxGridDBColumn;
    cxtbPBHeaddriver: TcxGridDBColumn;
    cxtbPBHeadno_sj: TcxGridDBColumn;
    cxtbPBHeadno_po_1: TcxGridDBColumn;
    zqrPBDet: TZReadOnlyQuery;
    dsPBDet: TDataSource;
    cxtbPBDetno_bukti: TcxGridDBColumn;
    cxtbPBDetkode_brg: TcxGridDBColumn;
    cxtbPBDetqty_retur: TcxGridDBColumn;
    cxtbPBDetqty_so: TcxGridDBColumn;
    cxtbPBDetqty: TcxGridDBColumn;
    cxtbPBDetsatuan: TcxGridDBColumn;
    cxtbPBDetid_satuan: TcxGridDBColumn;
    cxtbPBDetharga: TcxGridDBColumn;
    cxtbPBDetketerangan: TcxGridDBColumn;
    cxtbPBDetf_posted: TcxGridDBColumn;
    cxtbPBDetmata_uang: TcxGridDBColumn;
    cxtbPBDetlokasi: TcxGridDBColumn;
    cxtbPBDetkondisi: TcxGridDBColumn;
    cxtbPBDetgudang: TcxGridDBColumn;
    cxtbPBDetdeskripsi: TcxGridDBColumn;
    cxtbPBDetsatuan2: TcxGridDBColumn;
    cxtbPBHeadnama_supplier: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure cxtbPBHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPB: TfrmLstPB;

implementation

uses unFrmInputPB, unFrmUtama, unDM;

{$R *.dfm}

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
  zqrPBHead.Open;
end;

end.
