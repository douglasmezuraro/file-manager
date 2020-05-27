unit Model.Config.Scanner;

interface

uses
  Component.Attribute.CheckBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key;

type
  TScanner = class sealed
  private
    FDetectFeederPaper: Boolean;
    FDuplex: Boolean;
    FResolution: Integer;
    FBlackAndWhiteProcessing: Boolean;
    FAcquireFrame: Boolean;
    FRegisterLogDigitalFolder: Boolean;
    FBlackAndWhiteThreshold: Integer;
    FPageSize: Integer;
    FColorResolution: Integer;
    FWaitTimeMS: Integer;
    FWaitTime: Integer;
    FDocumentPerfil: Integer;
    FScannerModel: Integer;
  public
    [TCheckBox('Gravar log da pasta digital?')]
    [TKey('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: Boolean read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [TEdit('Tempo de espera (Ms)')]
    [TKey('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: Integer read FWaitTimeMS write FWaitTimeMS;

    [TEdit('Tempo de espera')]
    [TKey('TEMPOESPERA')]
    property WaitTime: Integer read FWaitTime write FWaitTime;

    [TCheckBox('Duplex')]
    [TKey('DUPLEX')]
    property Duplex: Boolean read FDuplex write FDuplex;

    [TCheckBox('AcquireFrame')]
    [TKey('ACQUIREFRAME')]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [TCheckBox('Detectar papel alimentador?')]
    [TKey('DETECTARPAPELALIMENTADOR')]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [TEdit('Tamanho da página')]
    [TKey('TAMPAGINA')]
    property PageSize: Integer read FPageSize write FPageSize;

    [TEdit('Resolução')]
    [TKey('RESOLUCAO')]
    property Resolution: Integer read FResolution write FResolution;

    [TEdit('Resolução (cores)')]
    [TKey('RESOLUCAOCORES')]
    property ColorResolution: Integer read FColorResolution write FColorResolution;

    [TEdit('Modelo')]
    [TKey('MODELOSCANNER')]
    property ScannerModel: Integer read FScannerModel write FScannerModel;

    [TEdit('Perfil documento')]
    [TKey('PERFILDOC')]
    property DocumentPerfil: Integer read FDocumentPerfil write FDocumentPerfil;

    [TEdit('Limiar preto e branco')]
    [TKey('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: Integer read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [TCheckBox('Processa preto e branco?')]
    [TKey('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

