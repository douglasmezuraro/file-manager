program spCfg;

uses
  Vcl.Forms,
  Form.Main in 'src\form\Form.Main.pas' {Main},
  Ini.Section in 'src\ini\Ini.Section.pas',
  Ini.Key in 'src\ini\Ini.Key.pas',
  Ini.CustomIniFileHelper in 'src\ini\Ini.CustomIniFileHelper.pas',
  Util.Constants in 'src\util\Util.Constants.pas',
  Model.Config in 'src\model\Model.Config.pas',
  Model.Config.AlternativeBalancer in 'src\model\Model.Config.AlternativeBalancer.pas',
  Model.Config.Application in 'src\model\Model.Config.Application.pas',
  Model.Config.Balancer in 'src\model\Model.Config.Balancer.pas',
  Model.Config.Client in 'src\model\Model.Config.Client.pas',
  Model.Config.Database in 'src\model\Model.Config.Database.pas',
  Model.Config.DUnit in 'src\model\Model.Config.DUnit.pas',
  Model.Config.Log in 'src\model\Model.Config.Log.pas',
  Model.Config.Monitor in 'src\model\Model.Config.Monitor.pas',
  Model.Config.Scanner in 'src\model\Model.Config.Scanner.pas',
  Model.Config.Server in 'src\model\Model.Config.Server.pas',
  Model.Config.SPP in 'src\model\Model.Config.SPP.pas',
  Model.Config.Update in 'src\model\Model.Config.Update.pas',
  Model.Config.Workflow in 'src\model\Model.Config.Workflow.pas',
  Util.Methods in 'src\util\Util.Methods.pas',
  Util.Types in 'src\util\Util.Types.pas',
  Helper.ComboBox in 'src\helper\Helper.ComboBox.pas',
  Helper.Value in 'src\helper\Helper.Value.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.

