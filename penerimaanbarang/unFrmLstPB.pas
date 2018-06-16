unit unFrmLstPB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplGrid, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, ExtCtrls, cxCheckBox, cxSpinEdit, cxContainer, cxLabel, cxPC;

type
  TfrmLstPB = class(TfrmTplGrid)
    Label1: TLabel;
    cxgrd1: TcxGrid;
    cxtbPBHead: TcxGridDBTableView;
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
    cxtbPBDet: TcxGridDBTableView;
    cxtbPBDetkode_brg: TcxGridDBColumn;
    cxtbPBDetdeskripsi: TcxGridDBColumn;
    cxtbPBDetqty: TcxGridDBColumn;
    cxtbPBDetsatuan: TcxGridDBColumn;
    cxtbPBDetharga: TcxGridDBColumn;
    cxtbPBDetmata_uang: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure btnTambahClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPB: TfrmLstPB;

implementation

uses unFrmInputPB, unFrmUtama;

{$R *.dfm}

procedure TfrmLstPB.btnTambahClick(Sender: TObject);
var
  f: TfrmInputPB;
  ts: TcxTabSheet;
begin
  inherited;
   if not fu.CekTabOpen('Input Penerimaan Barang') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputPB.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;
    fu.pgMain.ActivePage := ts;
  end;
end;

end.
