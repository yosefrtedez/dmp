inherited frmLstCOA: TfrmLstCOA
  Caption = 'Daftar Akun'
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    ExplicitTop = -6
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
  object cxgCOA: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 336
    ExplicitTop = 200
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxtbCOA: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCOA
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbCOAnoakun: TcxGridDBColumn
        Caption = 'No. Akun'
        DataBinding.FieldName = 'noakun'
        Width = 98
      end
      object cxtbCOAnama: TcxGridDBColumn
        Caption = 'Nama Akun'
        DataBinding.FieldName = 'nama'
      end
      object cxtbCOAinduk: TcxGridDBColumn
        DataBinding.FieldName = 'induk'
      end
      object cxtbCOAf_subakun: TcxGridDBColumn
        DataBinding.FieldName = 'f_subakun'
      end
      object cxtbCOAf_aktif: TcxGridDBColumn
        DataBinding.FieldName = 'f_aktif'
      end
      object cxtbCOAsawal: TcxGridDBColumn
        DataBinding.FieldName = 'sawal'
      end
      object cxtbCOAdfl: TcxGridDBColumn
        DataBinding.FieldName = 'dfl'
      end
    end
    object cxgCOALevel1: TcxGridLevel
      GridView = cxtbCOA
    end
  end
  object zqrCOA: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
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
