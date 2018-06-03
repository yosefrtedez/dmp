object frmCari: TfrmCari
  Left = 608
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '-'
  ClientHeight = 464
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrd: TcxGrid
    Left = 0
    Top = 0
    Width = 483
    Height = 426
    Align = alTop
    TabOrder = 0
    object cxTblView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = cxTblViewCellDblClick
      DataController.DataSource = dsQ
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnFilteredItemsList = True
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
    end
    object cxGrdLevel1: TcxGridLevel
      GridView = cxTblView
    end
  end
  object btnOk: TButton
    Left = 8
    Top = 433
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnBatal: TButton
    Left = 87
    Top = 433
    Width = 75
    Height = 25
    Caption = '&Batal'
    TabOrder = 2
    OnClick = btnBatalClick
  end
  object dsQ: TDataSource
    DataSet = zq
    Left = 415
    Top = 60
  end
  object zq: TZQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT kode,nama FROM tbl_supplier')
    Params = <>
    Left = 385
    Top = 60
  end
end
