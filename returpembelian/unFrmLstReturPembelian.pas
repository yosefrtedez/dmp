unit unFrmLstReturPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplGrid, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, cxSpinEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC;

type
  TfrmLstReturPembelian = class(TfrmTplGrid)
    Label13: TLabel;
    cxgrd1: TcxGrid;
    cxtbPOHead: TcxGridDBTableView;
    cxColTblHeadno_bukti: TcxGridDBColumn;
    cxColTblHeadno_fobj: TcxGridDBColumn;
    cxColTblHeadnama: TcxGridDBColumn;
    cxColTblHeadkontak: TcxGridDBColumn;
    cxColTblHeadtgl_required: TcxGridDBColumn;
    cxColTblHeaduser: TcxGridDBColumn;
    cxColTblHeaduser_dept: TcxGridDBColumn;
    cxColTblHeadpembayaran: TcxGridDBColumn;
    cxColTblHeadnopol: TcxGridDBColumn;
    cxColTblHeaddriver: TcxGridDBColumn;
    cxColTblHeadf_approval: TcxGridDBColumn;
    cxColTblHeadf_completed: TcxGridDBColumn;
    cxTblDet: TcxGridDBTableView;
    cxColTblDetid: TcxGridDBColumn;
    cxColTblDetid_ref: TcxGridDBColumn;
    cxColTblDetno_bukti: TcxGridDBColumn;
    cxColTblDetkode_brg: TcxGridDBColumn;
    cxColTblDetdeskripsi: TcxGridDBColumn;
    cxColTblDetqty: TcxGridDBColumn;
    cxColTblDetsatuan: TcxGridDBColumn;
    cxColTblDetharga: TcxGridDBColumn;
    cxColTblDetmata_uang: TcxGridDBColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxtbPODet: TcxGridDBTableView;
    cxtbPODetkode_brg: TcxGridDBColumn;
    cxtbPODetdeskripsi: TcxGridDBColumn;
    cxtbPODetqty: TcxGridDBColumn;
    cxtbPODetsatuan: TcxGridDBColumn;
    cxtbPODetharga: TcxGridDBColumn;
    cxtbPODetmata_uang: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure btnTambahClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstReturPembelian: TfrmLstReturPembelian;

implementation

uses unDM, unTools, unFrmInputReturPembelian, unFrmUtama;

{$R *.dfm}

procedure TfrmLstReturPembelian.btnTambahClick(Sender: TObject);
var
  f: TfrmInputReturPembelian;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Retur Pembelian') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputReturPembelian.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

end.
