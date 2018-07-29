unit unFrmPilihHarga;

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
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ZDataset, cxSpinEdit, ZAbstractRODataset;

type
  TfrmPilihHarga = class(TForm)
    cxtbHarga: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnPilih: TButton;
    btnBatal: TButton;
    cxColJenis: TcxGridDBColumn;
    cxColHarga: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    zqrHarga: TZReadOnlyQuery;
    dsHarga: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1harga: TcxGridDBColumn;
    cxGrid2DBTableView1jenis: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnPilihClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
  private
    mID: integer;
    mHarga: real;
  public
    public property ID: integer write mID;
    public property Harga: Real read mHarga;
  end;

var
  frmPilihHarga: TfrmPilihHarga;

implementation

uses unTools, unDM;

{$R *.dfm}

procedure TfrmPilihHarga.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPilihHarga.btnPilihClick(Sender: TObject);
begin
  mHarga := zqrHarga.FieldByName('harga').AsFloat;
  ModalResult := mrOk;
end;

procedure TfrmPilihHarga.FormShow(Sender: TObject);
var
  q: TZQuery;
  i: integer;
begin
  q := OpenRS('SELECT a.harga, b.jenis FROM tbl_barang_det_harga a LEFT JOIN tbl_jenis_harga b ON a.id_jenis = b.id WHERE id_brg = %d', [mID]);
  while not q.Eof do begin
    with cxtbHarga.DataController do begin
      i := AppendRecord;
      Values[i, cxColJenis.Index] := q.FieldByName('jenis').AsString;
      Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
    end;
    q.Next;
  end;
  q.Close;

  zqrHarga.Close;
  zqrHarga.ParamByName('id').AsInteger := mID;
  zqrHarga.Open;
end;

end.
