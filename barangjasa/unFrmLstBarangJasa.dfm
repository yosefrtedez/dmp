inherited frmLstBarangJasa: TfrmLstBarangJasa
  BorderIcons = []
  Caption = 'Barang dan Jasa'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 119
      Height = 19
      Caption = 'Master Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
  end
  object cxgBarang: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbBarang: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBarang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbBarangid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
      end
      object cxtbBarangkode: TcxGridDBColumn
        DataBinding.FieldName = 'kode'
      end
      object cxtbBarangdeskripsi: TcxGridDBColumn
        DataBinding.FieldName = 'deskripsi'
      end
      object cxtbBarangstok: TcxGridDBColumn
        DataBinding.FieldName = 'stok'
      end
      object cxtbBarangb_stok: TcxGridDBColumn
        DataBinding.FieldName = 'b_stok'
      end
      object cxtbBarangsatuan: TcxGridDBColumn
        DataBinding.FieldName = 'satuan'
      end
      object cxtbBarangtipe: TcxGridDBColumn
        DataBinding.FieldName = 'tipe'
      end
      object cxtbBarangkategori: TcxGridDBColumn
        DataBinding.FieldName = 'kategori'
      end
      object cxtbBarangsubkategori: TcxGridDBColumn
        DataBinding.FieldName = 'subkategori'
      end
      object cxtbBarangdivisi: TcxGridDBColumn
        DataBinding.FieldName = 'divisi'
      end
      object cxtbBarangpackinfo: TcxGridDBColumn
        DataBinding.FieldName = 'packinfo'
      end
      object cxtbBarangf_aktif: TcxGridDBColumn
        DataBinding.FieldName = 'f_aktif'
      end
      object cxtbBaranguser_input: TcxGridDBColumn
        DataBinding.FieldName = 'user_input'
      end
      object cxtbBarangtgl_input: TcxGridDBColumn
        DataBinding.FieldName = 'tgl_input'
      end
      object cxtbBaranguser_edit: TcxGridDBColumn
        DataBinding.FieldName = 'user_edit'
      end
      object cxtbBarangtgl_edit: TcxGridDBColumn
        DataBinding.FieldName = 'tgl_edit'
      end
      object cxtbBarangberat: TcxGridDBColumn
        DataBinding.FieldName = 'berat'
      end
      object cxtbBarangpacking: TcxGridDBColumn
        DataBinding.FieldName = 'packing'
      end
      object cxtbBarangberat_per_unit: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit'
      end
      object cxtbBarangs_berat: TcxGridDBColumn
        DataBinding.FieldName = 's_berat'
      end
      object cxtbBarangisi_pak: TcxGridDBColumn
        DataBinding.FieldName = 'isi_pak'
      end
      object cxtbBarangimage: TcxGridDBColumn
        DataBinding.FieldName = 'image'
      end
      object cxtbBarangwarna: TcxGridDBColumn
        DataBinding.FieldName = 'warna'
      end
      object cxtbBarangpanjang: TcxGridDBColumn
        DataBinding.FieldName = 'panjang'
      end
      object cxtbBarangs_panjang: TcxGridDBColumn
        DataBinding.FieldName = 's_panjang'
      end
      object cxtbBaranglebar: TcxGridDBColumn
        DataBinding.FieldName = 'lebar'
      end
      object cxtbBarangs_lebar: TcxGridDBColumn
        DataBinding.FieldName = 's_lebar'
      end
      object cxtbBarangtebal: TcxGridDBColumn
        DataBinding.FieldName = 'tebal'
      end
      object cxtbBarangs_tebal: TcxGridDBColumn
        DataBinding.FieldName = 's_tebal'
      end
      object cxtbBarangdiameter: TcxGridDBColumn
        DataBinding.FieldName = 'diameter'
      end
      object cxtbBarangs_diameter: TcxGridDBColumn
        DataBinding.FieldName = 's_diameter'
      end
      object cxtbBarangberat_per_unit_b: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit_b'
      end
      object cxtbBarangs_berat_per_unit_b: TcxGridDBColumn
        DataBinding.FieldName = 's_berat_per_unit_b'
      end
      object cxtbBarangf_dijual: TcxGridDBColumn
        DataBinding.FieldName = 'f_dijual'
      end
      object cxtbBarangf_dibeli: TcxGridDBColumn
        DataBinding.FieldName = 'f_dibeli'
      end
      object cxtbBarangf_joborder: TcxGridDBColumn
        DataBinding.FieldName = 'f_joborder'
      end
      object cxtbBarangflow_process: TcxGridDBColumn
        DataBinding.FieldName = 'flow_process'
      end
      object cxtbBarangdiameter_dalam: TcxGridDBColumn
        DataBinding.FieldName = 'diameter_dalam'
      end
      object cxtbBarangs_diameter_dalam: TcxGridDBColumn
        DataBinding.FieldName = 's_diameter_dalam'
      end
      object cxtbBarangdiameter_luar: TcxGridDBColumn
        DataBinding.FieldName = 'diameter_luar'
      end
      object cxtbBarangs_diameter_luar: TcxGridDBColumn
        DataBinding.FieldName = 's_diameter_luar'
      end
      object cxtbBarangpanjang_lurus: TcxGridDBColumn
        DataBinding.FieldName = 'panjang_lurus'
      end
      object cxtbBarangberat_per_unit_old: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit_old'
      end
      object cxtbBarangf_ed: TcxGridDBColumn
        DataBinding.FieldName = 'f_ed'
      end
      object cxtbBaranged: TcxGridDBColumn
        DataBinding.FieldName = 'ed'
      end
      object cxtbBarangf_tds: TcxGridDBColumn
        DataBinding.FieldName = 'f_tds'
      end
      object cxtbBarangtds: TcxGridDBColumn
        DataBinding.FieldName = 'tds'
      end
      object cxtbBaranghrg_kel1: TcxGridDBColumn
        DataBinding.FieldName = 'hrg_kel1'
      end
      object cxtbBaranghrg_kel2: TcxGridDBColumn
        DataBinding.FieldName = 'hrg_kel2'
      end
      object cxtbBaranglokasi: TcxGridDBColumn
        DataBinding.FieldName = 'lokasi'
      end
      object cxtbBaranglokasi_grid: TcxGridDBColumn
        DataBinding.FieldName = 'lokasi_grid'
      end
      object cxtbBarangf_consumable: TcxGridDBColumn
        DataBinding.FieldName = 'f_consumable'
      end
      object cxtbBarangdeskripsi2: TcxGridDBColumn
        DataBinding.FieldName = 'deskripsi2'
      end
      object cxtbBarangberat_per_unit_pack: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit_pack'
      end
      object cxtbBarangf_lotnumber: TcxGridDBColumn
        DataBinding.FieldName = 'f_lotnumber'
      end
      object cxtbBarangf_sml: TcxGridDBColumn
        DataBinding.FieldName = 'f_sml'
      end
      object cxtbBarangf_fai: TcxGridDBColumn
        DataBinding.FieldName = 'f_fai'
      end
      object cxtbBarangqty_per_pallet: TcxGridDBColumn
        DataBinding.FieldName = 'qty_per_pallet'
      end
      object cxtbBarangleadtime: TcxGridDBColumn
        DataBinding.FieldName = 'leadtime'
      end
      object cxtbBarangf_brg_cust: TcxGridDBColumn
        DataBinding.FieldName = 'f_brg_cust'
      end
      object cxtbBarangf_bs_dipakai: TcxGridDBColumn
        DataBinding.FieldName = 'f_bs_dipakai'
      end
    end
    object cxgBarangLevel1: TcxGridLevel
      GridView = cxtbBarang
    end
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_barang')
    Params = <>
    Left = 824
    Top = 192
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 896
    Top = 192
  end
end
