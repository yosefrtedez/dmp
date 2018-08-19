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
      TabOrder = 1
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      TabOrder = 2
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      Left = 388
      Top = 6
      TabOrder = 0
      Visible = False
      ExplicitLeft = 388
      ExplicitTop = 6
    end
    inherited btnRefresh: TButton
      Left = 172
      OnClick = btnRefreshClick
      ExplicitLeft = 172
    end
  end
  object cxgJurnalUmum: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 169
    Align = alClient
    TabOrder = 1
    object cxtbJurnalUmum: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbJurnalUmumFocusedRecordChanged
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
        Width = 79
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
    TabOrder = 2
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 259
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxtbJUDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsJUDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbJUDetnoakun: TcxGridDBColumn
        Caption = 'No. Akun'
        DataBinding.FieldName = 'noakun'
        Width = 66
      end
      object cxtbJUDetnamaakun: TcxGridDBColumn
        Caption = 'Nama Akun'
        DataBinding.FieldName = 'namaakun'
        Width = 215
      end
      object cxtbJUDetdebet: TcxGridDBColumn
        Caption = 'Debet'
        DataBinding.FieldName = 'debet'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 88
      end
      object cxtbJUDetkredit: TcxGridDBColumn
        Caption = 'Kredit'
        DataBinding.FieldName = 'kredit'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 75
      end
      object cxtbJUDetketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 333
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbJUDet
    end
  end
  object zqrJurnalUmum: TZReadOnlyQuery
    Connection = DM.zConn
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
  object zqrJUDet: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      
        'SELECT b.noakun, b.nama namaakun, a.debet, a.kredit, a.keteranga' +
        'n'
      'FROM tbl_jurnal a'
      'LEFT JOIN tbl_coa b on a.id_akun = b.id '
      'WHERE a.id_ref = :id_ref'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 672
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsJUDet: TDataSource
    DataSet = zqrJUDet
    Left = 776
    Top = 304
  end
end
