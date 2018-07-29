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
  cxCheckBox;

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
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    procedure btnTambahClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPenerimaanKas: TfrmLstPenerimaanKas;

implementation

uses unFrmInputPenerimaanKas, unFrmUtama, unDM;

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
    f.Jenis := 'E';
    f.EditKey := zqrPK.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := 'Edit Penerimaan Kas';
    f.Show;

    fu.pgMain.ActivePage := ts;
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
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := 'Input Penerimaan Kas';
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

end.
