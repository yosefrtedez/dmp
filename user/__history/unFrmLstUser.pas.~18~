unit unFrmLstUser;

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
  TfrmLstUser = class(TfrmTplGrid)
    cxtbUser: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    zqrUser: TZReadOnlyQuery;
    dsUser: TDataSource;
    cxtbUsernama_lengkap: TcxGridDBColumn;
    cxtbUsernama: TcxGridDBColumn;
    cxtbUserdept: TcxGridDBColumn;
    cxtbUseremail: TcxGridDBColumn;
    Label13: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstUser: TfrmLstUser;

implementation

uses unDM, unFrmInputUser, unFrmUtama;

{$R *.dfm}

procedure TfrmLstUser.btnEditClick(Sender: TObject);
var
  f: TfrmInputUser;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Edit User') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputUser.Create(Self);
    f.FormInduk := Self;
    f.Caption := 'Edit User';
    f.Jenis := 'E';
    f.EditKey := zqrUser.FieldByName('nama').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstUser.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrUser.Close;
  zqrUser.Open;
end;

procedure TfrmLstUser.btnTambahClick(Sender: TObject);
var
  f: TfrmInputUser;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input User') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputUser.Create(Self);
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstUser.FormCreate(Sender: TObject);
begin
  inherited;
  zqrUser.Open;
end;

end.
