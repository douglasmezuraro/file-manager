program spCfg;

uses
  Vcl.Forms,
  Form.Main in 'src\form\Form.Main.pas' {Form1},
  Ini.Section in 'src\ini\Ini.Section.pas',
  Ini.Key in 'src\ini\Ini.Key.pas',
  Ini.DataType in 'src\ini\Ini.DataType.pas',
  Ini.CustomIniFileHelper in 'src\ini\Ini.CustomIniFileHelper.pas',
  Util.Constants in 'src\util\Util.Constants.pas',
  Model.Config.AlternativeBalancer in 'src\model\Model.Config.AlternativeBalancer.pas',
  Model.Config.Application in 'src\model\Model.Config.Application.pas',
  Model.Config.Balancer in 'src\model\Model.Config.Balancer.pas',
  Model.Config.Client in 'src\model\Model.Config.Client.pas',
  Model.Config.Database in 'src\model\Model.Config.Database.pas',
  Model.Config.DUnit in 'src\model\Model.Config.DUnit.pas',
  Model.Config.Log in 'src\model\Model.Config.Log.pas',
  Model.Config.Monitor in 'src\model\Model.Config.Monitor.pas',
  Model.Config in 'src\model\Model.Config.pas',
  Model.Config.Scanner in 'src\model\Model.Config.Scanner.pas',
  Model.Config.Server in 'src\model\Model.Config.Server.pas',
  Model.Config.SPP in 'src\model\Model.Config.SPP.pas',
  Model.Config.Update in 'src\model\Model.Config.Update.pas',
  Model.Config.Workflow in 'src\model\Model.Config.Workflow.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.

