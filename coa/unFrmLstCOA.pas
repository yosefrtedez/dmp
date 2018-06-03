unit unFrmLstCOA;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ZAbstractRODataset, ZDataset;

type
  TfrmLstCOA = class(TfrmTplGrid)
    Label13: TLabel;
    cxtbCOA: TcxGridDBTableView;
    cxgCOALevel1: TcxGridLevel;
    cxgCOA: TcxGrid;
    zqrCOA: TZReadOnlyQuery;
    dsCOA: TDataSource;
    cxtbCOAnoakun: TcxGridDBColumn;
    cxtbCOAnama: TcxGridDBColumn;
    cxtbCOAinduk: TcxGridDBColumn;
    cxtbCOAf_subakun: TcxGridDBColumn;
    cxtbCOAf_aktif: TcxGridDBColumn;
    cxtbCOAsawal: TcxGridDBColumn;
    cxtbCOAdfl: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstCOA: TfrmLstCOA;

implementation

uses unDM;

{$R *.dfm}

end.
