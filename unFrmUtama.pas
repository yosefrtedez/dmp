unit unFrmUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, ZDataset,
  dxSkinscxPCPainter, cxPC, ExtCtrls, StdCtrls;

type
  TfrmUtama = class(TForm)
    MainMenu: TMainMenu;
    stsBar: TdxStatusBar;
    pgMain: TcxPageControl;
    mnSystem: TMenuItem;
    mnMaster: TMenuItem;
    mnMst_BarangJasa: TMenuItem;
    mnSys_LogOff: TMenuItem;
    mnSys_Keluar: TMenuItem;
    mnMst_Customer: TMenuItem;
    mnMst_Supplier: TMenuItem;
    mnMst_Mesin: TMenuItem;
    mnMst_Karyawan: TMenuItem;
    mnMst_UserProgram: TMenuItem;
    mnPPIC: TMenuItem;
    mnPRD: TMenuItem;
    mnPUR: TMenuItem;
    mnMst_COA: TMenuItem;
    mnMst_Lain2: TMenuItem;
    mnSys_TutupTab: TMenuItem;
    N1: TMenuItem;
    imgBackground: TImage;
    mnMKT: TMenuItem;
    mnMkt_SalesOrder: TMenuItem;
    mnPpic_MasterOrder: TMenuItem;
    mnPur_PP: TMenuItem;
    mnPur_AppPP: TMenuItem;
    N2: TMenuItem;
    mnPur_PO: TMenuItem;
    mnPur_AppPO: TMenuItem;
    mnAKT: TMenuItem;
    mnAkt_JurnalUmum: TMenuItem;
    mnAkt_SetDefaultAkun: TMenuItem;
    mnSet: TMenuItem;
    mnSet_WewenangUser: TMenuItem;
    mnSet_SettingProgram: TMenuItem;
    mnPrd_PengambilanBB: TMenuItem;
    mnPrd_InputHslProd: TMenuItem;
    mnMkt_SuratJalan: TMenuItem;
    mnPpic_MasterSchedule: TMenuItem;
    mnMkt_ReturPenjualan: TMenuItem;
    mnAKT_PenerimaanKas: TMenuItem;
    mnAKT_PengeluaranKas: TMenuItem;
    mnLap: TMenuItem;
    mnMst_Formula: TMenuItem;
    N3: TMenuItem;
    mnPur_PB: TMenuItem;
    mnWHL: TMenuItem;
    mnWhl_TransferBarang: TMenuItem;
    mnMst_Sales: TMenuItem;
    N4: TMenuItem;
    mnPur_ReturPembelian: TMenuItem;
    mnPur_AppReturPembelian: TMenuItem;
    mnWhl_BarangMasuk: TMenuItem;
    mnWhl_BarangKeluar: TMenuItem;
    mnSet_KalkulasiUlangStok: TMenuItem;
    mnWhl_Koreksi: TMenuItem;
    mnPrd_LapPengambilanBB: TMenuItem;
    mnPrd_LapInputHP: TMenuItem;
    mnAkt_Pembelian: TMenuItem;
    Penjualan1: TMenuItem;
    mnAkt_InvoicePembelian: TMenuItem;
    PembayaranPembelian1: TMenuItem;
    InvoicePenjualan1: TMenuItem;
    PembayaranPenjualan1: TMenuItem;
    mnPpic_SoMts: TMenuItem;
    N6: TMenuItem;
    mnPur_OutstandingPO: TMenuItem;
    ListBox1: TListBox;
    N5: TMenuItem;
    mnMkt_LapOustandingSO: TMenuItem;
    mnSet_UbahPassword: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnMst_BarangJasaClick(Sender: TObject);
    procedure mnSys_KeluarClick(Sender: TObject);
    procedure mnMst_CustomerClick(Sender: TObject);
    procedure mnMst_SupplierClick(Sender: TObject);
    procedure mnMst_MesinClick(Sender: TObject);
    procedure mnMst_UserProgramClick(Sender: TObject);
    procedure mnMst_Lain2Click(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure mnSys_TutupTabClick(Sender: TObject);
    procedure mnMst_KaryawanClick(Sender: TObject);
    procedure mnMkt_SalesOrderClick(Sender: TObject);
    procedure mnPur_PPClick(Sender: TObject);
    procedure mnMst_COAClick(Sender: TObject);
    procedure mnAkt_JurnalUmumClick(Sender: TObject);
    procedure mnAkt_SetDefaultAkunClick(Sender: TObject);
    procedure mnPpic_MasterOrderClick(Sender: TObject);
    procedure mnSys_LogOffClick(Sender: TObject);
    procedure mnSet_WewenangUserClick(Sender: TObject);
    procedure mnSet_SettingProgramClick(Sender: TObject);
    procedure mnAKT_PenerimaanKasClick(Sender: TObject);
    procedure mnPur_AppPPClick(Sender: TObject);
    procedure mnPur_POClick(Sender: TObject);
    procedure mnPur_PBClick(Sender: TObject);
    procedure mnAKT_PengeluaranKasClick(Sender: TObject);
    procedure mnWhl_TransferBarangClick(Sender: TObject);
    procedure mnMst_SalesClick(Sender: TObject);
    procedure mnMst_FormulaClick(Sender: TObject);
    procedure mnPur_AppPOClick(Sender: TObject);
    procedure mnPur_ReturPembelianClick(Sender: TObject);
    procedure mnPur_AppReturPembelianClick(Sender: TObject);
    procedure mnWhl_BarangMasukClick(Sender: TObject);
    procedure mnWhl_BarangKeluarClick(Sender: TObject);
    procedure mnLapClick(Sender: TObject);
    procedure mnSet_KalkulasiUlangStokClick(Sender: TObject);
    procedure mnWhl_KoreksiClick(Sender: TObject);
    procedure mnPrd_PengambilanBBClick(Sender: TObject);
    procedure mnPrd_InputHslProdClick(Sender: TObject);
    procedure mnMkt_SuratJalanClick(Sender: TObject);
    procedure mnPpic_SoMtsClick(Sender: TObject);
    procedure mnPrd_LapInputHPClick(Sender: TObject);
    procedure mnPrd_LapPengambilanBBClick(Sender: TObject);
    procedure mnPur_OutstandingPOClick(Sender: TObject);
    procedure mnMkt_LapOustandingSOClick(Sender: TObject);
    procedure mnSet_UbahPasswordClick(Sender: TObject);
    procedure InvoicePenjualan1Click(Sender: TObject);
    procedure mnAkt_InvoicePembelianClick(Sender: TObject);
    procedure PembayaranPembelian1Click(Sender: TObject);
    procedure PembayaranPenjualan1Click(Sender: TObject);
  private
    procedure PGChange(Sender: TObject);
  public
    procedure BuildMenu;
    function CekTabOpen(sCaption: string): Boolean;
    procedure CloseTab(Frm: TForm; Sender: TObject);
    procedure ToggleMainPage;
    procedure HideAllMenu(flag: Boolean);
    procedure SettingWewenang;
  end;

var
  frmUtama: TfrmUtama;

function fu: TfrmUtama;

implementation

uses
  unTools, unFrmLstBarangJasa, unFrmLstCustomer, unFrmLstSupplier,
  unFrmLstMesin, unFrmLstUser, unFrmLstLain2, unDM, unFrmLstKaryawan,
  unFrmLstSO, unFrmLstPP, unFrmLstCOA, unFrmLstJurnalUmum, unFrmDefaultAkun,
  unFrmMasterOrder, unFrmLogin, unFrmSettingWewenang, unFrmSettingProgram,
  unFrmLstPenerimaanKas, unFrmAppPP, unFrmInputPO, unFrmLstPO, unFrmLstPB,
  unFrmLstPengeluaranKas, unFrmLstTransferBarang, unFrmLstSales,
  unFrmLstFormula, unFrmAppPO, unFrmLstReturPembelian, unFrmAppRetur,
  unFrmInputBarangMasuk, unFrmLstBarangMasuk, unFrmLstBarangKeluar,
  unFrmKalkulasiStok, unFrmLstKoreksi, unFrmMenuLaporan,
  unFrmPengambilanBahanBaku, unFrmInputHasilProduksi, unFrmLstSuratJalan,
  unFrmLapHasilProduksi, unFrmLapPengambilanBB, unFrmLapOutstandingPO,
  unFrmLapOutstandingSO, unFrmUbahPassword, unFrmLstInvoicePenjualan,
  unFrmLstInvoicePembelian, unFrmLstPembayaranPembelian,
  unFrmInputPembayaranPenjualan, unFrmLstPembayaranPenjualan;

{$R *.dfm}

function fu: TfrmUtama;
begin
  Result := frmUtama;
end;

procedure TfrmUtama.BuildMenu;
var
  q: TZQuery;
  mi: TMenuItem;
begin
  {
  q := OpenRS('SELECT * FROM tbl_menu');
  while not q.Eof do begin

    q.Next;
  end;
  }
end;

procedure TfrmUtama.FormCreate(Sender: TObject);
begin
  pgMain.OnChange := PGChange;
  pgMain.Align := alClient;
  imgBackground.Align := alClient;
  Caption := Aplikasi.JudulAplikasi;
  HideAllMenu(True);
  try
  imgBackground.Picture.LoadFromFile(Aplikasi.AppPath + '/images/bg.jpg');
  finally
  end;
end;

procedure TfrmUtama.CloseTab(Frm: TForm; Sender: TObject);
var
  t: TcxTabSheet;
  i: integer;
begin
  Frm.Release;

  {
  for i := 0 to pgMain.PageCount - 1 do begin
    if pgMain.Pages[i].Caption = 'Master Barang' then begin
      t := pgMain.Pages[i];
    end;
  end;
  //t := (Sender as TcxTabSheet);
  //MsgBox(t.Caption);
  }
end;


procedure TfrmUtama.FormShow(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
  Self.BuildMenu;
end;

procedure TfrmUtama.HideAllMenu(flag: boolean);
var
  i: integer;
begin
  for i := 0 to frmUtama.ComponentCount - 1 do begin
    if Components[i].ClassName = 'TMenuItem' then
      (Components[i] as TMenuItem).Visible := Not Flag;
    {
    if Components[i].ClassName = 'TToolButton' then
      if Components[i].Name = 'tbtnBrowseMst' then
        (Components[i] as TToolButton).Visible := False
      else
        (Components[i] as TToolButton).Visible := Not Flag;
    }
  end;
end;

procedure TfrmUtama.mnAkt_InvoicePembelianClick(Sender: TObject);
var
  f: TfrmLstInvoicePembelian;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Invoice Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstInvoicePembelian.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.InvoicePenjualan1Click(Sender: TObject);
var
  f: TfrmLstInvoicePenjualan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Invoice Penjualan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstInvoicePenjualan.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAkt_JurnalUmumClick(Sender: TObject);
var
  f: TfrmLstJurnalUmum;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Jurnal Umum') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstJurnalUmum.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAKT_PenerimaanKasClick(Sender: TObject);
var
  f: TfrmLstPenerimaanKas;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Penerimaan Kas') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPenerimaanKas.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAKT_PengeluaranKasClick(Sender: TObject);
var
  f: TfrmLstPengeluaranKas;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Pengeluaran Kas') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPengeluaranKas.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAkt_SetDefaultAkunClick(Sender: TObject);
var
  f: TfrmDefaultAkun;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Sales Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmDefaultAkun.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnLapClick(Sender: TObject);
{
var
  f: TfrmLaporan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Laporan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLaporan.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;
}
var
  f: TfrmMenuLaporan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Laporan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmMenuLaporan.Create(Self);
    f.Caption := 'Laporan';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMkt_LapOustandingSOClick(Sender: TObject);
var
  f: TfrmLapOutstandingSO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Laporan Outstanding Sales Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLapOutstandingSO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;
procedure TfrmUtama.mnMkt_SalesOrderClick(Sender: TObject);
var
  f: TfrmLstSO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Sales Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMkt_SuratJalanClick(Sender: TObject);
var
  f: TfrmLstSuratJalan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Surat Jalan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSuratJalan.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_BarangJasaClick(Sender: TObject);
var
  f: TfrmLstBarangJasa;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Barang dan Jasa') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstBarangJasa.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_COAClick(Sender: TObject);
var
  f: TfrmLstCOA;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Daftar Akun') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstCOA.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_CustomerClick(Sender: TObject);
var
  f: TfrmLstCustomer;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Customer') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstCustomer.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_FormulaClick(Sender: TObject);
var
  f: TfrmLstFormula;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Formula') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstFormula.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_KaryawanClick(Sender: TObject);
var
  f: TfrmLstKaryawan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Karyawan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstKaryawan.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_Lain2Click(Sender: TObject);
var
  f: TfrmLstLain2;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Kategori Barang - Departemen - Gudang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstLain2.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_MesinClick(Sender: TObject);
var
  f: TfrmLstMesin;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Mesin') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstMesin.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_SalesClick(Sender: TObject);
var
  f: TfrmLstSales;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Sales') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSales.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;


procedure TfrmUtama.mnMst_SupplierClick(Sender: TObject);
var
  f: TfrmLstSupplier;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Supplier') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSupplier.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_UserProgramClick(Sender: TObject);
var
  f: TfrmLstUser;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('User') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstUser.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPpic_MasterOrderClick(Sender: TObject);
var
  f: TfrmMasterOrder;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Master Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmMasterOrder.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPpic_SoMtsClick(Sender: TObject);
var
  f: TfrmLstSO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Sales Order - MTS') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSO.Create(Self);
    f.Caption := 'Sales Order - MTS';
    f.JenisSO := 'MTS';
    f.Label1.Caption := 'Sales Order - MTS';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;


procedure TfrmUtama.mnPrd_InputHslProdClick(Sender: TObject);
var
  f: TfrmInputHasilProduksi;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Input Hasil Produksi') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmInputHasilProduksi.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPrd_LapInputHPClick(Sender: TObject);
var
  f: TfrmLapHasilProduksi;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Laporan Input Hasil Produksi') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLapHasilProduksi.Create(Self);
    f.Parent := ts;
    ts.Caption := 'Laporan Input Hasil Produksi';
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPrd_LapPengambilanBBClick(Sender: TObject);
var
  f: TfrmLapPengambilanBB;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Laporan Pengambilan Bahan Baku') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLapPengambilanBB.Create(Self);
    f.Caption := 'Laporan Pengambilan Bahan Baku';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPrd_PengambilanBBClick(Sender: TObject);
var
  f: TfrmPengambilanBahanBaku;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Pengambilan Bahan Baku') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmPengambilanBahanBaku.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_AppPOClick(Sender: TObject);
var
  f: TfrmAppPO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Approval Purchase Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmAppPO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_AppPPClick(Sender: TObject);
var
  f: TfrmAppPP;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Approval Permintaan Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmAppPP.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_AppReturPembelianClick(Sender: TObject);
var
  f: TfrmAppRetur;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Approval Retur Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmAppRetur.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_OutstandingPOClick(Sender: TObject);
var
  f: TfrmLapOutstandingPO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Laporan Outstanding Purchase Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLapOutstandingPO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_PBClick(Sender: TObject);
var
  f: TfrmLstPB;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Penerimaan Barang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPB.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_POClick(Sender: TObject);
var
  f: TfrmLstPO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Purchase Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_PPClick(Sender: TObject);
var
  f: TfrmLstPP;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Permintaan Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPP.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_ReturPembelianClick(Sender: TObject);
var
  f: TfrmLstReturPembelian;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Retur Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstReturPembelian.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnSet_KalkulasiUlangStokClick(Sender: TObject);
var
  f: TfrmKalkulasiStok;
begin
  f := TfrmKalkulasiStok.Create(Self);
  f.ShowModal;
end;

procedure TfrmUtama.mnSet_SettingProgramClick(Sender: TObject);
var
  f: TfrmSettingProgram;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Setting Program') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmSettingProgram.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnSet_UbahPasswordClick(Sender: TObject);
var
  f: TfrmUbahPassword;
begin
  f := TfrmUbahPassword.Create(Self);
  f.ShowModal;
  f.Free;
end;

procedure TfrmUtama.mnSet_WewenangUserClick(Sender: TObject);
var
  f: TfrmSettingWewenang;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Setting Wewenang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmSettingWewenang.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnSys_KeluarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmUtama.mnSys_LogOffClick(Sender: TObject);
var
  f: TFrmLogin;
begin

  Aplikasi.NamaUser := '';
  Aplikasi.UserDept := '';
  Aplikasi.EmailUser := '';
  Aplikasi.Jabatan := '';

  frmUtama.stsBar.Panels[1].Text := '';
  frmUtama.stsBar.Panels[2].Text := '';
  frmUtama.stsBar.Panels[3].Text := '';
  frmUtama.stsBar.Panels[4].Text := '';

  f := TfrmLogin.Create(Self);
  f.ShowModal;
  Self.mnSys_TutupTabClick(nil);
end;

procedure TfrmUtama.mnSys_TutupTabClick(Sender: TObject);
var
  i, styleID: Integer;
  ts: TcxTabSheet;
  pagecontrol:TcxPageControl;

  component: TComponent;
  stream: TMemoryStream;

begin
  {
  RegisterClass(TcxPageControl);
  stream := TMemoryStream.Create;
  try
    stream.WriteComponent(pgMain);
    stream.Position := 0;
    component := stream.ReadComponent(nil);
    pagecontrol := component as TcxPageControl;

    pgMain.Free;

    pagecontrol.Name := 'pgMain';
    InsertComponent(pagecontrol);

    pagecontrol.Parent := Self;
    pagecontrol.Align := alClient;
  finally
    stream.Free;
  end;
  }

  if not pgMain.Visible then Abort;

  styleID := pgMain.Style;
  PGMain.Free;
  pagecontrol := TcxPageControl.Create(Self);

  with pagecontrol do begin
    pagecontrol.Name := 'PGMain';
    pagecontrol.Align := alClient;
    pagecontrol.Parent := frmUtama;
    //pagecontrol.ShowFrame := True;
    pagecontrol.HotTrack := True;
    //pagecontrol.ParentColor := False;
    //pagecontrol.Color := clSkyBlue;
    //pagecontrol.LookAndFeel.Kind := lfOffice11;
    pagecontrol.Style := styleID;
    //pagecontrol.Visible := True;
    //pagecontrol.HideTabs := True;
    //pagecontrol.Options := [pcoAlwaysShowGoDialogButton,pcoCloseButton,pcoGradient,pcoGradientClientArea,pcoRedrawOnResize];
    pagecontrol.ParentBackground := False;
    pagecontrol.Options := [pcoAlwaysShowGoDialogButton,pcoCloseButton];
    pagecontrol.Visible := False;
    pagecontrol.OnChange := PGChange;
  end;

end;

procedure TfrmUtama.mnWhl_BarangKeluarClick(Sender: TObject);
var
  f: TfrmLstBarangKeluar;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Barang Keluar') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstBarangKeluar.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnWhl_BarangMasukClick(Sender: TObject);
var
  f: TfrmLstBarangMasuk;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Barang Masuk') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstBarangMasuk.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnWhl_KoreksiClick(Sender: TObject);
var
  f: TfrmLstKoreksi;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Koreksi Barang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstKoreksi.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnWhl_TransferBarangClick(Sender: TObject);
var
  f: TfrmLstPembayaranPembelian;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Pembayaran Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPembayaranPembelian.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.PembayaranPembelian1Click(Sender: TObject);
var
  f: TfrmLstPembayaranPembelian;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Pembayaran Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPembayaranPembelian.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.PembayaranPenjualan1Click(Sender: TObject);
var
  f: TfrmLstPembayaranPenjualan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Pembayaran Penjualan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;
    ts.Caption := 'Pembayaran Penjualan';

    f := TfrmLstPembayaranPenjualan.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.PGChange(Sender: TObject);
var
  pg: TcxPageControl;
begin
  pg := (Sender as TcxPageControl);
  if pg.TabCount = 0 then pg.Visible := False;
end;

procedure TfrmUtama.pgMainChange(Sender: TObject);
begin
  if pgMain.TabCount = 0 then pgMain.Visible := False;
end;

procedure TfrmUtama.SettingWewenang;
var
  q: TZQuery;
  i: integer;
  namaKomponen: string;
  f: Boolean;
begin

  q := OpenRS('SELECT * FROM tbl_wewenang WHERE nama = ''%s''', [Aplikasi.NamaUser]);

  if (Aplikasi.NamaUser = 'ADMIN') or (Aplikasi.NamaUser = 'FELGITO') or (Aplikasi.NamaUser = 'HENDRA') then begin
  //if Aplikasi.NamaUser = 'ADMIN' then begin
    HideAllMenu(False);
  end
  else begin

    for i := 0 to frmUtama.ComponentCount - 1 do begin

      namaKomponen := Trim(frmUtama.Components[i].Name);
      ListBox1.Items.Add(namaKomponen);

      if q.Locate('nm_comp', namaKomponen,[]) then begin
        f := false;
        if q.FieldByName('b').AsInteger = 1 then
          f := true;
        (frmUtama.Components[i] as TMenuItem).Visible := f;
        q.First;
      end
      else begin
        {
        if (namaKomponen = 'mnLogOff') or (namaKomponen = 'mnKeluar')
          then continue;

        if aplikasi.NamaUser = 'ADMIN' then begin
          if (namaKomponen = 'mnCFT_SO') then continue;
          if (namaKomponen = 'mnWHL_SPMB') then Continue;
          if (namaKomponen = 'mnCFT_SJ') then Continue;
          if (namaKomponen = 'mnCFT_SOT') then Continue;
          if (namaKomponen = 'mnPPICTrsSpkPotong') then Continue;
          if (namaKomponen = 'mnCFT_cetakSJ') then Continue;
          if (namaKomponen = 'mnPPIC_AppSpkPot') then Continue;
          if (namaKomponen = 'mnCFT_spmb') then Continue;
          if (namaKomponen = 'mnPembatalan') then Continue;
          if (namaKomponen = 'mnPembIN') then Continue;
          if (namaKomponen = 'mnPembOUT') then Continue;
          if (namaKomponen = 'mnPembKS') then Continue;
        end;

        if frmUtama.Components[i].ClassType = TMenuItem then
          (frmUtama.Components[i] as TMenuItem).Visible := False;
        }
      end;

    end;
    q.Close; q := nil;

    q := OpenRS('SELECT * FROM tbl_oto_mutasi WHERE user = ''%s'' ' +
      'AND tanggal = ''%s'' AND f_selesai = 0',
      [Aplikasi.NamaUser,
       Aplikasi.TanggalString
      ]
    );

    mnSystem.Visible := True;
    mnSys_TutupTab.Visible := True;
    mnSys_LogOff.Visible := True;
    mnSys_Keluar.Visible := True;

  end;
  Self.Menu := mainMenu;

  mnMkt_ReturPenjualan.Visible := False;
  mnPpic_MasterSchedule.Visible := False;
  mnPur_ReturPembelian.Visible := False;
  mnPur_AppReturPembelian.Visible := False;
  if Aplikasi.FAcc then
    mnAKT.Visible := True
  else
    mnAKT.Visible := False;

  mnAKT.Visible := True;
end;

procedure TfrmUtama.ToggleMainPage;
begin
  if not pgMain.Visible then pgMain.Visible := True;
end;

function TfrmUtama.CekTabOpen(sCaption: string): Boolean;
var
  i: Integer;
  f: boolean;
  ts: TcxTabSheet;
begin
  f := False;
  for i := 0 to pgMain.TabCount - 1 do begin
    if sCaption = pgMain.Tabs[i].Caption then begin
      ts := pgMain.Pages[i];
      f := True;
      Break;
    end;
  end;

  if f then begin
    pgMain.ActivePage := ts;
  end;

  Result := f;
end;

end.

