object frmPilihSO: TfrmPilihSO
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pilih Sales Order '
  ClientHeight = 349
  ClientWidth = 542
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
    Left = 16
    Top = 16
    Width = 497
    Height = 281
    TabOrder = 0
    object cxtbSO: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSO
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.GroupByBox = False
      object cxtbSOtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 89
      end
      object cxtbSOno_bukti: TcxGridDBColumn
        Caption = 'No. Sales Order'
        DataBinding.FieldName = 'no_bukti'
        Width = 129
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbSO
    end
  end
  object Button1: TButton
    Left = 16
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Pilih'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = Button2Click
  end
  object zqrSO: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT a.id, a.tanggal,a. no_bukti '
      'FROM tbl_so_head a'
      'LEFT JOIN tbl_so_det b ON a.id = b.id_ref'
      'WHERE id_cust = :id_cust AND b.id_brg = :id_brg')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_brg'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_brg'
        ParamType = ptUnknown
      end>
  end
  object dsSO: TDataSource
    DataSet = zqrSO
    Left = 304
    Top = 120
  end
end
