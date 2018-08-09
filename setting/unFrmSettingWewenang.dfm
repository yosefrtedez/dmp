inherited frmSettingWewenang: TfrmSettingWewenang
  Caption = 'Setting Wewenang'
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 132
      Height = 19
      Caption = 'Wewenang User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 6
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'Pilih User'
  end
  object cxlUser: TcxLookupComboBox
    Left = 76
    Top = 63
    Properties.KeyFieldNames = 'nama'
    Properties.ListColumns = <
      item
        Caption = 'Username'
        FieldName = 'nama'
      end>
    Properties.ListSource = dsUser
    TabOrder = 2
    Width = 521
  end
  object cxGrid1: TcxGrid
    Left = 252
    Top = 472
    Width = 876
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    Visible = False
    object cxtbWewenang: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnSorting = False
      OptionsView.GroupByBox = False
      object cxColNamaMenu: TcxGridColumn
        Caption = 'Nama Menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 248
      end
      object cxColInput: TcxGridColumn
        Caption = 'Input'
        Width = 70
      end
      object cxColEdit: TcxGridColumn
        Caption = 'Edit'
      end
      object cxColHapus: TcxGridColumn
        Caption = 'Hapus'
        Width = 76
      end
      object cxColKodeMenu: TcxGridColumn
        Caption = 'Kode Menu'
        Visible = False
        Width = 138
      end
    end
    object cxtbWewenang2: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnSorting = False
      OptionsView.GroupByBox = False
      object cxColNamaMenu2: TcxGridColumn
        Caption = 'Nama Menu'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        MinWidth = 248
        Width = 248
      end
      object cxColInput2: TcxGridColumn
        Caption = 'Input'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueGrayed = -1
        Properties.ValueUnchecked = 0
      end
      object cxColEdit2: TcxGridColumn
        Caption = 'Edit'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
      object cxColHapus2: TcxGridColumn
        Caption = 'Hapus'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
      object cxColKodeMenu2: TcxGridColumn
        Caption = 'Kode'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbWewenang
      object cxGrid1Level2: TcxGridLevel
        GridView = cxtbWewenang2
      end
    end
  end
  object Button1: TButton
    Left = 601
    Top = 61
    Width = 75
    Height = 25
    Caption = 'Proses'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxTreeWewenang: TcxTreeList
    Left = 8
    Top = 97
    Width = 878
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    Bands = <
      item
      end>
    TabOrder = 4
    OnEditing = cxTreeWewenangEditing
    object cxtrNama: TcxTreeListColumn
      Caption.Text = 'Nama Menu'
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Options.Sorting = False
      Width = 381
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtColBuka: TcxTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Caption.AlignHorz = taCenter
      Caption.Text = 'Buka'
      DataBinding.ValueType = 'Integer'
      Width = 64
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtColInput: TcxTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Caption.AlignHorz = taCenter
      Caption.Text = 'Input'
      DataBinding.ValueType = 'Integer'
      Width = 66
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtColEdit: TcxTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Caption.AlignHorz = taCenter
      Caption.Text = 'Edit'
      DataBinding.ValueType = 'Integer'
      Width = 69
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtColHapus: TcxTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Caption.AlignHorz = taCenter
      Caption.Text = 'Hapus'
      DataBinding.ValueType = 'Integer'
      Width = 70
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxTreeWewenangColumn1: TcxTreeListColumn
      Visible = False
      DataBinding.ValueType = 'String'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtColNamaMenu: TcxTreeListColumn
      Visible = False
      DataBinding.ValueType = 'String'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object zqrUser: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_user ORDER BY nama')
    Params = <>
    Left = 704
    Top = 8
  end
  object dsUser: TDataSource
    DataSet = zqrUser
    Left = 768
    Top = 8
  end
end
