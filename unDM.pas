unit unDM;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, unAplikasi, ZDataset, IniFiles, Forms, Controls,
  ImgList, Windows;

type
  TDM = class(TDataModule)
    zConn: TZConnection;
    IL16: TImageList;
    I64: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CekUpdate;
  public
    { Public declarations }
  end;

var
  DM: TDM;
  Aplikasi: TAplikasi;
  UpdatePath: string;

implementation

uses unFrmPilihKoneksi, unTools, LbCipher, LbString, unFrmKetUpdate;

var
  Key128: TKey128;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  FileIni, db, host, user,
  password, dsn, port: string;

  Ini, Ini2, Ini3: TIniFile;
  i: integer;
  q: TZQuery;

  tx: TextFile;
  frmPilihKoneksi: TfrmPilihKoneksi;
  section, fupdate: string;
  lstSec: TStringList;
begin
  Aplikasi := TAplikasi.Create;
  if ParamStr(2) = '/debug' then Aplikasi.debug := true;

  Aplikasi.AppPath := ExtractFilePath(Application.ExeName);
  Aplikasi.ExeName := 'dmp';

  if not FileExists(Aplikasi.AppPath + 'setting.ini') then begin
    MsgBox('Error, file setting.ini tidak ditemukan.');
    Application.Terminate;
  end;

  FileIni := Aplikasi.AppPath + 'setting.ini';

  Ini3 := TIniFile.Create(FileIni);
  lstSec := TStringList.Create;
  Ini3.ReadSections(lstSec);

  if lstSec.Count > 1 then begin
    frmPilihKoneksi := TfrmPilihKoneksi.Create(Self);
    if frmPilihKoneksi.ShowModal = mrOk then begin
      section := frmPilihKoneksi.Section;
      frmPilihKoneksi.Release;
    end
    else begin
      Application.Terminate;
      Abort;
    end;
  end
  else
    section := 'database';

  // get update_path
  Ini2 := TIniFile.Create(FileIni);
  UpdatePath := Ini2.ReadString(section,'update_path','');

  if ParamCount > 0 then begin
    if ParamStr(1) <> '/noupdate' then begin
      CekUpdate;
    end;
    if ParamStr(2) = '/admin:admin1' then begin
      aplikasi.debug := true;
    end;
  end
  else begin
    CekUpdate;
  end;

  if (FileExists(FileIni)) then begin

    if zConn.Connected = False then begin
      Ini := TIniFile.Create(FileIni);
      db := Ini.ReadString(section,'db','');
      host := Ini.ReadString(section,'host','');
      user := Ini.ReadString(section,'user','');
      password := Ini.ReadString(section,'password','');
      aplikasi.POTmp := Ini.ReadString(section,'potmp','');
      port := Ini.ReadString(section,'port','3306');

      GenerateLMDKey(Key128, SizeOf(Key128), '238');
      password := TripleDESEncryptStringCBCEx(password, Key128, False);
      //Aplikasi.ComPort := Ini.ReadString(section,'ComPort','COM3');

      zConn.Catalog := db;
      zConn.Database := db;
      zConn.HostName := host;
      zConn.User := user;
      zConn.Password := password;
      zConn.Connect;
    end;

    q := OpenRS('SELECT * FROM tbl_app');

    Aplikasi.DBHost := zConn.HostName;
    Aplikasi.DBName := zConn.Database;
    Aplikasi.GdgPB := q.FieldByName('gdg_pb').AsInteger;
    Aplikasi.GdgBB := q.FieldByName('gdg_bb').AsInteger;
    Aplikasi.GdgBJ := q.FieldByname('gdg_bj').AsInteger;

    {
    if aplikasi.debug then
      aplikasi.ServerSMTP := q.FieldByName('mail_server').AsString
    else
      aplikasi.ServerSMTP := q.FieldByName('mail_server').AsString;
    }

    // ambil user database
    aplikasi.DBUser := user;
    // ambil password database
    aplikasi.DBPassword := password;
    // setting path report
    aplikasi.ReportPath := aplikasi.AppPath + 'report\';

    // get tanggal stok awal terkecil
    q := OpenRS('SELECT MIN(tanggal) AS tanggal FROM tbl_stkawal');
    if (not q.IsEmpty) and (not q.FieldByName('tanggal').IsNull) then
      aplikasi.TglStkAwal := q.FieldByName('tanggal').AsDateTime
    else
      aplikasi.TglStkAwal := EncodeDate(1970,1,1);
    q.Close;
  end;
end;

procedure Tdm.CekUpdate;
var
  mSourcePath, mTargetPath, BackName, ExeName: string;
  f: TfrmKetUpdate;
  lstIP: TStringList;
begin

  if UpdatePath <> '' then
    mSourcePath := UpdatePath
  else
    mSourcePath := '\\192.168.0.241\PUBLIC\SOFTWARE UPDATER\MutasiStok\';

  ExeName := Aplikasi.ExeName;
  BackName := ExtractFilePath(Application.ExeName) + ExeName + '.old';
  mTargetPath := ExtractFilePath(Application.ExeName) + ExeName + '.exe';

  if DirectoryExists(mSourcePath) then begin

    if FileExists(mSourcePath+ '\' + ExeName + '.exe') then begin
      f := TfrmKetUpdate.Create(Self);

      if FileExists(BackName) then begin
        DeleteFile(PChar(BackName));
      end;

      zConn.Disconnect;
      if FileAge(mSourcePath + '\' + ExeName + '.exe') <> FileAge(mTargetPath) then begin

        f.Show;
        f.Refresh;

        RenameFile(Application.ExeName, BackName);
        try
          CopyFile(PChar(mSourcePath + '\' + ExeName + '.exe'),PChar(mTargetPath), False);
          f.Close;
          MsgBox('Update berhasil, silahkan jalankan program kembali.');
          Application.Terminate;
        except
          on E: Exception do begin
            MsgBox('Update gagal, silahkan jalankan program kembali.');
            Application.Terminate;
          end;
        end;
      end;
    end;
  end;
end;

end.
