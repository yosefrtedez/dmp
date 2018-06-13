unit unFrmLstPP;

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
  cxGrid, ExtCtrls, StdCtrls, cxPC, ZAbstractRODataset, ZDataset, cxTextEdit,
  cxSpinEdit;

type
  TfrmLstPP = class(TfrmTplGrid)
    Label1: TLabel;
    zqrPPHead: TZReadOnlyQuery;
    dsPPHead: TDataSource;
    zqrPPDet: TZReadOnlyQuery;
    dsPPDet: TDataSource;
    cxgtblPP: TcxGridDBTableView;
    cxgrdlvl1TblPP: TcxGridLevel;
    cxgrd1PP: TcxGrid;
    cxgtblPP1: TcxGridDBTableView;
    cxColPPno_bukti: TcxGridDBColumn;
    cxColPPtanggal: TcxGridDBColumn;
    cxColPPtgl_diperlukan: TcxGridDBColumn;
    cxColPPdiajukan_oleh: TcxGridDBColumn;
    cxColPPdiajukan_dept: TcxGridDBColumn;
    cxColPPlevel_kebutuhan: TcxGridDBColumn;
    cxColPP1no_bukti: TcxGridDBColumn;
    cxColPP1kode_brg: TcxGridDBColumn;
    cxColPP1deskripsi: TcxGridDBColumn;
    cxColPP1qty: TcxGridDBColumn;
    cxColPP1satuan: TcxGridDBColumn;
    cxColPP1harga: TcxGridDBColumn;
    cxColPP1keterangan: TcxGridDBColumn;
    cxColPP1mata_uang: TcxGridDBColumn;
    cxgrdlvl1cxgrd1PPLevel1: TcxGridLevel;
    cxTblcxgtblcxgrd1PPDBTableView1: TcxGridDBTableView;
    cxColcxgtblcxgrd1PPDBTableView1no_bukti: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1kode_brg: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1deskripsi: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1qty: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1satuan: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1harga: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1keterangan: TcxGridDBColumn;
    cxColcxgtblcxgrd1PPDBTableView1mata_uang: TcxGridDBColumn;
    cxColPPLevel1_f_app: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPP: TfrmLstPP;

implementation

uses
  unTools, unFrmInputPP, unDM, unFrmUtama;

{$R *.dfm}

procedure TfrmLstPP.btnEditClick(Sender: TObject);
var
 f: TfrmInputPP;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
  if not fu.CekTabOpen('Edit PP') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    if zqrPPHead.FieldByName('f_app').AsString = '1' then begin
      MsgBox('Maaf data tidak bisa diedit, karena sudah di approve');
      Abort;
    end;
    f := TfrmInputPP.Create(Self);
    ts.Caption := 'Edit PP';
    f.Jenis := 'E';
    f.EditKey := zqrPPHead.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPP.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;

  q := OpenRS('SELECT * FROM tbl_po_head where no_fobj = ''%s''',[zqrPPhead.FieldByName('no_bukti').AsString]);
  if not q.Eof then begin
    MsgBox('Data tidak bisa dihapus karena memiliki transaksi.');
    Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      Dm.zConn.ExecuteDirect('delete from tbl_pp_head where id = ''' + zqrPPHead.FieldByName('id').AsString +'''');
      Dm.zConn.ExecuteDirect('delete from tbl_pp_det where id_ref = ''' + zqrPPHead.FieldByName('id').AsString +'''');
      DM.zConn.Commit;
      MsgBox('Data Permintaan Pembelian dengan kode ' + zqrPPHead.FieldByName('no_bukti').AsString + 'sudah berhasil dihapus');
      q.Close;
      q.Open;
      btnRefreshClick(nil);
    finally

    end;
  end;

end;

procedure TfrmLstPP.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrPPDet.Close;
  zqrPPDet.Open;
  zqrPPHead.Close;
  zqrPPHead.Open;
end;

procedure TfrmLstPP.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPP;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Permintaan Pembelian') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputPP.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := 'Input Permintaan Pembelian';
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstPP.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPPDet.Close;
  zqrPPHead.Close;
  zqrPPDet.Open;
  zqrPPHead.Open;
end;

end.
