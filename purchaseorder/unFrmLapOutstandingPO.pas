unit unFrmLapOutstandingPO;

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
  cxGridExportLink, ShellAPI, cxSpinEdit, cxCheckBox;

type
  TfrmLapOutstandingPO = class(TfrmTplGrid)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxdTgl2: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnProses: TButton;
    zqrPO: TZReadOnlyQuery;
    dsPO: TDataSource;
    Button1: TButton;
    Label13: TLabel;
    Button2: TButton;
    cxGrid1DBTableView1no_bukti: TcxGridDBColumn;
    cxGrid1DBTableView1nama_supplier: TcxGridDBColumn;
    cxGrid1DBTableView1kode_brg: TcxGridDBColumn;
    cxGrid1DBTableView1deskripsi: TcxGridDBColumn;
    cxGrid1DBTableView1qty_po: TcxGridDBColumn;
    cxGrid1DBTableView1qty_terima: TcxGridDBColumn;
    cxGrid1DBTableView1satuan: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    zqrPB: TZReadOnlyQuery;
    dsPB: TDataSource;
    Panel4: TPanel;
    cxtbPBDet: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxtbPBDettanggal: TcxGridDBColumn;
    cxtbPBDetid_brg: TcxGridDBColumn;
    cxtbPBDetid_po: TcxGridDBColumn;
    cxtbPBDetqty: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    cxtbPBDetColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapOutstandingPO: TfrmLapOutstandingPO;

implementation

uses unTools, unAplikasi, unDM;

{$R *.dfm}

procedure TfrmLapOutstandingPO.btnProsesClick(Sender: TObject);
begin
  inherited;
  zqrPO.Close;
  zqrPO.ParamByName('tgl1').AsDate := cxdTgl1.Date;
  zqrPO.ParamByName('tgl2').AsDate := cxdTgl2.Date;
  zqrPO.Open;
  zqrPB.Open;
end;

procedure TfrmLapOutstandingPO.Button1Click(Sender: TObject);
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

procedure TfrmLapOutstandingPO.Button2Click(Sender: TObject);
begin
  inherited;
  btnKeluarClick(nil);
end;

procedure TfrmLapOutstandingPO.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  zqrPB.Close;
  zqrPB.ParamByName('id_po').AsInteger := zqrPO.FieldByName('id').AsInteger;
  zqrPB.ParamByName('id_brg').AsInteger := zqrPO.FieldByName('id_brg').AsInteger;
  zqrPB.Open;
end;

procedure TfrmLapOutstandingPO.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTgl1.Date := unTools.FDOM(Aplikasi.TanggalServer);
  cxdTgl2.Date := unTools.LDOM(Aplikasi.TanggalServer);
end;

end.
