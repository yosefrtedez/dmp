unit unFrmTplGrid;

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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  StdCtrls, cxPC, ZDataset;

type
  TfrmTplGrid = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnTambah: TButton;
    btnEdit: TButton;
    btnHapus: TButton;
    btnKeluar: TButton;
    btnRefresh: TButton;
    procedure btnKeluarClick(Sender: TObject);
  private
    mNamaMenu: string;
  public
    property NamaMenu: string read mNamaMenu write mNamaMenu;
    procedure TerapkanWewenang(sNamaMenu: string);
  end;

var
  frmTplGrid: TfrmTplGrid;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmTplGrid.btnKeluarClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  ts.Free;
end;

procedure TfrmTplGrid.TerapkanWewenang(sNamaMenu: string);
var
  q: TZQuery;
  s: string;
  i,j: integer;
  lst, lst2: TStringList;
  btn: TButton;
begin
  if Pos(Aplikasi.NamaUser, 'ADMIN;HENDRA;FELGITO') > 0 then begin
    btnTambah.Visible := True;
    btnEdit.Visible := True;
    btnHapus.Visible := True;
  end
  else begin

    q := OpenRS('SELECT * FROM tbl_wewenang WHERE nama = ''%s'' AND nm_comp = ''%s''',[Aplikasi.NamaUser, sNamaMenu]);
    s := q.FieldByName('i').AsString + q.FieldByName('e').AsString + q.FieldByName('h').AsString;
    lst := TStringList.Create;
    lst.CommaText := ',btnTambah,btnEdit,btnHapus';
    for i  := 1 to 3 do begin
      btn := FindComponent(lst.Strings[i]) as TButton;
      if Copy(s,i,1) = '0' then btn.Visible := False;
    end;

    lst.CommaText := ',btnTambah,btnEdit,btnHapus,btnRefresh';

    lst2 := TStringList.Create;
    lst2.CommaText := ',10,91,172,253';
    j := 1;
    for i  := 1 to 4 do begin
      btn := FindComponent(lst.Strings[i]) as TButton;
      if not btn.Visible then
        Continue
      else begin
        btn.Left := StrToInt(lst2.Strings[j]);
        Inc(j);
      end;
    end;
    q.Close;
  end;
end;

end.
