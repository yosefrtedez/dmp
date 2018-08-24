unit unFrmLstTransferBarang;

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
  cxGridTableView, cxGridDBTableView, cxGrid, ZAbstractRODataset, ZDataset,cxPC,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxCheckBox, cxSpinEdit;

type
  TfrmLstTransferBarang = class(TfrmTplGrid)
    Label1: TLabel;
    cxTblTransBarang: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    zqrTransBarang: TZReadOnlyQuery;
    dsTransBarang: TDataSource;
    cxTblTransBarangno_bukti: TcxGridDBColumn;
    cxTblTransBarangtanggal: TcxGridDBColumn;
    cxTblTransBarangketerangan: TcxGridDBColumn;
    Panel3: TPanel;
    cxLabel3: TcxLabel;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    zqrTransBarangDet: TZReadOnlyQuery;
    dsTransBarangDet: TDataSource;
    cxTblTransBarangDet: TcxGridDBTableView;
    cxTblTransBarangDetkode: TcxGridDBColumn;
    cxTblTransBarangDetdeskripsi: TcxGridDBColumn;
    cxTblTransBarangDetasal: TcxGridDBColumn;
    cxTblTransBarangDettujuan: TcxGridDBColumn;
    cxTblTransBarangDetsatuan: TcxGridDBColumn;
    cxTblTransBarangDetqty: TcxGridDBColumn;
    btnPosting: TButton;
    cxTblTransBarangColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure cxTblTransBarangFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnPostingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstTransferBarang: TfrmLstTransferBarang;

implementation

uses
  unDM, unTools, unAplikasi, unFrmInputTransferBarang, unFrmUtama;

{$R *.dfm}

procedure TfrmLstTransferBarang.btnEditClick(Sender: TObject);
var
  f: TfrmInputTransferBarang;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Edit Transfer Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputTransferBarang.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.EditKey := zqrTransBarang.FieldByName('id').AsString;
    f.Parent := ts;
    f.Caption := 'Edit Transfer Barang';
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstTransferBarang.btnHapusClick(Sender: TObject);
begin
  inherited;
  try
    dm.zConn.StartTransaction;
    dm.zConn.ExecuteDirect('DELETE from tbl_trsmutasi_head WHERE no_bukti = ''' + zqrTransBarang.FieldByName('no_bukti').AsString + '''');
    dm.zConn.ExecuteDirect('DELETE from tbl_trsmutasi_det WHERE no_bukti = ''' + zqrTransBarang.FieldByName('no_bukti').AsString + '''');
    dm.zConn.ExecuteDirect('DELETE from tbl_history WHERE no_bukti = ''' + zqrTransBarang.FieldByName('no_bukti').AsString + '''');
    dm.zConn.Commit;
    MsgBox('No.Transfer: ' + zqrTransBarang.FieldByName('no_bukti').AsString + ' sudah berhasil di Hapus.');
    zqrTransBarang.Close;
    zqrTransBarang.Open;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
  end;
end;

procedure TfrmLstTransferBarang.btnPostingClick(Sender: TObject);
var
  qd, q, qbrg: TZQuery;
begin
  inherited;

  q := OpenRS('SELECT f_posting FROM tbl_trsmutasi_head WHERE id = %d',
    [zqrTransBarang.FieldByName('id').AsInteger]);
  if (not q.IsEmpty) and (q.FieldByName('f_posting').AsInteger = 1) then begin
    MsgBox('Transaksi sudah di terposting.');
    q.Close;
    Abort;
  end;
  q.Close;

  try
    dm.zConn.StartTransaction;

    Screen.Cursor := crSQLWait;
    q := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[zqrTransBarang.FieldByName('no_bukti').AsString]);
    qd := OpenRS('SELECT * FROM tbl_trsmutasi_det WHERE id_ref = ''%s''',[zqrTransBarang.FieldByName('id').AsString]);

    while not qd.Eof do begin
      with q do begin
        Insert;
        FieldByName('no_bukti').AsString      := zqrTransBarang.FieldByName('no_bukti').AsString;
        FieldByName('tanggal').AsDateTime     := zqrTransBarang.FieldByName('tanggal').AsDateTime;
        FieldByName('kode_brg').AsString      := qd.FieldByName('kode_brg').AsString;
        FieldByName('id_brg').AsInteger       := qd.FieldByName('id_brg').AsInteger;
        FieldByName('tipe').AsString          := 'o';
        FieldByName('qty').AsFloat            := qd.FieldByName('qty').AsInteger;
        FieldByName('id_gdg').AsInteger       := qd.FieldByName('id_gdg_asal').AsInteger;
        FieldByName('id_satuan').AsInteger    := qd.FieldByName('id_satuan').AsInteger;
        FieldByName('user').AsString          := aplikasi.NamaUser;
        FieldByName('tgl_input').AsDateTime   := aplikasi.NowServer;
        Post;

        Insert;
        FieldByName('no_bukti').AsString      := zqrTransBarang.FieldByName('no_bukti').AsString;
        FieldByName('tanggal').AsDateTime    := zqrTransBarang.FieldByName('tanggal').AsDateTime;
        FieldByName('kode_brg').AsString      := qd.FieldByName('kode_brg').AsString;
        FieldByName('id_brg').AsInteger       := qd.FieldByName('id_brg').AsInteger;
        FieldByName('tipe').AsString          := 'i';
        FieldByName('qty').AsFloat            := qd.FieldByName('qty').AsInteger;
        FieldByName('id_gdg').AsInteger       := qd.FieldByName('id_gdg_tujuan').AsInteger;
        FieldByName('id_satuan').AsInteger    := qd.FieldByName('id_satuan').AsInteger;
        FieldByName('user').AsString          := aplikasi.NamaUser;
        FieldByName('tgl_input').AsDateTime   := aplikasi.NowServer;
        Post;
      end;

      qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
        [qd.FieldByName('id_brg').AsString, qd.FieldByName('id_gdg_asal').AsString]);
      if qbrg.IsEmpty then begin
        qbrg.Insert;
        qbrg.FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        qbrg.FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        qbrg.FieldByName('id_gdg').AsInteger := qd.FieldByName('id_gdg').AsInteger;
      end
      else
        qbrg.Edit;
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat - qd.FieldByName('qty').AsFloat;
      qbrg.Post;
      qbrg.Close;

      qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
        [qd.FieldByName('id_brg').AsString, qd.FieldByName('id_gdg_tujuan').AsString]);
      if qbrg.IsEmpty then begin
        qbrg.Insert;
        qbrg.FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        qbrg.FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        qbrg.FieldByName('id_gdg').AsInteger := qd.FieldByName('id_gdg').AsInteger;
      end
      else
        qbrg.Edit;
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + qd.FieldByName('qty').AsFloat;
      qbrg.Post;
      qbrg.Close;

      dm.zConn.ExecuteDirect(Format('UPDATE tbl_trsmutasi_head SET f_posting = 1 WHERE id = %s',
        [zqrTransBarang.FieldByName('id').AsString]));

      qd.Next;
    end;

    dm.zConn.Commit;

    Screen.Cursor := crDefault;
    MsgBox('Transaksi pengeluaran barang sudah di posting.');

    btnRefreshClick(nil);

  except
    on E: Exception do begin
      dm.zConn.Rollback;
      Screen.Cursor := crDefault;
      MsgBox('Error: ' + E.Message);
    end;
  end;
end;

procedure TfrmLstTransferBarang.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrTransBarang.Close;
  zqrTransBarang.Open;
end;

procedure TfrmLstTransferBarang.btnTambahClick(Sender: TObject);
var
  f: TfrmInputTransferBarang;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Input Transfer Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputTransferBarang.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstTransferBarang.cxTblTransBarangFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrTransBarangDet.Close;
    zqrTransBarangDet.ParamByName('id_ref').AsInteger := zqrTransBarang.FieldByName('id').AsInteger;
    zqrTransBarangDet.Open;
  except
  end;
end;

procedure TfrmLstTransferBarang.FormCreate(Sender: TObject);
begin
  inherited;
  zqrTransBarang.Open;
end;


end.
