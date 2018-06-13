unit unFrmInputSO;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxLabel,
  cxTextEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ZAbstractRODataset, ZDataset, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxSpinEdit;

type
  TfrmInputSO = class(TfrmTplInput)
    Label1: TLabel;
    cxtNoSO: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxtPO: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxlbl2: TcxLabel;
    cxdTanggal: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLUCust: TcxLookupComboBox;
    zqrCust: TZReadOnlyQuery;
    dsCust: TDataSource;
    cxLabel10: TcxLabel;
    cxlSales: TcxLookupComboBox;
    GroupBox1: TGroupBox;
    cxLabel13: TcxLabel;
    cxCmbCurr: TcxComboBox;
    cxsKurs: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxCmbTax: TcxComboBox;
    cxLabel3: TcxLabel;
    cxCmbTOP: TcxComboBox;
    zqrSales: TZReadOnlyQuery;
    dsSales: TDataSource;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxLabel4: TcxLabel;
    cxdTglRequaired: TcxDateEdit;
    cxLabel11: TcxLabel;
    cxsGross: TcxSpinEdit;
    cxLabel12: TcxLabel;
    cxsDisc: TcxSpinEdit;
    cxLabel5: TcxLabel;
    cxsTax: TcxSpinEdit;
    cxLabel6: TcxLabel;
    cxsNet: TcxSpinEdit;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxTblSO: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKode: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColHarga: TcxGridColumn;
    cxColGross: TcxGridColumn;
    cxColDisc: TcxGridColumn;
    cxColDiscAmount: TcxGridColumn;
    cxColTaxable: TcxGridColumn;
    cxColTaxAmount: TcxGridColumn;
    cxColNetAmount: TcxGridColumn;
    procedure FormShow(Sender: TObject);
    procedure cxCmbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxTblSODataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxCmbTaxEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxTblSODataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxTblSODataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure btnSimpanClick(Sender: TObject);
    procedure ClearAll;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputSO: TfrmInputSO;

implementation

uses
  unDM, unTools, unFrmLstSO;

{$R *.dfm}

procedure TfrmInputSO.btnSimpanClick(Sender: TObject);
var
  q,z,qmo,qCekMO : TZQuery ;
  ID, i,j : integer;
  sNoTrs,sNoMO : string;
  tbl_tmp: TZTable;
begin
  inherited;

  if (cxTblSO.DataController.EditState = [dceInsert, dceModified]) or
    (cxTblSO.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  if cxsNet.EditValue = 0 then begin
    MsgBox('Detail Transaksi masih kosong.');
  end
  else if cxLUCust.Text = '' then begin
    MsgBox('Mohon isi nama customer.');
    cxLUCust.SetFocus;
    Abort;
  end
  else if cxlsales.Text = '' then begin
    MsgBox('Mohon isi nama sales.');
    cxlSales.SetFocus;
    Abort;
  end
  else begin

    //Cek Qty
    for i := 0 to cxTblSO.DataController.RecordCount - 1 do begin
      if VarIsNull(cxTblSO.DataController.Values[i, cxColQty.Index]) then begin
        MsgBox('Qty masih ada yang kosong.');
        Abort;
      end;
    end;
    //Cek Satuan
    for i := 0 to cxTblSO.DataController.RecordCount - 1 do begin
      if VarIsNull(cxTblSO.DataController.Values[i, cxColSatuan.Index]) then begin
        MsgBox('Satuan masih ada yang kosong.');
        Abort;
      end;
    end;
    //Cek Harga
    for i := 0 to cxTblSO.DataController.RecordCount - 1 do begin
      if VarIsNull(cxTblSO.DataController.Values[i, cxColHarga.Index]) then begin
        MsgBox('Harga masih ada yang kosong.');
        Abort;
      end;
    end;
    //Cek Status SO
    q := OpenRS('SELECT * FROM tbl_so_head_dmp WHERE no_bukti = ''%s''',[cxtNoSO.Text]);
    if not q.IsEmpty then begin
      if q.FieldByName('f_completed').AsInteger = 1 then begin
        MsgBox('SO ini sudah komplit / selesai. Tidak bisa di edit.');
        q.Close;
        Abort;
      end;
    end;
    q.Close;
    try
      dm.zConn.StartTransaction;

      if Self.Jenis = 'T' then begin
        sNoTrs := GetLastFak('sales_order');
        UpdateFaktur(Copy(sNoTrs,1,7));
      end
      else begin
        sNoTrs := cxtNoSO.Text;
      end;

      // header SO
      q := OpenRS('SELECT * FROM tbl_so_head_dmp where no_bukti =''%s''',[sNoTrs]);

      if Self.Jenis = 'T' then
        q.Insert
      else
        q.Edit;

      with q do begin
        FieldByName('no_bukti').AsString          := cxtNoSO.Text;
        FieldByName('po#').AsString               := cxtPO.Text;
        FieldByName('tanggal').AsDateTime         := cxdTanggal.EditValue;
        FieldByName('kode_customer').AsString     := cxLUCust.EditValue;
        FieldByName('sales').AsString             := cxlSales.EditValue;
        FieldByName('currency').AsString          := cxCmbCurr.Text;
        FieldByName('rate').AsFloat               := cxsKurs.EditValue;
        FieldByName('tax').AsString               := cxCmbTax.Text;
        FieldByName('top').AsString               := cxCmbTOP.Text;
        FieldByName('tanggal').AsDateTime         := cxdTglRequaired.EditValue;
        FieldByName('gross').AsFloat              := cxsGross.EditValue;
        if cxsDisc.EditValue <> 0 then
          FieldByName('discount').AsFloat           := cxsDisc.EditValue;
        FieldByName('tax_amount').AsFloat         := cxsTax.EditValue;
        FieldByName('net_amount').AsFloat         := cxsNet.EditValue;
        if self.Jenis = 'T' then begin
          FieldByName('user').AsString          := aplikasi.NamaUser;
          FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
          FieldByName('f_revisi').AsInteger     := 0;
        end;
        if Self.Jenis = 'E' then begin
          FieldByName('user_edit').AsString     := aplikasi.NamaUser;
          FieldByName('tgl_edit').AsDateTime    := aplikasi.TanggalServer;
          FieldByName('f_revisi').AsInteger     := 1;
        end;
        Post ;
      end;

      // detail SO
      if Self.Jenis = 'E' then
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_so_det_dmp WHERE no_bukti = ''%s''',[sNoTrs]));

      if (cxsNet.EditValue <> 0) then begin
        with cxTblSO.DataController  do begin
          for i := 0 to RecordCount -1 do begin
            z := OpenRS('SELECT * FROM tbl_so_det_dmp where no_bukti =''%s''',[sNoTrs]) ;
            z.Insert;
            z.FieldByName('no').AsInteger           := i+1;
            z.FieldByName('no_bukti').AsString      := sNoTrs;
            z.FieldByName('kode_brg').AsString      := Values[i, cxColKode.index];
            z.FieldByName('qty').AsFloat            := Values[i, cxColQty.Index];
            z.FieldByName('satuan').AsString        := Values[i, cxColSatuan.Index];
            z.FieldByName('harga').AsFloat          := Values[i, cxColHarga.Index];
            z.FieldByName('harga_gross').asFloat    := Values[i, cxColGross.Index];
            if Values[i, cxColDisc.Index]<> null then
              z.FieldByName('disc').AsInteger         := Values[i, cxColDisc.Index];
            z.FieldByName('invoice_disc').AsFloat   := Values[i, cxColDiscAmount.Index] ;
            z.FieldByName('taxable').AsFloat        := Values[i, cxColTaxable.Index];
            z.FieldByName('taxamount').AsFloat      := Values[i, cxColTaxAmount.Index];
            z.FieldByName('net_amount').AsFloat     := Values[i, cxColNetAmount.Index];
            z.Post;
            z.Close;

            //Simpan tbl_mo
            if Self.Jenis = 'T' then begin

              sNoMO := GetLastFak('master_order');
              UpdateFaktur(Copy(sNoMO,1,7));

              qmo := OpenRS('SELECT * FROM tbl_mo WHERE no_mo = ''%s''', [sNoMO]);
              with qmo do begin
                Insert;
                FieldByName('no_mo').AsString     := sNoMO;
                FieldByName('no_so').AsString     := sNoTrs;
                FieldByName('kode_brg').AsString  := Values[i, cxColKode.index];
                FieldByName('qty_mo').AsFloat     := Values[i, cxColQty.Index];
                FieldByName('qty_so').AsFloat     := Values[i, cxColQty.Index];
                FieldByName('jenis').AsString     := 'BJ';
                FieldByName('app_cft').AsInteger  := 1;
                Post;
              end;
            end
            else begin
              qCekMO := OpenRS('SELECT * FROM tbl_mo WHERE no_so = ''%s'' ' +
                'AND kode_brg = ''%s''',[sNoTrs, Values[i, cxColKode.index]]);

              if tbl_tmp.Locate('kode_brg',Values[i, cxColKode.index],[]) then begin

                if tbl_tmp.FieldByName('qty').AsFloat <> Values[i, cxColQty.Index] then begin

                  // update qty lama tbl_mo
                  if tbl_tmp.Locate('kode_brg',Values[i, cxColKode.index],[]) then begin
                    qCekMO.Edit;
                    qCekMO.FieldByName('qty_mo').AsFloat := Values[i, cxColQty.Index];
                    qCekMO.FieldByName('qty_so').AsFloat := Values[i, cxColQty.Index];
                    qCekMO.FieldByName('qty_lama').AsFloat := tbl_tmp.FieldByName('qty').AsFloat;
                    qCekMO.FieldByName('jml_revisi').AsInteger := qCekMO.FieldByName('jml_revisi').AsInteger + 1;
                    qCekMO.Post;
                  end;
                end;

              end;
            end;
          end;
        end;
      end;

      Close;
      MsgBox('Sales Order sudah disimpan dengan nomor : ' + sNoTrs);
      cxTblSO.DataController.RecordCount := 0;
      btnBatalClick(nil);
      dm.zConn.Commit;

      {
      else begin
        q.Edit;
        sNoTrs := cxtNoSO.Text;

        q := OpenRS('SELECT kode_brg, qty FROM tbl_so_det_dmp WHERE no_bukti = ''%s''',[cxtNoSO.Text]);

        dm.zConn.ExecuteDirect('DROP TABLE IF EXISTS tmp_so');
        dm.zConn.ExecuteDirect('CREATE TEMPORARY TABLE tmp_so ( ' +
          'kode_brg VARCHAR(50), ' +
          'qty FLOAT(11,2)' +
          ')');

        tbl_tmp := OpenTbl('tmp_so');
        while not q.Eof do begin
          tbl_tmp.Insert;
          tbl_tmp.FieldByName('kode_brg').AsString := q.FieldByName('kode_brg').AsString;
          tbl_tmp.FieldByName('qty').AsFloat := q.FieldByName('qty').AsFloat;
          tbl_tmp.Post;
          q.Next;
        end;
        q.Close;
        q := nil;

        // hapus detail so
        dm.zConn.ExecuteDirect('DELETE FROM tbl_so_det_dmp WHERE no_bukti = ''' + cxtNoSO.Text + '''');

        with cxTblSO.DataController  do begin
          for i := 0 to cxTblSO.DataController.RowCount -1 do begin
            z := OpenRS('SELECT * FROM tbl_so_det_dmp where no_bukti =''%s''',
              [cxtNoSO.Text]) ;
            z.Insert;
            z.FieldByName('no').AsInteger           := Values[i, cxColNo.Index];
            z.FieldByName('no_bukti').AsString      := sNoTrs;
            z.FieldByName('kode_brg').AsString      := Values[i, cxColKode.index];
            z.FieldByName('qty').AsFloat            := Values[i, cxColQty.Index];
            z.FieldByName('satuan').AsString        := Values[i, cxColSatuan.Index];
            z.FieldByName('harga').AsFloat          := Values[i, cxColHarga.Index];
            z.FieldByName('harga_gross').asFloat    := Values[i, cxColGross.Index];
            if Values[i, cxColDisc.Index] <> null then
              z.FieldByName('disc').AsInteger         := Values[i, cxColDisc.Index];
            z.FieldByName('invoice_disc').AsFloat   := Values[i, cxColDiscAmount.Index] ;
            z.FieldByName('taxable').AsFloat        := Values[i, cxColTaxable.Index];
            z.FieldByName('taxamount').AsFloat      := Values[i, cxColTaxAmount.Index];
            z.FieldByName('net_amount').AsFloat     := Values[i, cxColNetAmount.Index];
            z.Post;
            z.Close;

            qCekMO := OpenRS('SELECT * FROM tbl_mo WHERE no_so = ''%s'' ' +
              'AND kode_brg = ''%s''',[sNoTrs, Values[i, cxColKode.index]]);

            if tbl_tmp.Locate('kode_brg',Values[i, cxColKode.index],[]) then begin

            if tbl_tmp.FieldByName('qty').AsFloat <> Values[i, cxColQty.Index] then begin

              // update qty lama tbl_mo
              if tbl_tmp.Locate('kode_brg',Values[i, cxColKode.index],[]) then begin
                qCekMO.Edit;
                qCekMO.FieldByName('qty_mo').AsFloat := Values[i, cxColQty.Index];
                qCekMO.FieldByName('qty_so').AsFloat := Values[i, cxColQty.Index];
                qCekMO.FieldByName('qty_lama').AsFloat := tbl_tmp.FieldByName('qty').AsFloat;
                qCekMO.FieldByName('jml_revisi').AsInteger := qCekMO.FieldByName('jml_revisi').AsInteger + 1;
                qCekMO.Post;
              end;

              // update jml_revisi tbl_so_det
              z.FieldByName('no').AsInteger := z.FieldByName('no').AsInteger + 1;
            end;
            end;

            qCekMO.Close;
            qCekMO := nil;
          end;
        end;



        Close;
        MsgBox('Sales Order sudah disimpan.');
        frmLstSO.zqrSO.Close ;
        frmLstSO.zqrSO.Open ;
        cxTblSO.DataController.RecordCount := 0;
        btnBatalClick(nil);
      end;
      }
    except
      on E: Exception do begin
        MsgBox('Error: ' + E.Message);
        dm.zConn.Rollback;
      end;
     end;
  end;
end;

procedure TfrmInputSO.ClearAll;
var
  i: Integer;
begin
  for i := 0 to ComponentCount  - 1 do
  begin
    if Components[i] is TcxTextEdit then
      (Components[i] as TcxTextEdit).Text := '';
    if Components[i] is TcxSpinEdit then
      (Components[i] as TcxSpinEdit).Value := 0;
    if Components[i] is TcxLookupComboBox then
      (Components[i] as TcxLookupComboBox).Text := ''
  end;
end;

procedure TfrmInputSO.cxCmbCurrPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
   if cxCmbCurr.Text<>'IDR' then cxsKurs.Enabled := True else cxsKurs.Enabled := False ;
end;

procedure TfrmInputSO.cxCmbTaxEditing(Sender: TObject; var CanEdit: Boolean);
begin
  inherited;
  //if cxTblSO.DataController.RecordCount<>0 then MsgBox('Jenis Tax Tidak Dapat Diganti');
end;

procedure TfrmInputSO.cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var
  Row: Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputSO.cxTblSODataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if cxTblSO.DataController.RecordCount=0 then cxCmbTax.Enabled := True;

   cxsGross.EditValue := cxTblSO.DataController.Summary.FooterSummaryValues[0];
   cxsDisc.EditValue  := cxTblSO.DataController.Summary.FooterSummaryValues[1];
   cxsTax.EditValue   := cxTblSO.DataController.Summary.FooterSummaryValues[2];
   cxsNet.EditValue   := cxTblSO.DataController.Summary.FooterSummaryValues[3];
end;

procedure TfrmInputSO.cxTblSODataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColKode.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColKode.Index] then begin
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;
  if (VarIsNull(ADataController.Values[i, cxColKode.Index])) or
    (Trim(ADataController.Values[i, cxColKode.Index]) = '')  then begin
    MsgBox('Kode barang harus di isi.');
    Abort;
  end;
end;

procedure TfrmInputSO.cxTblSODataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  i : Integer;
  z,q : TZQuery;
begin
  inherited;
   if AItemIndex = cxColDeskripsi.Index then begin
      try
        cxTblSO.BeginUpdate;
        ADataController.Values[ARecordIndex, cxColKode.Index] :=
        ADataController.Values[ARecordIndex, cxColDeskripsi.Index];
        {z := OpenRS('SELECT unitid FROM tbl_barang where kode =''%s''',[Label1.caption]) ;
        with cxTblSO.DataController do begin
         Values[i, cxColSatuan.Index] := z.FieldByName('unitid').AsString ;
        end; }
      finally
        cxTblSO.EndUpdate;
      end;
   end
   else if (AItemIndex = cxColHarga.Index) or (AItemIndex = cxColQty.Index) then begin
      try
        cxTblSO.BeginUpdate;
        ADataController.Values [ARecordIndex, cxColGross.Index] :=
        ADataController.Values [ARecordIndex, cxColQty.Index] *
        ADataController.Values [ARecordIndex, cxColHarga.Index] ;

        ADataController.Values[ARecordIndex, cxColDiscAmount.Index] := 0 ;

        if cxCmbTax.Text = 'INCLUDE' then begin
          ADataController.Values [ARecordIndex, cxColTaxable.Index] :=
          (ADataController.Values [ARecordIndex, cxColQty.Index] * ADataController.Values [ARecordIndex, cxColHarga.Index])/1.1 ;

          ADataController.Values [ARecordIndex, cxColTaxAmount.Index] :=
          ADataController.Values [ARecordIndex, cxColTaxable.Index]* 0.1 ;
          ADataController.Values [ARecordIndex, cxColNetAmount.Index] :=
          ADataController.Values [ARecordIndex, cxColQty.Index] *
          ADataController.Values [ARecordIndex, cxColHarga.Index];
        end
        else begin
          ADataController.Values [ARecordIndex, cxColTaxable.Index] :=
          (ADataController.Values [ARecordIndex, cxColQty.Index] * ADataController.Values [ARecordIndex, cxColHarga.Index]);

          ADataController.Values [ARecordIndex, cxColTaxAmount.Index] :=
          ADataController.Values [ARecordIndex, cxColTaxable.Index]* 0.1 ;
          ADataController.Values [ARecordIndex, cxColNetAmount.Index] :=
          (ADataController.Values [ARecordIndex, cxColQty.Index] *
          ADataController.Values [ARecordIndex, cxColHarga.Index])+ ADataController.Values [ARecordIndex, cxColTaxAmount.Index];
        end;
      finally
        cxTblSO.EndUpdate;

        cxsGross.EditValue := cxTblSO.DataController.Summary.FooterSummaryValues[0];
        cxsDisc.EditValue  := cxTblSO.DataController.Summary.FooterSummaryValues[1];
        cxsTax.EditValue   := cxTblSO.DataController.Summary.FooterSummaryValues[2];
        cxsNet.EditValue   := cxTblSO.DataController.Summary.FooterSummaryValues[3];
      end;
   end
   else if AItemIndex = cxColDisc.Index then begin
       try
        cxTblSO.BeginUpdate;
        ADataController.Values[ARecordIndex, cxColDiscAmount.Index] :=
        (ADataController.Values [ARecordIndex, cxColGross.Index]*
        ADataController.Values [ARecordIndex, cxColDisc.Index])/100 ;

        if cxCmbTax.Text = 'INCLUDE' then begin
          ADataController.Values [ARecordIndex, cxColTaxable.Index] :=
          (ADataController.Values [ARecordIndex, cxColGross.Index] - ((ADataController.Values [ARecordIndex, cxColGross.Index]*
          ADataController.Values [ARecordIndex, cxColDisc.Index])/100))/1.1 ;

          ADataController.Values [ARecordIndex, cxColTaxAmount.Index] :=
          ADataController.Values [ARecordIndex, cxColTaxable.Index]* 0.1 ;
          ADataController.Values [ARecordIndex, cxColNetAmount.Index] :=
          (ADataController.Values [ARecordIndex, cxColGross.Index] -(ADataController.Values [ARecordIndex, cxColGross.Index]*
          ADataController.Values [ARecordIndex, cxColDisc.Index])/100);
        end
        else begin
          ADataController.Values [ARecordIndex, cxColTaxable.Index] :=
          (ADataController.Values [ARecordIndex, cxColGross.Index] -((ADataController.Values [ARecordIndex, cxColGross.Index]*
          ADataController.Values [ARecordIndex, cxColDisc.Index])/100));

          ADataController.Values [ARecordIndex, cxColTaxAmount.Index] :=
          ADataController.Values [ARecordIndex, cxColTaxable.Index]* 0.1 ;
          ADataController.Values [ARecordIndex, cxColNetAmount.Index] :=
          (ADataController.Values [ARecordIndex, cxColGross.Index] -((ADataController.Values [ARecordIndex, cxColGross.Index]*
          ADataController.Values [ARecordIndex, cxColDisc.Index])/100))+ ADataController.Values [ARecordIndex, cxColTaxAmount.Index];
        end;

      finally
        cxTblSO.EndUpdate;
        cxsGross.EditValue := cxTblSO.DataController.Summary.FooterSummaryValues[0];
        cxsDisc.EditValue  := cxTblSO.DataController.Summary.FooterSummaryValues[1];
        cxsTax.EditValue   := cxTblSO.DataController.Summary.FooterSummaryValues[2];
        cxsNet.EditValue   := cxTblSO.DataController.Summary.FooterSummaryValues[3];
      end;
   end ;

  if cxTblSO.DataController.RecordCount<>0 then cxCmbTax.Enabled := False;

end;

procedure TfrmInputSO.FormCreate(Sender: TObject);
var
  sNoTrs : string;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('sales_order');
    cxtNoSo.Text := sNoTrs;
    cxdTanggal.Date := Aplikasi.Tanggal;
    cxdTglRequaired.Date := Aplikasi.Tanggal;
  end
end;

procedure TfrmInputSO.FormShow(Sender: TObject);
var
  q,z : TZQuery;
  i : Integer ;
  sNoTrs : string;
begin
  inherited;
  zqrCust.Open;
  zqrSales.Open;
  zqrBarang.Open;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('sales_order');
    cxtNoSo.Text := sNoTrs;
    cxdTanggal.Date := Aplikasi.Tanggal;
    cxdTglRequaired.Date := Aplikasi.Tanggal;
  end
  else if Self.Jenis= 'E' then begin

    q := OpenRS('SELECT * FROM tbl_so_head_dmp WHERE no_bukti=''%s''', [Self.EditKey] );

    with q do begin
      cxtNoSO.Text                  := FieldByName('no_bukti').AsString;
      cxtPO.Text                    := FieldByName('po#').AsString;
      cxdTanggal.EditValue          := FieldByName('tanggal').AsDateTime;
      cxLUCust.EditValue            := FieldByName('kode_customer').AsString;
      cxlSales.EditValue            := FieldByName('sales').AsString;
      cxCmbCurr.Text                := FieldByName('currency').AsString;
      cxsKurs.Text                  := FieldByName('rate').AsString;
      cxCmbTax.Text                 := FieldByName('tax').AsString;
      cxCmbTOP.Text                 := FieldByName('top').AsString;
      cxdTglRequaired.EditValue     := FieldByName('tanggal').AsDateTime;
      cxsGross.EditValue            := FieldByName('gross').AsFloat;
      cxsDisc.EditValue             := FieldByName('discount').AsFloat;
      cxsTax.EditValue              := FieldByName('tax_amount').AsFloat;
      cxsNet.EditValue              := FieldByName('net_amount').AsFloat;

      z := OpenRS('SELECT * FROM tbl_so_det_dmp where no_bukti =''%s'' order by no asc',[Self.EditKey]) ;
      while not z.Eof do begin
        cxGrid1.BeginUpdate;
        with cxTblSO.DataController do begin
          i := AppendRecord ;
          Values[i, cxColNo.Index]          := z.FieldByName('no').AsInteger ;
          Values[i, cxColkode.index]        := z.FieldByName('kode_brg').AsString;
          Values[i, cxColDeskripsi.Index]   := z.FieldByName('kode_brg').AsString;
          Values[i, cxColQty.Index]         := z.FieldByName('qty').AsFloat ;
          Values[i, cxColSatuan.Index]      := z.FieldByName('satuan').AsString ;
          Values[i, cxColHarga.Index]       := z.FieldByName('harga').AsFloat;
          Values[i, cxColGross.Index]       := z.FieldByName('harga_gross').asstring;
          Values[i, cxColDisc.Index]        := z.FieldByName('disc').AsFloat ;
          Values[i, cxColDiscAmount.Index]  := z.FieldByName('invoice_disc').AsFloat ;
          Values[i, cxColTaxable.Index]     := z.FieldByName('taxable').AsFloat ;
          Values[i, cxColTaxAmount.Index]   := z.FieldByName('taxamount').AsFloat ;
          Values[i, cxColNetAmount.Index]   := z.FieldByName('net_amount').AsFloat ;
        end;
        cxGrid1.EndUpdate;
        z.Next;
      end;
        z.Close;

        if cxTblSO.DataController.RecordCount = 0 then cxCmbTax.Enabled := False;
    end;

  end;
  if cxCmbCurr.Text<>'IDR' then cxsKurs.Enabled := True else cxsKurs.Enabled := False ;

end;

end.
