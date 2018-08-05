unit unFrmLapTransaksi;

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
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel;

type
  TfrmLapTransaksi = class(TfrmTplInput)
    lstBox: TListBox;
    pgParam: TcxPageControl;
    ts01: TcxTabSheet;
    btnCetak: TButton;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxdTgl2: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure lstBoxClick(Sender: TObject);
  private
    procedure CetakLapHistTransaksiMasuk;
    procedure CetakLapHistTransaksiKeluar;
  public

  end;

var
  frmLapTransaksi: TfrmLapTransaksi;

implementation

uses unFrmLapMasterData, unFrmRptTransaksi;

{$R *.dfm}

procedure TfrmLapTransaksi.FormCreate(Sender: TObject);
begin
  inherited;
  lstBox.Items.Add('01. History Transaksi Masuk');
  lstBox.Items.Add('02. History Transaksi Keluar');
end;

procedure TfrmLapTransaksi.lstBoxClick(Sender: TObject);
begin
  inherited;
  if lstBox.ItemIndex = 0 then
    ts01.Visible := True
  else if lstBox.ItemIndex = 0 then
    ts01.Visible := True;
end;

procedure TfrmLapTransaksi.btnCetakClick(Sender: TObject);
begin
  inherited;

  if lstBox.ItemIndex = 0 then
    CetakLapHistTransaksiMasuk
  else if lstBox.ItemIndex = 1 then
    CetakLapHistTransaksiKeluar;

end;

procedure TfrmLapTransaksi.CetakLapHistTransaksiKeluar;
var
  f: TfrmRptTransaksi;
begin

  f := TfrmRptTransaksi.Create(nil);
  with f do begin
    zqrLapRekapTrsKeluar.Close;
    zqrLapRekapTrsKeluar.ParamByName('tgl1').AsDate := cxdTgl1.Date;
    zqrLapRekapTrsKeluar.ParamByName('tgl2').AsDate := cxdTgl2.Date;
    zqrLapRekapTrsKeluar.Open;
    rptLapRekapTrsKeluar.ShowReport(True);
  end;
  f.Free;

end;

procedure TfrmLapTransaksi.CetakLapHistTransaksiMasuk;
var
  f: TfrmRptTransaksi;
begin
  f := TfrmRptTransaksi.Create(nil);
  with f do begin
    zqrLapRekapTrsMasuk.Close;
    zqrLapRekapTrsMasuk.ParamByName('tgl1').AsDate := cxdTgl1.Date;
    zqrLapRekapTrsMasuk.ParamByName('tgl2').AsDate := cxdTgl2.Date;
    zqrLapRekapTrsMasuk.Open;
    rptLapRekapTrsMasuk.ShowReport(True);
  end;
  f.Free;
end;

end.
