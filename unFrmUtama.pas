unit unFrmUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, ZDataset,
  dxSkinscxPCPainter, cxPC, ExtCtrls;

type
  TfrmUtama = class(TForm)
    MainMenu: TMainMenu;
    stsBar: TdxStatusBar;
    pgMain: TcxPageControl;
    mnSystem: TMenuItem;
    mnMaster: TMenuItem;
    mnMst_BarangJasa: TMenuItem;
    mnSys_LogOff: TMenuItem;
    mnSys_Keluar: TMenuItem;
    mnMst_Customer: TMenuItem;
    mnMst_Supplier: TMenuItem;
    mnMst_Mesin: TMenuItem;
    mnMst_Karyawan: TMenuItem;
    mnMst_UserProgram: TMenuItem;
    mnPPIC: TMenuItem;
    mnPRD: TMenuItem;
    PUR1: TMenuItem;
    mnMst_COA: TMenuItem;
    mnMst_Lain2: TMenuItem;
    mnSys_TutupTab: TMenuItem;
    N1: TMenuItem;
    imgBackground: TImage;
    mnMKT: TMenuItem;
    mnMkt_SalesOrder: TMenuItem;
    mnPpic_MasterOrder: TMenuItem;
    mnPur_PP: TMenuItem;
    mnPur_AppPP: TMenuItem;
    N2: TMenuItem;
    mnPur_PO: TMenuItem;
    mnPur_AppPO: TMenuItem;
    mnAKT: TMenuItem;
    mnAkt_JurnalUmum: TMenuItem;
    mnAkt_SetDefaultAkun: TMenuItem;
    mnSet: TMenuItem;
    mnSet_WewenangUser: TMenuItem;
    mnSet_SettingProgram: TMenuItem;
    mnPrd_PengambilanBB: TMenuItem;
    mnPrd_InputHslProd: TMenuItem;
    SuratJalan1: TMenuItem;
    mnPpic_MasterSchedule: TMenuItem;
    mnMkt_ReturPenjualan: TMenuItem;
    mnPpic_SOMadeToStok: TMenuItem;
    mnAKT_PenerimaanKas: TMenuItem;
    mnAKT_PengeluaranKas: TMenuItem;
    mnLap: TMenuItem;
    mnMst_Formula: TMenuItem;
    N3: TMenuItem;
    mnPur_PB: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnMst_BarangJasaClick(Sender: TObject);
    procedure mnSys_KeluarClick(Sender: TObject);
    procedure mnMst_CustomerClick(Sender: TObject);
    procedure mnMst_SupplierClick(Sender: TObject);
    procedure mnMst_MesinClick(Sender: TObject);
    procedure mnMst_UserProgramClick(Sender: TObject);
    procedure mnMst_Lain2Click(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure mnSys_TutupTabClick(Sender: TObject);
    procedure mnMst_KaryawanClick(Sender: TObject);
    procedure mnMkt_SalesOrderClick(Sender: TObject);
    procedure mnPur_PPClick(Sender: TObject);
    procedure mnMst_COAClick(Sender: TObject);
    procedure mnAkt_JurnalUmumClick(Sender: TObject);
    procedure mnAkt_SetDefaultAkunClick(Sender: TObject);
    procedure mnPpic_MasterOrderClick(Sender: TObject);
    procedure mnSys_LogOffClick(Sender: TObject);
    procedure mnSet_WewenangUserClick(Sender: TObject);
    procedure mnSet_SettingProgramClick(Sender: TObject);
    procedure mnAKT_PenerimaanKasClick(Sender: TObject);
    procedure mnPur_AppPPClick(Sender: TObject);
    procedure mnPur_POClick(Sender: TObject);
    procedure mnPur_PBClick(Sender: TObject);
    procedure mnAKT_PengeluaranKasClick(Sender: TObject);
  private
    procedure PGChange(Sender: TObject);
  public
    procedure BuildMenu;
    function CekTabOpen(sCaption: string): Boolean;
    procedure CloseTab(Frm: TForm; Sender: TObject);
    procedure ToggleMainPage;
  end;

var
  frmUtama: TfrmUtama;

function fu: TfrmUtama;

implementation

uses
  unTools, unFrmLstBarangJasa, unFrmLstCustomer, unFrmLstSupplier,
  unFrmLstMesin, unFrmLstUser, unFrmLstLain2, unDM, unFrmLstKaryawan,
  unFrmLstSO, unFrmLstPP, unFrmLstCOA, unFrmLstJurnalUmum, unFrmDefaultAkun,
  unFrmMasterOrder, unFrmLogin, unFrmSettingWewenang, unFrmSettingProgram,
  unFrmLstPenerimaanKas, unFrmAppPP, unFrmInputPO, unFrmLstPO, unFrmLstPB,
  unFrmLstPengeluaranKas;

{$R *.dfm}

function fu: TfrmUtama;
begin
  Result := frmUtama;
end;

procedure TfrmUtama.BuildMenu;
var
  q: TZQuery;
  mi: TMenuItem;
begin
  {
  q := OpenRS('SELECT * FROM tbl_menu');
  while not q.Eof do begin

    q.Next;
  end;
  }
end;

procedure TfrmUtama.FormCreate(Sender: TObject);
begin
  pgMain.OnChange := PGChange;
  pgMain.Align := alClient;
  imgBackground.Align := alClient;
  imgBackground.Picture.LoadFromFile(Aplikasi.AppPath + '/images/back.jpg');
  Caption := Aplikasi.JudulAplikasi;
end;

procedure TfrmUtama.CloseTab(Frm: TForm; Sender: TObject);
var
  t: TcxTabSheet;
  i: integer;
begin
  Frm.Release;

  {
  for i := 0 to pgMain.PageCount - 1 do begin
    if pgMain.Pages[i].Caption = 'Master Barang' then begin
      t := pgMain.Pages[i];
    end;
  end;
  //t := (Sender as TcxTabSheet);
  //MsgBox(t.Caption);
  }
end;


procedure TfrmUtama.FormShow(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
  Self.BuildMenu;
end;

procedure TfrmUtama.mnAkt_JurnalUmumClick(Sender: TObject);
var
  f: TfrmLstJurnalUmum;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Jurnal Umum') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstJurnalUmum.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAKT_PenerimaanKasClick(Sender: TObject);
var
  f: TfrmLstPenerimaanKas;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Penerimaan Kas') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPenerimaanKas.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAKT_PengeluaranKasClick(Sender: TObject);
var
  f: TfrmLstPengeluaranKas;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Pengeluaran Kas') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPengeluaranKas.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnAkt_SetDefaultAkunClick(Sender: TObject);
var
  f: TfrmDefaultAkun;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Sales Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmDefaultAkun.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMkt_SalesOrderClick(Sender: TObject);
var
  f: TfrmLstSO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Sales Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_BarangJasaClick(Sender: TObject);
var
  f: TfrmLstBarangJasa;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Barang dan Jasa') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstBarangJasa.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_COAClick(Sender: TObject);
var
  f: TfrmLstCOA;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Daftar Akun') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstCOA.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_CustomerClick(Sender: TObject);
var
  f: TfrmLstCustomer;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Customer') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstCustomer.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_KaryawanClick(Sender: TObject);
var
  f: TfrmLstKaryawan;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Karyawan') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstKaryawan.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_Lain2Click(Sender: TObject);
var
  f: TfrmLstLain2;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Kategori Barang - Departemen - Gudang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstLain2.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_MesinClick(Sender: TObject);
var
  f: TfrmLstMesin;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Mesin') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstMesin.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_SupplierClick(Sender: TObject);
var
  f: TfrmLstSupplier;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Supplier') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstSupplier.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnMst_UserProgramClick(Sender: TObject);
var
  f: TfrmLstUser;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('User') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstUser.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPpic_MasterOrderClick(Sender: TObject);
var
  f: TfrmMasterOrder;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Master Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmMasterOrder.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_AppPPClick(Sender: TObject);
var
  f: TfrmAppPP;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Approval PP') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmAppPP.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_PBClick(Sender: TObject);
var
  f: TfrmLstPB;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Penerimaan Barang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPB.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_POClick(Sender: TObject);
var
  f: TfrmLstPO;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Purchase Order') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPO.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnPur_PPClick(Sender: TObject);
var
  f: TfrmLstPP;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Permintaan Pembelian') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmLstPP.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnSet_SettingProgramClick(Sender: TObject);
var
  f: TfrmSettingProgram;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Setting Program') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmSettingProgram.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnSet_WewenangUserClick(Sender: TObject);
var
  f: TfrmSettingWewenang;
  ts: TcxTabSheet;
begin
  if not CekTabOpen('Setting Wewenang') then begin
    ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := pgMain;

    f := TfrmSettingWewenang.Create(Self);
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    pgMain.ActivePage := ts;
  end;
end;

procedure TfrmUtama.mnSys_KeluarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmUtama.mnSys_LogOffClick(Sender: TObject);
var
  f: TFrmLogin;
begin
  Self.mnSys_TutupTabClick(nil);

  Aplikasi.NamaUser := '';
  Aplikasi.UserDept := '';
  Aplikasi.EmailUser := '';
  Aplikasi.Jabatan := '';

  frmUtama.stsBar.Panels[1].Text := '';
  frmUtama.stsBar.Panels[2].Text := '';
  frmUtama.stsBar.Panels[3].Text := '';
  frmUtama.stsBar.Panels[4].Text := '';

  f := TfrmLogin.Create(Self);
  f.ShowModal;
end;

procedure TfrmUtama.mnSys_TutupTabClick(Sender: TObject);
var
  i, styleID: Integer;
  ts: TcxTabSheet;
  pagecontrol:TcxPageControl;

  component: TComponent;
  stream: TMemoryStream;

begin
  {
  RegisterClass(TcxPageControl);
  stream := TMemoryStream.Create;
  try
    stream.WriteComponent(pgMain);
    stream.Position := 0;
    component := stream.ReadComponent(nil);
    pagecontrol := component as TcxPageControl;

    pgMain.Free;

    pagecontrol.Name := 'pgMain';
    InsertComponent(pagecontrol);

    pagecontrol.Parent := Self;
    pagecontrol.Align := alClient;
  finally
    stream.Free;
  end;
  }

  if not pgMain.Visible then Abort;

  styleID := pgMain.Style;
  PGMain.Free;
  pagecontrol := TcxPageControl.Create(Self);

  with pagecontrol do begin
    pagecontrol.Name := 'PGMain';
    pagecontrol.Align := alClient;
    pagecontrol.Parent := frmUtama;
    //pagecontrol.ShowFrame := True;
    pagecontrol.HotTrack := True;
    //pagecontrol.ParentColor := False;
    //pagecontrol.Color := clSkyBlue;
    //pagecontrol.LookAndFeel.Kind := lfOffice11;
    pagecontrol.Style := styleID;
    //pagecontrol.Visible := True;
    //pagecontrol.HideTabs := True;
    //pagecontrol.Options := [pcoAlwaysShowGoDialogButton,pcoCloseButton,pcoGradient,pcoGradientClientArea,pcoRedrawOnResize];
    pagecontrol.ParentBackground := False;
    pagecontrol.Options := [pcoAlwaysShowGoDialogButton,pcoCloseButton];
    pagecontrol.Visible := False;
    pagecontrol.OnChange := PGChange;
  end;

end;

procedure TfrmUtama.PGChange(Sender: TObject);
var
  pg: TcxPageControl;
begin
  pg := (Sender as TcxPageControl);
  if pg.TabCount = 0 then pg.Visible := False;
end;

procedure TfrmUtama.pgMainChange(Sender: TObject);
begin
  if pgMain.TabCount = 0 then pgMain.Visible := False;
end;

procedure TfrmUtama.ToggleMainPage;
begin
  if not pgMain.Visible then pgMain.Visible := True;
end;

function TfrmUtama.CekTabOpen(sCaption: string): Boolean;
var
  i: Integer;
  f: boolean;
  ts: TcxTabSheet;
begin
  f := False;
  for i := 0 to pgMain.TabCount - 1 do begin
    if sCaption = pgMain.Tabs[i].Caption then begin
      ts := pgMain.Pages[i];
      f := True;
      Break;
    end;
  end;

  if f then begin
    pgMain.ActivePage := ts;
  end;

  Result := f;
end;

end.

