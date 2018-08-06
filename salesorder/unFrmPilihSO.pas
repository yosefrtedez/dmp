unit unFrmPilihSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  ZAbstractRODataset, ZDataset;

type
  TfrmPilihSO = class(TForm)
    cxtbSO: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    Button2: TButton;
    zqrSO: TZReadOnlyQuery;
    dsSO: TDataSource;
    cxtbSOtanggal: TcxGridDBColumn;
    cxtbSOno_bukti: TcxGridDBColumn;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    mIdBrg, mIdCust: integer;
    mIdSO: integer;
  public
    property IdBrg: integer read mIdBrg write mIdBrg;
    property IdCust: Integer read mIdCust write mIdCust;
    property IdSO: Integer read mIdSO;
  end;

var
  frmPilihSO: TfrmPilihSO;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmPilihSO.Button1Click(Sender: TObject);
begin
  mIdSO := zqrSO.FieldByName('id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfrmPilihSO.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPilihSO.FormShow(Sender: TObject);
begin
  zqrSO.Close;
  zqrSO.ParamByName('id_cust').AsInteger := mIdCust;
  zqrSO.ParambYName('id_brg').AsInteger := mIdBrg;
  zqrSO.Open;
end;

end.
