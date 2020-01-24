program FileManager;

uses
  System.StartUpCopy,
  FMX.Forms,
  MidasLib,
  Attribute.Component.CheckBox in 'src\Attribute\Component\Attribute.Component.CheckBox.pas',
  Attribute.Component.ComboBox in 'src\Attribute\Component\Attribute.Component.ComboBox.pas',
  Attribute.Component.Control in 'src\Attribute\Component\Attribute.Component.Control.pas',
  Attribute.Component.Edit in 'src\Attribute\Component\Attribute.Component.Edit.pas',
  Attribute.Component.Hint in 'src\Attribute\Component\Attribute.Component.Hint.pas',
  Attribute.Component.Memo in 'src\Attribute\Component\Attribute.Component.Memo.pas',
  Attribute.Component.Tab in 'src\Attribute\Component\Attribute.Component.Tab.pas',
  Attribute.Ini in 'src\Attribute\Ini\Attribute.Ini.pas',
  Attribute.Ini.Key in 'src\Attribute\Ini\Attribute.Ini.Key.pas',
  Attribute.Ini.Section in 'src\Attribute\Ini\Attribute.Ini.Section.pas',
  Attribute.Managed in 'src\Attribute\Attribute.Managed.pas',
  Attribute.Text in 'src\Attribute\Attribute.Text.pas',
  Attribute.Validation in 'src\Attribute\Validation\Attribute.Validation.pas',
  Attribute.Validation.Date in 'src\Attribute\Validation\Attribute.Validation.Date.pas',
  Attribute.Validation.DateTime in 'src\Attribute\Validation\Attribute.Validation.DateTime.pas',
  Attribute.Validation.Float in 'src\Attribute\Validation\Attribute.Validation.Float.pas',
  Attribute.Validation.Integer in 'src\Attribute\Validation\Attribute.Validation.Integer.pas',
  Attribute.Validation.RegEx in 'src\Attribute\Validation\Attribute.Validation.RegEx.pas',
  Attribute.Validation.Text in 'src\Attribute\Validation\Attribute.Validation.Text.pas',
  Attribute.Validation.Time in 'src\Attribute\Validation\Attribute.Validation.Time.pas',
  Command.API in 'src\Command\Command.API.pas',
  Command.Invoker in 'src\Command\Command.Invoker.pas',
  Command.Receiver in 'src\Command\Command.Receiver.pas',
  Command.Undoable in 'src\Command\Command.Undoable.pas',
  FactoryMethod.Control in 'src\FactoryMethod\FactoryMethod.Control.pas',
  Form.Main in 'src\Form\Form.Main.pas' {Main},
  Helper.FMX.FMXObject in 'src\Helper\FMX\Helper.FMX.FMXObject.pas',
  Helper.FMX.Hyperlink in 'src\Helper\FMX\Helper.FMX.Hyperlink.pas',
  Helper.FMX.TabControl in 'src\Helper\FMX\Helper.FMX.TabControl.pas',
  Helper.FMX.TreeView in 'src\Helper\FMX\Helper.FMX.TreeView.pas',
  Helper.FMX.TreeViewItem in 'src\Helper\FMX\Helper.FMX.TreeViewItem.pas',
  Helper.Ini in 'src\Helper\Ini\Helper.Ini.pas',
  Helper.Rtti.RttiProperty in 'src\Helper\Rtti\Helper.Rtti.RttiProperty.pas',
  Helper.Rtti.RttiType in 'src\Helper\Rtti\Helper.Rtti.RttiType.pas',
  Helper.Rtti.Util in 'src\Helper\Rtti\Helper.Rtti.Util.pas',
  Helper.Rtti.Value in 'src\Helper\Rtti\Helper.Rtti.Value.pas',
  Model.Base in 'src\Model\Base\Model.Base.pas',
  Model.Config in 'src\Model\Config\Model.Config.pas',
  Model.Config.AlternativeBalancer in 'src\Model\Config\Model.Config.AlternativeBalancer.pas',
  Model.Config.Application in 'src\Model\Config\Model.Config.Application.pas',
  Model.Config.Client in 'src\Model\Config\Model.Config.Client.pas',
  Model.Config.Database in 'src\Model\Config\Model.Config.Database.pas',
  Model.Config.DUnit in 'src\Model\Config\Model.Config.DUnit.pas',
  Model.Config.Log in 'src\Model\Config\Model.Config.Log.pas',
  Model.Config.Monitor in 'src\Model\Config\Model.Config.Monitor.pas',
  Model.Config.Scanner in 'src\Model\Config\Model.Config.Scanner.pas',
  Model.Config.Server in 'src\Model\Config\Model.Config.Server.pas',
  Model.Config.SPP in 'src\Model\Config\Model.Config.SPP.pas',
  Model.Config.Update in 'src\Model\Config\Model.Config.Update.pas',
  Model.Config.Workflow in 'src\Model\Config\Model.Config.Workflow.pas',
  Template.AbstractClass in 'src\Template\Template.AbstractClass.pas',
  Template.CheckBox in 'src\Template\Template.CheckBox.pas',
  Template.ComboBox in 'src\Template\Template.ComboBox.pas',
  Template.Edit in 'src\Template\Template.Edit.pas',
  Template.Memo in 'src\Template\Template.Memo.pas',
  Template.Tab in 'src\Template\Template.Tab.pas',
  Types.Binding in 'src\Types\Types.Binding.pas',
  Types.ControlDTO in 'src\Types\Types.ControlDTO.pas',
  Types.IniObject in 'src\Types\Types.IniObject.pas',
  Types.Input in 'src\Types\Types.Input.pas',
  Types.Input.Item in 'src\Types\Types.Input.Item.pas',
  Types.ObjectFileAPI in 'src\Types\Types.ObjectFileAPI.pas',
  Types.ResourceStrings in 'src\Types\Types.ResourceStrings.pas',
  Types.Utils in 'src\Types\Types.Utils.pas',
  Types.Utils.Constants in 'src\Types\Types.Utils.Constants.pas',
  Types.Utils.Conversions in 'src\Types\Types.Utils.Conversions.pas',
  Types.Utils.Dialogs in 'src\Types\Types.Utils.Dialogs.pas',
  Types.Utils.Methods in 'src\Types\Types.Utils.Methods.pas',
  Types.Utils.RegEx in 'src\Types\Types.Utils.RegEx.pas',
  Types.Utils.Translation in 'src\Types\Types.Utils.Translation.pas',
  Types.Validator in 'src\Types\Types.Validator.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;

{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := WordBool(DebugHook);
{$WARN SYMBOL_PLATFORM ON}
end.

