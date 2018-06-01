inherited frmInputUser: TfrmInputUser
  Caption = 'Input User'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 98
      Height = 19
      Caption = 'Master User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'User Login'
  end
  object cxtUserLogin: TcxTextEdit
    Left = 104
    Top = 63
    TabOrder = 3
    Width = 265
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Nama Lengkap'
  end
  object cxtNamaLengkap: TcxTextEdit
    Left = 104
    Top = 90
    TabOrder = 5
    Width = 377
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 118
    Caption = 'Departemen'
  end
  object cxlDept: TcxLookupComboBox
    Left = 104
    Top = 117
    Properties.KeyFieldNames = 'departemen'
    Properties.ListColumns = <
      item
        Caption = 'Departemen'
        FieldName = 'departemen'
      end>
    Properties.ListSource = dsDept
    TabOrder = 7
    Width = 265
  end
  object zqrDept: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT * FROM tbl_dept')
    Params = <>
    Left = 672
    Top = 152
  end
  object dsDept: TDataSource
    DataSet = zqrDept
    Left = 752
    Top = 152
  end
end
