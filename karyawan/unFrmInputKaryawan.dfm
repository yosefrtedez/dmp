inherited frmInputKaryawan: TfrmInputKaryawan
  Caption = 'Input Karyawan'
  ClientHeight = 663
  ClientWidth = 1058
  OnShow = FormShow
  ExplicitWidth = 1058
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage [0]
    Left = 445
    Top = 63
    Width = 167
    Height = 190
    Visible = False
  end
  inherited Panel1: TPanel
    Width = 1058
    ExplicitWidth = 1058
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 130
      Height = 19
      Caption = 'Input Karyawan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 614
    Width = 1058
    TabOrder = 14
    ExplicitTop = 614
    ExplicitWidth = 1058
  end
  object cxlbl1: TcxLabel
    Left = 10
    Top = 66
    Caption = 'Nik'
  end
  object cxtNik: TcxTextEdit
    Left = 83
    Top = 63
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 99
  end
  object cxtNama: TcxTextEdit
    Left = 83
    Top = 90
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 238
  end
  object cxtFoto: TcxTextEdit
    Left = 445
    Top = 259
    TabOrder = 13
    Visible = False
    Width = 248
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 93
    Caption = 'Nama'
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 122
    Caption = 'Jabatan'
  end
  object btn1: TcxButton
    Left = 703
    Top = 256
    Width = 59
    Height = 26
    Caption = 'Cari Foto'
    TabOrder = 12
    Visible = False
    OnClick = btn1Click
  end
  object cxlbl4: TcxLabel
    Left = 10
    Top = 172
    Caption = 'Divisi'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 145
    Caption = 'Departemen'
  end
  object cxchkAktif: TcxCheckBox
    Left = 192
    Top = 63
    Caption = 'Aktif'
    TabOrder = 2
    Width = 82
  end
  object cxcboJabatan: TcxLookupComboBox
    Left = 83
    Top = 117
    Properties.KeyFieldNames = 'jabatan'
    Properties.ListColumns = <
      item
        Caption = 'JABATAN'
        FieldName = 'jabatan'
      end>
    Properties.ListSource = dsJabatan
    TabOrder = 6
    Width = 183
  end
  object cxcboDepartemen: TcxLookupComboBox
    Left = 83
    Top = 144
    Properties.KeyFieldNames = 'departemen'
    Properties.ListColumns = <
      item
        Caption = 'DEPARTEMEN'
        FieldName = 'departemen'
      end>
    Properties.ListSource = dsDepartemen
    Properties.OnChange = cxcboDepartemenPropertiesChange
    TabOrder = 8
    OnClick = cxcboDepartemenClick
    Width = 183
  end
  object cxCboDivisi: TcxComboBox
    Left = 83
    Top = 171
    TabOrder = 10
    Width = 200
  end
  object dlgOpen1: TOpenDialog
    Filter = 'jpg'
    Left = 663
    Top = 122
  end
  object zqrJabatan: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_jabatan')
    Params = <>
    Left = 746
    Top = 77
  end
  object dsJabatan: TDataSource
    DataSet = zqrJabatan
    Left = 776
    Top = 77
  end
  object zqrDepartemen: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_dept  order by departemen')
    Params = <>
    Left = 886
    Top = 93
  end
  object dsDepartemen: TDataSource
    DataSet = zqrDepartemen
    Left = 942
    Top = 83
  end
end
