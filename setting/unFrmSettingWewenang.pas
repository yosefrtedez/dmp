unit unFrmSettingWewenang;

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
  cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ZDataset,
  cxCheckBox, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, ZAbstractRODataset;

type
  TfrmSettingWewenang = class(TfrmTplInput)
    Label13: TLabel;
    cxLabel1: TcxLabel;
    cxlUser: TcxLookupComboBox;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxtbWewenang: TcxGridTableView;
    cxColNamaMenu: TcxGridColumn;
    cxColInput: TcxGridColumn;
    cxColEdit: TcxGridColumn;
    cxColHapus: TcxGridColumn;
    cxColKodeMenu: TcxGridColumn;
    cxGrid1Level2: TcxGridLevel;
    cxtbWewenang2: TcxGridTableView;
    cxColNamaMenu2: TcxGridColumn;
    cxColInput2: TcxGridColumn;
    cxColEdit2: TcxGridColumn;
    cxColHapus2: TcxGridColumn;
    cxColKodeMenu2: TcxGridColumn;
    Button1: TButton;
    cxTreeWewenang: TcxTreeList;
    cxtrNama: TcxTreeListColumn;
    cxtColBuka: TcxTreeListColumn;
    cxtColInput: TcxTreeListColumn;
    cxtColEdit: TcxTreeListColumn;
    cxtColHapus: TcxTreeListColumn;
    cxTreeWewenangColumn1: TcxTreeListColumn;
    zqrUser: TZReadOnlyQuery;
    dsUser: TDataSource;
    cxtColNamaMenu: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxTreeWewenangEditing(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure KosongiTree;
  public
    { Public declarations }
  end;

var
  frmSettingWewenang: TfrmSettingWewenang;

implementation

uses unTools, unDM;

{$R *.dfm}

procedure TfrmSettingWewenang.btnSimpanClick(Sender: TObject);
var
  i,j: Integer;
  a,b: TcxTreeListNode;
  q: TZQuery;
begin
  inherited;
  Screen.Cursor := crSQLWait;
  dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_wewenang WHERE nama = ''%s''',[cxlUser.Text]));
  q := OpenRS('SELECT * FROM tbl_wewenang WHERE nama = ''%s''',[cxlUser.Text]);
  for i := 0 to cxTreeWewenang.Count - 1 do begin
    a := cxTreeWewenang.Items[i];
    q.Insert;
    q.FieldByName('nama').AsString := cxlUser.EditValue;
    q.FieldByName('nm_comp').AsString := a.Values[6];
    q.FieldByName('b').AsInteger := a.Values[1];
    q.FieldByName('i').AsInteger := a.Values[2];
    q.FieldByName('e').AsInteger := a.Values[3];
    q.FieldByName('h').AsInteger := a.Values[4];
    q.Post;
    if a.HasChildren then begin
      for j := 0 to a.Count - 1 do begin
        b := a.Items[j];
        q.Insert;
        q.FieldByName('nama').AsString := cxlUser.EditValue;
        q.FieldByName('nm_comp').AsString := b.Values[6];
        q.FieldByName('b').AsInteger := b.Values[1];
        q.FieldByName('i').AsInteger := b.Values[2];
        q.FieldByName('e').AsInteger := b.Values[3];
        q.FieldByName('h').AsInteger := b.Values[4];
        q.Post;
      end;
    end;
  end;
  Screen.Cursor := crDefault;

  MsgBox('Setting wewenang user sudah disimpan.');
end;

procedure TfrmSettingWewenang.Button1Click(Sender: TObject);
var
  q: TZQuery;
  a: TcxTreeListNode;
begin
  if cxlUser.Text = '' then Abort;
  Screen.Cursor := crSQLWait;
  Self.KosongiTree;
  q := OpenRS('SELECT * FROM tbl_wewenang WHERE nama = ''%s''',[cxlUser.Text]);
  while not q.Eof do begin
    a := cxTreeWewenang.FindNodeByText(q.FieldByName('nm_comp').AsString, cxtColNamaMenu);
    if q.FieldByName('b').AsInteger = 1 then a.Values[1] := 1;
    if q.FieldByName('i').AsInteger = 1 then a.Values[2] := 1;
    if q.FieldByName('e').AsInteger = 1 then a.Values[3] := 1;
    if q.FieldByName('h').AsInteger = 1 then a.Values[4] := 1;
    q.Next;
  end;
  q.Close;
  Screen.Cursor := crDefault;
  cxTreeWewenang.Root.Expand(true);
end;

procedure TfrmSettingWewenang.cxTreeWewenangEditing(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
var
  a: TcxTreeListNode;
begin
  inherited;
  a := cxTreeWewenang.FocusedNode;
  if Pos(AColumn.Name, 'cxtColInput,cxtColEdit,cxtColHapus') > 0 then begin
    if a.Values[5] = '1000' then Allow := False;
  end;
  if Pos(AColumn.Name, 'cxtColBuka') > 0 then begin
    if a.Values[5] = '0111' then Allow := False;
  end;

end;

procedure TfrmSettingWewenang.FormCreate(Sender: TObject);
begin
  inherited;
  zqrUser.Open;
end;

procedure TfrmSettingWewenang.FormShow(Sender: TObject);
var
  q, q2, q3: TZQuery;
  i,j: Integer;
  ADetDataController: TcxCustomDataController;
  an, ab, ac: TcxTreeListNode;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_tpl_wewenang where parent = ''0'' order by urutan');
  while not q.Eof do begin
    with cxtbWewenang.DataController do begin
      i := AppendRecord;
      Values[i, cxColNamaMenu.Index] := q.FieldByName('keterangan').AsString;
      ADetDataController := GetDetailDataController(I, 0);
      q2 := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''%s''',[q.FieldByName('kode').AsString]);
      while not q2.Eof do begin
        j := 0;
        with ADetDataController do begin
          j := AppendRecord;
          Values[j, cxColNamaMenu2.Index] := q2.FieldByName('keterangan').AsString;
          Values[j, cxColInput2.Index] := 0;
          Values[j, cxColEdit2.Index] := 0;
          Values[j, cxColHapus2.Index] := 0;
        end;
        q2.Next;
      end;
    end;
    q.Next;
  end;
  cxtbWewenang.ViewData.Collapse(True);
  cxtbWewenang2.ViewData.Collapse(True);

  q := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''0'' ORDER BY urutan');
  while not q.Eof  do begin
    an := cxTreeWewenang.Add;
    an.Texts[0] := q.FieldByName('keterangan').AsString;
    an.Texts[5] := q.FieldByName('b').AsString +
      q.FieldByName('i').AsString +
      q.FieldByName('e').AsString +
      q.FieldByName('h').AsString;
    an.Values[1] := 0;
    an.Values[2] := 0;
    an.Values[3] := 0;
    an.Values[4] := 0;
    an.Values[6] := q.FieldByName('nm_comp').AsString;

    q2 := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''%s''',[q.FieldByName('kode').AsString]);
    if not q2.IsEmpty then begin
      while not q2.Eof do begin
        ab := an.AddChild;
        ab.Texts[0] := q2.FieldByName('keterangan').AsString;
        ab.Values[1] := 0;
        ab.Values[2] := 0;
        ab.Values[3] := 0;
        ab.Values[4] := 0;
        ab.Texts[5] := q2.FieldByName('b').AsString +
          q2.FieldByName('i').AsString +
          q2.FieldByName('e').AsString +
          q2.FieldByName('h').AsString;
        ab.Values[6] := q2.FieldByName('nm_comp').AsString;
        q3 := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''%s''',[q2.FieldByName('kode').AsString]);
        if not q3.IsEmpty then begin
          while not q3.Eof do begin
            ac := ab.AddChild;
            ac.Texts[0] := q3.FieldByName('keterangan').AsString;
            ac.Values[1] := 0;
            ac.Values[2] := 0;
            ac.Values[3] := 0;
            ac.Values[4] := 0;
            ac.Texts[5] := q3.FieldByName('b').AsString +
              q3.FieldByName('i').AsString +
              q3.FieldByName('e').AsString +
              q3.FieldByName('h').AsString;
            ac.Values[6] := q3.FieldByName('nm_comp').AsString;
            q3.Next;
          end;
        end;
        q2.Next;
      end;
    end;
    q.Next;
  end;
  q.Close;

end;

procedure TfrmSettingWewenang.KosongiTree;
var
  q, q2, q3: TZQuery;
  i,j: Integer;
  ADetDataController: TcxCustomDataController;
  an, ab, ac: TcxTreeListNode;
begin
  cxTreeWewenang.Clear;
  q := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''0'' ORDER BY urutan');
  while not q.Eof  do begin
    an := cxTreeWewenang.Add;
    an.Texts[0] := q.FieldByName('keterangan').AsString;
    an.Texts[5] := q.FieldByName('b').AsString +
      q.FieldByName('i').AsString +
      q.FieldByName('e').AsString +
      q.FieldByName('h').AsString;
    an.Values[1] := 0;
    an.Values[2] := 0;
    an.Values[3] := 0;
    an.Values[4] := 0;
    an.Values[6] := q.FieldByName('nm_comp').AsString;

    q2 := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''%s''',[q.FieldByName('kode').AsString]);
    if not q2.IsEmpty then begin
      while not q2.Eof do begin
        ab := an.AddChild;
        ab.Texts[0] := q2.FieldByName('keterangan').AsString;
        ab.Values[1] := 0;
        ab.Values[2] := 0;
        ab.Values[3] := 0;
        ab.Values[4] := 0;
        ab.Texts[5] := q2.FieldByName('b').AsString +
          q2.FieldByName('i').AsString +
          q2.FieldByName('e').AsString +
          q2.FieldByName('h').AsString;
        ab.Values[6] := q2.FieldByName('nm_comp').AsString;
        q3 := OpenRS('SELECT * FROM tbl_tpl_wewenang WHERE parent = ''%s''',[q2.FieldByName('kode').AsString]);
        if not q3.IsEmpty then begin
          while not q3.Eof do begin
            ac := ab.AddChild;
            ac.Texts[0] := q3.FieldByName('keterangan').AsString;
            ac.Values[1] := 0;
            ac.Values[2] := 0;
            ac.Values[3] := 0;
            ac.Values[4] := 0;
            ac.Texts[5] := q3.FieldByName('b').AsString +
              q3.FieldByName('i').AsString +
              q3.FieldByName('e').AsString +
              q3.FieldByName('h').AsString;
            ac.Values[6] := q3.FieldByName('nm_comp').AsString;
            q3.Next;
          end;
        end;
        q2.Next;
      end;
    end;
    q.Next;
  end;
  q.Close;
end;

end.
