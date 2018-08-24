unit unFrmLstBarangMasuk;

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
  TfrmLstBarangMasuk = class(TfrmTplGrid)
    Label13: TLabel;
    cxgrd1: TcxGrid;
    cxTblTrsMasukHead: TcxGridDBTableView;
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
    cxTblTrsMasukDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrBarangMasuk: TZReadOnlyQuery;
    dsBarangMasuk: TDataSource;
    zqrBarangMasukDet: TZReadOnlyQuery;
    dsBarangMasukDet: TDataSource;
    cxColTblTrsMasukDetno_bukti: TcxGridDBColumn;
    cxColTblTrsMasukDetkode_brg: TcxGridDBColumn;
    cxColTblTrsMasukDetdeskripsi: TcxGridDBColumn;
    cxColTblTrsMasukDetsatuan: TcxGridDBColumn;
    cxColTblTrsMasukDetqty: TcxGridDBColumn;
    cxColTblTrsMasukDetketerangan: TcxGridDBColumn;
    cxColTblTrsMasukDetno_so: TcxGridDBColumn;
    cxColTblTrsMasukDetno_spk: TcxGridDBColumn;
    cxColTblTrsMasukDetnO_spmb: TcxGridDBColumn;
    cxColTblTrsMasukHeadno_bukti: TcxGridDBColumn;
    cxColTblTrsMasukHeadtanggal: TcxGridDBColumn;
    cxColTblTrsMasukHeaduser: TcxGridDBColumn;
    cxColTblTrsMasukHeaduser_dept: TcxGridDBColumn;
    cxTblTrsMasukHeadColumn1: TcxGridDBColumn;
    btnPosting: TButton;
    cxTblTrsMasukHeadColumn2: TcxGridDBColumn;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxTblTrsMasukHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnPostingClick(Sender: TObject);
  private
    { Private declarations }
    mjenis : string;
  public
    { Public declarations }
  end;

var
  frmLstBarangMasuk: TfrmLstBarangMasuk;

implementation

uses unDM, unTools, unFrmInputReturPembelian, unFrmUtama, unFrmInputBarangJasa,
  unFrmInputBarangMasuk;

{$R *.dfm}

procedure TfrmLstBarangMasuk.btnEditClick(Sender: TObject);
var
 f: TfrmInputBarangMasuk;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
  if not fu.CekTabOpen('Edit Barang Masuk') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    if zqrBarangMasuk.FieldByName('f_posting').AsString = '1' then begin
      MsgBox('Maaf data barang masuk tidak bisa diedit, karena sudah di posting.');
      Abort;
    end;
    f := TfrmInputBarangMasuk.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    ts.Caption := 'Edit Barang Masuk';
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.EditKey := zqrBarangMasuk.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;


procedure TfrmLstBarangMasuk.btnHapusClick(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;
  {q := OpenRS('select * from tbl_trsreturpemb_head where f_app = ''1'' and no_bukti = ''%s''',[zqrReturPembHead.FieldByName('no_bukti').AsString]);
  if not q.Eof then begin
    MsgBox('Maaf data tidak bisa dihapus, karena sudah di approve atasan');
    Abort;
  end else begin
    try
      DM.zConn.StartTransaction;
      DM.zConn.ExecuteDirect('delete  from tbl_trsreturpemb_head where no_bukti = ''' + zqrReturPembHead.FieldByName('no_bukti').AsString + '''');
      DM.zConn.ExecuteDirect('delete  from tbl_trsreturpemb_det where no_bukti = ''' + zqrReturPembDet.FieldByName('no_bukti').AsString + '''');
      DM.zConn.Commit;
      MsgBox('Data berhasil dihapus');
      btnRefreshClick(nil);
    except
       on e : Exception do begin
         MsgBox('Error: ' + E.Message);
         DM.zConn.Rollback;
         mjenis := '';
       end;
    end;
  end;}
end;


procedure TfrmLstBarangMasuk.btnPostingClick(Sender: TObject);
var
  qd, q, qbrg: TZQuery;
begin
  inherited;

  q := OpenRS('SELECT f_posting FROM tbl_trsmasuk_head WHERE id = %d',
    [zqrBarangMasuk.FieldByName('id').AsInteger]);
  if (not q.IsEmpty) and (q.FieldByName('f_posting').AsInteger = 1) then begin
    MsgBox('Transaksi sudah di terposting.');
    q.Close;
    Abort;
  end;
  q.Close;

  try
    dm.zConn.StartTransaction;

    Screen.Cursor := crSQLWait;
    q := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[zqrBarangMasuk.FieldByName('no_bukti').AsString]);
    qd := OpenRS('SELECT * FROM tbl_trsmasuk_det WHERE id_ref = ''%s''',[zqrBarangMasuk.FieldByName('id').AsString]);

    while not qd.Eof do begin
      with q do begin
        Insert;
        FieldByName('no_bukti').AsString := zqrBarangMasuk.FieldByName('no_bukti').AsString;
        FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
        FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        FieldByName('qty').AsFloat := qd.FieldByName('qty').AsFloat;
        FieldByName('tipe').AsString := 'i';
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
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + qd.FieldByName('qty').AsFloat;
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
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + qd.FieldByName('qty').AsFloat;
      qbrg.Post;
      qbrg.Close;

      dm.zConn.ExecuteDirect(Format('UPDATE tbl_trsmasuk_head SET f_posting = 1 WHERE id = %s',
        [zqrBarangMasuk.FieldByName('id').AsString]));

      qd.Next;
    end;

    dm.zConn.Commit;

    Screen.Cursor := crDefault;
    MsgBox('Transaksi penerimaan barang sudah di posting.');

    btnRefreshClick(nil);
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      Screen.Cursor := crDefault;
      MsgBox('Error: ' + E.Message);
    end;
  end;
end;

procedure TfrmLstBarangMasuk.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrBarangMasuk.Close;
  zqrBarangMasuk.Open;
  zqrBarangMasukDet.Close;
  zqrBarangMasukDet.Open;
end;

procedure TfrmLstBarangMasuk.btnTambahClick(Sender: TObject);
var
  f: TfrmInputBarangMasuk;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Barang Masuk') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputBarangMasuk.Create(Self);
    f.TabSheet := Self.Parent as TcxTabSheet;
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangMasuk.cxTblTrsMasukHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrBarangMasukDet.Close;
    zqrBarangMasukDet.ParamByName('id_ref').AsInteger := zqrBarangMasuk.FieldByName('id').AsInteger;
    zqrBarangMasukDet.Open;
  except
  end;
end;

procedure TfrmLstBarangMasuk.FormCreate(Sender: TObject);
begin
  inherited;
  zqrBarangMasuk.Open;
end;

end.
