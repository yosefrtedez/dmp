unit unFrmLstBarangJasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplGrid, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ExtCtrls, StdCtrls, cxPC, ZAbstractRODataset, ZDataset;

type
  TfrmLstBarangJasa = class(TfrmTplGrid)
    cxtbBarang: TcxGridDBTableView;
    cxgBarangLevel1: TcxGridLevel;
    cxgBarang: TcxGrid;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxtbBarangid: TcxGridDBColumn;
    cxtbBarangkode: TcxGridDBColumn;
    cxtbBarangdeskripsi: TcxGridDBColumn;
    cxtbBarangstok: TcxGridDBColumn;
    cxtbBarangb_stok: TcxGridDBColumn;
    cxtbBarangsatuan: TcxGridDBColumn;
    cxtbBarangtipe: TcxGridDBColumn;
    cxtbBarangkategori: TcxGridDBColumn;
    cxtbBarangsubkategori: TcxGridDBColumn;
    cxtbBarangdivisi: TcxGridDBColumn;
    cxtbBarangpackinfo: TcxGridDBColumn;
    cxtbBarangf_aktif: TcxGridDBColumn;
    cxtbBaranguser_input: TcxGridDBColumn;
    cxtbBarangtgl_input: TcxGridDBColumn;
    cxtbBaranguser_edit: TcxGridDBColumn;
    cxtbBarangtgl_edit: TcxGridDBColumn;
    cxtbBarangberat: TcxGridDBColumn;
    cxtbBarangpacking: TcxGridDBColumn;
    cxtbBarangberat_per_unit: TcxGridDBColumn;
    cxtbBarangs_berat: TcxGridDBColumn;
    cxtbBarangisi_pak: TcxGridDBColumn;
    cxtbBarangimage: TcxGridDBColumn;
    cxtbBarangwarna: TcxGridDBColumn;
    cxtbBarangpanjang: TcxGridDBColumn;
    cxtbBarangs_panjang: TcxGridDBColumn;
    cxtbBaranglebar: TcxGridDBColumn;
    cxtbBarangs_lebar: TcxGridDBColumn;
    cxtbBarangtebal: TcxGridDBColumn;
    cxtbBarangs_tebal: TcxGridDBColumn;
    cxtbBarangdiameter: TcxGridDBColumn;
    cxtbBarangs_diameter: TcxGridDBColumn;
    cxtbBarangberat_per_unit_b: TcxGridDBColumn;
    cxtbBarangs_berat_per_unit_b: TcxGridDBColumn;
    cxtbBarangf_dijual: TcxGridDBColumn;
    cxtbBarangf_dibeli: TcxGridDBColumn;
    cxtbBarangf_joborder: TcxGridDBColumn;
    cxtbBarangflow_process: TcxGridDBColumn;
    cxtbBarangdiameter_dalam: TcxGridDBColumn;
    cxtbBarangs_diameter_dalam: TcxGridDBColumn;
    cxtbBarangdiameter_luar: TcxGridDBColumn;
    cxtbBarangs_diameter_luar: TcxGridDBColumn;
    cxtbBarangpanjang_lurus: TcxGridDBColumn;
    cxtbBarangberat_per_unit_old: TcxGridDBColumn;
    cxtbBarangf_ed: TcxGridDBColumn;
    cxtbBaranged: TcxGridDBColumn;
    cxtbBarangf_tds: TcxGridDBColumn;
    cxtbBarangtds: TcxGridDBColumn;
    cxtbBaranghrg_kel1: TcxGridDBColumn;
    cxtbBaranghrg_kel2: TcxGridDBColumn;
    cxtbBaranglokasi: TcxGridDBColumn;
    cxtbBaranglokasi_grid: TcxGridDBColumn;
    cxtbBarangf_consumable: TcxGridDBColumn;
    cxtbBarangdeskripsi2: TcxGridDBColumn;
    cxtbBarangberat_per_unit_pack: TcxGridDBColumn;
    cxtbBarangf_lotnumber: TcxGridDBColumn;
    cxtbBarangf_sml: TcxGridDBColumn;
    cxtbBarangf_fai: TcxGridDBColumn;
    cxtbBarangqty_per_pallet: TcxGridDBColumn;
    cxtbBarangleadtime: TcxGridDBColumn;
    cxtbBarangf_brg_cust: TcxGridDBColumn;
    cxtbBarangf_bs_dipakai: TcxGridDBColumn;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstBarangJasa: TfrmLstBarangJasa;

implementation

uses unFrmUtama, unFrmInputBarangJasa, unDM;

{$R *.dfm}

procedure TfrmLstBarangJasa.btnTambahClick(Sender: TObject);
var
  f: TfrmInputBarangJasa;
  ts: TcxTabSheet;
begin
  if not fu.CekTabOpen('Input Barang dan Jasa') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputBarangJasa.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangJasa.Button1Click(Sender: TObject);
var
  f: TfrmInputBarangJasa;
  ts: TcxTabSheet;
begin

  if not frmUtama.CekTabOpen('Input Barang dan Jasa') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputBarangJasa.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    frmUtama.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstBarangJasa.FormCreate(Sender: TObject);
begin
  inherited;
  zqrBarang.Open;
end;

end.
