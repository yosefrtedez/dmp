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
  cxGridDBTableView, cxGrid, ExtCtrls, cxCheckBox, ZAbstractRODataset, ZDataset, cxDateUtils,
  cxTextEdit;

type
  TfrmAppPP = class(TfrmTplInput)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label13: TLabel;
    cxtbHead: TcxGridTableView;
    cxColChkApp: TcxGridColumn;
    cxColNoPP: TcxGridColumn;
    Panel3: TPanel;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    zqrDetPP: TZReadOnlyQuery;
    dsDetPP: TDataSource;
    cxTblDetail: TcxGridDBTableView;
    cxColGrdDetailkode_brg: TcxGridDBColumn;
    cxColGrdDetailqty: TcxGridDBColumn;
    cxColGrdDetailsatuan: TcxGridDBColumn;
    cxColGrdDetailketerangan: TcxGridDBColumn;
    cxColGrdDetailmata_uang: TcxGridDBColumn;
    cxColGrdDetailnama_jasa: TcxGridDBColumn;
    cxColGrdDetailharga: TcxGridDBColumn;
    procedure cxColAppPPColumn1PropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxColAppPPColumn1PropertiesChange(Sender: TObject);
    procedure cxgrdAppPPDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppPP: TfrmAppPP;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmAppPP.btnSimpanClick(Sender: TObject);
var
  i : Integer;
  q : TZQuery;
begin
  inherited;
  for i := 0 to cxtbHead.DataController.RecordCount - 1 do begin

    with cxtbHead.DataController do begin
      q := OpenRS('select * from tbl_pp_head where no_bukti = ''' + Values[i, cxColNoPP.index] + '''');
      if Values[i, cxColChkApp.index] = True then begin
        q.Edit;
        q.FieldByName('f_app').AsInteger := 1;
        q.FieldByName('tgl_app').AsDateTime := Aplikasi.Tanggal;
        q.FieldByName('user_app').AsString := Aplikasi.NamaUser;
        q.Post;
        q.Close;
        MsgBox('Approval PO berhasil disimpan');
        btnBatalClick(nil);
      end;
    end;
  end;
end;

procedure TfrmAppPP.cxColAppPPColumn1PropertiesChange(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  
end;

procedure TfrmAppPP.cxColAppPPColumn1PropertiesEditValueChanged(
  Sender: TObject);
  var
  i,j : Integer;
  AValue : Variant;
begin
  inherited;
 
  end;


procedure TfrmAppPP.cxgrdAppPPDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
begin
  inherited;
  if AItemIndex = cxColChkApp.Index then begin

  end;

end;

procedure TfrmAppPP.cxtbHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  i: integer;
  z :TZQuery;
begin
  inherited;
  i := cxtbHead.DataController.GetFocusedRecordIndex;
  zqrDetPP.Close;
  zqrDetPP.ParamByName('no_bukti').AsString := cxtbHead.DataController.Values[i, cxColNoPP.Index];
  zqrDetPP.Open;
end;

procedure TfrmAppPP.FormShow(Sender: TObject);
var
  q : TZQuery;
  i : Integer;
begin
  inherited;
  q := OpenRS('select * from tbl_pp_head where f_app = 0');
  while not q.eof do begin
    with cxtbHead.DataController  do begin
      i := AppendRecord;
      Values[i, cxColNoPP.Index] := q.FieldByName('no_bukti').AsString;
    end;
    q.Next;
  end;
  q.Close;
end;

end.
