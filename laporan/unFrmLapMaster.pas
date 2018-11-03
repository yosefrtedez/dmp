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
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, cxContainer,
  cxEdit, DB, ZAbstractRODataset, ZDataset, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel;

type
  TfrmLapMaster = class(TfrmTplInput)
    lstBox: TListBox;
    pgParam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    btnCetak: TButton;
    cxLabel1: TcxLabel;
    cxlKategoriBrg: TcxLookupComboBox;
    zqrKategori: TZReadOnlyQuery;
    dsKategori: TDataSource;
    cxLabel2: TcxLabel;
    cxlSubKategori: TcxLookupComboBox;
    zqrSubKategori: TZReadOnlyQuery;
    dsSubKategori: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure lstBoxClick(Sender: TObject);
  private
    procedure CetakLapMasterBarang;
  public
    { Public declarations }
  end;

var
  frmLapMaster: TfrmLapMaster;

implementation

uses unFrmLapMasterData, unDM, unTools;

{$R *.dfm}

procedure TfrmLapMaster.FormCreate(Sender: TObject);
begin
  inherited;
  lstBox.Items.Add('01. Master Barang / Persediaan');
  lstBox.Items.Add('02. Customer');
  lstBox.Items.Add('03. Supplier');
  zqrKategori.Open;
  zqrSubKategori.Open;

  cxlKategoriBrg.EditValue := 0;
  cxlSubKategori.EditValue := 0;
end;

procedure TfrmLapMaster.lstBoxClick(Sender: TObject);
begin
  inherited;
  if lstBox.ItemIndex = 0 then
    pgParam.Visible := True;
  
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

  if cxlSubKategori.EditValue > 0 then
    if cxlKategoriBrg.EditValue = 0 then begin
      MsgBox('Mohon Pilih kategori barang.');
      Abort;
    end;

  f := TfrmLapMasterData.Create(nil);
  with f do begin
    if cxlKategoriBrg.EditValue = 0 then
      zqrMstBarang.SQL.Strings[9] := ''
    else
      zqrMstBarang.ParamByname('id_kategori').AsString := cxlKategoriBrg.EditValue;

    if cxlSubKategori.EditValue = 0 then
      zqrMstBarang.SQL.Strings[10] := ''
    else
      zqrMstBarang.ParamByName('id_subkategori').AsString := cxlSubKategori.EditValue;

    zqrMstBarang.Open;
    rptMstBarang.ShowReport(True);
  end;
  f.Free;
end;

end.
