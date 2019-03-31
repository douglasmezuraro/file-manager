program spCfg;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Main in 'src\form\Form.Main.pas' {Main},
  Helper.Rtti in 'src\helper\Helper.Rtti.pas',
  Attribute.Ini in 'src\attribute\Attribute.Ini.pas',
  Helper.Ini in 'src\helper\Helper.Ini.pas',
  Model.Config.Application in 'src\model\Model.Config.Application.pas',
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
  Model.Config.Workflow in 'src\model\Model.Config.Workflow.pas',
  Util.Methods in 'src\util\Util.Methods.pas',
  Helper.FMX in 'src\helper\Helper.FMX.pas',
  Template.CheckBox in 'src\template\Template.CheckBox.pas',
  Template.ComboBox in 'src\template\Template.ComboBox.pas',
  Template.Edit in 'src\template\Template.Edit.pas',
  Template.TabItem in 'src\template\Template.TabItem.pas',
  Command.Invoker in 'src\command\Command.Invoker.pas',
  Command.Undoable in 'src\command\Command.Undoable.pas',
  Command.API in 'src\command\Command.API.pas',
  Command.Receiver in 'src\command\Command.Receiver.pas',
  Util.Binding in 'src\util\Util.Binding.pas',
  Template.AbstractClass in 'src\template\Template.AbstractClass.pas',
  FactoryMethod.ControlTemplate in 'src\factorymethod\FactoryMethod.ControlTemplate.pas',
  Attribute.Control in 'src\attribute\Attribute.Control.pas',
  Util.DTO in 'src\util\Util.DTO.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
