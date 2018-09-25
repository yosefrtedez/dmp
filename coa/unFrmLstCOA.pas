unit unFrmLstCOA;

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
  cxGridTableView, cxGridDBTableView, cxGrid, ZAbstractRODataset, ZDataset, cxPC,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit;

type
  TfrmLstCOA = class(TfrmTplGrid)
    Label13: TLabel;
    zqrCOA: TZReadOnlyQuery;
    dsCOA: TDataSource;
    treeCOA: TcxDBTreeList;
    cxColNoAkun: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshGrid;
  end;

var
  frmLstCOA: TfrmLstCOA;

function flCOA: TFrmLstCOA;

implementation

uses unDM, unFrmInputCOA, unFrmUtama;

{$R *.dfm}

function flCOA: TFrmLstCOA;
begin
  Result := frmLstCOA;
end;

procedure TfrmLstCOA.btnEditClick(Sender: TObject);
var
  f: TfrmInputCOA;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Edit COA') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputCOA.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.Caption := 'Edit COA';
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.EditKey := zqrCOA.FieldByName('noakun').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstCOA.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrCOA.Close;
  zqrCOA.Open;
  treeCOA.FullExpand;
end;

procedure TfrmLstCOA.btnTambahClick(Sender: TObject);
var
  f: TfrmInputCOA;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input COA') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputCOA.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.cxChkAktif.Checked := True ;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstCOA.FormCreate(Sender: TObject);
begin
  inherited;
  zqrCOA.Open;
  //zqrCOA.Refresh;
  treeCOA.FullExpand;
  cxColNoAkun.SortOrder := soAscending;
end;

procedure TfrmLstCOA.RefreshGrid;
begin
  //Self.btnRefreshClick(nil);
end;

end.
