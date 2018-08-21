inherited frmLstCOA: TfrmLstCOA
  Caption = 'Daftar Akun'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 153
      Height = 19
      Caption = 'Daftar Akun (COA)'
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
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object treeCOA: TcxDBTreeList
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    Bands = <
      item
      end>
    DataController.DataSource = dsCOA
    DataController.ParentField = 'induk'
    DataController.KeyField = 'noakun'
    OptionsBehavior.IncSearch = True
    OptionsBehavior.IncSearchItem = cxDBTreeList1cxDBTreeListColumn2
    OptionsData.Editing = False
    OptionsData.Deleting = False
    RootValue = -1
    TabOrder = 1
    object cxColNoAkun: TcxDBTreeListColumn
      Caption.Text = 'No. Akun'
      DataBinding.FieldName = 'noakun'
      Width = 100
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
      Caption.Text = 'Nama Akun'
      DataBinding.FieldName = 'nama'
      Width = 470
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object zqrCOA: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_coa')
    Params = <>
    Left = 704
    Top = 144
  end
  object dsCOA: TDataSource
    DataSet = zqrCOA
    Left = 824
    Top = 176
  end
end
