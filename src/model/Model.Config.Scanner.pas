unit Model.Config.Scanner;

interface

uses
  Ini.Section;

type
  [TSection('SCANNER')]
  TScanner = class
  private
    FDetectFeederPaper: Boolean;
    FDuplex: Boolean;
    FResolution: UInt32;
    FBlackAndWhiteProcessing: Boolean;
    FAcquireFrame: Boolean;
    FRegisterLogDigitalFolder: UInt8;
    FBlackAndWhiteThreshold: UInt32;
    FPageSize: Uint32;
    FColorResolution: UInt32;
    FWaitTimeMS: UInt32;
    FWaitTime: Uint32;
    FDocumentPerfil: UInt32;
    FScannerModel: UInt32;
  public
    property RegisterLogDigitalFolder: UInt8 read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;
    property WaitTimeMS: UInt32 read FWaitTimeMS write FWaitTimeMS;
    property WaitTime: Uint32 read FWaitTime write FWaitTime;
    property Duplex: Boolean read FDuplex write FDuplex;
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;
    property PageSize: Uint32 read FPageSize write FPageSize;
    property Resolution: UInt32 read FResolution write FResolution;
    property ColorResolution: UInt32 read FColorResolution write FColorResolution;
    property ScannerModel: UInt32 read FScannerModel write FScannerModel;
    property DocumentPerfil: UInt32 read FDocumentPerfil write FDocumentPerfil;
    property BlackAndWhiteThreshold: UInt32 read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

