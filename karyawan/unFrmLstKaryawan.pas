unit unFrmLstKaryawan;

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
  TfrmLstKaryawan = class(TfrmTplGrid)
    cxtbKaryawan: TcxGridDBTableView;
    cxgKaraywanLevel1: TcxGridLevel;
    cxgKaraywan: TcxGrid;
    zqrKaryawan: TZReadOnlyQuery;
    dsKaryawan: TDataSource;
    cxgrdbclmnCustomernik: TcxGridDBColumn;
    cxgrdbclmnCustomernama: TcxGridDBColumn;
    cxgrdbclmnCustomerjabatan: TcxGridDBColumn;
    cxgrdbclmnCustomerdivisi: TcxGridDBColumn;
    cxgrdbclmnCustomerfoto: TcxGridDBColumn;
    cxgrdbclmnCustomerdepartemen: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstKaryawan: TfrmLstKaryawan;

implementation

uses unFrmUtama, unDM, unFrmInputKaryawan, unTools;

{$R *.dfm}

procedure TfrmLstKaryawan.btnEditClick(Sender: TObject);
var
  f: TfrmInputKaryawan;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Edit Karyawan') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputKaryawan.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.Caption := 'Edit Karyawan';
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.EditKey := zqrKaryawan.FieldByName('nik').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstKaryawan.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_hsl_prd where user = ''%s''',[zqrKaryawan.FieldByName('nama').AsString]);
  if not q.Eof then begin
        MsgBox('Data tidak bisa dihapus karena memiliki transaksi.');
        Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      Dm.zConn.ExecuteDirect('delete from tbl_karyawan where nik = ''' + zqrKaryawan.FieldByName('nik').AsString);
      DM.zConn.Commit;
      MsgBox('Data supplier dengan kode ' + zqrKaryawan.FieldByName('kode').AsString + 'sudah berhasil dihapus');
      q.Close;
      q.Open;
      btnRefreshClick(nil);
    except
      on E : Exception do begin
        MsgBox('Error : ' + E.Message);
        DM.zConn.Rollback;
      end;
    end;
  end;

end;

procedure TfrmLstKaryawan.btnRefreshClick(Sender: TObject);
begin
  inherited;
    zqrKaryawan.Close;
    zqrKaryawan.Open;
end;

procedure TfrmLstKaryawan.btnTambahClick(Sender: TObject);
var
  f: TfrmInputKaryawan;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Karyawan') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputKaryawan.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
    f.cxtNik.SetFocus;
  end;
end;

procedure TfrmLstKaryawan.FormCreate(Sender: TObject);
begin
  inherited;
  zqrKaryawan.Open;
end;

end.
