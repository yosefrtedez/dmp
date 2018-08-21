unit unFrmInputUser;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB,
  ZAbstractRODataset, ZDataset, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel;

type
  TfrmInputUser = class(TfrmTplInput)
    cxLabel1: TcxLabel;
    cxtUserLogin: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxtNamaLengkap: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxlDept: TcxLookupComboBox;
    zqrDept: TZReadOnlyQuery;
    dsDept: TDataSource;
    Label13: TLabel;
    cxLabel4: TcxLabel;
    cxtPass1: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxtPass2: TcxTextEdit;
    cxtEmail: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxlJabatan: TcxLookupComboBox;
    zqrJabatan: TZReadOnlyQuery;
    dsJabatan: TDataSource;
    cxLabel8: TcxLabel;
    cxlAtasan: TcxLookupComboBox;
    zqrAtasan: TZReadOnlyQuery;
    dsAtasan: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmInputUser: TfrmInputUser;

implementation

uses unDM, unTools, unFrmLstUser;

{$R *.dfm}

procedure TfrmInputUser.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  if Trim(cxtUserLogin.Text) = '' then begin
    MsgBox('Mohon isi user login.');
    cxtUserLogin.SetFocus;
  end
  else if Trim(cxtNamaLengkap.Text) = '' then begin
    MsgBox('Mohon isi nama lengkap user.');
    cxtNamaLengkap.SetFocus;
  end
  else if Trim(cxlDept.Text) = '' then begin
    MsgBox('Mohon pilih departemen user.');
    cxlDept.SetFocus;
  end
  else begin

    if Self.Jenis = 'T' then begin
      if Trim(cxtPass1.Text) = '' then begin
        MsgBox('Mohon isi password.');
        cxtPass1.SetFocus;
        Abort;
      end;

      if Trim(cxtPass2.Text) = '' then begin
        MsgBox('Mohin isi konfirmasi password.');
        cxtPass2.SetFocus;
        Abort;
      end;

      if Length(Trim(cxtPass1.Text)) < 6 then begin
        MsgBox('Panjang password minimal 6 karakter.');
        cxtPass1.SetFocus;
        cxtPass1.SelectAll;
        Abort;
      end;

      if Trim(cxtPass1.Text) <> Trim(cxtPass2.Text) then begin
        MsgBox('Password dan Konfirmasi Password harus sama.');
        cxtPass1.SetFocus;
        cxtPass1.SelectAll;
        Abort;
      end;
    end;

    q := OpenRS('SELECT * FROM tbl_user WHERE nama = ''%s''',[cxtUserLogin.Text]);
    if Self.Jenis = 'T' then
      q.Insert
    else
      q.Edit;
    q.FieldByName('nama').AsString := Trim(cxtUserLogin.Text);
    q.FieldByName('nama_lengkap').AsString := Trim(cxtNamaLengkap.Text);
    q.FieldByName('dept').AsString := cxlDept.Text;
    q.FieldByName('jabatan').AsString := cxlJabatan.Text;
    q.FieldByName('id_atasan').AsString := VarToStr(cxlAtasan.EditValue);
    if Self.Jenis = 'T' then
      q.FieldByName('password').AsString := MySQLPassword(Trim(UpperCase(cxtPass1.Text)));
    q.FieldByName('email').AsString := LowerCase(Trim(cxtEmail.Text));
    q.Post;

    MsgBox('Data user sudah berhasil disimpan.');

    if Assigned(Self.FormInduk) then
      (Self.FormInduk as TfrmLstUser).btnRefreshClick(nil);
    btnBatalClick(nil);
  end;
end;

procedure TfrmInputUser.FormCreate(Sender: TObject);
begin
  inherited;
  zqrDept.Open;
  zqrJabatan.Open;
end;

procedure TfrmInputUser.FormShow(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_user WHERE nama = ''%s''',[Self.EditKey]);
    cxtUserLogin.Text := q.FieldByName('nama').AsString;
    cxtUserLogin.Enabled := False;
    cxtNamaLengkap.Text := q.FieldByName('nama_lengkap').AsString;
    cxlDept.EditValue := q.FieldByName('dept').AsString;
    cxlJabatan.EditValue := q.FieldByName('jabatan').AsString;
    cxtEmail.Text := q.FieldByName('email').AsString;
    q.Close;
  end;
end;

end.
