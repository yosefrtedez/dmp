unit unFrmKartuStok;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, StdCtrls, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ZAbstractRODataset, ZDataset, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ZAbstractDataset, ZStoredProcedure, DateUtils, cxSpinEdit;

type
  TfrmKartuStok = class(TForm)
    cxtbKS: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxdTgl2: TcxDateEdit;
    cxLabel3: TcxLabel;
    btnProses: TButton;
    btnKeluar: TButton;
    zqrKS: TZReadOnlyQuery;
    dsKS: TDataSource;
    cxtbKSno_bukti: TcxGridDBColumn;
    cxtbKStanggal: TcxGridDBColumn;
    cxtbKSmasuk: TcxGridDBColumn;
    cxtbKSkeluar: TcxGridDBColumn;
    cxtbKSstok_akhir: TcxGridDBColumn;
    zqrGdg: TZReadOnlyQuery;
    dsGdg: TDataSource;
    zspKS: TZStoredProc;
    cxlGdg: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    cxsSA: TcxSpinEdit;
    procedure btnProsesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
  private
    mIdBrg: integer;
  public
    property IdBrg: Integer read mIdBrg write mIdBrg;
  end;

var
  frmKartuStok: TfrmKartuStok;

implementation

uses unAplikasi, unDM, unTools;

{$R *.dfm}

procedure TfrmKartuStok.btnKeluarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKartuStok.btnProsesClick(Sender: TObject);
var
  q: TZQuery;
  sa: real;
  s: string;
begin
  q := OpenRS('SELECT sf_getstokawal2(%d, %s, ''%s'') as sa',
    [mIdBrg, cxlGdg.EditValue, FormatDateTime('yyyy-mm-dd', IncDay(cxdTgl1.Date,-1))]);
  sa := q.FieldByName('sa').AsFloat;
  cxsSA.Value := sa;
  q.Close;

  //q.Properties.Add('checkparam=false');
  s := FormatFloat('#,#0.00', sa);
  s := StringReplace(s,',','.',[rfReplaceall]);
  q.SQL.Text := Format('call sp_kartustok(%d, %s, %s, ''%s'', ''%s'')',
    [mIdBrg, cxlGdg.EditValue, s, FormatDateTime('yyyy-mm-dd', cxdTgl1.Date), FormatDateTime('yyyy-mm-dd', cxdTgl2.Date)]);
  // MsgBox(q.SQL.Text);
  q.ExecSQL;

  zqrKS.SQL.Text := 'SELECT * FROM _ks';
  zqrKS.Open;

end;

procedure TfrmKartuStok.FormCreate(Sender: TObject);
begin
  zqrGdg.Open;
end;

end.
