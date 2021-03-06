unit unFrmTplInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, unFrmUtama,
  cxLabel, cxPC;

type
  TfrmTplInput = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSimpan: TButton;
    btnBatal: TButton;
    procedure btnBatalClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    mJenis: string;
    mEditKey: string;
    mFormInduk: TForm;
    mTabSheet: TcxTabSheet;
    mfu: TFrmUtama;
  public
    property Jenis: string read mJenis write mJenis;
    property EditKey: string read mEditKey write mEditKey;
    property FormInduk: TForm read mFormInduk write mFormInduk;
    property TabSheet: TcxTabSheet read mTabSheet write mTabSheet;
    property FormUtama: TFrmUtama read mfu write mfu;
  end;

var
  frmTplInput: TfrmTplInput;

implementation

{$R *.dfm}

procedure TfrmTplInput.btnBatalClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  ts.Free;
  mfu.pgMain.ActivePage := TabSheet;
end;

procedure TfrmTplInput.btnSimpanClick(Sender: TObject);
begin
  mfu.pgMain.ActivePage := TabSheet;
end;

procedure TfrmTplInput.FormCreate(Sender: TObject);
begin
  mfu := frmUtama;
end;

end.
