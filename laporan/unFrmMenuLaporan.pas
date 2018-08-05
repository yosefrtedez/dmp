unit unFrmMenuLaporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, unFrmeTplLap,
  cxPC, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmMenuLaporan = class(TfrmTplInput)
    ScrollBox1: TScrollBox;
    btnMasterData: TButton;
    btnTransaksi: TButton;
    pg: TcxPageControl;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnMasterDataClick(Sender: TObject);
    procedure btnTransaksiClick(Sender: TObject);
  private
    lstFrame: TStringList;
    procedure HideAllFrame;
    function CekTabOpen(sCaption: string): Boolean;
  public

  end;

var
  frmMenuLaporan: TfrmMenuLaporan;

implementation

uses unTools, unFrmLapMaster, unFrmLapTransaksi;

{$R *.dfm}

{ TfrmMenuLaporan }

procedure TfrmMenuLaporan.btnMasterDataClick(Sender: TObject);
var
  f: TfrmLapMaster;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('01') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pg;
    ts.TabVisible := False;
    ts.Caption := '01';

    f := TfrmLapMaster.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pg.ActivePage := ts;
  end;
end;


procedure TfrmMenuLaporan.FormCreate(Sender: TObject);
begin
  inherited;

  {
  with frameMasterData do begin
    lstBox.Items.Add('01. Master Barang / Persediaan');
    lstBox.Items.Add('02. Customer');
    lstBox.Items.Add('03. Supplier');
  end;
  }

  lstFrame := TStringList.Create;
  lstFrame.Add('frameMasterData');
  HideAllFrame;
end;

procedure TfrmMenuLaporan.HideAllFrame;
var
  i,j: integer;
begin
  {
  for i := 0 to Self.ComponentCount - 1 do begin
    if lstFrame.find(Components[i].Name,j) then
      (Components[i] as TControl).Visible := False;
  end;
  }
end;

procedure TfrmMenuLaporan.btnTransaksiClick(Sender: TObject);
var
  f: TfrmLapTransaksi;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('01') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pg;
    ts.TabVisible := False;
    ts.Caption := '01';

    f := TfrmLapTransaksi.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pg.ActivePage := ts;
  end;
end;

function TfrmMenuLaporan.CekTabOpen(sCaption: string): Boolean;
var
  i: Integer;
  f: boolean;
  ts: TcxTabSheet;
begin
  f := False;
  for i := 0 to pg.TabCount - 1 do begin
    if sCaption = pg.Tabs[i].Caption then begin
      ts := pg.Pages[i];
      f := True;
      Break;
    end;
  end;

  if f then begin
    pg.ActivePage := ts;
  end;

  Result := f;
end;


end.
