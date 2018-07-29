object frmPilihHarga: TfrmPilihHarga
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pilih Harga'
  ClientHeight = 217
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 8
    Top = 8
    Width = 281
    Height = 169
    TabOrder = 1
    object cxtbHarga: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
      object cxColJenis: TcxGridDBColumn
        Caption = 'Jenis Harga'
        Width = 124
      end
      object cxColHarga: TcxGridDBColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 136
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbHarga
    end
  end
  object btnPilih: TButton
    Left = 8
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Pilih'
    TabOrder = 2
    OnClick = btnPilihClick
  end
  object btnBatal: TButton
    Left = 89
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = btnBatalClick
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 8
    Width = 284
    Height = 169
    TabOrder = 0
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsHarga
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxGrid2DBTableView1jenis: TcxGridDBColumn
        Caption = 'Jenis'
        DataBinding.FieldName = 'jenis'
      end
      object cxGrid2DBTableView1harga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        Width = 92
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object zqrHarga: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      ''
      'SELECT a.harga, b.jenis '
      
        'FROM tbl_barang_det_harga a LEFT JOIN tbl_jenis_harga b ON a.id_' +
        'jenis = b.id'
      ' where a.id_brg = :id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object dsHarga: TDataSource
    DataSet = zqrHarga
    Left = 104
    Top = 24
  end
end
