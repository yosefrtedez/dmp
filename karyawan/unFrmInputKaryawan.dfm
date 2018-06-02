inherited frmInputKaryawan: TfrmInputKaryawan
  Caption = 'Input Karyawan'
  ClientHeight = 663
  ClientWidth = 1058
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1058
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage [0]
    Left = 445
    Top = 64
    Width = 167
    Height = 190
    Visible = False
  end
  inherited Panel1: TPanel
    Width = 1058
    ExplicitWidth = 1058
  end
  inherited Panel2: TPanel
    Top = 614
    Width = 1058
    ExplicitTop = 614
    ExplicitWidth = 1058
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxlbl1: TcxLabel
    Left = 23
    Top = 74
    Caption = 'Nik'
  end
  object cxtNik: TcxTextEdit
    Left = 99
    Top = 71
    Properties.CharCase = ecUpperCase
    TabOrder = 3
    Width = 99
  end
  object cxtNama: TcxTextEdit
    Left = 99
    Top = 95
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 238
  end
  object cxtFoto: TcxTextEdit
    Left = 445
    Top = 259
    TabOrder = 5
    Visible = False
    Width = 248
  end
  object cxlbl2: TcxLabel
    Left = 23
    Top = 98
    Caption = 'Nama'
  end
  object cxlbl3: TcxLabel
    Left = 23
    Top = 124
    Caption = 'Jabatan'
  end
  object btn1: TcxButton
    Left = 703
    Top = 256
    Width = 59
    Height = 26
    Caption = 'Cari Foto'
    TabOrder = 8
    OnClick = btn1Click
  end
  object cxlbl4: TcxLabel
    Left = 23
    Top = 147
    Caption = 'Divisi'
  end
  object cxlbl5: TcxLabel
    Left = 23
    Top = 170
    Caption = 'Departemen'
  end
  object cxchkAktif: TcxCheckBox
    Left = 208
    Top = 71
    Caption = 'Aktif'
    TabOrder = 11
    Width = 82
  end
  object cbbJabatan: TcxLookupComboBox
    Left = 99
    Top = 120
    Properties.KeyFieldNames = 'jabatan'
    Properties.ListColumns = <
      item
        Caption = 'Nama'
        FieldName = 'jabatan'
      end>
    Properties.ListSource = dsJabatan
    TabOrder = 12
    Width = 183
  end
  object cbbDivisi: TcxLookupComboBox
    Left = 99
    Top = 142
    Properties.KeyFieldNames = 'divisi'
    Properties.ListColumns = <
      item
        Caption = 'Divisi'
        FieldName = 'divisi'
      end>
    Properties.ListSource = dsDivisi
    TabOrder = 13
    Width = 183
  end
  object cbb1: TcxLookupComboBox
    Left = 99
    Top = 167
    Properties.KeyFieldNames = 'divisi'
    Properties.ListColumns = <
      item
        Caption = 'Divisi'
        FieldName = 'divisi'
      end>
    Properties.ListSource = dsDivisi
    TabOrder = 14
    Width = 183
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
  object zqrDivisi: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_divisi order by divisi;')
    Params = <>
    Left = 835
    Top = 80
  end
  object dsDivisi: TDataSource
    DataSet = zqrDivisi
    Left = 865
    Top = 82
  end
  object zqrDepartemen: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_departemen  order by departemen;')
    Params = <>
    Left = 820
    Top = 153
  end
  object dsDepartemen: TDataSource
    DataSet = zqrDepartemen
    Left = 899
    Top = 155
  end
end
