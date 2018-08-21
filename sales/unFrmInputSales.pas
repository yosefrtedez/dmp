unit unFrmInputSales;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, ZDataset,
  cxLabel;

type
  TfrmInputSales = class(TfrmTplInput)
    Label1: TLabel;
    cxLabel1: TcxLabel;
    cxtKode: TcxTextEdit;
    cxtNama: TcxTextEdit;
    cxLabel2: TcxLabel;
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputSales: TfrmInputSales;

implementation

uses unTools;

{$R *.dfm}

procedure TfrmInputSales.btnSimpanClick(Sender: TObject);
var
  q: TZQuery;
begin

  if Trim(cxtKode.Text) = '' then begin
    MsgBox('Mohon isi kode sales.');
    cxtKode.SetFocus;
  end
  else if Trim(cxtNama.Text) = '' then begin
    MsgBox('Mohon isi nama sales.');
    cxtNama.SetFocus;
  end
  else begin
    q := OpenRS('SELECT * FROM tbl_sales WHERE kode = ''%s''',[cxtKode.text]);
    if Self.Jenis = 'T' then
      q.Insert
    else
      q.Edit;

    q.FieldByName('kode').AsString := Trim(cxtKode.Text);
    q.FieldByName('nama').AsString := Trim(cxtNama.Text);
    q.POst;

    MsgBox('Data sales sudah disimpan.');

    inherited;
  end;
end;

end.
