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
    TabOrder = 2
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxgBarang: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 1
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
        Visible = False
      end
      object cxtbBarangkode: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kode'
        Width = 132
      end
      object cxtbBarangdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 322
      end
      object cxtbBarangstok: TcxGridDBColumn
        Caption = 'Stok'
        DataBinding.FieldName = 'stok'
      end
      object cxtbBarangb_stok: TcxGridDBColumn
        Caption = 'Buffer Stok '
        DataBinding.FieldName = 'b_stok'
      end
      object cxtbBarangsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan2'
        Width = 54
      end
      object cxtbBarangkategori: TcxGridDBColumn
        Caption = 'Kategori'
        DataBinding.FieldName = 'kategori2'
        Width = 103
      end
      object cxtbBarangsubkategori: TcxGridDBColumn
        Caption = 'Sub Kategori'
        DataBinding.FieldName = 'subkategori2'
        Width = 97
      end
      object cxtbBarangtipe: TcxGridDBColumn
        Caption = 'Tipe'
        DataBinding.FieldName = 'tipe2'
        Width = 72
      end
      object cxtbBarangdivisi: TcxGridDBColumn
        DataBinding.FieldName = 'divisi'
        Visible = False
      end
      object cxtbBarangpackinfo: TcxGridDBColumn
        DataBinding.FieldName = 'packinfo'
        Visible = False
      end
      object cxtbBarangf_aktif: TcxGridDBColumn
        DataBinding.FieldName = 'f_aktif'
        Visible = False
      end
      object cxtbBaranguser_input: TcxGridDBColumn
        DataBinding.FieldName = 'user_input'
        Visible = False
      end
      object cxtbBarangtgl_input: TcxGridDBColumn
        DataBinding.FieldName = 'tgl_input'
        Visible = False
      end
      object cxtbBaranguser_edit: TcxGridDBColumn
        DataBinding.FieldName = 'user_edit'
        Visible = False
      end
      object cxtbBarangtgl_edit: TcxGridDBColumn
        DataBinding.FieldName = 'tgl_edit'
        Visible = False
      end
      object cxtbBarangberat: TcxGridDBColumn
        DataBinding.FieldName = 'berat'
        Visible = False
      end
      object cxtbBarangpacking: TcxGridDBColumn
        DataBinding.FieldName = 'packing'
        Visible = False
      end
      object cxtbBarangberat_per_unit: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit'
        Visible = False
      end
      object cxtbBarangs_berat: TcxGridDBColumn
        DataBinding.FieldName = 's_berat'
        Visible = False
      end
      object cxtbBarangisi_pak: TcxGridDBColumn
        DataBinding.FieldName = 'isi_pak'
        Visible = False
      end
      object cxtbBarangimage: TcxGridDBColumn
        DataBinding.FieldName = 'image'
        Visible = False
      end
      object cxtbBarangwarna: TcxGridDBColumn
        DataBinding.FieldName = 'warna'
        Visible = False
      end
      object cxtbBarangpanjang: TcxGridDBColumn
        DataBinding.FieldName = 'panjang'
        Visible = False
      end
      object cxtbBarangs_panjang: TcxGridDBColumn
        DataBinding.FieldName = 's_panjang'
        Visible = False
      end
      object cxtbBaranglebar: TcxGridDBColumn
        DataBinding.FieldName = 'lebar'
        Visible = False
      end
      object cxtbBarangs_lebar: TcxGridDBColumn
        DataBinding.FieldName = 's_lebar'
        Visible = False
      end
      object cxtbBarangtebal: TcxGridDBColumn
        DataBinding.FieldName = 'tebal'
        Visible = False
      end
      object cxtbBarangs_tebal: TcxGridDBColumn
        DataBinding.FieldName = 's_tebal'
        Visible = False
      end
      object cxtbBarangdiameter: TcxGridDBColumn
        DataBinding.FieldName = 'diameter'
        Visible = False
      end
      object cxtbBarangs_diameter: TcxGridDBColumn
        DataBinding.FieldName = 's_diameter'
        Visible = False
      end
      object cxtbBarangberat_per_unit_b: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit_b'
        Visible = False
      end
      object cxtbBarangs_berat_per_unit_b: TcxGridDBColumn
        DataBinding.FieldName = 's_berat_per_unit_b'
        Visible = False
      end
      object cxtbBarangf_dijual: TcxGridDBColumn
        DataBinding.FieldName = 'f_dijual'
        Visible = False
      end
      object cxtbBarangf_dibeli: TcxGridDBColumn
        DataBinding.FieldName = 'f_dibeli'
        Visible = False
      end
      object cxtbBarangf_joborder: TcxGridDBColumn
        DataBinding.FieldName = 'f_joborder'
        Visible = False
      end
      object cxtbBarangflow_process: TcxGridDBColumn
        DataBinding.FieldName = 'flow_process'
        Visible = False
      end
      object cxtbBarangdiameter_dalam: TcxGridDBColumn
        DataBinding.FieldName = 'diameter_dalam'
        Visible = False
      end
      object cxtbBarangs_diameter_dalam: TcxGridDBColumn
        DataBinding.FieldName = 's_diameter_dalam'
        Visible = False
      end
      object cxtbBarangdiameter_luar: TcxGridDBColumn
        DataBinding.FieldName = 'diameter_luar'
        Visible = False
      end
      object cxtbBarangs_diameter_luar: TcxGridDBColumn
        DataBinding.FieldName = 's_diameter_luar'
        Visible = False
      end
      object cxtbBarangpanjang_lurus: TcxGridDBColumn
        DataBinding.FieldName = 'panjang_lurus'
        Visible = False
      end
      object cxtbBarangberat_per_unit_old: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit_old'
        Visible = False
      end
      object cxtbBarangf_ed: TcxGridDBColumn
        DataBinding.FieldName = 'f_ed'
        Visible = False
      end
      object cxtbBaranged: TcxGridDBColumn
        DataBinding.FieldName = 'ed'
        Visible = False
      end
      object cxtbBarangf_tds: TcxGridDBColumn
        DataBinding.FieldName = 'f_tds'
        Visible = False
      end
      object cxtbBarangtds: TcxGridDBColumn
        DataBinding.FieldName = 'tds'
        Visible = False
      end
      object cxtbBaranghrg_kel1: TcxGridDBColumn
        DataBinding.FieldName = 'hrg_kel1'
        Visible = False
      end
      object cxtbBaranghrg_kel2: TcxGridDBColumn
        DataBinding.FieldName = 'hrg_kel2'
        Visible = False
      end
      object cxtbBaranglokasi: TcxGridDBColumn
        DataBinding.FieldName = 'lokasi'
        Visible = False
      end
      object cxtbBaranglokasi_grid: TcxGridDBColumn
        DataBinding.FieldName = 'lokasi_grid'
        Visible = False
      end
      object cxtbBarangf_consumable: TcxGridDBColumn
        DataBinding.FieldName = 'f_consumable'
        Visible = False
      end
      object cxtbBarangdeskripsi2: TcxGridDBColumn
        DataBinding.FieldName = 'deskripsi2'
        Visible = False
      end
      object cxtbBarangberat_per_unit_pack: TcxGridDBColumn
        DataBinding.FieldName = 'berat_per_unit_pack'
        Visible = False
      end
      object cxtbBarangf_lotnumber: TcxGridDBColumn
        DataBinding.FieldName = 'f_lotnumber'
        Visible = False
      end
      object cxtbBarangf_sml: TcxGridDBColumn
        DataBinding.FieldName = 'f_sml'
        Visible = False
      end
      object cxtbBarangf_fai: TcxGridDBColumn
        DataBinding.FieldName = 'f_fai'
        Visible = False
      end
      object cxtbBarangqty_per_pallet: TcxGridDBColumn
        DataBinding.FieldName = 'qty_per_pallet'
        Visible = False
      end
      object cxtbBarangleadtime: TcxGridDBColumn
        DataBinding.FieldName = 'leadtime'
        Visible = False
      end
      object cxtbBarangf_brg_cust: TcxGridDBColumn
        DataBinding.FieldName = 'f_brg_cust'
        Visible = False
      end
      object cxtbBarangf_bs_dipakai: TcxGridDBColumn
        DataBinding.FieldName = 'f_bs_dipakai'
        Visible = False
      end
    end
    object cxgBarangLevel1: TcxGridLevel
      GridView = cxtbBarang
    end
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.*, b.satuan satuan2, c.kategori kategori2, d.subkategor' +
        'i subkategori2, e.tipe tipe2'
      'FROM tbl_barang a'
      'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id'
      'LEFT JOIN tbl_kategori_brg c ON a.id_kategori = c.id'
      'LEFT JOIN tbl_subkategori_brg d ON a.id_subkategori = d.id'
      'LEFT JOIN tbl_tipe_brg e ON a.id_tipe = e.id')
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
