unit unFrmLstCustomer;

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
  cxGrid, ExtCtrls, StdCtrls, cxPC, ZAbstractRODataset, ZDataset, cxCheckBox;

type
  TfrmLstCustomer = class(TfrmTplGrid)
    cxtbCustomer: TcxGridDBTableView;
    cxgCustomerLevel1: TcxGridLevel;
    cxgCustomer: TcxGrid;
    zqrCustomer: TZReadOnlyQuery;
    dsCustomer: TDataSource;
    cxtbCustomerkode: TcxGridDBColumn;
    cxtbCustomernama: TcxGridDBColumn;
    cxtbCustomerkontak: TcxGridDBColumn;
    cxtbCustomeralamat: TcxGridDBColumn;
    cxtbCustomeralamat2: TcxGridDBColumn;
    cxtbCustomerkota: TcxGridDBColumn;
    cxtbCustomerprovinsi: TcxGridDBColumn;
    cxtbCustomernegara: TcxGridDBColumn;
    cxtbCustomertelpon: TcxGridDBColumn;
    cxtbCustomerfax: TcxGridDBColumn;
    cxtbCustomerhp: TcxGridDBColumn;
    cxtbCustomerf_aktif: TcxGridDBColumn;
    Label1: TLabel;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshGrid;
  end;

var
  frmLstCustomer: TfrmLstCustomer;

implementation

uses unFrmUtama, unDM, unFrmInputCustomer, unTools;

{$R *.dfm}

procedure TfrmLstCustomer.btnEditClick(Sender: TObject);
var
 f: TfrmInputCustomer;
 ts: TcxTabSheet;
 q: TZQuery;
begin
 if not fu.CekTabOpen('Input Customer') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputCustomer.Create(Self);
    f.Jenis := 'E';
    f.Caption := 'Edit Customer';
    f.EditKey := zqrCustomer.FieldByName('kode').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

	  fu.pgMain.ActivePage := ts;
  end;
end;
procedure TfrmLstCustomer.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrCustomer.Close;
  zqrCustomer.Open;
end;

procedure TfrmLstCustomer.btnTambahClick(Sender: TObject);
var
  f: TfrmInputCustomer;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Customer') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputCustomer.Create(Self);
    f.Jenis := 'T';
    f.cxChkAktif.Checked := True ;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  zqrCustomer.Open;
end;

procedure TfrmLstCustomer.RefreshGrid;
begin
  Self.btnRefreshClick(nil);
end;

end.
