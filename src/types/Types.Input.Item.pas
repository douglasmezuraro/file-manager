unit Types.Input.Item;

interface

uses
  Model.Base,
  System.SysUtils;

type
  TInputItem<T: TModel> = class
  private
    FCanOverride: Boolean;
    FName: string;
    FSource: TFileName;
    FTarget: TFileName;
    FModel: T;
    FGroup: string;
  public
    property Name: string read FName write FName;
    property Group: string read FGroup write FGroup;
    property CanOverride: Boolean read FCanOverride write FCanOverride;
    property Source: TFileName read FSource write FSource;
    property Target: TFileName read FTarget write FTarget;
    property Model: T read FModel write FModel;
  end;

implementation

end.

