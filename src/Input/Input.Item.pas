unit Input.Item;

interface

uses
  System.Classes;

type
  /// <summary>
  ///  Config item class.
  /// </summary>
  TItem = class sealed(TPersistent)
  private
    FCanOverride: Boolean;
    FName: string;
    FSource: string;
    FTarget: string;
    FGroup: string;
    FClassName: string;
    FTabs: TArray<string>;
  public
    /// <summary>
    ///  Defines the name that the file appears on the application
    /// </summary>
    property Name: string read FName write FName;

    /// <summary>
    ///  Defines the position in treeview
    /// </summary>
    /// <remarks>
    ///  Uses the ">" character to nest the item on threeview
    /// </remarks>
    property Group: string read FGroup write FGroup;

    /// <summary>
    ///  Defines if the application can override the source file
    /// </summary>
    /// <remarks>
    ///  When true the application can overwrite the source file
    /// </remarks>
    property CanOverride: Boolean read FCanOverride write FCanOverride;

    /// <summary>
    ///  Defines the path of source file
    /// </summary>
    property Source: string read FSource write FSource;

    /// <summary>
    ///  Defines the path of target file
    /// </summary>
    property Target: string read FTarget write FTarget;

  {$WARN HIDING_MEMBER OFF}
    /// <summary>
    ///  Defines the name of mapped ini class
    /// </summary>
    property ClassName: string read FClassName write FClassName;
  {$WARN HIDING_MEMBER DEFAULT}

    /// <summary>
    ///  Defines the order of tabs
    /// </summary>
    property Tabs: TArray<string> read FTabs write FTabs;
  end;

implementation

end.

