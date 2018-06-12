unit unFrmMasterOrder;

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
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, ExtCtrls,ZDataset, ZAbstractRODataset;

type
  TfrmMasterOrder = class(TfrmTplInput)
    Label13: TLabel;
    Panel3: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel4: TPanel;
    cxdTgl1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxdTgl2: TcxDateEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btnProses: TButton;
    zqrMO: TZReadOnlyQuery;
    dsMO: TDataSource;
    cxGrid1DBTableView1no_mo: TcxGridDBColumn;
    cxGrid1DBTableView1no_so: TcxGridDBColumn;
    cxGrid1DBTableView1no_spk: TcxGridDBColumn;
    cxGrid1DBTableView1tgl_spk: TcxGridDBColumn;
    cxGrid1DBTableView1kode_brg: TcxGridDBColumn;
    cxGrid1DBTableView1qty_mo: TcxGridDBColumn;
    cxGrid1DBTableView1qty_so: TcxGridDBColumn;
    cxGrid1DBTableView1deskripsi: TcxGridDBColumn;
    cxGrid1DBTableView1tanggal: TcxGridDBColumn;
    cxGrid1DBTableView1kode_customer: TcxGridDBColumn;
    cxGrid1DBTableView1nama_customer: TcxGridDBColumn;
    procedure btnProsesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterOrder: TfrmMasterOrder;

implementation

uses
  unDM, unTools;

{$R *.dfm}

procedure TfrmMasterOrder.btnProsesClick(Sender: TObject);
begin
  inherited;
  with zqrMO do begin
    if Active then Close;
    Screen.Cursor := crSQLWait;
    dm.zConn.ExecuteDirect('CALL sp_tmp_mo');
    //SQL.Text := cxMemo2.Lines.Text;
    ParamByName('tgl1').AsDateTime := cxdTgl1.Date;
    ParamByName('tgl2').AsDateTime := cxdTgl2.Date;
    Open;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMasterOrder.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTgl1.Date := FDOM(Date);
  cxdTgl2.Date := LDOM(Date);
end;

end.
