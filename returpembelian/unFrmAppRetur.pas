unit unFrmAppRetur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
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
  cxDBData, cxCheckBox, cxSpinEdit, cxContainer, ZAbstractRODataset, ZDataset,
  cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmAppRetur = class(TfrmTplInput)
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
    cxColTblHeadf_approval: TcxGridDBColumn;
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
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxtbPODet: TcxGridDBTableView;
    cxtbPODetkode_brg: TcxGridDBColumn;
    cxtbPODetdeskripsi: TcxGridDBColumn;
    cxtbPODetqty: TcxGridDBColumn;
    cxtbPODetsatuan: TcxGridDBColumn;
    cxtbPODetharga: TcxGridDBColumn;
    cxtbPODetmata_uang: TcxGridDBColumn;
    cxtbPODetColumn2: TcxGridDBColumn;
    cxtbPODetColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    zqrRet: TZReadOnlyQuery;
    dsRet: TDataSource;
    zqrRetDet: TZReadOnlyQuery;
    dsRetDet: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppRetur: TfrmAppRetur;

implementation

{$R *.dfm}

end.
