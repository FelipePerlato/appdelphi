 unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,IOUtils;

type
  Tdm = class(TDataModule)
    FDConn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDTransaction1: TFDTransaction;
    qry_geral: TFDQuery;
    DtsRegistro: TDataSource;
    qry_geralidcadastro: TFDAutoIncField;
    qry_geralnome: TStringField;
    qry_geralemail: TStringField;
    qry_geralsenha: TStringField;
    qry_veiculo: TFDQuery;
    qry_veiculoidveiculo: TFDAutoIncField;
    qry_veiculoplaca: TStringField;
    qry_veiculonome: TStringField;
    qry_veiculomodelo: TStringField;
    qry_veiculolitros: TStringField;
    qry_veiculodescricao: TStringField;

    procedure FDConnAfterConnect(Sender: TObject);
    procedure FDConnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}




procedure Tdm.FDConnAfterConnect(Sender: TObject);
begin
     var
 strSQL : string;
begin

 StrSQL := 'CREATE TABLE IF NOT EXISTS login(' +
            'idcadastro integer  primary key autoincrement, ' +
            'nome varchar(15),' +
            'email varchar(20), '+
            'senha varchar(8))';

  FDConn.ExecSQL(strSQL);

 strSQL := EmptyStr;

  StrSQL := 'CREATE TABLE IF NOT EXISTS veiculos(' +
            'idveiculo integer primary key autoincrement, ' +
            'placa varchar(7),' +
            'nome varchar(20),' +
            'modelo varchar(20), '+

            'litros varchar(2),  '+
            'descricao varchar (50), ';


       FDConn.ExecSQL(strSQL);
       strSQL := EmptyStr;

      qry_geral.Active := true
end;

end;
procedure Tdm.FDConnBeforeConnect(Sender: TObject);
begin
var
  strPath: string;
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'database.db');
{$ENDIF}
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('F:\PROGRAMA MOBILE\PROGRAMA MOBILE\DB','database.db');
{$ENDIF}
  FDConn.Params.Values['UseUnicode'] := 'False';
  FDConn.Params.Values['DATABASE'] := strPath;

end;
     END;
end.
