program FileManager;

uses
  System.StartUpCopy,
  FMX.Forms,
  MidasLib,
  Attribute.Validation in 'src\attribute\Validation\Attribute.Validation.pas',
  Command.API in 'src\command\Command.API.pas',
  Command.Invoker in 'src\command\Command.Invoker.pas',
  Command.Receiver in 'src\command\Command.Receiver.pas',
  Command.Undoable in 'src\command\Command.Undoable.pas',
  FactoryMethod.Control in 'src\factorymethod\FactoryMethod.Control.pas',
  Form.Main in 'src\form\Form.Main.pas' {Main},
  Helper.Ini in 'src\helper\Helper.Ini.pas',
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
  Template.Tab in 'src\template\Template.Tab.pas',
  Types.Binding in 'src\types\Types.Binding.pas',
  Types.ControlDTO in 'src\types\Types.ControlDTO.pas',
  Types.Input in 'src\types\Types.Input.pas',
  Types.IniObject in 'src\types\Types.IniObject.pas',
  Types.ObjectFileAPI in 'src\types\Types.ObjectFileAPI.pas',
  Types.Input.Item in 'src\types\Types.Input.Item.pas',
  Types.Utils in 'src\types\Types.Utils.pas',
  Types.Utils.Constants in 'src\types\Types.Utils.Constants.pas',
  Types.Utils.Conversions in 'src\types\Types.Utils.Conversions.pas',
  Types.Utils.Dialogs in 'src\types\Types.Utils.Dialogs.pas',
  Types.Utils.Methods in 'src\types\Types.Utils.Methods.pas',
  Types.Utils.Translation in 'src\types\Types.Utils.Translation.pas',
  Model.Base in 'src\model\Model.Base.pas',
  Types.Validator in 'src\types\Types.Validator.pas',
  Types.Utils.RegEx in 'src\types\Types.Utils.RegEx.pas',
  Model.Config.AlternativeBalancer in 'src\model\Model.Config.AlternativeBalancer.pas',
  Attribute.Managed in 'src\attribute\Attribute.Managed.pas',
  Template.Memo in 'src\template\Template.Memo.pas',
  Types.ResourceStrings in 'src\types\Types.ResourceStrings.pas',
  Attribute.Component.ComboBox in 'src\attribute\Component\Attribute.Component.ComboBox.pas',
  Attribute.Text in 'src\attribute\Attribute.Text.pas',
  Attribute.Component.Control in 'src\attribute\Component\Attribute.Component.Control.pas',
  Attribute.Component.Hint in 'src\attribute\Component\Attribute.Component.Hint.pas',
  Attribute.Component.Tab in 'src\attribute\Component\Attribute.Component.Tab.pas',
  Attribute.Component.CheckBox in 'src\attribute\Component\Attribute.Component.CheckBox.pas',
  Attribute.Component.Edit in 'src\attribute\Component\Attribute.Component.Edit.pas',
  Attribute.Component.Memo in 'src\attribute\Component\Attribute.Component.Memo.pas',
  Attribute.Ini.Key in 'src\attribute\Ini\Attribute.Ini.Key.pas',
  Attribute.Ini in 'src\attribute\Ini\Attribute.Ini.pas',
  Attribute.Ini.Section in 'src\attribute\Ini\Attribute.Ini.Section.pas',
  Attribute.Validation.Date in 'src\attribute\Validation\Attribute.Validation.Date.pas',
  Attribute.Validation.DateTime in 'src\attribute\Validation\Attribute.Validation.DateTime.pas',
  Attribute.Validation.Time in 'src\attribute\Validation\Attribute.Validation.Time.pas',
  Attribute.Validation.Float in 'src\attribute\Validation\Attribute.Validation.Float.pas',
  Attribute.Validation.Integer in 'src\attribute\Validation\Attribute.Validation.Integer.pas',
  Attribute.Validation.RegEx in 'src\attribute\Validation\Attribute.Validation.RegEx.pas',
  Attribute.Validation.Text in 'src\attribute\Validation\Attribute.Validation.Text.pas',
  Helper.FMX.FMXObject in 'src\helper\FMX\Helper.FMX.FMXObject.pas',
  Helper.FMX.Hyperlink in 'src\helper\FMX\Helper.FMX.Hyperlink.pas',
  Helper.FMX.TabControl in 'src\helper\FMX\Helper.FMX.TabControl.pas',
  Helper.FMX.TreeView in 'src\helper\FMX\Helper.FMX.TreeView.pas',
  Helper.FMX.TreeViewItem in 'src\helper\FMX\Helper.FMX.TreeViewItem.pas',
  Helper.Rtti.Value in 'src\helper\Rtti\Helper.Rtti.Value.pas',
  Helper.Rtti.Util in 'src\helper\Rtti\Helper.Rtti.Util.pas',
  Helper.Rtti.RttiType in 'src\helper\Rtti\Helper.Rtti.RttiType.pas',
  Helper.Rtti.RttiProperty in 'src\helper\Rtti\Helper.Rtti.RttiProperty.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;

{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook > 0;
{$WARN SYMBOL_PLATFORM ON}
end.

