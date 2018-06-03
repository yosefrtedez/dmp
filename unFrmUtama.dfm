object frmUtama: TfrmUtama
  Left = 0
  Top = 0
  Caption = 'frmUtama'
  ClientHeight = 612
  ClientWidth = 1122
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
  end
  object stsBar: TdxStatusBar
    Left = 0
    Top = 588
    Width = 1122
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
    Left = 136
    Top = 112
    Width = 289
    Height = 193
    HotTrack = True
    LookAndFeel.SkinName = ''
    Options = [pcoAlwaysShowGoDialogButton, pcoCloseButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    ParentBackground = False
    Style = 5
    TabOrder = 1
    Visible = False
    ClientRectBottom = 193
    ClientRectRight = 289
    ClientRectTop = 0
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
    end
    object mnPPIC: TMenuItem
      Caption = 'PPIC'
      object mnPpic_MasterOrder: TMenuItem
        Caption = 'Master Order'
      end
    end
    object PRD1: TMenuItem
      Caption = 'PRD'
    end
    object PUR1: TMenuItem
      Caption = 'PUR'
      object mnPur_PP: TMenuItem
        Caption = 'Permintaan Pembelian'
        OnClick = mnPur_PPClick
      end
      object mnPur_AppPP: TMenuItem
        Caption = 'Approval Permintaan Pembelian '
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnPur_PO: TMenuItem
        Caption = 'Purchase Order'
      end
      object mnApp_PO: TMenuItem
        Caption = 'Approval Purchase Order'
      end
    end
    object mnAKT: TMenuItem
      Caption = 'AKT'
      object mnAKT_JurnalUmum: TMenuItem
        Caption = 'Jurnal Umum'
      end
    end
  end
end
