unit unFrmLstMesin;

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
  cxGrid, ExtCtrls, StdCtrls, cxPC, ZAbstractRODataset, ZDataset;

type
  TfrmLstMesin = class(TfrmTplGrid)
    cxtbMesin: TcxGridDBTableView;
    cxgCustomerLevel1: TcxGridLevel;
    cxgCustomer: TcxGrid;
    zqrMesin: TZReadOnlyQuery;
    dsMesin: TDataSource;
    cxtbMesinnama: TcxGridDBColumn;
    cxtbMesinkode: TcxGridDBColumn;
    cxtbMesinlokasi: TcxGridDBColumn;
    Label13: TLabel;
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshGrid;
  end;

var
  frmLstMesin: TfrmLstMesin;

implementation

uses unFrmUtama, unDM, unFrmInputMesin, unTools;

{$R *.dfm}

procedure TfrmLstMesin.btnEditClick(Sender: TObject);
var
 f: TfrmInputMesin;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
   if not fu.CekTabOpen('Input Mesin') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputMesin.Create(Self);
    f.Jenis := 'E';
    f.Caption := 'Edit Mesin';
    f.EditKey := zqrMesin.FieldByName('kode').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

	  fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstMesin.btnHapusClick(Sender: TObject);
begin
  inherited;
  try
    dm.zConn.StartTransaction;
    dm.zConn.ExecuteDirect('DELETE from tbl_mesin WHERE kode = ''' + zqrMesin.FieldByName('kode').AsString + '''');
    dm.zConn.Commit;
    MsgBox('Kode mesin: ' + zqrMesin.FieldByName('kode').AsString + ' sudah berhasil di Hapus.');
    zqrMesin.Close;
    zqrMesin.Open;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
  end;
end;

procedure TfrmLstMesin.btnRefreshClick(Sender: TObject);
begin
  zqrMesin.Close;
  zqrMesin.Open;
end;

procedure TfrmLstMesin.btnTambahClick(Sender: TObject);
var
  f: TfrmInputMesin;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Mesin') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputMesin.Create(Self);
    f.Jenis := 'T';
    f.cxChkAktif.Checked := True ;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;


procedure TfrmLstMesin.FormCreate(Sender: TObject);
begin
  inherited;
  zqrMesin.Open ;
end;

procedure TfrmLstMesin.RefreshGrid;
begin
  Self.btnRefreshClick(nil);
end;

end.
