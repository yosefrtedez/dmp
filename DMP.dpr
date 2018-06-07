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
  unFrmLstLain2 in 'lainlain\unFrmLstLain2.pas' {frmLstLain2},
  unFrmInputSO in 'salesorder\unFrmInputSO.pas' {frmInputSO},
  unFrmLstSO in 'salesorder\unFrmLstSO.pas' {frmLstSO},
  unFrmLstPO in 'purchaseorder\unFrmLstPO.pas' {frmLstPO},
  unFrmInputPO in 'purchaseorder\unFrmInputPO.pas' {frmInputPO},
  unFrmLstPP in 'permintaanpembelian\unFrmLstPP.pas' {frmLstPP},
  unFrmInputPP in 'permintaanpembelian\unFrmInputPP.pas' {frmInputPP},
  unFrmLstCOA in 'coa\unFrmLstCOA.pas' {frmLstCOA},
  unFrmCari in 'unFrmCari.pas' {frmCari},
  unFrmInputCOA in 'coa\unFrmInputCOA.pas' {frmInputCOA},
  unFrmLstJurnalUmum in 'jurnalumum\unFrmLstJurnalUmum.pas' {frmLstJurnalUmum},
  unFrmInputJurnalUmum in 'jurnalumum\unFrmInputJurnalUmum.pas' {frmInputJurnalUmum},
  unFrmAppPP in 'permintaanpembelian\unFrmAppPP.pas' {frmAppPP},
  unFrmDefaultAkun in 'coa\unFrmDefaultAkun.pas' {frmDefaultAkun},
  unFrmMasterOrder in 'masterorder\unFrmMasterOrder.pas' {frmMasterOrder};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmUtama, frmUtama);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAppPP, frmAppPP);
  Application.CreateForm(TfrmDefaultAkun, frmDefaultAkun);
  Application.CreateForm(TfrmMasterOrder, frmMasterOrder);
  frmUtama.Show;

  frmLogin.ShowModal;

  if frmLogin.ModalResult = mrOk then begin
    //frmLogin.Close;
    //frmLogin.Destroy;

  end;

  Application.Run;
end.
