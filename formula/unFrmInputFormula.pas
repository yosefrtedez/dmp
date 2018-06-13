unit unFrmInputFormula;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxLabel, cxGroupBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ZAbstractRODataset, ZDataset, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit;

type
  TfrmInputFormula = class(TfrmTplInput)
    ScrollBox1: TScrollBox;
    Label13: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxtKodeBrg: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel3: TcxLabel;
    cxtbFormulaHead: TcxGridTableView;
    cxColHNamaFormula: TcxGridColumn;
    cxColHKeterangan: TcxGridColumn;
    cxLabel4: TcxLabel;
    cxGrid2: TcxGrid;
    cxtbFormulaDet: TcxGridTableView;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxlDeskripsi: TcxLookupComboBox;
    zqrBrg: TZReadOnlyQuery;
    dsBrg: TDataSource;
    cxColHID: TcxGridColumn;
    cxColHID_HEAD: TcxGridColumn;
    zqrBrg2: TZReadOnlyQuery;
    dsBrg2: TDataSource;
    procedure cxlDeskripsiPropertiesEditValueChanged(Sender: TObject);
    procedure cxtbFormulaHeadDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbFormulaDetDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure FormCreate(Sender: TObject);
    procedure cxtbFormulaHeadFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxtbFormulaDetDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputFormula: TfrmInputFormula;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmInputFormula.cxlDeskripsiPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cxtKodeBrg.Text := zqrBrg.FieldByName('kode').AsString;
end;

procedure TfrmInputFormula.cxtbFormulaDetDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  q: TZQuery;
  i: Integer;
  id_det, id_head: string;
begin
  inherited;

  if (cxtbFormulaHead.DataController.EditState = [dceEdit, dceModified]) or
    (cxtbFormulaHead.DataController.EditState = [dceInsert, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan nama formula terlebih dahulu.');
    Abort;
  end;

  i := cxtbFormulaHead.DataController.GetFocusedRecordIndex;
  id_det := VarToStr(cxtbFormulaHead.DataController.Values[i, cxColHID.Index]);
  id_head := VarToStr(cxtbFormulaHead.DataController.Values[i, cxColHID_HEAD.Index]);

  q := OpenRS('SELECT * FROM tbl_formula_subdet WHERE id = %s AND id_ref = %s',[id_det, id_head]);
  if q.IsEmpty then
    q.Insert
  else
    q.Edit;

  q.FieldByName('id_head').AsString := id_head;
  q.FieldByName('id_ref').AsString := id_det;
  q.FieldByName('id_brg').AsInteger := cxColDeskripsi.EditValue;
  q.FieldByName('qty').AsFloat := cxColQty.EditValue;
  q.Post;
  q.Close;

end;

procedure TfrmInputFormula.cxtbFormulaDetDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  if AItemIndex = cxColDeskripsi.Index then begin
    q := OpenRS('SELECT kode FROM tbl_barang WHERE id = %s',[VarToStr(cxColDeskripsi.EditValue)]);
    cxColKodeBrg.EditValue := q.FieldByName('kode').AsString;
    q.Close;
  end;
end;

procedure TfrmInputFormula.cxtbFormulaHeadDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  q: TZQuery;
  ID, ID_DET, i : integer;
begin
  inherited;

  i := ADataController.GetFocusedRecordIndex;

  if Trim(cxtKodeBrg.Text) = '' then begin
    MsgBox('Mohon pilih kode barang jadi terlebih dahulu.');
    cxlDeskripsi.SetFocus;
    Abort;
  end;

  q := OpenRS('SELECT * FROM tbl_formula_head WHERE kode_brg = ''%s''',[cxtKodeBrg.Text]);
  if q.IsEmpty then begin
    q.Insert;
    q.FieldByName('kode_brg').AsString := cxtKodeBrg.Text;
    q.Post;
    ID := LastInsertID;
  end
  else begin
    ID := q.FieldByName('id').AsInteger;
  end;
  q.Close;

  if VarIsNull(cxColHID.EditValue) then
    ID_DET := 0
  else
    ID_DET := cxColHID.EditValue;

  if ID_DET = 0 then begin
    q := OpenRS('SELECT * FROM tbl_formula_det WHERE id_ref = %d',[ID]);
    q.Insert;
  end
  else begin
    q := OpenRS('SELECT * FROM tbl_formula_det WHERE id_ref = %d AND id = %d',[ID_DET, ID]);
    q.Edit;
    ID_DET := q.FieldByName('id').AsInteger;
  end;

  q.FieldByName('id_ref').AsInteger := ID;
  q.FieldByName('nama').AsString := cxColHNamaFormula.EditValue;
  q.FieldByName('keterangan').AsString := cxColHKeterangan.EditValue;
  q.Post;

  if ID_DET = 0 then begin
    ID_DET := LastInsertID;
  end;

  cxColHID_HEAD.EditValue := ID;
  cxColHID.EditValue := ID_DET;

end;

procedure TfrmInputFormula.cxtbFormulaHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  q: TZQuery;
  i: integer;
begin
  inherited;
  if VarIsNull(cxColHID_HEAD.EditValue) then Abort;
  if VarIsNull(cxColHID.EditValue) then Abort;

  q := OpenRS('SELECT * FROM tbl_formula_subdet WHERE id_head = %s AND id_ref = %s',
    [VarToStr(cxColHID_HEAD.EditValue), VarToStr(cxColHID.EditValue)]);
  cxtbFormulaDet.DataController.RecordCount := 0;
  while not q.Eof do begin
    with cxtbFormulaDet.DataController do begin
      i := AppendRecord;
      Values[i, cxColDeskripsi.Index] := q.FieldByName('id_brg').AsInteger;
      Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
    end;
    q.Next;
  end;
  q.Close;
end;

procedure TfrmInputFormula.FormCreate(Sender: TObject);
begin
  inherited;
  zqrBrg.Open;
  zqrBrg2.Open;
end;

end.
