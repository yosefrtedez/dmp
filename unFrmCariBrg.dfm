object frmCariBrg: TfrmCariBrg
  Left = 0
  Top = 0
  Caption = 'Cari Barang'
  ClientHeight = 528
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 749
    Height = 246
    Align = alClient
    TabOrder = 0
    ExplicitTop = -6
    object cxtbBrg: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBrg
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbBrgid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
        Width = 45
      end
      object cxtbBrgkode: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode'
        Width = 74
      end
      object cxtbBrgdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbBrg
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 487
    Width = 749
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = 129
    ExplicitTop = 456
    ExplicitWidth = 185
    object btnOK: TButton
      Left = 11
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
    object btnBatal: TButton
      Left = 92
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 1
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 287
    Width = 749
    Height = 200
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 384
    ExplicitTop = 272
    ExplicitWidth = 250
    object cxtbBrgDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxtbBrgDet
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 246
    Width = 749
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 392
    ExplicitTop = 224
    ExplicitWidth = 185
  end
  object zqrBrg: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT id, kode, deskripsi'
      'FROM tbl_barang'
      'ORDER BY deskripsi')
    Params = <>
    Left = 440
    Top = 80
  end
  object dsBrg: TDataSource
    DataSet = zqrBrg
    Left = 512
    Top = 88
  end
  object zqrBrgDet: TZReadOnlyQuery
    Params = <>
    Left = 440
    Top = 144
  end
  object dsBrgDet: TDataSource
    DataSet = zqrBrgDet
    Left = 512
    Top = 152
  end
end
