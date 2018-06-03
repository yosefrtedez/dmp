unit unFrmCari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmCari = class(TForm)
    cxTblView: TcxGridDBTableView;
    cxGrdLevel1: TcxGridLevel;
    cxGrd: TcxGrid;
    dsQ: TDataSource;
    btnOk: TButton;
    btnBatal: TButton;
    zq: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTblViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnBatalClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    mJenis: string;
    mReturnValue: string;
    mResult: TStringList;
    mFilterText: string;
    mKodeBrg: string;
    mGroup: string;
    mFormula: string;
  public
    property Jenis : string read mJenis write mJenis;
    property ReturnValue : string read mReturnValue;
    property Result: TStringList read mResult;
    property FilterText: String write mFilterText;
    property KodeBrg: string write mKodeBrg;
    property Group: string write mGroup;
    property Formula: string write mFormula;
  end;

var
  frmCari2: TfrmCari;

implementation

uses unAplikasi, unDm, unTools;

{$R *.dfm}

procedure TfrmCari.cxTblViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i: Integer;
begin
  //mReturnValue := ACellViewInfo.GridRecord.DisplayTexts[0];
  //ModalResult := mrOk;
  for i := 0 to zq.FieldCount - 1 do begin
    mResult.AddObject(zq.Fields[i].Name, zQ.Fields[i]);
  end;
  ModalResult := mrOk;
end;

procedure TfrmCari.FormCreate(Sender: TObject);
begin
  zQ.Connection := dm.zConn;
  mResult := TStringList.Create;
end;

procedure TfrmCari.FormShow(Sender: TObject);
var
  sql, caption: string;
  i: Integer;
  cl: TcxGridDBColumn;
  ColCaption, ColWidth: TStringList;
  AItemList: TcxFilterCriteriaItemList;
  lstFilter: TStringList;
begin
  ColCaption := TStringList.Create;
  ColWidth := TStringList.Create;

  Screen.Cursor := crSQLWait;

  if mJenis = 'mutasi' then begin
    sql := 'SELECT a.no_bukti, no_so, tanggal, user, user_dept ' +
      'FROM tbl_trsmutasi_head a, tbl_trsmutasi_det b ' +
      'WHERE a.no_bukti = b.no_bukti AND f_batal = 0 ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. Trans","No. SO",Tanggal,User,Dept';
    ColWidth.CommaText := '100,100,100,100,100';
    caption := 'Cari Transaksi Mutasi';
  end
  else if mJenis = 'sales-order' then begin
    sql := 'SELECT no_bukti, tanggal, nama ' +
      'FROM v_so_head ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. SO",Tanggal,"Nama Customer"';
    ColWidth.CommaText := '100,100,250';
    caption := 'Cari Sales Order';
  end
  else if mJenis = 'sales-order-mdb' then begin

    //sql := 'SELECT a.no_bukti, b.no_bukti, b.tanggal, a.qty_g02 FROM ' +
    sql := 'SELECT a.no_bukti, b.no_bukti, b.tanggal, b.qty FROM ' +
      'v_stok_so a, tbl_history b ' +
      'WHERE a.no_bukti = b.no_so AND b.tipe = ''IN_'' AND b.gudang = ''G02'' ' +
      'AND a.kode_brg = b.kode_brg ' + 
      'AND a.qty_g02 > 0 ' +
      'AND a.kode_brg = ' + mKodeBrg;

    {
    sql := 'SELECT DISTINCT no_so, no_bukti, qty, tanggal FROM tbl_history ' +
      'WHERE LEFT(no_so,2) <> ''SO'' and gudang = ''G02'' ' +
      'AND (left(no_bukti,2) = ''MG'' OR left(no_bukti,2) = ''IN'') AND tipe = ''IN_'' ' +
      'AND kode_brg = ' + mKodeBrg + ' ' +
      'ORDER BY no_so';
    }

    ColCaption.CommaText := '"No. SO","No. Transaksi",Tanggal,"Qty. SO"';
    ColWidth.CommaText := '100,100,100,100';
    caption := 'Cari Sales Order MDB';
  end
  else if mJenis = 'adjust_koreksi' then begin
    sql := 'SELECT no_bukti, tanggal FROM tbl_trskoreksi_head ' +
      'WHERE f_approval = 1 AND f_adjust = 0 ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. Trans",Tanggal';
    ColWidth.CommaText := '100,200';
    caption := 'Cari No. Koreksi';
  end
  else if mJenis = 'barang' then begin
    sql := 'SELECT kode, deskripsi, G01, G02, G03, G_ASIS, G_CONS, G01+G02+G03+G_ASIS+G_CONS total_stok, kategori, subkategori ' +
      'FROM v_brg_per_gdg_2 ORDER BY kode';
    ColCaption.CommaText := 'Kode,Deskripsi,G01,G02,G03,"G-ASIS","G-CONS","Total Stok",Kategori,SubKategori';
    ColWidth.CommaText := '100,200,100,100,100,100,100,100,200,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end
  else if mJenis = 'barang-po-ktg' then begin
    sql := 'SELECT kode, deskripsi, G01, G02, G03, G_ASIS, G_CONS, G01+G02+G03+G_ASIS+G_CONS total_stok, kategori, subkategori ' +
      'FROM v_brg_per_gdg_2 WHERE kode IN (''C'',''D'',''E'') ORDER BY kode';
    ColCaption.CommaText := 'Kode,Deskripsi,G01,G02,G03,"G-ASIS","G-CONS","Total Stok",Kategori,SubKategori';
    ColWidth.CommaText := '100,200,100,100,100,100,100,100,200,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end
  else if mJenis = 'barang-percobaan' then begin
    sql := 'SELECT kode, deskripsi, G01, G02, G01+G02 total_stok, kategori, subkategori ' +
      'FROM v_brg_per_gdg_2 WHERE deskripsi like ''%PERCOBAAN%'' ORDER BY kode';
    ColCaption.CommaText := 'Kode,Deskripsi,G01,G02,"Total Stok",Kategori,SubKategori';
    ColWidth.CommaText := '100,200,100,100,100,200,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end
  else if mJenis = 'barang-bahan-baku' then begin
    sql := 'SELECT kode, deskripsi, G01, G02, G01+G02 total_stok, kategori, subkategori ' +
      'FROM v_brg_per_gdg_2 WHERE tipe LIKE ''BB%'' ORDER BY deskripsi';
    ColCaption.CommaText := 'Kode,Deskripsi,G01,G02,"Total Stok",Kategori,SubKategori';
    ColWidth.CommaText := '100,200,100,100,100,200,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end
  else if mJenis = 'retur' then begin
    sql := 'select p.kode_brg,b.deskripsi,p.no_bukti,p.no_so,p.qty from tbl_trsreturpenj_det p ' +
            'left join tbl_barang b on p.kode_brg=b.kode';
    ColCaption.CommaText := 'Kode,Deskripsi,"No. Retur","No. SO","Qty Retur"';
    ColWidth.CommaText := '100,200,100,100,75';
    Width := Width + 120;
    caption := 'Cari Barang Retur';
  end
  else if mJenis = 'barang-peletan' then begin
    sql := 'SELECT kode, deskripsi, G01, G02, G01+G02 total_stok, kategori, subkategori ' +
      'FROM v_brg_per_gdg WHERE kategori = ''PELETAN'' ORDER BY kode';
    ColCaption.CommaText := 'Kode,Deskripsi,G01,G02"Total Stok",Kategori,SubKategori';
    ColWidth.CommaText := '100,200,100,100,100,200,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end
  else if mJenis = 'barang-jasa-pelet' then begin
    sql := 'SELECT kode, deskripsi, G01, G02, G_ASIS, G01+G02+G_ASIS total_stok, kategori, subkategori ' +
      'FROM v_brg_per_gdg WHERE kategori = ''OKS JASA PELET'' ORDER BY kode';
    ColCaption.CommaText := 'Kode,Deskripsi,G01,G02,"G-ASIS","Total Stok",Kategori,SubKategori';
    ColWidth.CommaText := '100,200,100,100,100,100,200,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end
  else if mJenis = 'customer' then begin
    sql := 'SELECT kode, nama, alamat FROM tbl_customer ORDER BY nama';
    ColCaption.CommaText := 'Kode,"Nama Customer",Alamat';
    ColWidth.CommaText := '100,300,300';
    Width := Width + 400;
    caption := 'Cari Customer';
  end
  else if mJenis = 'supplier' then begin
    sql := 'SELECT kode, nama, alamat FROM tbl_supplier ORDER BY nama';
    ColCaption.CommaText := 'Kode,"Nama Supplier",Alamat';
    ColWidth.CommaText := '100,300,300';
    Width := Width + 400;
    caption := 'Cari Supplier';
  end
  else if mJenis = 'alamat-kirim' then begin
    sql := 'SELECT kode, nama, alamat FROM tbl_alamat_kirim ORDER BY nama';
    ColCaption.CommaText := 'Kode,Nama,Alamat';
    ColWidth.CommaText := '100,300,300';
    Width := Width + 400;
    caption := 'Cari Alamat Kirim';
  end
  else if mJenis = 'spmb' then begin
    sql := 'SELECT no_bukti, tanggal, no_dokumen ' +
      'FROM tbl_spmb_head WHERE (f_completed IS NULL OR f_completed = 0) ' +
      'ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. SPMB",Tanggal,"No. Dokumen"';
    ColWidth.CommaText := '100,100,100';
    Caption := 'Cari No. SPMB';
  end
  else if mJenis = 'po' then begin
    sql := 'SELECT no_bukti, tanggal, kode_supp, (SELECT nama FROM tbl_supplier WHERE kode = a.kode_supp) nama_supplier ' +
     'FROM tbl_po_head a WHERE a.f_pb = 0 ORDER BY tanggal DESC';
    ColCaption.CommaText := 'NO.PO,Tanggal,Kode Supp.,Nama Supplier';
    ColWidth.CommaText := '100,100,100,200';
    caption := 'Cari PO';
  end
  else if mJenis = 'pb' then begin
    sql := 'SELECT no_bukti, tanggal, kode_supp, (SELECT nama FROM tbl_supplier WHERE kode = a.kode_supp) nama_supplier ' +
     'FROM tbl_pb_head a ORDER BY tanggal DESC';
    ColCaption.CommaText := 'NO.PB,Tanggal,Kode Supp.,Nama Supplier';
    ColWidth.CommaText := '100,100,100,200';
    caption := 'Cari PB';
  end
  else if mJenis = 'spk' then begin
    sql := 'SELECT no_spk, no_so, kode_brg, deskripsi, qty, qty_prod, qty_terima ' +
     'FROM v_spk a ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. SPK","No. SO","Kode Brg.",Deskripsi, "Qty. SPK", "Qty. Prod", "Qty. Serah Terima"';
    ColWidth.CommaText := '100,100,100,200,100,100,100';
    caption := 'Cari SPK';
    Width := Width + 400;
  end
  else if mJenis = 'spk-peletan' then begin
    sql := 'SELECT no_spk, no_so, kode_brg, deskripsi, qty, qty_prod, qty_terima ' +
     'FROM v_spk a WHERE LEFT(a.no_so,3) = ''SPL'' ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. SPK","No. SO","Kode Brg.",Deskripsi, "Qty. SPK", "Qty. Prod", "Qty. Serah Terima"';
    ColWidth.CommaText := '100,100,100,200,100,100,100';
    caption := 'Cari SPK';
    Width := Width + 400;
  end
  else if mJenis = 'so' then begin

    // 29-10-2015 : so yang ditarnsaksikan dengan mutasi tidak kelihatan
    //sql := 'SELECT a.no_spk, a.no_so, a.kode_brg, a.deskripsi, a.qty, sf_getstok_per_gdg(b.kode, ''G01'') g01, sf_getstok_per_gdg(b.kode, ''G02'') g02 ' +
    // 'FROM v_spk a left join tbl_barang b on a.kode_brg = b.kode where left(a.no_so,2)=''SO'' or left(a.no_so,3)=''MTS'' ORDER BY a.tanggal DESC';

    sql := 'select e.no_spk, a.no_bukti no_so, a.kode_brg, c.deskripsi, a.qty, sf_getstok_per_gdg(a.kode_brg, ''G01'') G01, ' +
      'sf_getstok_per_gdg(a.kode_brg, ''G02'') G02 ' +
      'from tbl_so_det a ' +
      'inner join tbl_so_head b on a.no_bukti = b.no_bukti ' +
      'left join tbl_barang c on c.kode = a.kode_brg ' +
      'left join tbl_customer d on d.kode = b.kode_customer ' +
      'left join tbl_mo e on e.no_so = a.no_bukti and e.kode_brg = a.kode_brg';
      
    ColCaption.CommaText := '"No. SPK","No. SO","Kode Brg.",Deskripsi, "Qty. SPK", "Qty. G-SDP", "Qty. G-Cust"';
    ColWidth.CommaText := '100,100,100,250,70,70,70';
    caption := 'Cari SO';
    Width := Width + 300;
  end
  else if mJenis = 'lkm-mutasi' then begin
    sql := 'select a.no_bukti, a.no_so, a.no_spk, a.kode_brg, b.deskripsi, a.qty ' +
           'from tbl_lkm a ' +
           'left join tbl_barang b on a.kode_brg = b.kode ' +
           'where app3 = 1'; // 15-10-2014 // request pak ferry 
    ColCaption.CommaText := '"No. LKM","No. SO","No. SPK","Kode Brg.","Deskripsi","Qty. LKM"';
    ColWidth.CommaText := '100,100,100,100,250,100';
    caption := 'Cari SO';
    Width := Width + 100;
  end
  else if mJenis = 'trial' then begin
    sql := 'SELECT no_trial, tanggal, deskripsi_awal FROM tbl_logbook_design ' +
      'ORDER BY tanggal DESC';
    ColCaption.CommaText := '"No. Trial","Tanggal","Deskripsi"';
    ColWidth.CommaText := '100,100,1000';
    caption := 'Cari Trial';
    Width := Width + 800;
  end
  else if mJenis = 'pengeluaran-kas' then begin
    sql := 'SELECT DISTINCT a.no_jurnal, a.tanggal, b.keterangan, ' +
      'IF(debet>0,debet,IF(kredit>0,kredit,0)) jumlah FROM ' +
      'tbl_jurnal a INNER JOIN tbl_jurnal_det b ON a.no_jurnal = b.no_jurnal ' +
      'LEFT JOIN tbl_coa c ON c.noakun = b.akun ' +
      'WHERE a.jenis = ''OK'' AND b.f_head = 1';
    ColCaption.CommaText := '"No. Jurnal","Tanggal","Keterangan","Jumlah"';
    ColWidth.CommaText := '100,100,300,100';
    Caption := 'Pengeluaran Kas';
    Width := Width + 500;
  end
  else if mJenis = 'penerimaan-kas' then begin
    sql := 'SELECT DISTINCT a.no_jurnal, a.tanggal, b.keterangan, ' +
      'IF(debet>0,debet,IF(kredit>0,kredit,0)) jumlah FROM ' +
      'tbl_jurnal a INNER JOIN tbl_jurnal_det b ON a.no_jurnal = b.no_jurnal ' +
      'LEFT JOIN tbl_coa c ON c.noakun = b.akun ' +
      'WHERE a.jenis = ''IK'' AND b.f_head = 1';
    ColCaption.CommaText := '"No. Jurnal","Tanggal","Keterangan","Jumlah"';
    ColWidth.CommaText := '100,100,300,100';
    Caption := 'Penerimaan Kas';
    Width := Width + 500;
  end
  else if mJenis = 'antar-akun' then begin
    sql := 'SELECT a.no_jurnal, a.tanggal, a.keterangan, SUM(b.debet) debet, SUM(b.kredit) kredit FROM ' +
      'tbl_jurnal a INNER JOIN tbl_jurnal_det b ON a.no_jurnal = b.no_jurnal ' +
      'LEFT JOIN tbl_coa c ON c.noakun = b.akun ' +
      'GROUP BY a.no_jurnal, a.tanggal, b.keterangan';
    ColCaption.CommaText := '"No. Jurnal","Tanggal","Keterangan","Debet","Kredit"';
    ColWidth.CommaText := '100,100,300,100,100';
    Caption := 'Antar Akun';
  end
    else if mJenis = 'barang-bom-spk' then begin
    sql := format('SELECT a.kode_alt, b.deskripsi FROM tbl_alternatif as a join tbl_barang as b on a.kode_alt=b.kode WHERE a.kode = ''%s'' and a.kode_bahan=''%s'' and a.formula=''%s''',[mKodeBrg,mGroup,mFormula]);
    ColCaption.CommaText := 'Kode,Deskripsi';
    ColWidth.CommaText := '100,200';
    Width := Width + 500;
    caption := 'Cari Barang';
  end;

  Self.Caption := caption;
  zQ.SQL.Text := sql;
  zQ.Open;

  for i := 0 to zQ.Fields.Count - 1 do begin
    cl := cxTblView.CreateColumn;
    cl.DataBinding.FieldName := zQ.Fields[i].DisplayName;
    cl.Caption := ColCaption.Strings[i];
    cl.Width := StrToInt(ColWidth.Strings[i]);
    cl.Options.Editing := False;
  end;

  if mFilterText <> '' then begin
    lstFilter := TStringList.Create;
    lstFilter.CommaText := mFilterText;
    cxTblView.DataController.Filter.BeginUpdate;
    try
      cxTblView.DataController.Filter.Root.Clear;
      AItemList := cxTblView.DataController.Filter.Root.AddItemList(fboAnd);
      AItemList.AddItem(cxTblView.GetColumnByFieldName(
        lstFilter.Strings[0]),foLike,'%' + lstFilter.Strings[1] + '%','%' + lstFilter.Strings[1] + '%');
    finally
      cxTblView.DataController.Filter.EndUpdate;
      cxTblView.DataController.Filter.Active := True;
    end;
  end;

  Screen.Cursor := crDefault;
  
end;

procedure TfrmCari.btnBatalClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCari.btnOkClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to zq.FieldCount - 1 do begin
    mResult.AddObject(zq.Fields[i].Name, zQ.Fields[i]);
  end;
  ModalResult := mrOk;
end;

end.
