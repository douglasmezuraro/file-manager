unit Model.Config.Scanner;

interface

uses
  Ini.Key,
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
    [TKey('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: UInt8 read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [TKey('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: UInt32 read FWaitTimeMS write FWaitTimeMS;

    [TKey('TEMPOESPERA')]
    property WaitTime: Uint32 read FWaitTime write FWaitTime;

    [TKey('DUPLEX')]
    property Duplex: Boolean read FDuplex write FDuplex;

    [TKey('ACQUIREFRAME')]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [TKey('DETECTARPAPELALIMENTADOR')]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [TKey('TAMPAGINA')]
    property PageSize: Uint32 read FPageSize write FPageSize;

    [TKey('RESOLUCAO')]
    property Resolution: UInt32 read FResolution write FResolution;

    [TKey('RESOLUCAOCORES')]
    property ColorResolution: UInt32 read FColorResolution write FColorResolution;

    [TKey('MODELOSCANNER')]
    property ScannerModel: UInt32 read FScannerModel write FScannerModel;

    [TKey('PERFILDOC')]
    property DocumentPerfil: UInt32 read FDocumentPerfil write FDocumentPerfil;

    [TKey('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: UInt32 read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [TKey('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

