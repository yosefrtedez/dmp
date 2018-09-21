object frmUtama: TfrmUtama
  Left = 0
  Top = 0
  Caption = 'frmUtama'
  ClientHeight = 523
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgBackground: TImage
    Left = 8
    Top = 8
    Width = 441
    Height = 225
    Stretch = True
  end
  object stsBar: TdxStatusBar
    Left = 0
    Top = 499
    Width = 1014
    Height = 24
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object pgMain: TcxPageControl
    Left = 8
    Top = 239
    Width = 441
    Height = 193
    HotTrack = True
    LookAndFeel.SkinName = ''
    Options = [pcoAlwaysShowGoDialogButton, pcoCloseButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    ParentBackground = False
    Style = 5
    TabOrder = 1
    Visible = False
    ClientRectBottom = 193
    ClientRectRight = 441
    ClientRectTop = 0
  end
  object ListBox1: TListBox
    Left = 455
    Top = 8
    Width = 386
    Height = 225
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object Button1: TButton
    Left = 712
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object MainMenu: TMainMenu
    Left = 40
    Top = 40
    object mnSystem: TMenuItem
      Caption = 'System'
      object mnSys_TutupTab: TMenuItem
        Caption = 'Tutup Semua Tab'
        OnClick = mnSys_TutupTabClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnSys_LogOff: TMenuItem
        Caption = 'Log Off - Ganti User'
        OnClick = mnSys_LogOffClick
      end
      object mnSys_Keluar: TMenuItem
        Caption = 'Keluar'
        OnClick = mnSys_KeluarClick
      end
    end
    object mnMaster: TMenuItem
      Caption = 'Master'
      object mnMst_BarangJasa: TMenuItem
        Caption = 'Barang dan Jasa'
        OnClick = mnMst_BarangJasaClick
      end
      object mnMst_Customer: TMenuItem
        Caption = 'Customer'
        OnClick = mnMst_CustomerClick
      end
      object mnMst_Supplier: TMenuItem
        Caption = 'Supplier'
        OnClick = mnMst_SupplierClick
      end
      object mnMst_Formula: TMenuItem
        Caption = 'Formula'
        OnClick = mnMst_FormulaClick
      end
      object mnMst_Mesin: TMenuItem
        Caption = 'Mesin'
        OnClick = mnMst_MesinClick
      end
      object mnMst_Karyawan: TMenuItem
        Caption = 'Karyawan'
        OnClick = mnMst_KaryawanClick
      end
      object mnMst_COA: TMenuItem
        Caption = 'Chart Of Account / Daftar Akun'
        OnClick = mnMst_COAClick
      end
      object mnMst_Lain2: TMenuItem
        Caption = 'Kategori Barang - Departemen - Gudang'
        OnClick = mnMst_Lain2Click
      end
      object mnMst_Sales: TMenuItem
        Caption = 'Sales'
        OnClick = mnMst_SalesClick
      end
      object mnMst_UserProgram: TMenuItem
        Caption = 'User Program'
        OnClick = mnMst_UserProgramClick
      end
    end
    object mnMKT: TMenuItem
      Caption = 'MKT'
      object mnMkt_SalesOrder: TMenuItem
        Caption = 'Sales Order'
        OnClick = mnMkt_SalesOrderClick
      end
      object mnMkt_SuratJalan: TMenuItem
        Caption = 'Surat Jalan '
        OnClick = mnMkt_SuratJalanClick
      end
      object mnMkt_ReturPenjualan: TMenuItem
        Caption = 'Retur Penjualan'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnMkt_LapOustandingSO: TMenuItem
        Caption = 'Laporan Outstanding SO'
        OnClick = mnMkt_LapOustandingSOClick
      end
    end
    object mnPPIC: TMenuItem
      Caption = 'PPIC'
      object mnPpic_SoMts: TMenuItem
        Caption = 'SO - MTS'
        OnClick = mnPpic_SoMtsClick
      end
      object mnPpic_MasterOrder: TMenuItem
        Caption = 'Master Order'
        OnClick = mnPpic_MasterOrderClick
      end
      object mnPpic_MasterSchedule: TMenuItem
        Caption = 'Master Schedule'
      end
    end
    object mnWHL: TMenuItem
      Caption = 'WHL'
      object mnWhl_TransferBarang: TMenuItem
        Caption = 'Transfer Antar Gudang'
        OnClick = mnWhl_TransferBarangClick
      end
      object mnWhl_BarangMasuk: TMenuItem
        Caption = 'Barang Masuk'
        OnClick = mnWhl_BarangMasukClick
      end
      object mnWhl_BarangKeluar: TMenuItem
        Caption = 'Barang Keluar'
        OnClick = mnWhl_BarangKeluarClick
      end
      object mnWhl_Koreksi: TMenuItem
        Caption = 'Koreksi Stok'
        OnClick = mnWhl_KoreksiClick
      end
    end
    object mnPRD: TMenuItem
      Caption = 'PRD'
      object mnPrd_PengambilanBB: TMenuItem
        Caption = 'Pengambilan Bahan Baku '
        OnClick = mnPrd_PengambilanBBClick
      end
      object mnPrd_LapPengambilanBB: TMenuItem
        Caption = 'Laporan Pengambilan Bahan Baku '
        OnClick = mnPrd_LapPengambilanBBClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnPrd_InputHslProd: TMenuItem
        Caption = 'Input Hasil Produksi '
        OnClick = mnPrd_InputHslProdClick
      end
      object mnPrd_LapInputHP: TMenuItem
        Caption = 'Laporan Input Hasil Produksi'
        OnClick = mnPrd_LapInputHPClick
      end
    end
    object mnPUR: TMenuItem
      Caption = 'PUR'
      object mnPur_PP: TMenuItem
        Caption = 'Permintaan Pembelian'
        OnClick = mnPur_PPClick
      end
      object mnPur_AppPP: TMenuItem
        Caption = 'Approval Permintaan Pembelian '
        OnClick = mnPur_AppPPClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnPur_PO: TMenuItem
        Caption = 'Purchase Order'
        OnClick = mnPur_POClick
      end
      object mnPur_AppPO: TMenuItem
        Caption = 'Approval Purchase Order'
        OnClick = mnPur_AppPOClick
      end
      object mnPur_OutstandingPO: TMenuItem
        Caption = 'Laporan Outstanding PO'
        OnClick = mnPur_OutstandingPOClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnPur_PB: TMenuItem
        Caption = 'Penerimaan Barang'
        OnClick = mnPur_PBClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnPur_ReturPembelian: TMenuItem
        Caption = 'Retur Pembelian'
        OnClick = mnPur_ReturPembelianClick
      end
      object mnPur_AppReturPembelian: TMenuItem
        Caption = 'Approval Retur Pembelian'
        OnClick = mnPur_AppReturPembelianClick
      end
    end
    object mnAKT: TMenuItem
      Caption = 'AKT'
      object mnAKT_PenerimaanKas: TMenuItem
        Caption = 'Penerimaan Kas'
        OnClick = mnAKT_PenerimaanKasClick
      end
      object mnAKT_PengeluaranKas: TMenuItem
        Caption = 'Pengeluaran Kas'
        OnClick = mnAKT_PengeluaranKasClick
      end
      object mnAkt_JurnalUmum: TMenuItem
        Caption = 'Jurnal Umum'
        OnClick = mnAkt_JurnalUmumClick
      end
      object mnAkt_SetDefaultAkun: TMenuItem
        Caption = 'Setting Default Akun'
        OnClick = mnAkt_SetDefaultAkunClick
      end
      object mnAkt_Pembelian: TMenuItem
        Caption = 'Pembelian'
        object mnAkt_InvoicePembelian: TMenuItem
          Caption = 'Invoice Pembelian'
          OnClick = mnAkt_InvoicePembelianClick
        end
        object mnAKT_PembayaranPembelian: TMenuItem
          Caption = 'Pembayaran Pembelian'
          OnClick = mnAKT_PembayaranPembelianClick
        end
        object mnAkt_PencairanDeposit: TMenuItem
          Caption = 'Pencairan Deposit'
        end
      end
      object Penjualan1: TMenuItem
        Caption = 'Penjualan'
        object InvoicePenjualan1: TMenuItem
          Caption = 'Invoice Penjualan'
          OnClick = InvoicePenjualan1Click
        end
        object PembayaranPenjualan1: TMenuItem
          Caption = 'Pembayaran Penjualan'
          OnClick = PembayaranPenjualan1Click
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnAkt_LaporanDetailJurnal: TMenuItem
        Caption = 'Laporan Detail Jurnal'
      end
    end
    object mnSet: TMenuItem
      Caption = 'Setting'
      object mnSet_SettingProgram: TMenuItem
        Caption = 'Setting Program'
        OnClick = mnSet_SettingProgramClick
      end
      object mnSet_WewenangUser: TMenuItem
        Caption = 'Wewenang User'
        OnClick = mnSet_WewenangUserClick
      end
      object mnSet_KalkulasiUlangStok: TMenuItem
        Caption = 'Kalkulasi Ulang Stok'
        OnClick = mnSet_KalkulasiUlangStokClick
      end
      object mnSet_UbahPassword: TMenuItem
        Caption = 'Ubah Password'
        OnClick = mnSet_UbahPasswordClick
      end
    end
    object mnLap: TMenuItem
      Caption = 'Laporan'
      OnClick = mnLapClick
    end
  end
end
