unit unFrmLapMaster;

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
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC;

type
  TfrmLapMaster = class(TfrmTplInput)
    lstBox: TListBox;
    pgParam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    btnCetak: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
  private
    procedure CetakLapMasterBarang;
  public
    { Public declarations }
  end;

var
  frmLapMaster: TfrmLapMaster;

implementation

uses unFrmLapMasterData;

{$R *.dfm}

procedure TfrmLapMaster.FormCreate(Sender: TObject);
begin
  inherited;
  lstBox.Items.Add('Master Barang / Persediaan');
  lstBox.Items.Add('Customer');
  lstBox.Items.Add('Supplier');
end;

procedure TfrmLapMaster.btnCetakClick(Sender: TObject);
begin
  inherited;

  if lstBox.ItemIndex = 0 then begin
    CetakLapMasterBarang;
  end;

end;

procedure TfrmLapMaster.CetakLapMasterBarang;
var
  f: TfrmLapMasterData;
begin
  f := TfrmLapMasterData.Create(nil);
  with f do begin
    zqrMstBarang.Open;
    rptMstBarang.ShowReport(True);
  end;
  f.Free;
end;

end.
