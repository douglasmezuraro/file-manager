program FileManager;

uses
  System.StartUpCopy,
  FMX.Forms,
  Attribute.Control in 'src\attribute\Attribute.Control.pas',
  Attribute.Ini in 'src\attribute\Attribute.Ini.pas',
  Command.API in 'src\command\Command.API.pas',
  Command.Invoker in 'src\command\Command.Invoker.pas',
  Command.Receiver in 'src\command\Command.Receiver.pas',
  Command.Undoable in 'src\command\Command.Undoable.pas',
  FactoryMethod.ControlTemplate in 'src\factorymethod\FactoryMethod.ControlTemplate.pas',
  Form.Main in 'src\form\Form.Main.pas' {Main},
  Helper.FMX.FMXObject in 'src\helper\Helper.FMX.FMXObject.pas',
  Helper.Ini in 'src\helper\Helper.Ini.pas',
  Helper.Rtti in 'src\helper\Helper.Rtti.pas',
  Model.Config in 'src\model\Model.Config.pas',
  Model.Config.Application in 'src\model\Model.Config.Application.pas',
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
  Template.AbstractClass in 'src\template\Template.AbstractClass.pas',
  Template.CheckBox in 'src\template\Template.CheckBox.pas',
  Template.ComboBox in 'src\template\Template.ComboBox.pas',
  Template.Edit in 'src\template\Template.Edit.pas',
  Template.TabItem in 'src\template\Template.TabItem.pas',
  Types.Binding in 'src\types\Types.Binding.pas',
  Types.DTO in 'src\types\Types.DTO.pas',
  Types.ObjectFile in 'src\types\Types.ObjectFile.pas',
  Types.ObjectFileAPI in 'src\types\Types.ObjectFileAPI.pas',
  Types.Path in 'src\types\Types.Path.pas',
  Types.Paths in 'src\types\Types.Paths.pas',
  Types.Utils in 'src\types\Types.Utils.pas',
  Types.Utils.Constants in 'src\types\Types.Utils.Constants.pas',
  Types.Utils.Conversions in 'src\types\Types.Utils.Conversions.pas',
  Types.Utils.Dialogs in 'src\types\Types.Utils.Dialogs.pas',
  Types.Utils.Methods in 'src\types\Types.Utils.Methods.pas',
  Types.Utils.Translation in 'src\types\Types.Utils.Translation.pas',
  Helper.FMX.TreeView in 'src\helper\Helper.FMX.TreeView.pas';

{$R *.res}

var
  View: TMain;

begin
  TUtils.Translation.Translate;

  Application.Initialize;
  Application.CreateForm(TMain, View);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.

