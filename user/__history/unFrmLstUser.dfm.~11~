inherited frmLstUser: TfrmLstUser
  Caption = 'User'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 98
      Height = 19
      Caption = 'Master User'
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbUser: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsUser
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbUsernama_lengkap: TcxGridDBColumn
        Caption = 'Nama Lengkap'
        DataBinding.FieldName = 'nama_lengkap'
        Width = 256
      end
      object cxtbUsernama: TcxGridDBColumn
        Caption = 'User Login'
        DataBinding.FieldName = 'nama'
      end
      object cxtbUserdept: TcxGridDBColumn
        Caption = 'Dept'
        DataBinding.FieldName = 'dept'
      end
      object cxtbUseremail: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
        Width = 280
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbUser
    end
  end
  object zqrUser: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT nama_lengkap, nama, dept, email '
      'FROM tbl_user'
      'ORDER BY nama')
    Params = <>
    Left = 672
    Top = 136
  end
  object dsUser: TDataSource
    DataSet = zqrUser
    Left = 752
    Top = 136
  end
end
