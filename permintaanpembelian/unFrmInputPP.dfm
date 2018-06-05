inherited frmInputPP: TfrmInputPP
  Caption = 'Input Permintaan Pembelian'
  ClientWidth = 983
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 983
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 983
    ExplicitWidth = 920
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 235
      Height = 19
      Caption = 'Input Permintaan Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 505
    Width = 983
    Height = 48
    ExplicitTop = 505
    ExplicitWidth = 920
    ExplicitHeight = 48
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxlbl1: TcxLabel
    Left = 21
    Top = 66
    Caption = 'No. Bukti'
  end
  object cxtNoBukti: TcxTextEdit
    Left = 106
    Top = 62
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 96
  end
  object cxlbl2: TcxLabel
    Left = 21
    Top = 89
    Caption = 'Tanggal'
  end
  object cxdTanggal: TcxDateEdit
    Left = 106
    Top = 89
    TabOrder = 5
    Width = 147
  end
  object cxlbl3: TcxLabel
    Left = 21
    Top = 115
    Caption = 'Tgl Diperlukan'
  end
  object cxdTglPerlu: TcxDateEdit
    Left = 106
    Top = 114
    TabOrder = 7
    Width = 147
  end
  object cxlbl5: TcxLabel
    Left = 20
    Top = 140
    Caption = 'Diajukan Oleh'
  end
  object cxtDiajukan: TcxTextEdit
    Left = 105
    Top = 139
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 9
    Width = 147
  end
  object cxrdgrp1: TcxRadioGroup
    Left = 279
    Top = 60
    Caption = 'Level Kebutuhan'
    Properties.Items = <>
    TabOrder = 10
    Height = 63
    Width = 193
  end
  object cxCboLevel: TcxComboBox
    Left = 299
    Top = 83
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 11
    Width = 159
  end
  object cxlbl6: TcxLabel
    Left = 23
    Top = 167
    Caption = 'Departemen'
  end
  object cxtDepartemen: TcxTextEdit
    Left = 105
    Top = 165
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 13
    Width = 147
  end
  object cxgrd1: TcxGrid
    Left = 24
    Top = 197
    Width = 926
    Height = 293
    TabOrder = 14
    object cxgrdTblPP: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedItemChanged = cxgrdTblPPFocusedItemChanged
      OnFocusedRecordChanged = cxgrdTblPPFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##.00'
          Kind = skSum
          Column = cxColQty
        end
        item
          Format = '#,##.00'
          Kind = skSum
          Column = cxColTotal
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxgrd1TableView1DataControllerBeforePost
      DataController.OnRecordChanged = cxgrd1TableView1DataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = cxColNoGetDisplayText
        Width = 42
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 102
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kode'
        Properties.ListColumns = <
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBarang
        Width = 149
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 82
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Width = 88
      end
      object cxColValuta: TcxGridColumn
        Caption = 'Valuta'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'IDR'
          'USD')
        SortIndex = 0
        SortOrder = soAscending
        Width = 61
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object cxColTotal: TcxGridColumn
        Caption = 'Total'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Width = 112
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxgrdTblPP
    end
  end
  object cxlbltemp: TcxLabel
    Left = 514
    Top = 117
    Visible = False
  end
  object zqrPP: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select * from tbl_pp_head order by no_bukti;')
    Params = <>
    Left = 673
    Top = 131
  end
  object dsPP: TDataSource
    DataSet = zqrPP
    Left = 705
    Top = 131
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 703
    Top = 95
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select kode, deskripsi, satuan from tbl_barang order by kode;')
    Params = <>
    Left = 670
    Top = 94
  end
end
