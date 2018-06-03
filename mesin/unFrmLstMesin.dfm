inherited frmLstMesin: TfrmLstMesin
  BorderIcons = []
  Caption = 'Mesin'
  OnCreate = FormCreate
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
    inherited btnTambah: TButton
      Top = 14
      OnClick = btnTambahClick
      ExplicitTop = 14
    end
    inherited btnEdit: TButton
      Top = 14
      OnClick = btnEditClick
      ExplicitTop = 14
    end
    inherited btnHapus: TButton
      Top = 14
      OnClick = btnHapusClick
      ExplicitTop = 14
    end
    inherited btnRefresh: TButton
      Top = 14
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
    TabOrder = 2
    object cxtbCustomer: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCustomer
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Appending = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbCustomerkode: TcxGridDBColumn
        Caption = 'Kode Mesin'
        DataBinding.FieldName = 'kode'
      end
      object cxtbCustomernama: TcxGridDBColumn
        Caption = 'Nama Mesin'
        DataBinding.FieldName = 'nama'
        Width = 224
      end
      object cxtbCustomerlokasi: TcxGridDBColumn
        Caption = 'Lokasi'
        DataBinding.FieldName = 'lokasi'
      end
    end
    object cxgCustomerLevel1: TcxGridLevel
      GridView = cxtbCustomer
    end
  end
  object zqrCustomer: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT nama, kode, lokasi FROM tbl_mesin')
    Params = <>
    Left = 824
    Top = 192
  end
  object dsCustomer: TDataSource
    DataSet = zqrCustomer
    Left = 896
    Top = 192
  end
end
