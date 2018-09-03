inherited frmLstSales: TfrmLstSales
  Caption = 'Sales'
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 43
      Height = 19
      Caption = 'Sales'
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
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 1
    object cxtbSales: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSales
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbSaleskode_sales: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kode_sales'
      end
      object cxtbSalesnama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbSales
    end
  end
  object zqrSales: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_sales')
    Params = <>
    Left = 760
    Top = 168
  end
  object dsSales: TDataSource
    DataSet = zqrSales
    Left = 912
    Top = 208
  end
end
