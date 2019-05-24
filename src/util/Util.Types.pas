unit Util.Types;

interface

uses
  System.IniFiles,
  System.SysUtils,
  System.Generics.Collections;

type
  TFilePath<T: class> = class
  strict private
    FPath: TFileName;
    FName: string;
    FModel: T;
  public
    property Name: string read FName write FName;
    property Path: TFileName read FPath write FPath;
    property Model: T read FModel write FModel;
  end;

  TPaths<T: class> = class
  strict private
    FItems: TObjectList<T> ;
  public
    destructor Destroy; override;
    procedure Foo;
    property Items: TObjectList<T> read FItems write FItems;
  end;

implementation

{ TPaths }

destructor TPaths<T>.Destroy;
var
  Path: TFilePath;
begin
  for Path in Paths do
  begin
    if Assigned(Path.IniFile) then
      Path.Free;
    Path.Free;
  end;
  inherited Destroy;
end;


end.
