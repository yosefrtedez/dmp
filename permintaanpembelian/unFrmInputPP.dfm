inherited frmInputPP: TfrmInputPP
  Caption = 'Input Permintaan Pembelian'
  ClientWidth = 1099
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1099
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1099
    ExplicitWidth = 1099
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
    Width = 1099
    Height = 48
    TabOrder = 15
    ExplicitTop = 505
    ExplicitWidth = 1099
    ExplicitHeight = 48
    inherited btnSimpan: TButton
      Top = 11
      OnClick = btnSimpanClick
      ExplicitTop = 11
    end
  end
  object cxlbl1: TcxLabel
    Left = 10
    Top = 66
    Caption = 'No. Bukti'
  end
  object cxtNoBukti: TcxTextEdit
    Left = 106
    Top = 62
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 96
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 89
    Caption = 'Tanggal'
  end
  object cxdTanggal: TcxDateEdit
    Left = 106
    Top = 89
    TabOrder = 6
    Width = 147
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 117
    Caption = 'Tgl Diperlukan'
  end
  object cxdTglPerlu: TcxDateEdit
    Left = 106
    Top = 116
    TabOrder = 7
    Width = 147
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 144
    Caption = 'Diajukan Oleh'
  end
  object cxtDiajukan: TcxTextEdit
    Left = 105
    Top = 143
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 147
  end
  object cxrdgrp1: TcxRadioGroup
    Left = 279
    Top = 60
    Caption = 'Level Kebutuhan'
    Properties.Items = <>
    TabOrder = 1
    Height = 63
    Width = 193
  end
  object cxCboLevel: TcxComboBox
    Left = 299
    Top = 83
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 4
    Width = 159
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 171
    Caption = 'Departemen'
  end
  object cxtDepartemen: TcxTextEdit
    Left = 105
    Top = 170
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 12
    Width = 147
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 204
    Width = 1075
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 14
    object cxGrdTblPP: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
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
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxgrd1TableView1DataControllerBeforePost
      DataController.OnRecordChanged = cxgrd1TableView1DataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        OnGetDisplayText = cxColNoGetDisplayText
        Width = 42
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg.'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end>
        Properties.ListSource = dsBarang
        Width = 111
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
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
        Width = 320
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 71
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 82
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 306
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColKodeBrg2: TcxGridColumn
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxGrdTblPP
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
    Left = 672
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
      
        'select id, kode, deskripsi, satuan from tbl_barang order by kode' +
        ';')
    Params = <>
    Left = 670
    Top = 94
  end
end
