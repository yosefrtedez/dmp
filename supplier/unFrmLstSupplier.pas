unit unFrmLstSupplier;

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
  TfrmLstSupplier = class(TfrmTplGrid)
    cxtbSupplier: TcxGridDBTableView;
    cxgSupplierLevel1: TcxGridLevel;
    cxgSupplier: TcxGrid;
    zqrSupplier: TZReadOnlyQuery;
    dsSupllier: TDataSource;
    cxtbSupplierkode: TcxGridDBColumn;
    cxtbSuppliernama: TcxGridDBColumn;
    cxtbSupplierkontak: TcxGridDBColumn;
    cxtbSuppliertitle: TcxGridDBColumn;
    cxtbSupplieralamat: TcxGridDBColumn;
    cxtbSupplieralamat2: TcxGridDBColumn;
    cxtbSupplierkota: TcxGridDBColumn;
    cxtbSupplierkodepos: TcxGridDBColumn;
    cxgrdbclmnSupplierprovinsi: TcxGridDBColumn;
    cxgrdbclmnSuppliernegara: TcxGridDBColumn;
    cxgrdbclmnSuppliertelpon: TcxGridDBColumn;
    cxgrdbclmnSupplierfax: TcxGridDBColumn;
    cxgrdbclmnSupplierhp: TcxGridDBColumn;
    cxgrdbclmnSupplierdirect: TcxGridDBColumn;
    cxgrdbclmnSupplierpembayaran: TcxGridDBColumn;
    cxgrdbclmnSupplieremail: TcxGridDBColumn;
    cxgrdbclmnSupplierf_aktif: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshGrid;
  end;

var
  frmLstSupplier: TfrmLstSupplier;

implementation

uses unFrmUtama, unDM, unFrmInputSupplier, unTools;

{$R *.dfm}

procedure TfrmLstSupplier.btnEditClick(Sender: TObject);
var
  f: TfrmInputSupplier;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Edit Supplier') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputSupplier.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Caption := 'Edit User';
    f.Jenis := 'E';
    f.EditKey := zqrSupplier.FieldByName('kode').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstSupplier.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;

  q := OpenRS('SELECT * FROM tbl_po_head where kode_supp = ''%s''',[zqrSupplier.FieldByName('kode').AsString]);
  if not q.IsEmpty then begin
    MsgBox('Data supplier tidak bisa dihapus karena memiliki transaksi.');
    q.Close;
  end
  else begin
    try
      DM.zConn.StartTransaction;
      Dm.zConn.ExecuteDirect('delete from tbl_supplier where kode = ''' + zqrSupplier.FieldByName('kode').AsString + '''');
      DM.zConn.Commit;
      MsgBox('Data supplier dengan kode : ' + zqrSupplier.FieldByName('kode').AsString + ' sudah berhasil dihapus');
      q.Close;
      q.Open;
      btnRefreshClick(nil);
    except
      on E: Exception do begin
        MsgBox('Error: ' + E.Message);
        dm.zConn.Rollback;
      end;
    end;
  end;

end;

procedure TfrmLstSupplier.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrSupplier.Close;
  zqrSupplier.Open;
end;

procedure TfrmLstSupplier.btnTambahClick(Sender: TObject);
var
  f: TfrmInputSupplier;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Supplier') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputSupplier.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
    f.cxtKode.SetFocus;
  end;
end;

procedure TfrmLstSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  zqrSupplier.Open;
end;

procedure TfrmLstSupplier.RefreshGrid;
begin
  Self.btnRefreshClick(nil);
end;


end.
