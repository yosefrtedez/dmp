unit unFrmLapAkunting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frxClass;

type
  TfrmLapAkunting = class(TfrmTplInput)
    lstBox: TListBox;
    pgParam: TcxPageControl;
    ts01: TcxTabSheet;
    btnCetak: TButton;
    cxLabel2: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxdTgl2: TcxDateEdit;
    ts02: TcxTabSheet;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure lstBoxClick(Sender: TObject);
  private
    procedure RekapPengeluaranKas;
    procedure RekapPenerimaanKas;
    procedure DaftarJurnal;
  public

  end;

var
  frmLapTransaksi: TfrmLapAkunting;

implementation

uses unFrmLapMasterData, unFrmRptTransaksi, unFrmLapAkunting_RPT, unTools, unDM;

{$R *.dfm}

procedure TfrmLapAkunting.DaftarJurnal;
var
  f: TfrmLapAkunting_RPT;
  mm: TfrxMemoView;
begin
  f := TfrmLapAkunting_RPT.Create(Self);
  with f do begin
    zqrJurnal.ParamByName('tgl1').AsDate := cxdTgl1.Date;
    zqrJurnal.ParamByName('tgl2').AsDate := cxdTgl2.Date;
    zqrJurnal.Open;

    mm := rptJurnal.FindObject('mmPeriode') as TfrxMemoView;
    mm.Text := 'Periode : ' + FormatDateTime('dd-MM-yyyy', cxdTgl1.Date) + ' S/D ' + FormatDateTime('dd-MM-yyyy', cxdTgl2.Date);
    rptJurnal.ShowReport(True);
    Release;
  end;
end;

procedure TfrmLapAkunting.FormCreate(Sender: TObject);
begin
  inherited;
  lstBox.Items.Add('01. Rekapitulasi Pengeluaran Kas');
  lstBox.Items.Add('02. Rekapitulasi Penerimaan Kas');
  lstBox.Items.Add('03. Buku Kas');
  lstBox.Items.Add('04. Daftar Jurnal');

  cxdTgl1.Date := unTools.FDOM(Aplikasi.TanggalServer);
  cxdTgl2.Date := unTools.LDOM(Aplikasi.TanggalServer);
  pgParam.ActivePage := ts01;
end;

procedure TfrmLapAkunting.lstBoxClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  inherited;
  if lstBox.ItemIndex = 0 then
    ts := ts01
  else if lstBox.ItemIndex = 1 then
    ts := ts01
  else if lstBox.ItemIndex = 2 then
    ts := ts02
  else if lstBox.ItemIndex = 3 then
    ts := ts01;
  ts.PageIndex := 0;
  pgParam.ActivePage := ts;
end;

procedure TfrmLapAkunting.RekapPenerimaanKas;
var
  f: TfrmLapAkunting_RPT;
  mm: TfrxMemoView;
begin
  f := TfrmLapAkunting_RPT.Create(Self);
  with f do begin
    zqrPenerimaanKas.ParamByName('tgl1').AsDate := cxdTgl1.Date;
    zqrPenerimaanKas.ParamByName('tgl2').AsDate := cxdTgl2.Date;
    zqrPenerimaanKas.Open;

    mm := rptPenerimaanKas.FindObject('mmPeriode') as TfrxMemoView;
    mm.Text := 'Periode : ' + FormatDateTime('dd-MM-yyyy', cxdTgl1.Date) + ' S/D ' + FormatDateTime('dd-MM-yyyy', cxdTgl2.Date);
    rptPenerimaanKas.ShowReport(True);
    Release;
  end;
end;

procedure TfrmLapAkunting.RekapPengeluaranKas;
var
  f: TfrmLapAkunting_RPT;
  mm: TfrxMemoView;
begin
  f := TfrmLapAkunting_RPT.Create(Self);
  with f do begin
    zqrPengeluaranKas.ParamByName('tgl1').AsDate := cxdTgl1.Date;
    zqrPengeluaranKas.ParamByName('tgl2').AsDate := cxdTgl2.Date;
    zqrPengeluaranKas.Open;

    mm := rptPengeluaranKas.FindObject('mmPeriode') as TfrxMemoView;
    mm.Text := 'Periode : ' + FormatDateTime('dd-MM-yyyy', cxdTgl1.Date) + ' S/D ' + FormatDateTime('dd-MM-yyyy', cxdTgl2.Date);
    rptPengeluaranKas.ShowReport(True);
    Release;
  end;
end;

procedure TfrmLapAkunting.btnCetakClick(Sender: TObject);
begin
  inherited;

  if lstBox.ItemIndex = 0 then
    RekapPengeluaranKas
  else if lstBox.ItemIndex = 1 then
    RekapPenerimaanKas
  else if lstBox.ItemIndex = 2 then
    DaftarJurnal;
end;

end.
