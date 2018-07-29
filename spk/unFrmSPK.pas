unit unFrmSPK;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxLabel;

type
  TfrmSPK = class(TfrmTplInput)
    Label13: TLabel;
    cxLabel1: TcxLabel;
    cxtNoSO: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxtbBOM: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel6: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxTextEdit5: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxTextEdit6: TcxTextEdit;
  private
    mNoSO: string;
  public
    property NoSO: string read mNoSO write mNoSO;
  end;

var
  frmSPK: TfrmSPK;

implementation

{$R *.dfm}

end.
