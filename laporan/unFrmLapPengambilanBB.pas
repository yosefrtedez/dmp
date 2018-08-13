unit unFrmLapPengambilanBB;

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
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, ZAbstractRODataset, ZDataset,
  cxGridExportLink, ShellAPI, cxSpinEdit;

type
  TfrmLapPengambilanBB = class(TfrmTplGrid)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxdTgl2: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnProses: TButton;
    zqrBB: TZReadOnlyQuery;
    dsBB: TDataSource;
    Button1: TButton;
    Label13: TLabel;
    Button2: TButton;
    cxGrid1DBTableView1no_spk: TcxGridDBColumn;
    cxGrid1DBTableView1no_bukti: TcxGridDBColumn;
    cxGrid1DBTableView1tanggal: TcxGridDBColumn;
    cxGrid1DBTableView1deskripsi_spk: TcxGridDBColumn;
    cxGrid1DBTableView1qty_spk: TcxGridDBColumn;
    cxGrid1DBTableView1deskripsi_bom: TcxGridDBColumn;
    cxGrid1DBTableView1qty_bom: TcxGridDBColumn;
    cxGrid1DBTableView1qty_pengambilan: TcxGridDBColumn;
    cxGrid1DBTableView1satuan: TcxGridDBColumn;
    cxGrid1DBTableView1operator: TcxGridDBColumn;
    cxGrid1DBTableView1kode: TcxGridDBColumn;
    cxGrid1DBTableView1user: TcxGridDBColumn;
    cxGrid1DBTableView1user_dept: TcxGridDBColumn;
    cxGrid1DBTableView1tgl_edit: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapPengambilanBB: TfrmLapPengambilanBB;

implementation

uses unTools, unAplikasi, unDM;

{$R *.dfm}

procedure TfrmLapPengambilanBB.btnProsesClick(Sender: TObject);
begin
  inherited;
  zqrBB.Close;
  zqrBB.ParamByName('tgl1').AsDate := cxdTgl1.Date;
  zqrBB.ParamByName('tgl2').AsDate := cxdTgl2.Date;
  zqrBB.Open;
end;

procedure TfrmLapPengambilanBB.Button1Click(Sender: TObject);
begin
  try
  ExportGridToExcel(aplikasi.AppPath + '\tmp.xls', cxGrid1);
  ShellExecute(Handle,'open', PChar(aplikasi.AppPath + '\tmp.xls'),''
    ,nil,SW_SHOWNORMAL);
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
    end;
  end;
end;

procedure TfrmLapPengambilanBB.Button2Click(Sender: TObject);
begin
  inherited;
  btnKeluarClick(nil);
end;

procedure TfrmLapPengambilanBB.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTgl1.Date := unTools.FDOM(Aplikasi.TanggalServer);
  cxdTgl2.Date := unTools.LDOM(Aplikasi.TanggalServer);
end;

end.
