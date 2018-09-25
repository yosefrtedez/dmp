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
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmLapAkunting = class(TfrmTplInput)
    lstBox: TListBox;
    pgParam: TcxPageControl;
    ts01: TcxTabSheet;
    btnCetak: TButton;
    cxLabel1: TcxLabel;
    cxlAkun: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxdTgl2: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure lstBoxClick(Sender: TObject);
  private
    
  public

  end;

var
  frmLapTransaksi: TfrmLapAkunting;

implementation

uses unFrmLapMasterData, unFrmRptTransaksi;

{$R *.dfm}

procedure TfrmLapAkunting.FormCreate(Sender: TObject);
begin
  inherited;
  lstBox.Items.Add('01. Kas Harian');
  lstBox.Items.Add('02. History Transaksi Keluar');
end;

procedure TfrmLapAkunting.lstBoxClick(Sender: TObject);
begin
  inherited;
  if lstBox.ItemIndex = 0 then
    ts01.Visible := True
  else if lstBox.ItemIndex = 0 then
    ts01.Visible := True;
end;

procedure TfrmLapAkunting.btnCetakClick(Sender: TObject);
begin
  inherited;

  if lstBox.ItemIndex = 0 then
    //CetakLapHistTransaksiMasuk
  else if lstBox.ItemIndex = 1 then
    //CetakLapHistTransaksiKeluar;

end;

end.
