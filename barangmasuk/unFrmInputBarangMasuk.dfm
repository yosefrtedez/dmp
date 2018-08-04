inherited frmInputBarangMasuk: TfrmInputBarangMasuk
  Caption = 'Input Barang Masuk'
  ClientHeight = 619
  ClientWidth = 973
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 973
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 973
    ExplicitWidth = 973
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 164
      Height = 19
      Caption = 'Input Barang Masuk'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 570
    Width = 973
    TabOrder = 10
    ExplicitTop = 570
    ExplicitWidth = 973
    inherited btnSimpan: TButton
      Top = 11
      OnClick = btnSimpanClick
      ExplicitTop = 11
    end
  end
  object cxlbl1: TcxLabel
    Left = 11
    Top = 62
    Caption = 'No. Bukti'
  end
  object cxlbl4: TcxLabel
    Left = 11
    Top = 89
    Caption = 'Tgl. Transaksi'
  end
  object cxdTglDatang: TcxDateEdit
    Left = 112
    Top = 88
    TabOrder = 3
    Width = 146
  end
  object cxtNoBukti: TcxTextEdit
    Left = 112
    Top = 61
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 146
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 116
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 115
    Properties.CharCase = ecUpperCase
    TabOrder = 5
    Width = 416
  end
  object cxgrdPP: TcxGrid
    Left = 8
    Top = 177
    Width = 957
    Height = 211
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 9
    object cxtbBarangMasuk: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
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
      DataController.OnBeforePost = cxtbBarangMasukDataControllerBeforePost
      DataController.OnRecordChanged = cxtbBarangMasukDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        OnGetDisplayText = cxColNoGetDisplayText
        Width = 32
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 95
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'deskripsi'
          end
          item
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBarang
        Width = 237
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty. Masuk'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
        Properties.ValueType = vtFloat
        Width = 73
      end
      object cxColGudang: TcxGridColumn
        Caption = 'Gudang'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end
          item
            Caption = 'ID'
            FieldName = 'id'
          end>
        Properties.ListSource = dsGudang
        Width = 80
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 82
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbBarangMasuk
    end
  end
  object cxLabel6: TcxLabel
    Left = 11
    Top = 144
    Caption = 'Jenis Transaksi'
  end
  object cxCmbJenisTrs: TcxComboBox
    Left = 112
    Top = 143
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 7
    Width = 146
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, deskripsi '
      'from tbl_barang')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 581
    Top = 56
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 633
    Top = 56
  end
  object zqrGudang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select * from tbl_gudang order by id')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 717
    Top = 63
  end
  object dsGudang: TDataSource
    DataSet = zqrGudang
    Left = 752
    Top = 63
  end
end
