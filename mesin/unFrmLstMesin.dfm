inherited frmLstMesin: TfrmLstMesin
  BorderIcons = []
  Caption = 'Mesin'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 47
      Height = 19
      Caption = 'Mesin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 2
    inherited btnTambah: TButton
      Top = 14
      TabOrder = 1
      OnClick = btnTambahClick
      ExplicitTop = 14
    end
    inherited btnEdit: TButton
      Top = 14
      TabOrder = 2
      OnClick = btnEditClick
      ExplicitTop = 14
    end
    inherited btnHapus: TButton
      Top = 14
      TabOrder = 3
      OnClick = btnHapusClick
      ExplicitTop = 14
    end
    inherited btnKeluar: TButton
      TabOrder = 0
    end
    inherited btnRefresh: TButton
      Top = 14
      TabOrder = 4
      OnClick = btnRefreshClick
      ExplicitTop = 14
    end
  end
  object cxgCustomer: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 1
    object cxtbMesin: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsMesin
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbMesinkode: TcxGridDBColumn
        Caption = 'Kode Mesin'
        DataBinding.FieldName = 'kode'
      end
      object cxtbMesinnama: TcxGridDBColumn
        Caption = 'Nama Mesin'
        DataBinding.FieldName = 'nama'
        Width = 224
      end
      object cxtbMesinlokasi: TcxGridDBColumn
        Caption = 'Lokasi'
        DataBinding.FieldName = 'lokasi'
      end
    end
    object cxgCustomerLevel1: TcxGridLevel
      GridView = cxtbMesin
    end
  end
  object zqrMesin: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT nama, kode, lokasi FROM tbl_mesin')
    Params = <>
    Left = 824
    Top = 192
  end
  object dsMesin: TDataSource
    DataSet = zqrMesin
    Left = 896
    Top = 192
  end
end
