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
  object cxgCOA: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbCOA: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = dsCOA
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
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
        Caption = 'Induk'
        DataBinding.FieldName = 'induk'
      end
      object cxtbCOAf_subakun: TcxGridDBColumn
        DataBinding.FieldName = 'f_subakun'
        Visible = False
      end
      object cxtbCOAf_aktif: TcxGridDBColumn
        DataBinding.FieldName = 'f_aktif'
        Visible = False
      end
      object cxtbCOAsawal: TcxGridDBColumn
        DataBinding.FieldName = 'sawal'
        Visible = False
      end
      object cxtbCOAdfl: TcxGridDBColumn
        DataBinding.FieldName = 'dfl'
        Visible = False
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
