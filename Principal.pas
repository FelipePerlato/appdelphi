unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts,
  FMX.ListBox, System.Actions, FMX.ActnList, FMX.MultiView, DB, System.IOUtils,
  System.Sensors, FMX.Maps, System.Sensors.Components, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Datasnap.DBClient,System.JSON;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabCadCarro: TTabItem;
    Rectangle1: TRectangle;
    Image1: TImage;
    Layout1: TLayout;
    lbl_email: TLabel;
    lbl_senha: TLabel;
    edt_senha: TEdit;
    edt_email: TEdit;
    Label3: TLabel;
    StyleBook1: TStyleBook;
    btn_entrar: TButton;
    Rectangle2: TRectangle;
    ToolBar1: TToolBar;
    Label4: TLabel;
    Layout2: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    edt_litros: TEdit;
    btn_cad_carro: TButton;
    TabCadConta: TTabItem;
    Label11: TLabel;
    Z: TRectangle;
    ToolBar2: TToolBar;
    Label12: TLabel;
    Layout3: TLayout;
    edt_nome_cad: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edt_email_cad: TEdit;
    Label15: TLabel;
    edt_senha_cad: TEdit;
    CADASTRAR: TButton;
    TabPerfil: TTabItem;
    ToolBar3: TToolBar;
    Label16: TLabel;
    Rectangle4: TRectangle;
    Label17: TLabel;
    Rectangle5: TRectangle;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    TabViagem: TTabItem;
    ToolBar4: TToolBar;
    Label18: TLabel;
    Rectangle6: TRectangle;
    Layout4: TLayout;
    Veículo: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edt_destino: TEdit;
    edt_origem: TEdit;
    edt_gasolina: TEdit;
    edt_diesel: TEdit;
    edt_etanol: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Button7: TButton;
    TabSplash: TTabItem;
    Layoutcarregamento: TLayout;
    Image2: TImage;
    Layoutatz: TLayout;
    Image3: TImage;
    Label25: TLabel;
    ActionList1: TActionList;
    Label1: TLabel;
    edt_placa: TEdit;
    edt_nome_carro: TEdit;
    edt_modelo: TEdit;
    Label2: TLabel;
    edt_desc: TEdit;
    ActViagem: TChangeTabAction;
    MultiView1: TMultiView;
    Rectangle7: TRectangle;
    ListBox2: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    lbl_logout: TListBoxItem;
    ActCadConta: TChangeTabAction;
    ActPerfil: TChangeTabAction;
    ActCadCarro: TChangeTabAction;
    Btn_menu_perfil: TButton;
    btn_menu: TButton;
    btn_voltar_cc: TButton;
    btn_voltar_cadconta: TButton;
    ActLogin: TChangeTabAction;
    TabGPS: TTabItem;
    ToolBar5: TToolBar;
    Label5: TLabel;
    Button1: TButton;
    Rectangle3: TRectangle;
    Switch1: TSwitch;
    LocationSensor1: TLocationSensor;
    MapView1: TMapView;
    ListBoxItem6: TListBoxItem;
    ActLoc: TChangeTabAction;
    CBveiculo: TComboBox;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    btn_atz: TButton;
    procedure btn_entrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
    procedure ListBoxItem8Click(Sender: TObject);
    procedure Btn_menu_perfilClick(Sender: TObject);
    procedure btn_voltar_ccClick(Sender: TObject);
    procedure btn_voltar_cadcontaClick(Sender: TObject);
    procedure lbl_logoutClick(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure CADASTRARClick(Sender: TObject);
    procedure btn_cad_carroClick(Sender: TObject);
  //procedure Switch1Click(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);

    procedure btn_atzClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure CBveiculoClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);

  private
  procedure OnFinishUpdate(Sender: TObject);
    { Private declarations }

  public
   versao_app: string;
    versao_server: string;
    { Public declarations }
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

Uses DataModule, UOpenURL


{$IFDEF ANDROID}
 , Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
 {$ENDIF}
 ;
 {$R *.fmx}

procedure TForm1.btn_entrarClick(Sender: TObject);
  // trata login
 var
senha: string;
begin

   dm.qry_geral.Close;
   dm.qry_geral.ParamByName('pEmail').AsString := edt_email.Text;
   dm.qry_geral.Open();

   if (dm.qry_geral <> nil) then
   begin
     if (dm.qry_geralemail.AsString = edt_email.Text) then
     begin
    if(dm.qry_geralsenha.AsString = edt_senha.Text) then
      begin
      ActViagem.Execute;

        end
    else
    begin
         ShowMessage('email ou senha estão incorretos');
    end;
    end
     else
     begin
       ShowMessage('email ou senha estão incorretos');
     end;
   end
   else
   begin
   ShowMessage('Erro interno ocorrido, acione o suporte');
   end;
end;


procedure TForm1.Btn_menu_perfilClick(Sender: TObject);
begin
  ActViagem.Execute;

end;

procedure TForm1.btn_voltar_cadcontaClick(Sender: TObject);
begin
  ActLogin.Execute;
end;

procedure TForm1.btn_voltar_ccClick(Sender: TObject);
begin
  ActViagem.Execute;
end;

procedure TForm1.btn_atzClick(Sender: TObject);
begin
     var url : string;
  begin
     {$IFDEF ANDROID}
     url:='https://drive.google.com/file/d/1cVjA5Gu4Rw30t6CiAZsr1PcJde2zoFLJ/view?usp=share_link';
     {$ELSE}
     url:='https://drive.google.com/file/d/1cVjA5Gu4Rw30t6CiAZsr1PcJde2zoFLJ/view?usp=share_link';
     {$ENDIF}

     OpenURL(url, False);
     Application.Terminate;
     end;

end;

procedure TForm1.btn_cad_carroClick(Sender: TObject);
begin
  if edt_placa.Text = EmptyStr then
  Begin
    showmessage('Informe a placa');
    exit;
  End;
  if edt_nome_carro.Text = EmptyStr then
  Begin
    showmessage('informe o nome');
    exit;
  End;
  if edt_modelo.Text = EmptyStr then
  Begin
    showmessage('informe o modelo');
    exit;
  End;
  if edt_litros.Text = EmptyStr then
  Begin
    showmessage('informe litros');
    exit;
  End;
  if edt_desc.Text = EmptyStr then
  Begin
    showmessage('informe a descrição');
    exit;
  End;

  

  Dm.qry_veiculo.Close;
  dm.qry_veiculo.Open();


      dm.Qry_veiculo.Append;
      dm.qry_veiculoplaca.AsString := edt_placa.Text;
      dm.qry_veiculonome.AsString := edt_nome_carro.Text;
      dm.qry_veiculomodelo.AsString := edt_modelo.Text;
      dm.qry_veiculolitros.AsString := edt_litros.Text;
      dm.qry_veiculodescricao.AsString := edt_desc.Text;
      dm.qry_veiculo.Post;
      dm.fdconn.CommitRetaining;




         ActViagem.ExecuteTarget(Sender);
   showmessage('VEICULO CADASTRADO COM SUCESSO');

 
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   versao_app := '0';
   versao_server := '1';

  TabControl1.ActiveTab := TabLogin;
  TabControl1.TabPosition := TTabPosition.None;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
     var
t: TThread;
begin
t:= TThread.CreateAnonymousThread(
procedure
var
JsonObj: TJSONObject;
begin
  sleep(2000);
  try
    RESTRequest1.Execute;
    except
    on ex: Exception do
    begin
      raise Exception.Create('Error ao acessar o servidor' + ex.Message);
   exit;
   end;
    end;
    try
    JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
    RESTRequest1.Response.JSONValue.ToString),0) as TJSONObject;

    versao_server := TJSONObject(JsonObj).GetValue('Form1').Value;

  finally
  JsonObj.DisposeOf;

  end;
end);
 t.Onterminate := OnFinishUpdate;
 t.Start;
 end;
end;
procedure TForm1.Image2Click(Sender: TObject);
begin
      form1:=Tform1.Create(Application);
      form1.show();
end;

procedure TForm1.OnFinishUpdate(Sender: TObject);
begin

       if Assigned(TThread(Sender).FatalException) then
           begin
           showmessage(Exception(TThread(Sender).FatalException).Message);
           exit;
           end;

  if versao_app < versao_server then
  begin
    Layoutcarregamento.Visible := False;
    Layoutatz.Visible := True;
  end;
end;


procedure TForm1.Label11Click(Sender: TObject);
begin
  ActCadConta.Execute;
  edt_nome_cad.SetFocus;
  MultiView1.HideMaster;

end;

procedure TForm1.ListBoxItem4Click(Sender: TObject);
begin
  ActPerfil.Execute;
  MultiView1.HideMaster;
end;

procedure TForm1.ListBoxItem5Click(Sender: TObject);
begin
  ActCadCarro.Execute;
  MultiView1.HideMaster;

end;

procedure TForm1.ListBoxItem6Click(Sender: TObject);
begin
          ActLoc.Execute;
       MultiView1.HideMaster;
end;

procedure TForm1.lbl_logoutClick(Sender: TObject);
begin
  // faz logout no sistema

  ActLogin.Execute;
  MultiView1.HideMaster;

end;

procedure TForm1.ListBoxItem8Click(Sender: TObject);
begin
  ActViagem.Execute;

  MultiView1.Visible := false;
end;








procedure TForm1.Rectangle1Click(Sender: TObject);
begin
  MultiView1.Visible := false;
end;

//procedure TForm1.Switch1Click(Sender: TObject);
//{$IFDEF ANDROID}
//var
//  ApermissaoGPS: string;
//{$ENDIF}
//begin
//{$IFDEF ANDROID}
//  ApermissaoGPS := JStringToString
//    (TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
///  PermissionsService.RequestPermissions([ApermissaoGPS],
 //   procedure(const ApermissaoGPS: TArray<string>;
 //     const AGrantResults: TArray<TPermissionStatus>)
 //   begin
 //     if (Length(AGrantResults) = 1) and
 //       (AGrantResults[0] = TPermissionStatus.Granted) then
 //       LocationSensor1.Active := true
 //   else
  //    LocationSensor1.Active := false;
  //  end);
//{$ENDIF}

//d;

procedure TForm1.CADASTRARClick(Sender: TObject);

begin

  if edt_nome_cad.Text = '' then
  Begin
    showmessage('Informe o nome');
    exit;
  End;
  if edt_email_cad.Text = '' then
  Begin
    showmessage('informe o e-mail');
    exit;
  End;
  if edt_senha_cad.Text = '' then
  Begin
    showmessage('informe a senha');
    exit;
  End;

  // exluiii usuario ja existente
  Dm.qry_geral.Close;
  dm.qry_geral.Open();


      dm.Qry_geral.Append;

      dm.qry_geralnome.AsString := edt_nome_cad.Text;
      dm.qry_geralemail.AsString := edt_email.Text;
      dm.qry_geralsenha.AsString := edt_senha_cad.Text;

      dm.qry_geral.Post;
      dm.fdconn.CommitRetaining;



      ActViagem.ExecuteTarget(Sender);

end;




procedure TForm1.CBveiculoClick(Sender: TObject);
begin
     begin
   dm.qry_veiculo.Close;
   dm.qry_veiculo.SQL.Clear;
   dm.qry_veiculo.SQL.Text:= 'select * from veiculos';
   dm.qry_veiculo.Open;
   dm.qry_veiculo.First;

   while not dm.qry_veiculo.Eof do
   begin
           CBveiculo.Items.Add(dm.qry_veiculo.FieldByName('nome').AsString);
   dm.qry_veiculo.Next;
   end;

  end;

end;





end.
