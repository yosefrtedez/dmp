inherited frmInputTransferBarang: TfrmInputTransferBarang
  Caption = 'Input Transfer Barang'
  ClientWidth = 971
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 971
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 971
    ExplicitWidth = 971
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 181
      Height = 19
      Caption = 'Input Transfer Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 971
    ExplicitWidth = 971
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 66
    Caption = 'No. Transaksi'
  end
  object cxtNoTrans: TcxTextEdit
    Tag = 1
    Left = 91
    Top = 62
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 121
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 92
    Caption = 'Tgl. Transaksi'
  end
  object cxdTglTrs: TcxDateEdit
    Left = 91
    Top = 89
    Properties.ReadOnly = False
    TabOrder = 5
    Width = 121
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 152
    Width = 952
    Height = 216
    TabOrder = 6
    object cxTblTransBarang: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skSum
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###'
          Kind = skSum
        end
        item
          Format = '#,###'
          Kind = skSum
        end
        item
          Format = '#,###'
          Kind = skSum
        end
        item
          Format = '#,###'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxTblTransBarangDataControllerBeforePost
      DataController.OnRecordChanged = cxTblTransBarangDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        OnGetDisplayText = cxColNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 42
      end
      object cxColKode: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 108
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'deskripsi'
          end
          item
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBarang
        HeaderAlignmentHorz = taCenter
        Width = 193
      end
      object cxColGudangAsal: TcxGridColumn
        Caption = 'Gudang Asal'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'nama'
          end
          item
            FieldName = 'kode'
          end>
        Properties.ListSource = dsGudang
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
      object cxColGudangTujuan: TcxGridColumn
        Caption = 'Gudang Tujuan'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'nama'
          end
          item
            FieldName = 'kode'
          end>
        Properties.ListSource = dsGudang
        HeaderAlignmentHorz = taCenter
        Width = 151
      end
      object cxColIdSatuan: TcxGridColumn
        Visible = False
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object cxColStock: TcxGridColumn
        Caption = 'Stock'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##0'
        Properties.EditFormat = '#,##0'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty.Transfer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##0'
        Properties.EditFormat = '#,##0'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblTransBarang
    end
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 115
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Tag = 1
    Left = 91
    Top = 114
    Properties.ReadOnly = False
    TabOrder = 8
    Width = 462
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select id,kode, deskripsi, satuan from tbl_barang order by kode;')
    Params = <>
    Left = 286
    Top = 6
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 319
    Top = 7
  end
  object zqrGudang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_gudang WHERE f_aktif=1')
    Params = <>
    Left = 382
    Top = 6
  end
  object dsGudang: TDataSource
    DataSet = zqrGudang
    Left = 431
    Top = 7
  end
end
