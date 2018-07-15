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
    pnlLapMasterData: TPanel;
    btnKeluar: TButton;
    btnMasterData: TButton;
    btnTransaksi: TButton;
    lstBox01: TListBox;
    btnCetak: TButton;
    pnlLapTransaksi: TPanel;
    ListBox1: TListBox;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure btnMasterDataClick(Sender: TObject);
    procedure btnTransaksiClick(Sender: TObject);
  private
    procedure CetakLapMasterBarang;
    procedure HideAllPanel;
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

procedure TfrmLaporan.btnMasterDataClick(Sender: TObject);
begin
  inherited;
  HideAllPanel;
  pnlLapMasterData.Visible := True;
  btnCetak.Visible := True;
end;

procedure TfrmLaporan.btnTransaksiClick(Sender: TObject);
begin
  inherited;
  HideAllPanel;
  pnlLapTransaksi.Visible := True;
  btnCetak.Visible := True;
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
var
  i: integer;
begin
  inherited;
  HideAllPanel;

  for i := 0 to ComponentCount - 1 do
    if Components[i].Name = 'pnlMasterData' then
      Continue
    else
      if Components[i].ClassName = 'TPanel' then
        if Components[i].Tag = 10 then
          (Components[i] as TPanel).Left := pnlLapMasterData.Left;

  lstBox01.Items.Add('Master Barang / Persediaan');
  lstBox01.Items.Add('Customer');
  lstBox01.Items.Add('Supplier');
end;

procedure TfrmLaporan.HideAllPanel;
var
  i: integer;
begin
  for i := 0 to Self.ComponentCount - 1 do begin
    if Components[i].Tag = 10 then
      (Components[i] as TPanel).Visible := False;
  end;
end;

end.
