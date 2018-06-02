unit unFrmInputKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxLabel, StdCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ZDataset, Menus, cxButtons, jpeg, cxCheckBox;

type
  TfrmInputKaryawan = class(TfrmTplInput)
    cxlbl1: TcxLabel;
    cxtNik: TcxTextEdit;
    cxtNama: TcxTextEdit;
    cxtJabatan: TcxTextEdit;
    cxtDivisi: TcxTextEdit;
    img1: TImage;
    dlgOpen1: TOpenDialog;
    cxtFoto: TcxTextEdit;
    cxlbl2: TcxLabel;
    cxlbl3: TcxLabel;
    btn1: TcxButton;
    cxlbl4: TcxLabel;
    cxlbl5: TcxLabel;
    cxtDepartemen: TcxTextEdit;
    cxchkAktif: TcxCheckBox;
    procedure btnSimpanClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ClearAll;
  public
    { Public declarations }
  end;

var
  frmInputKaryawan: TfrmInputKaryawan;

implementation

uses unTools;

{$R *.dfm}

procedure TfrmInputKaryawan.btn1Click(Sender: TObject);

begin
  inherited;
  if dlgOpen1.Execute then begin
    img1.Picture.LoadFromFile(dlgOpen1.FileName);
    cxtFoto.Text := dlgOpen1.FileName;
  end;

end;

procedure TfrmInputKaryawan.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
  fotoku : TMemoryStream;
begin
  inherited;
  if cxtNik.Text = '' then begin
    MsgBox('Mohon isi NIK Karyawan.');
    cxtNik.SetFocus;
    Abort;
  end else
  if cxtNama.Text = '' then begin
    MsgBox('Mohon isi nama karyawan.');
    cxtNama.SetFocus;
    Abort;
  end else begin
    if img1.Picture <> nil then begin
      q := OpenRS('SELECT * FROM tbl_karyawan WHERE nik = ''%s''',[cxtnik.Text]);
      if Self.Jenis = 'T' then
        q.Insert
      else
      q.Edit;
      q.FieldByName('nik').AsString := Trim(cxtNik.Text);
      q.FieldByName('nama').AsString := Trim(cxtNama.Text);
      q.FieldByName('jabatan').AsString := Trim(cxtJabatan.Text);
      q.FieldByName('divisi').AsString := Trim(cxtDivisi.Text);
      q.FieldByName('departemen').AsString := Trim(cxtDepartemen.Text);
      if cxchkAktif.Checked = true then
        q.FieldByName('f_karyawan').AsInteger := 1
      else
        q.FieldByName('f_karyawan').AsInteger := 0;
      q.Post;
    end;
    MsgBox('Data supplier sudah berhasil disimpan.');
    ClearAll;
    btnBatalClick(nil);
    end;
end;


procedure TfrmInputKaryawan.ClearAll;
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do begin
    if Components[i].Tag = 1 then
      (Components[i] as TcxTextEdit).Text := '';
  end;
end;


procedure TfrmInputKaryawan.FormCreate(Sender: TObject);
begin
  inherited;
  cxchkAktif.Checked := True;
end;

procedure TfrmInputKaryawan.FormShow(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_karyawan WHERE nik = ''%s''',[Self.EditKey]);
    cxtNik.Text := q.FieldByName('nik').AsString;
    cxtNama.Text := q.FieldByName('nama').AsString;
    cxtJabatan.Text := q.FieldByName('jabatan').AsString;
    cxtDivisi.Text := q.FieldByName('divisi').AsString;
    cxtDepartemen.Text := q.FieldByName('departemen').AsString;
    if q.FieldByName('f_karyawan').AsInteger = 1 then
      cxchkAktif.Checked := True
    else
      cxchkAktif.Checked := False;
    q.Close;
  end;
end;

end.
