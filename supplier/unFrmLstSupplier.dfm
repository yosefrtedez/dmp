inherited frmLstSupplier: TfrmLstSupplier
  BorderIcons = []
  Caption = 'Supplier'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnTambah: TButton
      OnClick = btnTambahClick
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
      OptionsData.Editing = False
      OptionsData.Inserting = False
    end
    object cxgCustomerLevel1: TcxGridLevel
      GridView = cxtbCustomer
    end
  end
  object zqrCustomer: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_barang')
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
