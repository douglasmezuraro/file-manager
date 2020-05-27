unit Ini.API;

interface

type
  /// <summary>
  ///  Interface for the concrete classes that handle file implement.
  /// </summary>
  IIniMappedObject = interface(IInterface)
  ['{D2FCBB10-0403-4B12-9F8F-D92C3D0B2AF4}']

    /// <summary>
    ///  Read the file.
    /// </summary>
    procedure Read;

    /// <summary>
    ///  Write the file.
    /// </summary>
    /// <remarks>
    ///  Write the file passed as parameter in class constructor.
    /// </remarks>
    procedure Write; overload;

    /// <summary>
    ///  Write the file.
    /// </summary>
    /// <param name="AFileName">
    /// </param>
    /// <remarks>
    ///  Write the file passed as parameter.
    /// </remarks>
    procedure Write(const AFileName: string); overload;

    /// <summary>
    ///  Auto create the properties of the class.
    /// </summary>
    procedure CreateProperties;

    /// <summary>
    ///  Auto destroy the properties of the class.
    /// </summary>
    procedure DestroyProperties;

    /// <summary>
    ///  Returns the instance of the object that implements the interface.
    /// </summary>
    /// <returns>
    ///  TObject
    /// </returns>
    function GetObject: TObject;
  end;

implementation

end.

