unit unFrmLstJurnalUmum;

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
  cxGridTableView, cxGridDBTableView, cxGrid, ZAbstractRODataset, ZDataset, cxPC;

type
  TfrmLstJurnalUmum = class(TfrmTplGrid)
    cxtbJurnalUmum: TcxGridDBTableView;
    cxgJurnalUmumLevel1: TcxGridLevel;
    cxgJurnalUmum: TcxGrid;
    zqrJurnalUmum: TZReadOnlyQuery;
    dsJurnalUmum: TDataSource;
    cxtbJurnalUmumno_jurnal: TcxGridDBColumn;
    cxtbJurnalUmumtanggal: TcxGridDBColumn;
    cxtbJurnalUmumketerangan: TcxGridDBColumn;
    cxtbJurnalUmumjenis: TcxGridDBColumn;
    cxtbJurnalUmumuser: TcxGridDBColumn;
    cxtbJurnalUmumuser_dept: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstJurnalUmum: TfrmLstJurnalUmum;

implementation

uses unDM, unFrmInputJurnalUmum, unFrmUtama;

{$R *.dfm}

procedure TfrmLstJurnalUmum.btnEditClick(Sender: TObject);
var
 f: TfrmInputJurnalUmum;
 ts: TcxTabSheet;
 q: TZQuery;
begin
 if not fu.CekTabOpen('Edit Jurnal Umum') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputJurnalUmum.Create(Self);
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.Caption := 'Edit Jurnal Umum';
    f.EditKey := zqrJurnalUmum.FieldByName('no_jurnal').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

	  fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstJurnalUmum.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrJurnalUmum.Close;
  zqrJurnalUmum.Open;
end;

procedure TfrmLstJurnalUmum.btnTambahClick(Sender: TObject);
var
  f: TfrmInputJurnalUmum;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Jurnal Umum') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputJurnalUmum.Create(Self);
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstJurnalUmum.FormShow(Sender: TObject);
begin
  inherited;
  zqrJurnalUmum.Open;
end;

end.
