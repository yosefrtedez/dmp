unit unFrmInputMesin;

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
  cxDBLookupComboBox, ZDataset, cxSpinEdit, cxCheckBox, DB, ZAbstractRODataset,
  ZAbstractDataset, unDM;

type
  TfrmInputMesin = class(TfrmTplInput)
    cxLabel1: TcxLabel;
    cxtKode: TcxTextEdit;
    cxChkAktif: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxtNama: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxlLokasi: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    cxCmbGrupMesin: TcxComboBox;
    cxLabel7: TcxLabel;
    cxsCycle: TcxSpinEdit;
    cxLabel8: TcxLabel;
    cxsSetup: TcxSpinEdit;
    cxsHeater: TcxSpinEdit;
    cxLabel13: TcxLabel;
    cxsWait: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxLabel12: TcxLabel;
    cxsMotor: TcxSpinEdit;
    cxLabel14: TcxLabel;
    cxsLine: TcxSpinEdit;
    cxlSatuan: TcxComboBox;
    cxLabel15: TcxLabel;
    cxsOutput: TcxSpinEdit;
    cxLabel11: TcxLabel;
    cxLabel3: TcxLabel;
    cxsJmlPersonil: TcxSpinEdit;
    cxLabel16: TcxLabel;
    cxsOperatorSet: TcxSpinEdit;
    cxsDie: TcxSpinEdit;
    cxLabel17: TcxLabel;
    zqrLokasi: TZQuery;
    dsLokasi: TDataSource;
    Label13: TLabel;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearAll;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputMesin: TfrmInputMesin;

implementation

uses unTools, unFrmLstMesin;

{$R *.dfm}

procedure TfrmInputMesin.btnSimpanClick(Sender: TObject);
var
  f: boolean;
  i: Integer;
  q: TZQuery;
begin
  inherited;
   if (Trim(cxtKode.Text) = '') then begin
    MsgBox('Kode Mesin harus diisi.');
    cxtKode.SetFocus;
  end
  else if Trim(cxtNama.Text) = '' then begin
    MsgBox('Nama Mesin harus diisi.');
    cxtNama.SetFocus;
  end
  else begin
    q := OpenRS('SELECT * FROM tbl_mesin WHERE kode =''%s''', [cxtKode.Text] );

    f := True;
    if self.Jenis = 'T' then begin

      if not q.IsEmpty then begin
        MsgBox('Kode Mesin sudah ada.');
        cxtKode.SelectAll ;
        cxtKode.SetFocus ;
        f:= False ;
      end
      else begin
        q.Insert;
      end;
    end
    else begin
     if q.IsEmpty then begin
        MsgBox('Kode Mesin belum ada.');
        cxtKode.SelectAll ;
        cxtKode.SetFocus ;
        f:= False ;
      end
      else begin
        q.Edit;
      end;
    end;

    if f then begin
      with q do begin
        FieldByName('kode').AsString := cxtKode.Text;
        FieldByName('nama').AsString := Trim(cxtNama.Text);
        FieldByName('lokasi').AsString := cxlLokasi.Text;
        FieldByName('jml_personil').AsInteger := cxsJmlPersonil.Value;
        FieldByName('jenis').AsString := cxCmbGrupMesin.Text;
        FieldByName('cycle_time').AsFloat := cxsCycle.Value;
        FieldByName('setup_time').AsFloat := cxsSetup.Value;
        FieldByName('wait_time').AsFloat := cxsWait.Value;
        FieldByName('output').AsFloat := cxsOutput.Value;
        FieldByName('daya_motor').AsFloat := cxsMotor.Value;
        FieldByName('daya_heater').AsFloat := cxsHeater.Value;
        FieldByName('line').AsFloat := cxsLine.Value;
        FieldByName('satuan').AsString := cxlSatuan.Text;
        FieldByName('die').AsFloat :=  cxsDie.Value;
        FieldByName('operator_setup').AsString := cxsOperatorSet.Value;
        if cxChkAktif.Checked then
          i := 1
        else
          i := 0;

        FieldByName('f_aktif').AsInteger := i;

        Post;
      end;

      MsgBox('Data Mesin sudah disimpan.');

      frmLstMesin.RefreshGrid;

      ClearAll;
      frmLstMesin.zqrMesin.Close;
      frmLstMesin.zqrMesin.Open;
      btnBatalClick(nil);
    end;

  end;

end;


procedure TfrmInputMesin.ClearAll;
var
  i: Integer;
begin
    for i := 0 to ComponentCount  - 1 do
  begin
    if Components[i] is TcxTextEdit then
      (Components[i] as TcxTextEdit).Text := '';
    if Components[i] is TcxSpinEdit then
      (Components[i] as TcxSpinEdit).Value := 0;
  end;
   cxChkAktif.Checked := False;
end;


procedure TfrmInputMesin.FormShow(Sender: TObject);
var
    q: TZQuery;
begin
  inherited;
  with cxCmbGrupMesin do begin
    Properties.Items.Add('MIXING');
    Properties.Items.Add('PRINTING');
    Properties.Items.Add('EXTRUSI');
    Properties.Items.Add('LAMINASI');
    Properties.Items.Add('CONVERTING');
    Properties.Items.Add('PELETAN');
    Properties.Items.Add('SLITTING');
    Properties.Items.Add('SEAMING');
    Properties.Items.Add('CUTTING');
    Properties.Items.Add('RECYCLE');
    Properties.Items.Add('GUSET');
    Properties.Sorted := True;
    ItemIndex := 0;
  end;

  zqrLokasi.Open;

  if Self.Jenis= 'E' then begin
    q := OpenRS('SELECT * FROM tbl_mesin WHERE kode=''%s''', [Self.EditKey] );

    with q do begin
      cxtKode.Text            := FieldByName('kode').AsString;
      cxtNama.Text            := FieldByName('nama').AsString;
      cxlLokasi.Text          := FieldByName('lokasi').AsString;
      cxsJmlPersonil.Value    := FieldByName('jml_personil').AsInteger;
      cxCmbGrupMesin.Text     := FieldByName('jenis').AsString;
      cxsCycle.Value          := FieldByName('cycle_time').AsFloat;
      cxsSetup.Value          := FieldByName('setup_time').AsFloat;
      cxsWait.Value           := FieldByName('wait_time').AsFloat;
      cxsOutput.Value         := FieldByName('output').AsFloat;
      cxsMotor.Value          := FieldByName('daya_motor').AsFloat;
      cxsHeater.Value         := FieldByName('daya_heater').AsFloat;
      cxsLine.Value           := FieldByName('line').AsFloat;
      cxlSatuan.Text          := FieldByName('satuan').AsString;
      cxsDie.Value            := FieldByName('die').AsFloat;
      cxsOperatorSet.Value    := FieldByName('operator_setup').AsString;
      if FieldByName('f_aktif').AsInteger = 1 then
        cxChkAktif.Checked := True
      else
        cxChkAktif.Checked := False;
    end;
  end;
end;


end.

