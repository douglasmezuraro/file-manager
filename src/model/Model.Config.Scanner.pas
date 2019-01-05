unit Model.Config.Scanner;

interface

uses
  Ini.DataType,
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
    [TKey('GRAVARLOGPASTADIGITAL', dtInteger)]
    property RegisterLogDigitalFolder: UInt8 read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [TKey('TEMPOESPERAEMMILISEGUNDOS', dtInteger)]
    property WaitTimeMS: UInt32 read FWaitTimeMS write FWaitTimeMS;

    [TKey('TEMPOESPERA', dtInteger)]
    property WaitTime: Uint32 read FWaitTime write FWaitTime;

    [TKey('DUPLEX', dtBool)]
    property Duplex: Boolean read FDuplex write FDuplex;

    [TKey('ACQUIREFRAME', dtBool)]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [TKey('DETECTARPAPELALIMENTADOR', dtBool)]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [TKey('TAMPAGINA', dtInteger)]
    property PageSize: Uint32 read FPageSize write FPageSize;

    [TKey('RESOLUCAO', dtInteger)]
    property Resolution: UInt32 read FResolution write FResolution;

    [TKey('RESOLUCAOCORES', dtInteger)]
    property ColorResolution: UInt32 read FColorResolution write FColorResolution;

    [TKey('MODELOSCANNER', dtInteger)]
    property ScannerModel: UInt32 read FScannerModel write FScannerModel;

    [TKey('PERFILDOC', dtInteger)]
    property DocumentPerfil: UInt32 read FDocumentPerfil write FDocumentPerfil;

    [TKey('LIMIARPRETOEBRANCO', dtInteger)]
    property BlackAndWhiteThreshold: UInt32 read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [TKey('PROCESSAPRETOEBRANCO', dtBool)]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

