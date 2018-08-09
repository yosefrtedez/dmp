unit unFrmKalkulasiStok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ZDataSet;

type
  TfrmKalkulasiStok = class(TForm)
    btnProses: TButton;
    prgBar: TProgressBar;
    btnBatal: TButton;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    procedure btnProsesClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKalkulasiStok: TfrmKalkulasiStok;

implementation

uses unAplikasi, unDM, unTools;

{$R *.dfm}

procedure TfrmKalkulasiStok.btnProsesClick(Sender: TObject);
var
  q, q2: TZQuery;
  iStok: real;
  sql, sGdg: string;
  stok: Extended;
begin
  q2 := OpenRS('SELECT * FROM tbl_gudang WHERE f_aktif = 1 ORDER BY kode');

  Label1.Caption := '';
  Label1.Visible := True;

  Self.Refresh;

  while not q2.Eof do begin
    Application.ProcessMessages;
    sGdg := q2.FieldByName('id').AsString;
    Label1.Caption := 'Update Detail Stok... (' + q2.FieldByName('kode').AsString + ')';
    Self.Refresh;
    {
    sql :=
    'select kode_brg, ' +
    'sum(sawal_' + sGdg + ') sawal, ' +
    'sum(IN_) IN_, ' +
    'sum(OUT_) OUT_ ' +
    'from ( ' +
    'select kode_brg, ' +
    '0 sawal_' + sGdg + ', ' +
    'sum(IN_) IN_, ' +
    'sum(OUT_) OUT_ ' +
    'from v_history_brg WHERE gudang = ''' + sGdg + ''' ' +
    'group by kode_brg ' +
    'union ' +
    'select kode kode_brg, stokawal, ' +
    '0 IN_, ' +
    '0 OUT_ ' +
    'from tbl_stkawal WHERE kode_gdg = ''' + sGdg + ''') a ' +
    'group by a.kode_brg';
    }

    //sql := 'select kode_brg, ' +
    //  'sum(IN_) IN_, ' +
    //  'sum(OUT_) OUT_ ' +
    //  'from v_history_brg WHERE gudang = ''' + sGdg + ''' ' +
    //  'group by kode_brg';

    {
    sql := 'SELECT b.kode AS kode_brg, IFNULL(IN_,0) IN_, IFNULL(OUT_,0) OUT_ from ' +
           '(' +
           'select kode_brg, ' +
           'sum(IN_) IN_, ' +
           'sum(OUT_) OUT_ ' +
           'from v_history_brg ' +
           'WHERE gudang = ''' + sGdg + ''' ' +
           'group by kode_brg ' +
           ') a RIGHT JOIN tbl_barang b ON a.kode_brg = b.kode';
    }
    dm.zConn.ExecuteDirect('DROP TABLE IF EXISTS _tmp_hist0');
    dm.zConn.ExecuteDirect('create temporary table _tmp_hist0 ' +
       'select id_brg, ' +
       'sum(IN_) IN_, ' +
       'sum(OUT_) OUT_ ' +
       'from v_history_brg ' +
       'WHERE id_gdg = ''' + sGdg + ''' ' +
       'group by id_brg');
    dm.zConn.ExecuteDirect('ALTER TABLE _tmp_hist0 add index idxkodebrg (id_brg)');
    sql := 'SELECT b.id AS id, IFNULL(IN_,0) IN_, IFNULL(OUT_,0) OUT_ ' +
      'from _tmp_hist0 a ' +
      'RIGHT JOIN tbl_barang b ON a.id_brg = b.id WHERE b.f_aktif = 1';

    q := OpenRS(sql);

    if q.IsEmpty then
      dm.zConn.ExecuteDirect('UPDATE tbl_barang_det SET stok = 0 ' +
        'WHERE id_gdg = ''' + sGdg + '''')
    else begin
      btnProses.Enabled := False;
      btnBatal.Enabled := False;

      dm.zConn.StartTransaction;

      Screen.Cursor := crSQLWait;

      try
        prgBar.Position := 0;
        prgBar.Refresh;
        prgBar.Max := q.RecordCount;

        while not q.Eof do begin

          iStok := q.FieldByName('IN_').AsFloat -
            q.FieldByName('OUT_').AsFloat;

          dm.zConn.ExecuteDirect('DELETE FROM tbl_barang_det WHERE id_gdg = ''' +
            sGdg + ''' AND id_brg = ''' +
            q.FieldByName('id').AsString + '''');

          dm.zConn.ExecuteDirect('INSERT INTO tbl_barang_det ' +
            'SET id_brg = ''' + q.FieldByName('id').AsString + ''', ' +
            'id_gdg = ''' + sGdg + ''', ' +
            'stok = ' + StringReplace(FloatToStr(iStok),',','.',[rfReplaceAll]));

          prgBar.Position := prgBar.Position + 1;
          q.Next;
        end;
        dm.zConn.Commit;
      except
        on E: Exception do begin
          MsgBox('Terjadi error: ' + E.Message);
          dm.zConn.Rollback;
          btnProses.Enabled := True;
          btnBatal.Enabled := True;
        end;
      end;

      Screen.Cursor := crDefault;

    end;
    q.Close;
    q := nil;

    q2.Next;
  end;
  q2.Close;

  try
  label1.Caption := 'Update Stok Barang...';
  Self.Refresh;
  dm.zConn.StartTransaction;
  q2 := OpenRS('SELECT id FROM tbl_barang');
  prgBar.Position := 0;
  prgBar.Max := q2.RecordCount;
  Screen.Cursor := crSQLWait;
  while not q2.Eof do begin
    prgBar.Position := prgBar.Position + 1;
    dm.zConn.ExecuteDirect('UPDATE tbl_barang SET stok = sf_get_stok(' +
      q2.FieldByName('id').AsString + ') WHERE id = ' +
      q2.FieldByName('id').AsString);
    q2.Next;
  end;
  q2.Close;
  dm.zConn.Commit;
  Screen.Cursor := crDefault;
  except
  end;
  
  btnProses.Enabled := True;
  btnBatal.Enabled := True;

  MsgBox('Proses kalkulasi stok selesai.');

  Close;
end;

procedure TfrmKalkulasiStok.btnBatalClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfrmKalkulasiStok.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
