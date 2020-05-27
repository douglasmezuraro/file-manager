unit Component.Factory.Classes;

interface

uses
  Component.Factory.Caption, Component.Factory.CheckBox, Component.Factory.ComboBox, Component.Factory.Edit,
  Component.Factory.Memo, Component.Factory.TabItem;

type
  /// <summary>
  ///  Concrete class of the <c>TLabel<c> component factory.
  /// </summary>
  TCaptionFactory = Component.Factory.Caption.TCaptionFactory;

  /// <summary>
  ///  Concrete class of the <c>TCheckBox<c> component factory.
  /// </summary>
  TCheckBoxFactory = Component.Factory.CheckBox.TCheckBoxFactory;

  /// <summary>
  ///  Concrete class of the <c>TComboBox<c> component factory.
  /// </summary>
  TComboBoxFactory = Component.Factory.ComboBox.TComboBoxFactory;

  /// <summary>
  ///  Concrete class of the <c>TEdit<c> component factory.
  /// </summary>
  TEditFactory = Component.Factory.Edit.TEditFactory;

  /// <summary>
  ///  Concrete class of the <c>TMemo<c> component factory.
  /// </summary>
  TMemoFactory = Component.Factory.Memo.TMemoFactory;

  /// <summary>
  ///  Concrete class of the <c>TTabItem<c> component factory.
  /// </summary>
  TTabItemFactory = Component.Factory.TabItem.TTabItemFactory;

implementation

end.

