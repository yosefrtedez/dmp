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
  cxDBLookupEdit, cxDBLookupComboBox, ZDataset, DB, ZAbstractRODataset;

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
    zqrInduk: TZReadOnlyQuery;
    dsInduk: TDataSource;
    zqrTipeAkun: TZReadOnlyQuery;
    dsTipeAkun: TDataSource;
    Button1: TButton;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputCOA: TfrmInputCOA;

implementation

uses unTools, unAplikasi, unDM, unFrmLstCOA;

{$R *.dfm}

procedure TfrmInputCOA.btnSimpanClick(Sender: TObject);
var
  f: boolean;
  i: Integer;
  q: TZQuery;
  stmp: string;
begin
  inherited;

  if Trim(cxlTipeAkun.Text) = '' then begin
    MsgBox('Mohon isi tipe akun.');
    cxlTipeAkun.SetFocus;
  end
  else if Trim(cxtNoAkun.Text) = '' then begin
    MsgBox('Mohon isi nomor akun.');
    cxtNoAkun.SetFocus;
  end
  else if Trim(cxtNamaAkun.Text) = '' then begin
    MsgBox('Mohon isi nama akun.');
    cxtNamaAKun.SetFocus;
  end
  else begin

    if Self.Jenis = 'T' then begin
      if Pos(Trim(cxtNoAkun.Text),' ') > 0 then begin
        MsgBox('No. Akun tidak boleh ada spasi.');
        cxtNoAkun.SetFocus;
        cxtNoAkun.SelectAll;
        Abort;
      end
    end;

    q := OpenRS('SELECT * FROM tbl_coa WHERE nama = ''%s''',[Trim(cxtNoAkun.Text)]);
    if Self.Jenis = 'T' then
      q.Insert
    else
      q.Edit;
    q.FieldByName('tipe').AsString := cxlTipeAkun.EditValue;
    q.FieldByName('noakun').AsString := Trim(cxtNoAkun.Text);
    q.FieldByName('nama').AsString := Trim(cxtNamaAKun.Text);
    q.FieldByName('induk').AsString := VarToStr(cxlIndukAkun.EditValue);
    q.Post;

    MsgBox('Data COA sudah berhasil disimpan.');
    //flCOA.RefreshGrid;
    if Assigned(frmLstCOA) then
      frmLstCOA.RefreshGrid;

  end;
end;

procedure TfrmInputCOA.Button1Click(Sender: TObject);
begin
  inherited;
  frmLstCOA.btnRefreshClick(nil);
end;

procedure TfrmInputCOA.FormCreate(Sender: TObject);
begin
  inherited;
  zqrInduk.Open;
  zqrTipeAkun.Open;
end;

procedure TfrmInputCOA.FormShow(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT * FROM tbl_coa WHERE noakun = ''%s''',[Self.EditKey]);
  if not q.IsEmpty then begin
    cxlTipeAkun.EditValue := q.FieldByName('tipe').AsString;
    cxlIndukAkun.EditValue := q.FieldByName('induk').Value;
    cxtNoAkun.Text := q.FieldByName('noakun').AsString;
    cxtNamaAKun.Text := q.FieldByName('nama').AsString;
    cxtNoAkun.Enabled := False;
  end;
  q.Close;
end;

end.
