unit unFrmLstSuratJalan;

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
  TfrmLstSuratJalan = class(TfrmTplGrid)
    Label13: TLabel;
    cxgrd1: TcxGrid;
    cxtbSJ: TcxGridDBTableView;
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
    cxtbSJDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrSJ: TZReadOnlyQuery;
    dsSJ: TDataSource;
    zqrSJDet: TZReadOnlyQuery;
    dsSJDet: TDataSource;
    cxColTblTrsMasukDetno_bukti: TcxGridDBColumn;
    cxColTblTrsMasukDetkode_brg: TcxGridDBColumn;
    cxColTblTrsMasukDetdeskripsi: TcxGridDBColumn;
    cxColTblTrsMasukDetsatuan: TcxGridDBColumn;
    cxColTblTrsMasukDetqty: TcxGridDBColumn;
    cxColTblTrsMasukDetketerangan: TcxGridDBColumn;
    cxColTblTrsMasukHeadno_bukti: TcxGridDBColumn;
    cxColTblTrsMasukHeadtanggal: TcxGridDBColumn;
    cxColTblTrsMasukHeaduser: TcxGridDBColumn;
    cxColTblTrsMasukHeaduser_dept: TcxGridDBColumn;
    btnPosting: TButton;
    cxtbSJColumn2: TcxGridDBColumn;
    cxtbSJColumn1: TcxGridDBColumn;
    Button1: TButton;
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxtbSJFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnPostingClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    mjenis : string;
  public
    { Public declarations }
  end;

var
  frmLstSuratJalan: TfrmLstSuratJalan;

implementation

uses unDM, unTools, unFrmUtama, unFrmInputKoreksi, unFrmInputSuratJalan,
  unFrmLapSJ;

{$R *.dfm}

procedure TfrmLstSuratJalan.btnEditClick(Sender: TObject);
var
 f: TfrmInputSuratJalan;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;

  if not fu.CekTabOpen('Edit Surat Jalan') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    if zqrSJ.FieldByName('f_posting').AsString = '1' then begin
      MsgBox('Mohon Maaf, surat jalan tidak bisa diedit, karena sudah di posting.');
      Abort;
    end;
    f := TfrmInputSuratJalan.Create(Self);
    ts.Caption := 'Edit Surat Jalan';
    f.Jenis := 'E';
    f.EditKey := zqrSJ.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;

end;


procedure TfrmLstSuratJalan.btnHapusClick(Sender: TObject);
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


procedure TfrmLstSuratJalan.btnPostingClick(Sender: TObject);
var
  qd, q, qbrg: TZQuery;
begin
  inherited;
  try
    dm.zConn.StartTransaction;

    Screen.Cursor := crSQLWait;
    q := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[zqrSJ.FieldByName('no_bukti').AsString]);
    qd := OpenRS('SELECT * FROM tbl_sj_det WHERE id_ref = %s',[zqrSJ.FieldByName('id').AsString]);

    while not qd.Eof do begin
      with q do begin
        Insert;
        FieldByName('no_bukti').AsString := zqrSJ.FieldByName('no_bukti').AsString;
        FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
        FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        FieldByName('qty').AsFloat := qd.FieldByName('qty').AsFloat;
        FieldByName('tipe').AsString := 'o';
        FieldByName('id_satuan').AsInteger := qd.FieldByName('id_satuan').AsInteger;
        FieldByname('id_gdg').AsInteger := qd.FieldByName('id_gdg').AsInteger;
        FieldByName('keterangan').AsString := qd.FieldByName('keterangan').AsString;
        FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;
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

      dm.zConn.ExecuteDirect(Format('UPDATE tbl_sj_head SET f_posting = 1 WHERE id = %s',
        [zqrSJ.FieldByName('id').AsString]));

      qd.Next;
    end;

    dm.zConn.Commit;

    Screen.Cursor := crDefault;
    MsgBox('Transaksi surat jalan sudah di posting.');

    btnRefreshClick(nil);

  except
    on E: Exception do begin
      dm.zConn.Rollback;
      Screen.Cursor := crDefault;
      MsgBox('Error: ' + E.Message);
    end;
  end;
end;

procedure TfrmLstSuratJalan.btnRefreshClick(Sender: TObject);
begin
  inherited;

  zqrSJ.Close;
  zqrSJ.Open;

end;

procedure TfrmLstSuratJalan.btnTambahClick(Sender: TObject);
var
  f: TfrmInputSuratJalan;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Input Surat Jalan') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputSuratJalan.Create(Self);
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstSuratJalan.Button1Click(Sender: TObject);
var
  f: TFrmLapSJ;
begin
  inherited;

  if zqrSJ.FieldByName('f_posting').AsInteger = 0 then begin
    MsgBox('Surat Jalan belum bisa di cetak karena belum di posting.');
    Abort;
  end;

  f := TfrmLapSJ.Create(Self);
  with f do begin
    zqrSJ01.Close;
    zqrSJ01.ParamByName('id').AsInteger := zqrSJ.FieldByName('id').AsInteger;
    zqrSJ01.Open;
    if zqrSJ.FieldByName('f_ppn').AsInteger = 1 then
      rptSJ01.ShowReport(True)
    else
      rptSJ01NonPPN.ShowReport(True);

    if zqrSJ.FieldByName('f_ppn').AsInteger = 1 then
      rptFakturPenjualan.ShowReport(True)
    else
      rptFakturPenjualanNonPPN.ShowReport(True);
  end;
end;

procedure TfrmLstSuratJalan.cxtbSJFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrSJDet.Close;
    zqrSJDet.ParamByName('id_ref').AsInteger := zqrSJ.FieldByName('id').AsInteger;
    zqrSJDet.Open;
  except
  end;
end;

procedure TfrmLstSuratJalan.FormCreate(Sender: TObject);
begin
  inherited;
  zqrSJ.Open;
end;

end.
