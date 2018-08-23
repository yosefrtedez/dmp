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
  unFrmMasterOrder in 'masterorder\unFrmMasterOrder.pas' {frmMasterOrder},
  unFrmSettingProgram in 'setting\unFrmSettingProgram.pas' {frmSettingProgram},
  unFrmInputPenerimaanKas in 'penerimaanpengeluarankas\unFrmInputPenerimaanKas.pas' {frmInputPenerimaanKas},
  unFrmLstPenerimaanKas in 'penerimaanpengeluarankas\unFrmLstPenerimaanKas.pas' {frmLstPenerimaanKas},
  unFrmLstFormula in 'formula\unFrmLstFormula.pas' {frmLstFormula},
  unFrmInputFormula in 'formula\unFrmInputFormula.pas' {frmInputFormula},
  unFrmAppPO in 'purchaseorder\unFrmAppPO.pas' {frmAppPO},
  unFrmLstPB in 'penerimaanbarang\unFrmLstPB.pas' {frmLstPB},
  unFrmInputPB in 'penerimaanbarang\unFrmInputPB.pas' {frmInputPB},
  unFrmLstPengeluaranKas in 'penerimaanpengeluarankas\unFrmLstPengeluaranKas.pas' {frmLstPengeluaranKas},
  unFrmInputPengeluaranKas in 'penerimaanpengeluarankas\unFrmInputPengeluaranKas.pas' {frmInputPengeluaranKas},
  unFrmLstTransferBarang in 'transferbarang\unFrmLstTransferBarang.pas' {frmLstTransferBarang},
  unFrmInputTransferBarang in 'transferbarang\unFrmInputTransferBarang.pas' {frmTplInput2},
  unFrmLstSales in 'sales\unFrmLstSales.pas' {frmLstSales},
  unFrmInputSales in 'sales\unFrmInputSales.pas' {frmInputSales},
  unFrmLstReturPembelian in 'returpembelian\unFrmLstReturPembelian.pas' {frmLstReturPembelian},
  unFrmInputReturPembelian in 'returpembelian\unFrmInputReturPembelian.pas' {frmInputReturPembelian},
  unFrmAppRetur in 'returpembelian\unFrmAppRetur.pas' {frmAppRetur},
  unFrmCariBrg in 'unFrmCariBrg.pas' {frmCariBrg},
  unFrmInputBarangMasuk in 'barangmasuk\unFrmInputBarangMasuk.pas' {frmInputBarangMasuk},
  unFrmLstBarangMasuk in 'barangmasuk\unFrmLstBarangMasuk.pas' {frmLstBarangMasuk},
  unFrmInputBarangKeluar in 'barangkeluar\unFrmInputBarangKeluar.pas' {frmInputBarangKeluar},
  unFrmLstBarangKeluar in 'barangkeluar\unFrmLstBarangKeluar.pas' {frmLstBarangKeluar},
  unFrmKetUpdate in 'unFrmKetUpdate.pas' {frmKetUpdate},
  unFrmTmpLap01 in 'laporan\unFrmTmpLap01.pas' {frmTmpLap01},
  unFrmLapMasterData in 'laporan\unFrmLapMasterData.pas' {frmLapMasterData},
  unFrmRptTransaksi in 'laporan\unFrmRptTransaksi.pas' {frmRptTransaksi},
  unFrmPilihHarga in 'barangkeluar\unFrmPilihHarga.pas' {frmPilihHarga},
  unFrmSettingWewenang in 'setting\unFrmSettingWewenang.pas' {frmSettingWewenang},
  unFrmKalkulasiStok in 'setting\unFrmKalkulasiStok.pas' {frmKalkulasiStok},
  unFrmSPK in 'spk\unFrmSPK.pas' {frmSPK},
  unFrmInputKoreksi in 'koreksi\unFrmInputKoreksi.pas' {frmInputKoreksi},
  unFrmLstKoreksi in 'koreksi\unFrmLstKoreksi.pas' {frmLstKoreksi},
  unFrmLapPO in 'laporan\unFrmLapPO.pas' {frmLapPO},
  unFrmMenuLaporan in 'laporan\unFrmMenuLaporan.pas' {frmMenuLaporan},
  unFrmeTplLap in 'laporan\unFrmeTplLap.pas' {frmeTplLap: TFrame},
  unFrmLapMaster in 'laporan\unFrmLapMaster.pas' {frmLapMaster},
  unFrmInputSuratJalan in 'suratjalan\unFrmInputSuratJalan.pas' {frmInputSuratJalan},
  unFrmLstSuratJalan in 'suratjalan\unFrmLstSuratJalan.pas' {frmLstSuratJalan},
  unFrmPengambilanBahanBaku in 'pengambilanbahanbaku\unFrmPengambilanBahanBaku.pas' {frmPengambilanBahanBaku},
  unFrmInputHasilProduksi in 'hasilproduksi\unFrmInputHasilProduksi.pas' {frmInputHasilProduksi},
  unFrmLapTransaksi in 'laporan\unFrmLapTransaksi.pas' {frmLapTransaksi},
  unFrmLapSPK in 'laporan\unFrmLapSPK.pas' {frmLapSPK},
  unFrmPilihSO in 'salesorder\unFrmPilihSO.pas' {frmPilihSO},
  unFrmLapSJ in 'laporan\unFrmLapSJ.pas' {frmLapSJ},
  unFrmLapHasilProduksi in 'laporan\unFrmLapHasilProduksi.pas' {frmLapHasilProduksi},
  unFrmKartuStok in 'barangjasa\unFrmKartuStok.pas' {frmKartuStok},
  unFrmInputSOMTS in 'salesorder\unFrmInputSOMTS.pas' {frmInputSOMTS},
  unFrmPilihPO in 'purchaseorder\unFrmPilihPO.pas' {frmPilihPO},
  unFrmLapPengambilanBB in 'laporan\unFrmLapPengambilanBB.pas' {frmLapPengambilanBB},
  unFrmLapOutstandingPO in 'purchaseorder\unFrmLapOutstandingPO.pas' {frmLapOutstandingPO},
  unFrmLapOutstandingSO in 'salesorder\unFrmLapOutstandingSO.pas' {frmLapOutstandingSO},
  unFrmUbahPassword in 'setting\unFrmUbahPassword.pas' {frmUbahPassword},
  unFrmInputInvoicePembelian in 'invoicepembelian\unFrmInputInvoicePembelian.pas' {frmInputInvoicePembelian},
  unFrmLstInvoicePembelian in 'invoicepembelian\unFrmLstInvoicePembelian.pas' {frmLstInvoicePembelian},
  unFrmInputPembayaranPembelian in 'pembayaranpembelian\unFrmInputPembayaranPembelian.pas' {frmInputPembayaranPembelian},
  unFrmLstPembayaranPembelian in 'pembayaranpembelian\unFrmLstPembayaranPembelian.pas' {frmLstPembayaranPembelian},
  unFrmInputInvoicePenjualan in 'invoicepenjualan\unFrmInputInvoicePenjualan.pas' {frmInputInvoicePenjualan},
  unFrmLstInvoicePenjualan in 'invoicepenjualan\unFrmLstInvoicePenjualan.pas' {frmLstInvoicePenjualan},
  unFrmLapKasMasukKasKeluar in 'laporan\unFrmLapKasMasukKasKeluar.pas' {frmLapKasMasukKasKeluar},
  unFrmLapInvoicePenjualan in 'laporan\unFrmLapInvoicePenjualan.pas' {frmLapInvoicePenjualan};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmUtama, frmUtama);
  Application.CreateForm(TfrmLogin, frmLogin);
  frmUtama.Show;

  frmLogin.ShowModal;

  if frmLogin.ModalResult = mrOk then begin
    //frmLogin.Close;
    //frmLogin.Destroy;

  end;

  Application.Run;
end.
