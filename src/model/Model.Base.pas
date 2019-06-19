unit Model.Base;

interface

uses
  Helper.Rtti,
  System.Rtti,
  System.SysUtils,
  Types.IniObject;

type
  TModel = class(TIniObject)
  public
    constructor Create(const FileName: TFileName); override;
    destructor Destroy; override;
  end;

implementation

{ TModel }

constructor TModel.Create;
begin
  inherited Create(FileName);
  TRttiUtil.CreateProperties(Self);
end;

destructor TModel.Destroy;
begin
  TRttiUtil.DestroyProperties(Self);
  inherited Destroy;
end;

end.
