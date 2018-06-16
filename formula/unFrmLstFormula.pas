unit unFrmLstFormula;

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
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, ZAbstractRODataset, ZDataset,
  cxContainer, cxLabel;

type
  TfrmLstFormula = class(TfrmTplGrid)
    cxtbFormulaH: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    cxtbFormulaD: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Label13: TLabel;
    zqrFormulaH: TZReadOnlyQuery;
    dsFormulaH: TDataSource;
    cxtbFormulaHkode_brg: TcxGridDBColumn;
    cxtbFormulaHdeskripsi: TcxGridDBColumn;
    cxGrid3: TcxGrid;
    cxtbFormulaSD: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dsFormulaD: TDataSource;
    zqrFormulaD: TZReadOnlyQuery;
    cxtbFormulaDnama: TcxGridDBColumn;
    cxtbFormulaDketerangan: TcxGridDBColumn;
    Panel4: TPanel;
    zqrFormulaSD: TZReadOnlyQuery;
    dsFormulaSD: TDataSource;
    cxtbFormulaSDqty: TcxGridDBColumn;
    cxtbFormulaSDsatuan: TcxGridDBColumn;
    cxtbFormulaSDdeskripsi: TcxGridDBColumn;
    cxtbFormulaSDkode: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxtbFormulaHFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxtbFormulaDFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstFormula: TfrmLstFormula;

implementation

uses unFrmInputFormula, unFrmUtama, unDM, unTools;

{$R *.dfm}

procedure TfrmLstFormula.btnEditClick(Sender: TObject);
var
 f: TfrmInputFormula;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
   if not fu.CekTabOpen('Edit Formula') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputFormula.Create(Self);
    f.Jenis := 'E';
    f.Caption := 'Edit Formula';
    f.EditKey := zqrFormulaH.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

	  fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstFormula.btnTambahClick(Sender: TObject);
var
  f: TfrmInputFormula;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Formula') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputFormula.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstFormula.cxtbFormulaDFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  zqrFormulaSD.Close;
  zqrFormulaSD.ParamByName('id_ref').AsInteger := zqrFormulaD.FieldByName('id').AsInteger;
  zqrFormulaSD.ParamByName('id_head').AsInteger := zqrFormulaH.FieldByName('id').AsInteger;
  zqrFormulaSD.Open;
end;

procedure TfrmLstFormula.cxtbFormulaHFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  zqrFormulaD.Close;
  zqrFormulaD.ParamByName('id_ref').AsInteger := zqrFormulaH.FieldByName('id').AsInteger;
  zqrFormulaD.Open;
end;

procedure TfrmLstFormula.FormCreate(Sender: TObject);
begin
  inherited;
  zqrFormulaH.Open;
end;

end.
