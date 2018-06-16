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
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
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
    Top = 287
    Width = 593
    Height = 193
    ActivePage = cxTabSheet1
    Style = 7
    TabOrder = 17
    ClientRectBottom = 192
    ClientRectLeft = 1
    ClientRectRight = 592
    ClientRectTop = 21
    object cxTabSheet1: TcxTabSheet
      Caption = 'Default Gudang'
      ImageIndex = 0
      ExplicitLeft = 2
      object cxLabel9: TcxLabel
        Left = 13
        Top = 16
        Caption = 'Penerimaan Barang'
      end
      object cxlGdgPB: TcxLookupComboBox
        Left = 123
        Top = 15
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
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
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
end
