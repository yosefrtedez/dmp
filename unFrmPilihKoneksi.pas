unit unFrmPilihKoneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TfrmPilihKoneksi = class(TForm)
    Label1: TLabel;
    lstBoxKoneksi: TListBox;
    btnOK: TButton;
    btnBatal: TButton;
    lstBoxSection: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure lstBoxKoneksiDblClick(Sender: TObject);
  private
    mSection: string;
  public
    property Section: string read mSection write mSection;
  end;

var
  frmPilihKoneksi: TfrmPilihKoneksi;

implementation

uses unAplikasi, unDm;

{$R *.dfm}

procedure TfrmPilihKoneksi.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  lstSec: TStringList;
  i: integer;
  title: string;
begin
  Ini := TIniFile.Create(aplikasi.AppPath + 'setting.ini');

  lstSec := TStringList.Create;
  Ini.ReadSections(lstSec);

  for i := 0 to lstSec.Count - 1 do begin
    title := Ini.ReadString(lstSec.Strings[i], 'title', '');
    lstBoxSection.Items.Add(lstSec.Strings[i]);
    lstBoxKoneksi.Items.Add(title);
  end;

end;

procedure TfrmPilihKoneksi.lstBoxKoneksiDblClick(Sender: TObject);
begin
  mSection := lstBoxSection.Items.Strings[lstBoxKoneksi.ItemIndex];
  btnOKClick(nil);
end;

procedure TfrmPilihKoneksi.btnOKClick(Sender: TObject);
begin
  if lstBoxKoneksi.ItemIndex = -1 then Abort;
  mSection := lstBoxSection.Items.Strings[lstBoxKoneksi.ItemIndex];
  ModalResult := mrOk;
end;

procedure TfrmPilihKoneksi.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
