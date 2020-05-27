unit Component.Attribute;

interface

uses
  Component.Attribute.Base, Component.Attribute.CheckBox, Component.Attribute.ComboBox,
  Component.Attribute.Edit, Component.Attribute.Managed, Component.Attribute.Memo,
  Component.Attribute.TabItem;

type
  /// <summary>
  ///  Base attribute to map which component a property will create.
  /// </summary>
  TComponentBaseAttribute = Component.Attribute.Base.TComponentBaseAttribute;

  /// <summary>
  ///  Attribute to map that the property will create a <c>TCheckBox<c>.
  /// </summary>
  TCheckBoxAttribute = Component.Attribute.CheckBox.TCheckBoxAttribute;

  /// <summary>
  ///  Attribute to map that the property will create a <c>TComboBox<c>.
  /// </summary>
  TComboBoxAttribute = Component.Attribute.ComboBox.TComboBoxAttribute;

  /// <summary>
  ///  Attribute to map that the property will create a <c>TEdit<c>.
  /// </summary>
  TEditAttribute = Component.Attribute.Edit.TEditAttribute;

  /// <summary>
  ///  Attribute to map that the property will create a <c>TMemo<c>.
  /// </summary>
  TMemoAttribute = Component.Attribute.Memo.TMemoAttribute;

  /// <summary>
  ///  Attribute to indicate which properties will be created and destroyed automatically.
  /// </summary>
  TManagedAttribute = Component.Attribute.Managed.TManagedAttribute;

  /// <summary>
  ///  Attribute to map that the property will create a <c>TTabItem<c>.
  /// </summary>
  TTabItemAttribute = Component.Attribute.TabItem.TTabItemAttribute;

implementation

end.
