unit Types.ObjectFileAPI;

interface

uses
  System.SysUtils;

type
  IObjectFile = interface
  ['{D2FCBB10-0403-4B12-9F8F-D92C3D0B2AF4}']
    procedure Read;
    procedure Write; overload;
    procedure Write(const FileName: TFileName); overload;
  end;

implementation

end.

