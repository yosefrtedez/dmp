inherited frmSettingProgram: TfrmSettingProgram
  Caption = 'Setting Program'
  OnShow = FormShow
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 134
      Height = 19
      Caption = 'Setting Program'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 18
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'Nama Perusahaan'
  end
  object cxtNamaPerusahaan: TcxTextEdit
    Left = 136
    Top = 63
    TabOrder = 1
    Width = 449
  end
  object cxtAlamat: TcxTextEdit
    Left = 136
    Top = 90
    TabOrder = 3
    Width = 449
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Alamat'
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 118
    Caption = 'Kota'
  end
  object cxtKota: TcxTextEdit
    Left = 136
    Top = 117
    TabOrder = 5
    Width = 449
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 145
    Caption = 'Kode Pos'
  end
  object cxtKodePos: TcxTextEdit
    Left = 136
    Top = 144
    TabOrder = 7
    Width = 185
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 253
    Caption = 'NPWP'
  end
  object cxtNPWP: TcxTextEdit
    Left = 136
    Top = 252
    TabOrder = 15
    Width = 449
  end
  object cxLabel6: TcxLabel
    Left = 10
    Top = 172
    Caption = 'Telpon'
  end
  object cxtTelpon: TcxTextEdit
    Left = 136
    Top = 171
    TabOrder = 9
    Width = 281
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 226
    Caption = 'Email'
  end
  object cxtEmail: TcxTextEdit
    Left = 136
    Top = 225
    TabOrder = 13
    Width = 449
  end
  object cxLabel8: TcxLabel
    Left = 10
    Top = 199
    Caption = 'Fax'
  end
  object cxtFax: TcxTextEdit
    Left = 136
    Top = 198
    TabOrder = 11
    Width = 281
  end
  object cxPageControl1: TcxPageControl
    Left = 8
    Top = 285
    Width = 593
    Height = 211
    ActivePage = cxTabSheet1
    Style = 7
    TabOrder = 17
    ClientRectBottom = 210
    ClientRectLeft = 1
    ClientRectRight = 592
    ClientRectTop = 21
    object cxTabSheet1: TcxTabSheet
      Caption = 'Default Gudang dan Satuan'
      ImageIndex = 0
      object GroupBox1: TGroupBox
        Left = 13
        Top = 3
        Width = 286
        Height = 106
        Caption = 'Default Gudang '
        TabOrder = 0
        object cxlGdgPB: TcxLookupComboBox
          Left = 131
          Top = 19
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = 'Kode Gudang'
              FieldName = 'kode'
            end>
          Properties.ListSource = dsGdg
          TabOrder = 0
          Width = 145
        end
        object cxlGdgBB: TcxLookupComboBox
          Left = 131
          Top = 46
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = 'Kode Gudang'
              FieldName = 'kode'
            end>
          Properties.ListSource = dsGdg
          TabOrder = 2
          Width = 145
        end
        object cxlGdgBJ: TcxLookupComboBox
          Left = 131
          Top = 73
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = 'Kode Gudang'
              FieldName = 'kode'
            end>
          Properties.ListSource = dsGdg
          TabOrder = 4
          Width = 145
        end
        object cxLabel9: TcxLabel
          Left = 13
          Top = 20
          Caption = 'Penerimaan Barang'
        end
        object cxLabel10: TcxLabel
          Left = 13
          Top = 47
          Caption = 'Pengambilan Bahan '
        end
        object cxLabel11: TcxLabel
          Left = 13
          Top = 74
          Caption = 'Hasil Produksi'
        end
      end
      object GroupBox2: TGroupBox
        Left = 13
        Top = 113
        Width = 286
        Height = 64
        Caption = 'Default Satuan '
        TabOrder = 1
        object cxLabel12: TcxLabel
          Left = 13
          Top = 23
          Caption = 'Satuan Produksi'
        end
        object cxlSatProd: TcxLookupComboBox
          Left = 131
          Top = 22
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = 'Satuan'
              FieldName = 'satuan'
            end>
          Properties.ListSource = dsSat
          TabOrder = 0
          Width = 145
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      TabVisible = False
    end
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_gudang')
    Params = <>
    Left = 648
    Top = 200
  end
  object dsGdg: TDataSource
    DataSet = zqrGdg
    Left = 720
    Top = 200
  end
  object zqrSat: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, satuan FROM tbl_satuan')
    Params = <>
    Left = 656
    Top = 288
  end
  object dsSat: TDataSource
    DataSet = zqrSat
    Left = 728
    Top = 288
  end
end
