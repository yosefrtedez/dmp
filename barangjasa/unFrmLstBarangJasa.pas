unit unFrmLstBarangJasa;

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
  cxGrid, ExtCtrls, StdCtrls, cxPC, ZAbstractRODataset, ZDataset, cxContainer,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxSpinEdit, cxGridExportLink, ShellAPI;

type
  TfrmLstBarangJasa = class(TfrmTplGrid)
    cxtbBarang: TcxGridDBTableView;
    cxgBarangLevel1: TcxGridLevel;
    cxgBarang: TcxGrid;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxtbBarangid: TcxGridDBColumn;
    cxtbBarangkode: TcxGridDBColumn;
    cxtbBarangdeskripsi: TcxGridDBColumn;
    cxtbBarangstok: TcxGridDBColumn;
    cxtbBarangb_stok: TcxGridDBColumn;
    cxtbBarangsatuan: TcxGridDBColumn;
    cxtbBarangtipe: TcxGridDBColumn;
    cxtbBarangkategori: TcxGridDBColumn;
    cxtbBarangsubkategori: TcxGridDBColumn;
    cxtbBarangdivisi: TcxGridDBColumn;
    cxtbBarangpackinfo: TcxGridDBColumn;
    cxtbBarangf_aktif: TcxGridDBColumn;
    cxtbBaranguser_input: TcxGridDBColumn;
    cxtbBarangtgl_input: TcxGridDBColumn;
    cxtbBaranguser_edit: TcxGridDBColumn;
    cxtbBarangtgl_edit: TcxGridDBColumn;
    cxtbBarangberat: TcxGridDBColumn;
    cxtbBarangpacking: TcxGridDBColumn;
    cxtbBarangberat_per_unit: TcxGridDBColumn;
    cxtbBarangs_berat: TcxGridDBColumn;
    cxtbBarangisi_pak: TcxGridDBColumn;
    cxtbBarangimage: TcxGridDBColumn;
    cxtbBarangwarna: TcxGridDBColumn;
    cxtbBarangpanjang: TcxGridDBColumn;
    cxtbBarangs_panjang: TcxGridDBColumn;
    cxtbBaranglebar: TcxGridDBColumn;
    cxtbBarangs_lebar: TcxGridDBColumn;
    cxtbBarangtebal: TcxGridDBColumn;
    cxtbBarangs_tebal: TcxGridDBColumn;
    cxtbBarangdiameter: TcxGridDBColumn;
    cxtbBarangs_diameter: TcxGridDBColumn;
    cxtbBarangberat_per_unit_b: TcxGridDBColumn;
    cxtbBarangs_berat_per_unit_b: TcxGridDBColumn;
    cxtbBarangf_dijual: TcxGridDBColumn;
    cxtbBarangf_dibeli: TcxGridDBColumn;
    cxtbBarangf_joborder: TcxGridDBColumn;
    cxtbBarangflow_process: TcxGridDBColumn;
    cxtbBarangdiameter_dalam: TcxGridDBColumn;
    cxtbBarangs_diameter_dalam: TcxGridDBColumn;
    cxtbBarangdiameter_luar: TcxGridDBColumn;
    cxtbBarangs_diameter_luar: TcxGridDBColumn;
    cxtbBarangpanjang_lurus: TcxGridDBColumn;
    cxtbBarangberat_per_unit_old: TcxGridDBColumn;
    cxtbBarangf_ed: TcxGridDBColumn;
    cxtbBaranged: TcxGridDBColumn;
    cxtbBarangf_tds: TcxGridDBColumn;
    cxtbBarangtds: TcxGridDBColumn;
    cxtbBaranghrg_kel1: TcxGridDBColumn;
    cxtbBaranghrg_kel2: TcxGridDBColumn;
    cxtbBaranglokasi: TcxGridDBColumn;
    cxtbBaranglokasi_grid: TcxGridDBColumn;
    cxtbBarangf_consumable: TcxGridDBColumn;
    cxtbBarangdeskripsi2: TcxGridDBColumn;
    cxtbBarangberat_per_unit_pack: TcxGridDBColumn;
    cxtbBarangf_lotnumber: TcxGridDBColumn;
    cxtbBarangf_sml: TcxGridDBColumn;
    cxtbBarangf_fai: TcxGridDBColumn;
    cxtbBarangqty_per_pallet: TcxGridDBColumn;
    cxtbBarangleadtime: TcxGridDBColumn;
    cxtbBarangf_brg_cust: TcxGridDBColumn;
    cxtbBarangf_bs_dipakai: TcxGridDBColumn;
    Label13: TLabel;
    Panel3: TPanel;
    cxtbBarangDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel1: TcxLabel;
    cxlGudang: TcxLookupComboBox;
    zqrGudang: TZReadOnlyQuery;
    dsGudang: TDataSource;
    zqrBarangDet: TZReadOnlyQuery;
    dsBarangDet: TDataSource;
    btnProses: TButton;
    cxtbBarangDetno_bukti: TcxGridDBColumn;
    cxtbBarangDettanggal: TcxGridDBColumn;
    cxtbBarangDetkode_brg: TcxGridDBColumn;
    cxtbBarangDetid_brg: TcxGridDBColumn;
    cxtbBarangDetqty: TcxGridDBColumn;
    cxtbBarangDettipe: TcxGridDBColumn;
    cxtbBarangDettipe_text: TcxGridDBColumn;
    cxtbBarangDetid_satuan: TcxGridDBColumn;
    cxtbBarangDetdeskripsi: TcxGridDBColumn;
    cxtbBarangDetsatuan: TcxGridDBColumn;
    cxtbBarangDetid_gdg: TcxGridDBColumn;
    cxtbBarangDetkode: TcxGridDBColumn;
    cxtbBarangDetuser: TcxGridDBColumn;
    cxtbBarangDetuser_dept: TcxGridDBColumn;
    Panel4: TPanel;
    cxtbStokGudang: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxLabel2: TcxLabel;
    zqrDetGudang: TZReadOnlyQuery;
    dsDetGudang: TDataSource;
    cxtbStokGudangstok: TcxGridDBColumn;
    cxtbStokGudangnama: TcxGridDBColumn;
    cxtbStokGudangColumn1: TcxGridDBColumn;
    btnKartuStok: TButton;
    cxChkSatKonv: TcxCheckBox;
    cxColStokKonv: TcxGridDBColumn;
    cxColSatKonv: TcxGridDBColumn;
    cxColSisa: TcxGridDBColumn;
    cxColSatSisa: TcxGridDBColumn;
    Button1: TButton;
    cxtbStokGudangColumn2: TcxGridDBColumn;
    procedure btnKartuStokClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxtbBarangFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnProsesClick(Sender: TObject);
    procedure cxChkSatKonvClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshGrid;
  end;

var
  frmLstBarangJasa: TfrmLstBarangJasa;

implementation

uses unFrmUtama, unFrmInputBarangJasa, unDM, unTools, unFrmKartuStok;

{$R *.dfm}

procedure TfrmLstBarangJasa.btnEditClick(Sender: TObject);
var
  f: TfrmInputBarangJasa;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Edit Barang Jasa') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputBarangJasa.Create(Self);
    f.Caption := 'Edit Barang Jasa';
    f.FormInduk := Self;
    f.Jenis := 'E';
    f.EditKey := zqrBarang.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangJasa.btnHapusClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  try
    dm.zConn.StartTransaction;
    i := unTools.QBox(Self, 'Hapus data barang ini ?', 'Hapus');
    if i = IDYES then begin
      dm.zConn.ExecuteDirect(Format('UPDATE tbl_barang SET f_aktif = 0 WHERE id = %s',[zqrBarang.FieldByName('id').AsString]));
    end;
    dm.zConn.Commit;
    zqrBarang.Close;
    zqrBarang.Open;
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      MsgBox('Error: ' + E.Message);
    end;
  end;
end;

procedure TfrmLstBarangJasa.btnProsesClick(Sender: TObject);
begin
  inherited;
  if cxlGudang.Text = '' then Abort;

  with zqrBarangDet do begin
    Close;
    ParamByname('id_brg').AsInteger := zqrBarang.FieldByName('id').AsInteger;
    ParamByName('id_gdg').AsInteger := cxlGudang.EditValue;
    Open;
  end;
end;

procedure TfrmLstBarangJasa.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrBarang.Close;
  zqrBarang.Open;
end;

procedure TfrmLstBarangJasa.btnTambahClick(Sender: TObject);
var
  f: TfrmInputBarangJasa;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Barang dan Jasa') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputBarangJasa.Create(Self);
    f.FormInduk := Self;
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangJasa.Button1Click(Sender: TObject);
begin
  inherited;
  try
  ExportGridToExcel(aplikasi.AppPath + '\tmp.xls', cxgBarang);
  ShellExecute(Handle,'open', PChar(aplikasi.AppPath + '\tmp.xls'),''
    ,nil,SW_SHOWNORMAL);
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
    end;
  end;
end;

procedure TfrmLstBarangJasa.btnKartuStokClick(Sender: TObject);
var
  f: TfrmKartuStok;
begin
  f := TfrmKartuStok.Create(Self);
  f.IdBrg := zqrBarang.FieldByName('id').AsInteger;
  f.ShowModal;

end;

procedure TfrmLstBarangJasa.cxChkSatKonvClick(Sender: TObject);
begin
  inherited;
  if cxChkSatKonv.Checked then begin
    zqrBarang.Close;
    zqrBarang.SQL.Text := 'SELECT a.*, b.satuan satuan2, c.kategori kategori2, d.subkategori subkategori2, e.tipe tipe2, ' +
      'if(f.qty < 1,(a.stok div (1 / f.qty)),f.qty * a.stok) stok2, g.satuan satuan3, ' +
      'if(f.qty < 1, (a.stok mod (1 / f.qty)),0) sisa, b.satuan satuan4 ' +
      'FROM tbl_barang a ' +
      'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
      'LEFT JOIN tbl_kategori_brg c ON a.id_kategori = c.id ' +
      'LEFT JOIN tbl_subkategori_brg d ON a.id_subkategori = d.id ' +
      'LEFT JOIN tbl_tipe_brg e ON a.id_tipe = e.id ' +
      'LEFT JOIN tbl_konv_brg f ON f.id_barang = a.id ' +
      'LEFT JOIN tbl_satuan g on g.id = f.id_satuan ' +
      'ORDER BY a.deskripsi ';
    cxColStokKonv.Visible := True;
    cxColSatKonv.Visible := True;
    cxColSisa.Visible := True;
    cxColSatSisa.Visible := True;
    zqrBarang.Open;
  end
  else begin
    zqrBarang.Close;
    zqrBarang.SQL.Text := 'SELECT a.*, b.satuan satuan2, c.kategori kategori2, d.subkategori subkategori2, e.tipe tipe2, 0 stok2, '''' satuan3, ' +
      '0 as sisa, '''' as satuan4 ' +
      'FROM tbl_barang a ' +
      'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
      'LEFT JOIN tbl_kategori_brg c ON a.id_kategori = c.id  ' +
      'LEFT JOIN tbl_subkategori_brg d ON a.id_subkategori = d.id ' +
      'LEFT JOIN tbl_tipe_brg e ON a.id_tipe = e.id ' +
      'ORDER BY a.deskripsi';
    cxColStokKonv.Visible := False;
    cxColSatKonv.Visible := False;
    cxColSisa.Visible := False;
    cxColSatSisa.Visible := False;
    zqrBarang.Open;
  end;
end;

procedure TfrmLstBarangJasa.cxtbBarangFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  with zqrBarangDet do begin
    Close;
    ParamByName('id_brg').AsInteger := zqrBarang.FieldByName('id').AsInteger;
  end;
  with zqrDetGudang do begin
    Close;
    ParamByName('id_brg').AsInteger := zqrBarang.FieldByName('id').AsInteger;
    Open;
  end;
end;

procedure TfrmLstBarangJasa.FormCreate(Sender: TObject);
begin
  inherited;
  Self.NamaMenu := 'mnMst_BarangJasa';
  TerapkanWewenang(Self.NamaMenu);
  zqrBarang.Open;
  zqrGudang.Open;
  cxColStokKonv.Visible := False;
  cxColSatKonv.Visible := False;
  cxColSisa.Visible := False;
  cxColSatSisa.Visible := False;
end;

procedure TfrmLstBarangJasa.RefreshGrid;
begin
  btnRefreshClick(nil);
end;

end.
