inherited frmLstJurnalUmum: TfrmLstJurnalUmum
  Caption = 'Jurnal Umum '
  OnShow = FormShow
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 107
      Height = 19
      Caption = 'Jurnal Umum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 4
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
  object cxgJurnalUmum: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 169
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 410
    object cxtbJurnalUmum: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsJurnalUmum
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbJurnalUmumno_jurnal: TcxGridDBColumn
        Caption = 'No. Jurnal'
        DataBinding.FieldName = 'no_jurnal'
      end
      object cxtbJurnalUmumtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbJurnalUmumketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 294
      end
      object cxtbJurnalUmumjenis: TcxGridDBColumn
        Caption = 'Jenis'
        DataBinding.FieldName = 'jenis'
      end
      object cxtbJurnalUmumuser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
      end
      object cxtbJurnalUmumuser_dept: TcxGridDBColumn
        Caption = 'User Dept'
        DataBinding.FieldName = 'user_dept'
      end
    end
    object cxgJurnalUmumLevel1: TcxGridLevel
      GridView = cxtbJurnalUmum
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 218
    Width = 1016
    Height = 41
    Align = alBottom
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitLeft = 536
    ExplicitTop = 400
    ExplicitWidth = 185
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 259
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = 552
    ExplicitTop = 272
    ExplicitWidth = 250
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object zqrJurnalUmum: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT * FROM tbl_jurnal_head')
    Params = <>
    Left = 760
    Top = 208
  end
  object dsJurnalUmum: TDataSource
    DataSet = zqrJurnalUmum
    Left = 864
    Top = 216
  end
end
