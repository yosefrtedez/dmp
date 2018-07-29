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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, unFLapParam;

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
    lstBox02: TListBox;
    FLapParam: TFrame1;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure btnMasterDataClick(Sender: TObject);
    procedure btnTransaksiClick(Sender: TObject);
  private
    mLapCetak: string;
    procedure CetakLapMasterBarang;
    procedure CetakLapHistTransaksiMasuk;
    procedure CetakLapHistTransaksiKeluar;
    procedure HideAllPanel;
  public
    { Public declarations }
  end;

var
  frmLaporan: TfrmLaporan;

implementation

uses unDM, unFrmLogin, unFrmLapMasterData, unFrmLapTransaksi;

{$R *.dfm}

procedure TfrmLaporan.btnCetakClick(Sender: TObject);
begin
  inherited;
  if mLapCetak = '' then begin
    if pnlLapMasterData.Visible then begin
      if lstBox01.ItemIndex = 0 then begin
        CetakLapMasterBarang;
      end;
    end
    else if pnlLapTransaksi.Visible then begin
      if lstBox02.ItemIndex = 0 then begin
        mLapCetak := 'RekapTransaksiMasuk';
        FLapParam.Visible := True;
      end
      else if lstBox02.ItemIndex = 1 then begin
        mLapCetak := 'RekapTransaksiKeluar';
        FLapParam.Visible := True;
      end
    end;
  end
  else begin
    if mLapCetak = 'RekapTransaksiMasuk' then begin
      CetakLapHistTransaksiMasuk;
    end
    else if mLapCetak = 'RekapTransaksiKeluar' then begin
      CetakLapHistTransaksiKeluar;
    end
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

procedure TfrmLaporan.CetakLapHistTransaksiKeluar;
var
  f: TfrmLapTransaksi;
begin
  f := TfrmLapTransaksi.Create(nil);
  with f do begin
    zqrLapRekapTrsKeluar.Close;
    zqrLapRekapTrsKeluar.ParamByName('tgl1').AsDate := FLapParam.cxdTgl1.Date;
    zqrLapRekapTrsKeluar.ParamByName('tgl2').AsDate := FLapParam.cxdTgl2.Date;
    zqrLapRekapTrsKeluar.Open;
    rptLapRekapTrsKeluar.ShowReport(True);
  end;
  f.Free;
end;

procedure TfrmLaporan.CetakLapHistTransaksiMasuk;
var
  f: TfrmLapTransaksi;
begin
  f := TfrmLapTransaksi.Create(nil);
  with f do begin
    zqrLapRekapTrsMasuk.Close;
    zqrLapRekapTrsMasuk.ParamByName('tgl1').AsDate := FLapParam.cxdTgl1.Date;
    zqrLapRekapTrsMasuk.ParamByName('tgl2').AsDate := FLapParam.cxdTgl2.Date;
    zqrLapRekapTrsMasuk.Open;
    rptLapRekapTrsMasuk.ShowReport(True);
  end;
  f.Free;
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

  lstBox02.Items.Add('History Transaksi Masuk');
  lstBox02.Items.Add('History Transaksi Keluar');

end;

procedure TfrmLaporan.HideAllPanel;
var
  i: integer;
begin
  for i := 0 to Self.ComponentCount - 1 do begin
    if Components[i].Tag = 10 then
      (Components[i] as TPanel).Visible := False;
  end;
  btnCetak.Visible := False;
  FLapParam.Visible := False;
  mLapCetak := '';
end;

end.
