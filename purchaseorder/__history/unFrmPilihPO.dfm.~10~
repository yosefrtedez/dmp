object frmPilihPO: TfrmPilihPO
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pilih Purchase Order'
  ClientHeight = 349
  ClientWidth = 998
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
  object cxGrid1: TcxGrid
    Left = 16
    Top = 16
    Width = 966
    Height = 281
    TabOrder = 0
    object cxtbSO: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnRecordChanged = cxtbSODataControllerRecordChanged
      OptionsView.GroupByBox = False
      object cxColPilih: TcxGridColumn
        Caption = 'Pilih'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 37
      end
      object cxColTanggal: TcxGridColumn
        Caption = 'Tanggal'
        DataBinding.ValueType = 'DateTime'
        Options.Editing = False
        Width = 64
      end
      object cxColNoPO: TcxGridColumn
        Caption = 'No. PO'
        Options.Editing = False
        Width = 90
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg.'
        Options.Editing = False
        Width = 81
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        Options.Editing = False
        Width = 215
      end
      object cxColQtyPO: TcxGridColumn
        Caption = 'Qty. PO'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Options.Editing = False
      end
      object cxColQtyDiterima: TcxGridColumn
        Caption = 'Qty. Sudah Terima'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Width = 104
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        Width = 53
      end
      object cxColGdg: TcxGridColumn
        Caption = 'Gudang'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Gudang'
            FieldName = 'nama'
          end>
        Properties.ListSource = dsGdg
        Width = 114
      end
      object cxColStok: TcxGridColumn
        Caption = 'Stok'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
      end
      object cxColJmlTerima: TcxGridColumn
        Caption = 'Jml. Datang'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 81
      end
      object cxColIdBrg: TcxGridColumn
        Visible = False
        Width = 83
        IsCaptionAssigned = True
      end
      object cxColIdSO: TcxGridColumn
        Visible = False
      end
      object cxColIdSatuan: TcxGridColumn
        Visible = False
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
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = Button2Click
  end
  object cxLabel1: TcxLabel
    Left = 613
    Top = 302
    Caption = 
      'Note : Input terlebih dahulu Jml. Datang, kemudian centang pada ' +
      'kolom pilih'
  end
  object zqrPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.id, a.tanggal,a. no_bukti '
      'FROM tbl_po_head a'
      'LEFT JOIN tbl_po_det b ON a.id = b.id_ref'
      
        'WHERE id_supplier = :id_supplier AND b.id_brg = :id_brg AND a.f_' +
        'completed = 0'
      'ORDER BY a.tanggal ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_supplier'
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
        Name = 'id_supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_brg'
        ParamType = ptUnknown
      end>
  end
  object dsPO: TDataSource
    DataSet = zqrPO
    Left = 304
    Top = 120
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, nama FROM tbl_gudang')
    Params = <>
    Left = 480
    Top = 112
  end
  object dsGdg: TDataSource
    DataSet = zqrGdg
    Left = 544
    Top = 184
  end
end
