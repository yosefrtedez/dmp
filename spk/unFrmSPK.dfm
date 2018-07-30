inherited frmSPK: TfrmSPK
  Caption = 'Surat Perintah Kerja (SPK)'
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 894
  ExplicitHeight = 553
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
    TabOrder = 19
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
    Top = 199
    Caption = 'Tgl. Produksi'
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 226
    Caption = 'Mesin'
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 253
    Caption = 'Bill Of Material'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 276
    Width = 875
    Height = 198
    TabOrder = 18
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
      DataController.OnRecordChanged = cxtbBomDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
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
    Left = 8
    Top = 172
    Caption = 'Qty. SPK'
  end
  object cxDateEdit1: TcxDateEdit
    Left = 101
    Top = 198
    TabOrder = 13
    Width = 121
  end
  object cxlMesin: TcxLookupComboBox
    Left = 101
    Top = 225
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nama Mesin'
        FieldName = 'nama'
      end>
    Properties.ListSource = dsMesin
    TabOrder = 15
    Width = 177
  end
  object cxsQtySPK: TcxSpinEdit
    Left = 101
    Top = 171
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    Properties.DisplayFormat = '#,#0.00'
    Properties.ValueType = vtFloat
    TabOrder = 10
    Width = 92
  end
  object cxtSatuan: TcxTextEdit
    Left = 200
    Top = 171
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 121
  end
  object cxtNoMO: TcxTextEdit
    Left = 284
    Top = 64
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 177
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
