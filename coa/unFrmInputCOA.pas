unit unFrmInputCOA;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCheckBox,
  cxTextEdit, cxSpinEdit, cxLabel, cxDropDownEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmInputCOA = class(TfrmTplInput)
    cxlTipeAkun: TcxLookupComboBox;
    cxCmbDK: TcxComboBox;
    cxLabel7: TcxLabel;
    cxsSaldoAwal: TcxSpinEdit;
    cxLabel5: TcxLabel;
    cxtNamaAKun: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxtNoAkun: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxtNoAkunInduk: TcxTextEdit;
    cxlIndukAkun: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    cxChkAktif: TcxCheckBox;
    cxLabel4: TcxLabel;
    Label13: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputCOA: TfrmInputCOA;

implementation

{$R *.dfm}

end.
