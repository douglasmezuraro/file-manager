program FileManager;

uses
  System.StartUpCopy,
  System.SysUtils,
  FMX.Forms,
  MidasLib,
  Command.API in 'src\Command\Command.API.pas',
  Command.Invoker in 'src\Command\Command.Invoker.pas',
  Command.Receiver in 'src\Command\Command.Receiver.pas',
  Command.Undoable in 'src\Command\Command.Undoable.pas',
  Component.Factory.API in 'src\Component\Factory\Component.Factory.API.pas',
  Component.Attribute.Base in 'src\Component\Attribute\Component.Attribute.Base.pas',
  Component.Attribute.CheckBox in 'src\Component\Attribute\Component.Attribute.CheckBox.pas',
  Component.Attribute.ComboBox in 'src\Component\Attribute\Component.Attribute.ComboBox.pas',
  Component.Attribute.Edit in 'src\Component\Attribute\Component.Attribute.Edit.pas',
  Component.Attribute.Managed in 'src\Component\Attribute\Component.Attribute.Managed.pas',
  Component.Attribute.Memo in 'src\Component\Attribute\Component.Attribute.Memo.pas',
  Component.Attribute.TabItem in 'src\Component\Attribute\Component.Attribute.TabItem.pas',
  Component.DTO in 'src\Component\Component.DTO.pas',
  Component.Factory.Method in 'src\Component\Factory\Component.Factory.Method.pas',
  Component.Factory.Caption in 'src\Component\Factory\Component.Factory.Caption.pas',
  Component.Factory.CheckBox in 'src\Component\Factory\Component.Factory.CheckBox.pas',
  Component.Factory.ComboBox in 'src\Component\Factory\Component.Factory.ComboBox.pas',
  Component.Factory.Edit in 'src\Component\Factory\Component.Factory.Edit.pas',
  Component.Factory.Memo in 'src\Component\Factory\Component.Factory.Memo.pas',
  Component.Factory.TabItem in 'src\Component\Factory\Component.Factory.TabItem.pas',
  Form.Main in 'src\Form\Form.Main.pas' {Main},
  Helper.FMX.FMXObject in 'src\Helper\FMX\Helper.FMX.FMXObject.pas',
  Helper.FMX.Hyperlink in 'src\Helper\FMX\Helper.FMX.Hyperlink.pas',
  Helper.FMX.Lang in 'src\Helper\FMX\Helper.FMX.Lang.pas',
  Helper.FMX.TabControl in 'src\Helper\FMX\Helper.FMX.TabControl.pas',
  Helper.FMX.TreeView in 'src\Helper\FMX\Helper.FMX.TreeView.pas',
  Helper.FMX.TreeViewItem in 'src\Helper\FMX\Helper.FMX.TreeViewItem.pas',
  Helper.Ini in 'src\Helper\Ini\Helper.Ini.pas',
  Helper.Rtti.RttiProperty in 'src\Helper\Rtti\Helper.Rtti.RttiProperty.pas',
  Helper.Rtti.RttiType in 'src\Helper\Rtti\Helper.Rtti.RttiType.pas',
  Helper.Rtti.Util in 'src\Helper\Rtti\Helper.Rtti.Util.pas',
  Helper.Rtti.Value in 'src\Helper\Rtti\Helper.Rtti.Value.pas',
  Ini.API in 'src\Ini\Ini.API.pas',
  Ini.Attribute.Base in 'src\Ini\Attribute\Ini.Attribute.Base.pas',
  Ini.Attribute.Key in 'src\Ini\Attribute\Ini.Attribute.Key.pas',
  Ini.Attribute.Section in 'src\Ini\Attribute\Ini.Attribute.Section.pas',
  Ini.Base in 'src\Ini\Ini.Base.pas',
  Input.Config in 'src\Input\Input.Config.pas',
  Input.Item in 'src\Input\Input.Item.pas',
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
  Model.Meza in 'src\Model\Meza\Model.Meza.pas',
  Model.Meza.Doo in 'src\Model\Meza\Model.Meza.Doo.pas',
  Model.Meza.Foo in 'src\Model\Meza\Model.Meza.Foo.pas',
  Types.Binding in 'src\Types\Types.Binding.pas',
  Types.Consts in 'src\Types\Types.Consts.pas',
  Types.Dialogs in 'src\Types\Types.Dialogs.pas',
  Types.Lock in 'src\Types\Types.Lock.pas',
  Types.RegisterClass in 'src\Types\Types.RegisterClass.pas',
  Types.Utils in 'src\Types\Types.Utils.pas',
  Validation.Attribute.Base in 'src\Validation\Attribute\Validation.Attribute.Base.pas',
  Validation.Attribute.Date in 'src\Validation\Attribute\Validation.Attribute.Date.pas',
  Validation.Attribute.DateTime in 'src\Validation\Attribute\Validation.Attribute.DateTime.pas',
  Validation.Attribute.Float in 'src\Validation\Attribute\Validation.Attribute.Float.pas',
  Validation.Attribute.Integer in 'src\Validation\Attribute\Validation.Attribute.Integer.pas',
  Validation.Attribute.RegEx in 'src\Validation\Attribute\Validation.Attribute.RegEx.pas',
  Validation.Attribute.Text in 'src\Validation\Attribute\Validation.Attribute.Text.pas',
  Validation.Attribute.Time in 'src\Validation\Attribute\Validation.Attribute.Time.pas',
  Validation.Validator in 'src\Validation\Validation.Validator.pas',
  Validation.Attribute in 'src\Validation\Attribute\Validation.Attribute.pas',
  Component.Attribute in 'src\Component\Attribute\Component.Attribute.pas',
  Component.Factory.Classes in 'src\Component\Factory\Component.Factory.Classes.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;

{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook.ToBoolean;
{$WARN SYMBOL_PLATFORM ON}
end.

