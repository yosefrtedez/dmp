program DMP;

uses
  Forms,
  Controls,
  unFrmUtama in 'unFrmUtama.pas' {frmUtama},
  unDM in 'unDM.pas' {DM: TDataModule},
  unTools in 'unTools.pas',
  unFrmLogin in 'unFrmLogin.pas' {frmLogin},
  unAplikasi in 'unAplikasi.pas',
  unFrmTplGrid in 'template\unFrmTplGrid.pas' {frmTplGrid},
  unFrmLstCustomer in 'customer\unFrmLstCustomer.pas' {frmLstCustomer},
  unFrmTplInput in 'template\unFrmTplInput.pas' {frmTplInput},
  unFrmPilihKoneksi in 'unFrmPilihKoneksi.pas' {frmPilihKoneksi},
  unFrmInputBarangJasa in 'barangjasa\unFrmInputBarangJasa.pas' {frmInputBarangJasa},
  unFrmLstBarangJasa in 'barangjasa\unFrmLstBarangJasa.pas' {frmLstBarangJasa},
  unFrmInputCustomer in 'customer\unFrmInputCustomer.pas' {frmInputCustomer},
  unFrmInputSupplier in 'supplier\unFrmInputSupplier.pas' {frmInputSupplier},
  unFrmLstSupplier in 'supplier\unFrmLstSupplier.pas' {frmLstSupplier},
  unFrmInputMesin in 'mesin\unFrmInputMesin.pas' {frmInputMesin},
  unFrmLstMesin in 'mesin\unFrmLstMesin.pas' {frmLstMesin},
  unFrmInputKaryawan in 'karyawan\unFrmInputKaryawan.pas' {frmInputKaryawan},
  unFrmLstKaryawan in 'karyawan\unFrmLstKaryawan.pas' {frmLstkaryawan},
  unFrmInputUser in 'user\unFrmInputUser.pas' {frmInputUser},
  unFrmLstUser in 'user\unFrmLstUser.pas' {frmLstUser},
  unFrmLstLain2 in 'lainlain\unFrmLstLain2.pas' {frmLstLain2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmUtama, frmUtama);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmInputBarangJasa, frmInputBarangJasa);
  Application.CreateForm(TfrmLstBarangJasa, frmLstBarangJasa);
  Application.CreateForm(TfrmInputCustomer, frmInputCustomer);
  Application.CreateForm(TfrmInputSupplier, frmInputSupplier);
  Application.CreateForm(TfrmLstSupplier, frmLstSupplier);
  Application.CreateForm(TfrmInputMesin, frmInputMesin);
  Application.CreateForm(TfrmLstMesin, frmLstMesin);
  Application.CreateForm(TfrmInputKaryawan, frmInputKaryawan);
  Application.CreateForm(TfrmLstkaryawan, frmLstkaryawan);
  Application.CreateForm(TfrmInputUser, frmInputUser);
  Application.CreateForm(TfrmLstUser, frmLstUser);
  Application.CreateForm(TfrmLstLain2, frmLstLain2);
  frmUtama.Show;

  frmLogin.ShowModal;

  if frmLogin.ModalResult = mrOk then begin
    //frmLogin.Close;
    //frmLogin.Destroy;

  end;

  Application.Run;
end.
