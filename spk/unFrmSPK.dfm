inherited frmSPK: TfrmSPK
  Caption = 'Surat Perintah Kerja (SPK)'
  ClientHeight = 620
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 894
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 219
      Height = 19
      Caption = 'Surat Perintah Kerja (SPK)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 571
    TabOrder = 27
    ExplicitTop = 571
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 65
    Caption = 'No. SO / No. MO '
  end
  object cxtNoSO: TcxTextEdit
    Left = 101
    Top = 64
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 177
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 146
    Caption = 'No. SPK'
  end
  object cxtNoSPK: TcxTextEdit
    Left = 101
    Top = 145
    Properties.ReadOnly = True
    TabOrder = 8
    Width = 177
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 254
    Caption = 'Tgl. Produksi'
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 281
    Caption = 'Mesin'
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 316
    Caption = 'Bill Of Material'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 339
    Width = 875
    Height = 198
    TabOrder = 26
    object cxtbBom: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbBomDataControllerBeforePost
      DataController.OnRecordChanged = cxtbBomDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 73
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end>
        Properties.ListSource = dsBrg
        Width = 304
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty.'
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
      end
      object cxColIdSatuan: TcxGridColumn
      end
      object cxColId: TcxGridColumn
        DataBinding.ValueType = 'Integer'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbBom
    end
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 92
    Caption = 'Kode Barang'
  end
  object cxtKodeBrg: TcxTextEdit
    Left = 101
    Top = 91
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 177
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 119
    Caption = 'Nama Barang'
  end
  object cxtDeskripsi: TcxTextEdit
    Left = 101
    Top = 118
    Properties.ReadOnly = True
    TabOrder = 6
    Width = 588
  end
  object cxLabel8: TcxLabel
    Left = 7
    Top = 199
    Caption = 'Qty. SPK'
  end
  object cxdTglPrd: TcxDateEdit
    Left = 101
    Top = 253
    TabOrder = 21
    Width = 121
  end
  object cxlMesin: TcxLookupComboBox
    Left = 101
    Top = 280
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nama Mesin'
        FieldName = 'nama'
      end>
    Properties.ListSource = dsMesin
    TabOrder = 23
    Width = 177
  end
  object cxsQtySPK: TcxSpinEdit
    Left = 101
    Top = 199
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    Properties.DisplayFormat = '#,#0.00'
    Properties.ValueType = vtFloat
    TabOrder = 18
    Width = 92
  end
  object cxtNoMO: TcxTextEdit
    Left = 284
    Top = 64
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 177
  end
  object cxLabel9: TcxLabel
    Left = 7
    Top = 172
    Caption = 'Qty. SO'
  end
  object cxsQtySO: TcxSpinEdit
    Left = 101
    Top = 172
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    TabOrder = 13
    Width = 92
  end
  object cxLabel10: TcxLabel
    Left = 199
    Top = 198
    Caption = 'Toleransi'
  end
  object cxsToleransi: TcxSpinEdit
    Left = 279
    Top = 198
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 90.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 15
    Width = 92
  end
  object cxLabel11: TcxLabel
    Left = 374
    Top = 198
    Caption = '%'
  end
  object cxLabel12: TcxLabel
    Left = 199
    Top = 171
    Caption = 'Qty. SPK Total'
  end
  object cxsTotalSPK: TcxSpinEdit
    Left = 279
    Top = 171
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    TabOrder = 11
    Width = 92
  end
  object cxLabel13: TcxLabel
    Left = 8
    Top = 227
    Caption = 'Satuan'
  end
  object cxtSatuan: TcxTextEdit
    Left = 101
    Top = 226
    Properties.ReadOnly = True
    TabOrder = 19
    Width = 92
  end
  object zqrMesin: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT id, kode, nama FROM tbl_mesin'
      'ORDER BY nama')
    Params = <>
    Left = 576
    Top = 184
  end
  object dsMesin: TDataSource
    DataSet = zqrMesin
    Left = 632
    Top = 184
  end
  object dsBrg: TDataSource
    DataSet = zqrBrg
    Left = 688
    Top = 144
  end
  object zqrBrg: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT id, kode, deskripsi'
      'FROM tbl_barang '
      'WHERE f_aktif = 1')
    Params = <>
    Left = 632
    Top = 144
  end
end
