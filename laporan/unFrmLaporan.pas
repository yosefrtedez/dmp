unit unFrmLaporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, Buttons, uniGUIBaseClasses,
  uniGUIClasses, uniButton, uniBitBtn, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC;

type
  TfrmLaporan = class(TfrmTplInput)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnKeluar: TButton;
    btnMasterData: TButton;
    btnTransaksi: TButton;
    lstBox01: TListBox;
    btnCetak: TButton;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
  private
    procedure CetakLapMasterBarang;
  public
    { Public declarations }
  end;

var
  frmLaporan: TfrmLaporan;

implementation

uses unDM, unFrmLogin, unFrmLapMasterData;

{$R *.dfm}

procedure TfrmLaporan.btnCetakClick(Sender: TObject);
begin
  inherited;
  if lstBox01.Visible then begin
    if lstBox01.ItemIndex = 0 then begin
      CetakLapMasterBarang;
    end;
  end;
end;

procedure TfrmLaporan.btnKeluarClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  ts.Free;
end;

procedure TfrmLaporan.CetakLapMasterBarang;
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

procedure TfrmLaporan.FormCreate(Sender: TObject);
begin
  inherited;
  lstBox01.Items.Add('Master Barang / Persediaan');
  lstBox01.Items.Add('Customer');
  lstBox01.Items.Add('Supplier');
end;

end.
