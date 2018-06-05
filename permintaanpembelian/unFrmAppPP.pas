unit unFrmAppPP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxCheckBox, ZAbstractRODataset, ZDataset;

type
  TfrmAppPP = class(TfrmTplInput)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label13: TLabel;
    cxtbPPHead: TcxGridTableView;
    cxtbPPHeadColumn1: TcxGridColumn;
    cxColNoPP: TcxGridColumn;
    Panel3: TPanel;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    zqrDetPP: TZReadOnlyQuery;
    dsDetPP: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1kode_brg: TcxGridDBColumn;
    cxGrid2DBTableView1qty: TcxGridDBColumn;
    cxGrid2DBTableView1satuan: TcxGridDBColumn;
    cxGrid2DBTableView1keterangan: TcxGridDBColumn;
    cxGrid2DBTableView1mata_uang: TcxGridDBColumn;
    cxGrid2DBTableView1nama_jasa: TcxGridDBColumn;
    cxGrid2DBTableView1harga: TcxGridDBColumn;
    procedure cxtbPPHeadFocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppPP: TfrmAppPP;

implementation

uses unDM;

{$R *.dfm}

procedure TfrmAppPP.cxtbPPHeadFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
var
  i: integer;
begin
  inherited;
  i := cxtbPPHead.DataController.GetFocusedRecordIndex;
  zqrDetPP.Close;
  zqrDetPP.ParamByName('no_bukti').AsString := cxtbPPHead.DataController.Values[i, cxColNoPP.Index];
  zqrDetPP.Open;
end;

end.
