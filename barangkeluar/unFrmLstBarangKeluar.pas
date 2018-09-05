unit unFrmLstBarangKeluar;

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
  cxDBData, cxCheckBox, cxSpinEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, ZAbstractRODataset, ZDataset;

type
  TfrmLstBarangKeluar = class(TfrmTplGrid)
    Label13: TLabel;
    cxgrd1: TcxGrid;
    cxtbBarangKeluar: TcxGridDBTableView;
    cxTblDet: TcxGridDBTableView;
    cxColTblDetid: TcxGridDBColumn;
    cxColTblDetid_ref: TcxGridDBColumn;
    cxColTblDetno_bukti: TcxGridDBColumn;
    cxColTblDetkode_brg: TcxGridDBColumn;
    cxColTblDetdeskripsi: TcxGridDBColumn;
    cxColTblDetqty: TcxGridDBColumn;
    cxColTblDetsatuan: TcxGridDBColumn;
    cxColTblDetharga: TcxGridDBColumn;
    cxColTblDetmata_uang: TcxGridDBColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxtbBarangKeluarDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrBarangKeluar: TZReadOnlyQuery;
    dsBarangKeluar: TDataSource;
    zqrBarangKeluarDet: TZReadOnlyQuery;
    dsBarangKeluarkDet: TDataSource;
    cxColPOHeadno_bukti: TcxGridDBColumn;
    cxColPOHeadid_invoice: TcxGridDBColumn;
    cxColPOHeadketerangan: TcxGridDBColumn;
    cxColPOHeadtanggal: TcxGridDBColumn;
    cxColPOHeaduser: TcxGridDBColumn;
    cxColPODetno_bukti: TcxGridDBColumn;
    cxColPODetkode_brg: TcxGridDBColumn;
    cxColPODetdeskripsi: TcxGridDBColumn;
    cxColPODetqty: TcxGridDBColumn;
    cxColPODetid_gdg: TcxGridDBColumn;
    cxColPODetsatuan: TcxGridDBColumn;
    cxtbBarangKeluarDetColumn1: TcxGridDBColumn;
    Button1: TButton;
    cxtbBarangKeluarColumn1: TcxGridDBColumn;
    cxtbBarangKeluarColumn2: TcxGridDBColumn;
    cxtbBarangKeluarColumn3: TcxGridDBColumn;
    cxtbBarangKeluarColumn4: TcxGridDBColumn;
    btnPosting: TButton;
    cxColPosting: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxtbBarangKeluarFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPostingClick(Sender: TObject);
  private
    { Private declarations }
    mjenis : string;
  public
    { Public declarations }
  end;

var
  frmLstBarangKeluar: TfrmLstBarangKeluar;

implementation

uses unDM, unTools, unFrmInputReturPembelian, unFrmUtama, unFrmInputBarangJasa,
  unFrmInputBarangMasuk, unFrmInputBarangKeluar, unFrmTmpLap01;

{$R *.dfm}

procedure TfrmLstBarangKeluar.btnEditClick(Sender: TObject);
var
 f: TfrmInputBarangKeluar;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
  MsgBox('Mohon maaf, modul ini belum bisa digunakan.');
  Abort;
  if not fu.CekTabOpen('Edit Barang Keluar') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputBarangKeluar.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    ts.Caption := 'Edit Barang Keluar';
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.EditKey := zqrBarangKeluar.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;


procedure TfrmLstBarangKeluar.btnPostingClick(Sender: TObject);
var
  qd, q, qbrg: TZQuery;
  sa: Real;
begin
  inherited;

  q := OpenRS('SELECT f_posting FROM tbl_trskeluar_head WHERE id = %d',
    [zqrBarangKeluar.FieldByName('id').AsInteger]);
  if (not q.IsEmpty) and (q.FieldByName('f_posting').AsInteger = 1) then begin
    MsgBox('Transaksi sudah di terposting.');
    q.Close;
    Abort;
  end;
  q.Close;

  q := OpenRS('SELECT no_bukti FROM tbl_history WHERE no_bukti = ''%s''',
    [zqrBarangKeluar.FieldByName('no_bukti').AsString]);
  if not q.IsEmpty then begin
    MsgBox('Transaksi sudah di terposting.');
    q.Close;
    Abort;
  end;
  q.Close;

  try
    q := OpenRS('SELECT a.id_brg, a.id_gdg, a.qty, b.kode, b.deskripsi ' +
      'FROM tbl_trskeluar_det a ' +
      'LEFT JOIN tbl_barang b ON b.id = a.id_brg ' +
      'WHERE id_ref = %s',[zqrBarangKeluar.FieldByName('id').AsString]);
    while not q.Eof do begin
      sa := GetStokAkhir(q.FieldByName('id_brg').AsInteger, q.FieldByName('id_gdg').AsInteger);
      if sa < q.FieldByName('qty').AsFloat then begin
        MsgBox('Stok Barang : ' + q.FieldByName('kode').AsString + ', ' +
          q.FieldByName('deskripsi').AsString + ' tidak mencukupi ( ' +
          FormatFloat('#,#0.00', sa) +' )');
        MsgBox('Posting dibatalkan.');
        q.Close;
        Abort;
      end;
      q.Next;
    end;
    q.Close;
  except
  end;

  try
    dm.zConn.StartTransaction;

    Screen.Cursor := crSQLWait;
    q := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[zqrBarangKeluar.FieldByName('no_bukti').AsString]);
    qd := OpenRS('SELECT * FROM tbl_trskeluar_det WHERE id_ref = ''%s''',[zqrBarangKeluar.FieldByName('id').AsString]);

    while not qd.Eof do begin
      with q do begin
        Insert;
        FieldByName('no_bukti').AsString := zqrBarangKeluar.FieldByName('no_bukti').AsString;
        FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
        FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        FieldByName('qty').AsFloat := qd.FieldByName('qty').AsFloat;
        FieldByName('tipe').AsString := 'o';
        FieldByName('id_satuan').AsInteger := qd.FieldByName('id_satuan').AsInteger;
        FieldByname('id_gdg').AsInteger := qd.FieldByName('id_gdg').AsInteger;
        FieldByName('keterangan').AsString := qd.FieldByName('keterangan').AsString;
        FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;
        FieldByName('user').AsString := Aplikasi.NamaUser;
        FieldByName('user_dept').AsString := Aplikasi.UserDept;
        Post;
      end;

      qbrg := OpenRS('SELECT * FROM tbl_barang WHERE id = %s',[qd.FieldByName('id_brg').AsString]);
      qbrg.Edit;
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat - qd.FieldByName('qty').AsFloat;
      qbrg.Post;
      qbrg.Close;

      qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
        [qd.FieldByName('id_brg').AsString, qd.FieldByName('id_gdg').AsString]);
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

      dm.zConn.ExecuteDirect(Format('UPDATE tbl_trskeluar_head SET f_posting = 1 WHERE id = %s',
        [zqrBarangKeluar.FieldByName('id').AsString]));

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

procedure TfrmLstBarangKeluar.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrBarangKeluar.Close;
  zqrBarangKeluar.Open;
  zqrBarangKeluarDet.Close;
  zqrBarangKeluarDet.Open;
end;

procedure TfrmLstBarangKeluar.btnTambahClick(Sender: TObject);
var
  f: TfrmInputBarangKeluar;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Barang Keluar') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputBarangKeluar.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangKeluar.Button1Click(Sender: TObject);
var
  f: TfrmTmpLap01;
begin
  inherited;

  if zqrBarangKeluar.FieldByName('f_posting').AsInteger = 0 then begin
    MsgBox('Transaksi belum bisa di cetak karena belum di posting.');
    Abort;
  end;

  f := TfrmTmpLap01.Create(Self);
  with f do begin
    zqrSJ01.Close;
    zqrSJ01.ParamByName('id').AsInteger := zqrBarangKeluar.FieldByName('id').AsInteger;
    zqrSJ01.Open;
    if zqrBarangKeluar.FieldByName('f_ppn').AsInteger = 1 then
      rptSJ01.ShowReport(True)
    else
      rptSJ01NonPPN.ShowReport(True);

    if zqrBarangKeluar.FieldByName('f_ppn').AsInteger = 1 then
      rptFakturPenjualan.ShowReport(True)
    else
      rptFakturPenjualanNonPPN.ShowReport(True);
  end;
end;

procedure TfrmLstBarangKeluar.cxtbBarangKeluarFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrBarangkeluarDet.Close;
    zqrBarangKeluarDet.ParamByName('id_ref').AsInteger := zqrBarangKeluar.FieldByName('id').AsInteger;
    zqrBarangKeluarDet.Open;
  except
  end;
end;

procedure TfrmLstBarangKeluar.FormCreate(Sender: TObject);
begin
  inherited;
  Self.NamaMenu := 'mnWhl_BarangKeluar';
  Self.TerapkanWewenang(Self.NamaMenu);
  zqrBarangKeluar.Open;
end;

end.
