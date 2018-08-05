unit unFrmInputHasilProduksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxTextEdit, cxSpinEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, ZAbstractRODataset, ZDataset,
  cxCheckBox;

type
  TfrmInputHasilProduksi = class(TfrmTplInput)
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxdTgl2: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnProses: TButton;
    cxGrid1: TcxGrid;
    cxtbSPK: TcxGridDBTableView;
    cxtbSPKid: TcxGridDBColumn;
    cxtbSPKno_spk: TcxGridDBColumn;
    cxtbSPKtanggal: TcxGridDBColumn;
    cxtbSPKno_mo: TcxGridDBColumn;
    cxtbSPKno_so: TcxGridDBColumn;
    cxtbSPKdeskripsi: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxtbBOM: TcxGridDBTableView;
    cxColTanggal: TcxGridDBColumn;
    cxColJam: TcxGridDBColumn;
    cxColQtySPK: TcxGridDBColumn;
    cxColSatuan: TcxGridDBColumn;
    cxColIdBrg: TcxGridDBColumn;
    cxColIdSatuan: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label13: TLabel;
    dsSPK: TDataSource;
    zqrSPK: TZReadOnlyQuery;
    cxtbBOMColumn1: TcxGridDBColumn;
    cxtbBOMColumn2: TcxGridDBColumn;
    cxtbBOMColumn3: TcxGridDBColumn;
    cxtbBOMColumn5: TcxGridDBColumn;
    cxtbBOMColumn6: TcxGridDBColumn;
    cxtbBOMColumn4: TcxGridDBColumn;
    cxtbSPKColumn1: TcxGridDBColumn;
    cxtbSPKColumn2: TcxGridDBColumn;
    cxtbBOMColumn7: TcxGridDBColumn;
    cxtbBOMColumn8: TcxGridDBColumn;
    procedure btnProsesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputHasilProduksi: TfrmInputHasilProduksi;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmInputHasilProduksi.btnProsesClick(Sender: TObject);
begin
  inherited;
  with zqrSPK do begin
    Close;
    ParamByName('tgl1').AsDate := cxdTgl1.Date;
    ParamByName('tgl2').AsDate := cxdTgl2.Date;
    Open;
  end;
end;

end.
