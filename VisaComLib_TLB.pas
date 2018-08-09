unit VisaComLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 3/16/2006 4:54:27 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\PROGRA~1\VISA\VisaCom\GlobMgr.dll (1)
// LIBID: {DB8CBF00-D6D3-11D4-AA51-00A024EE30BD}
// LCID: 0
// Helpfile: 
// HelpString: VISA COM 3.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: Parameter 'type' of IVisaSession.LockRsrc changed to 'type_'
//   Hint: Parameter 'type' of IEventManager.EnableEvent changed to 'type_'
//   Hint: Parameter 'type' of IEventManager.DisableEvent changed to 'type_'
//   Hint: Parameter 'type' of IEventManager.DiscardEvents changed to 'type_'
//   Hint: Parameter 'type' of IEventManager.WaitOnEvent changed to 'type_'
//   Hint: Parameter 'type' of IEventManager.InstallHandler changed to 'type_'
//   Hint: Parameter 'type' of IEventManager.UninstallHandler changed to 'type_'
//   Hint: Symbol 'type' renamed to 'type_'
//   Hint: Parameter 'type' of IFormattedIO488.WriteNumber changed to 'type_'
//   Hint: Parameter 'type' of IFormattedIO488.WriteList changed to 'type_'
//   Hint: Parameter 'type' of IFormattedIO488.ReadNumber changed to 'type_'
//   Hint: Parameter 'type' of IFormattedIO488.ReadList changed to 'type_'
//   Hint: Parameter 'type' of IFormattedIO488.ReadIEEEBlock changed to 'type_'
//   Hint: Parameter 'type' of IVisaConflictTableManager.CreateHandler changed to 'type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  VisaComLibMajorVersion = 3;
  VisaComLibMinorVersion = 0;

  LIBID_VisaComLib: TGUID = '{DB8CBF00-D6D3-11D4-AA51-00A024EE30BD}';

  IID_IVisaSession: TGUID = '{DB8CBF03-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventManager: TGUID = '{DB8CBF14-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEvent: TGUID = '{DB8CBF12-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventHandler: TGUID = '{DB8CBF13-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IResourceManager: TGUID = '{DB8CBF02-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IResourceManager3: TGUID = '{DB8CBF20-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IBaseMessage: TGUID = '{DB8CBF04-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IMessage: TGUID = '{DB8CBF05-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IAsyncMessage: TGUID = '{DB8CBF06-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IRegister: TGUID = '{DB8CBF07-D6D3-11D4-AA51-00A024EE30BD}';
  IID_ISharedRegister: TGUID = '{DB8CBF08-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IGpib: TGUID = '{DB8CBF09-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IGpibIntfc: TGUID = '{DB8CBF0A-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IGpibIntfcMessage: TGUID = '{DB8CBF0B-D6D3-11D4-AA51-00A024EE30BD}';
  IID_ISerial: TGUID = '{DB8CBF0C-D6D3-11D4-AA51-00A024EE30BD}';
  IID_ITcpipInstr: TGUID = '{DB8CBF0D-D6D3-11D4-AA51-00A024EE30BD}';
  IID_ITcpipSocket: TGUID = '{DB8CBF0E-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IUsb: TGUID = '{DB8CBF24-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IVxi: TGUID = '{DB8CBF0F-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IVxi3: TGUID = '{DB8CBF22-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IVxiMemacc: TGUID = '{DB8CBF10-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IVxiBackplane: TGUID = '{DB8CBF11-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventIOCompletion: TGUID = '{DB8CBF15-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventTrigger: TGUID = '{DB8CBF16-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventVxiSignal: TGUID = '{DB8CBF17-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventVxiVmeInterrupt: TGUID = '{DB8CBF18-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventGpibCIC: TGUID = '{DB8CBF19-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IEventUsbInterrupt: TGUID = '{DB8CBF23-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IFormattedIO488: TGUID = '{DB8CBF1A-D6D3-11D4-AA51-00A024EE30BD}';
  IID_IVisaConflictTableManager: TGUID = '{DB8CBF1B-D6D3-11D4-AA51-00A024EE30BD}';
  CLASS_ResourceManager: TGUID = '{DB8CBF1C-D6D3-11D4-AA51-00A024EE30BD}';
  CLASS_FormattedIO488: TGUID = '{DB8CBF1D-D6D3-11D4-AA51-00A024EE30BD}';
  CLASS_VisaConflictTableManager: TGUID = '{DB8CBF1F-D6D3-11D4-AA51-00A024EE30BD}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum VisaStatusCode
type
  VisaStatusCode = TOleEnum;
const
  S_VISA_SUCCESS = $00000000;
  S_VISA_EVENT_EN = $00040002;
  S_VISA_EVENT_DIS = $00040003;
  S_VISA_QUEUE_EMPTY = $00040004;
  S_VISA_TERM_CHAR = $00040005;
  S_VISA_MAX_CNT = $00040006;
  S_VISA_DEV_NPRESENT = $0004007D;
  S_VISA_QUEUE_NEMPTY = $00040080;
  S_VISA_TRIG_MAPPED = $0004007E;
  S_VISA_NCHAIN = $00040098;
  S_VISA_NESTED_SHARED = $00040099;
  S_VISA_NESTED_EXCLUSIVE = $0004009A;
  S_VISA_SYNC = $0004009B;
  S_VISA_QUEUE_OVERFLOW = $0004000C;
  S_VISA_CONFIG_NLOADED = $00040077;
  S_VISA_NULL_OBJECT = $00040082;
  S_VISA_NSUP_ATTR_STATE = $00040084;
  S_VISA_UNKNOWN_STATUS = $00040085;
  S_VISA_NSUP_BUF = $00040088;
  S_VISA_EXT_FUNC_NIMPL = $000400A9;
  E_VISA_SYSTEM_ERROR = $80040000;
  E_VISA_INV_OBJECT = $8004000E;
  E_VISA_RSRC_LOCKED = $8004000F;
  E_VISA_INV_EXPR = $80040010;
  E_VISA_RSRC_NFOUND = $80040011;
  E_VISA_INV_RSRC_NAME = $80040012;
  E_VISA_INV_ACC_MODE = $80040013;
  E_VISA_TMO = $80040015;
  E_VISA_CLOSING_FAILED = $80040016;
  E_VISA_INV_DEGREE = $8004001B;
  E_VISA_INV_JOB_ID = $8004001C;
  E_VISA_NSUP_ATTR = $8004001D;
  E_VISA_NSUP_ATTR_STATE = $8004001E;
  E_VISA_ATTR_READONLY = $8004001F;
  E_VISA_INV_LOCK_TYPE = $80040020;
  E_VISA_INV_ACCESS_KEY = $80040021;
  E_VISA_INV_EVENT = $80040026;
  E_VISA_INV_MECH = $80040027;
  E_VISA_HNDLR_NINSTALLED = $80040028;
  E_VISA_INV_HNDLR_REF = $80040029;
  E_VISA_INV_CONTEXT = $8004002A;
  E_VISA_QUEUE_OVERFLOW = $8004002D;
  E_VISA_NENABLED = $8004002F;
  E_VISA_ABORT = $80040030;
  E_VISA_RAW_WR_PROT_VIOL = $80040034;
  E_VISA_RAW_RD_PROT_VIOL = $80040035;
  E_VISA_OUTP_PROT_VIOL = $80040036;
  E_VISA_INP_PROT_VIOL = $80040037;
  E_VISA_BERR = $80040038;
  E_VISA_IN_PROGRESS = $80040039;
  E_VISA_INV_SETUP = $8004003A;
  E_VISA_QUEUE_ERROR = $8004003B;
  E_VISA_ALLOC = $8004003C;
  E_VISA_INV_MASK = $8004003D;
  E_VISA_IO = $8004003E;
  E_VISA_INV_FMT = $8004003F;
  E_VISA_NSUP_FMT = $80040041;
  E_VISA_LINE_IN_USE = $80040042;
  E_VISA_NSUP_MODE = $80040046;
  E_VISA_SRQ_NOCCURRED = $8004004A;
  E_VISA_INV_SPACE = $8004004E;
  E_VISA_INV_OFFSET = $80040051;
  E_VISA_INV_WIDTH = $80040052;
  E_VISA_NSUP_OFFSET = $80040054;
  E_VISA_NSUP_VAR_WIDTH = $80040055;
  E_VISA_WINDOW_NMAPPED = $80040057;
  E_VISA_RESP_PENDING = $80040059;
  E_VISA_NLISTENERS = $8004005F;
  E_VISA_NCIC = $80040060;
  E_VISA_NSYS_CNTLR = $80040061;
  E_VISA_NSUP_OPER = $80040067;
  E_VISA_INTR_PENDING = $80040068;
  E_VISA_ASRL_PARITY = $8004006A;
  E_VISA_ASRL_FRAMING = $8004006B;
  E_VISA_ASRL_OVERRUN = $8004006C;
  E_VISA_TRIG_NMAPPED = $8004006E;
  E_VISA_NSUP_ALIGN_OFFSET = $80040070;
  E_VISA_USER_BUF = $80040071;
  E_VISA_RSRC_BUSY = $80040072;
  E_VISA_NSUP_WIDTH = $80040076;
  E_VISA_INV_PARAMETER = $80040078;
  E_VISA_INV_PROT = $80040079;
  E_VISA_INV_SIZE = $8004007B;
  E_VISA_WINDOW_MAPPED = $80040080;
  E_VISA_NIMPL_OPER = $80040081;
  E_VISA_INV_LENGTH = $80040083;
  E_VISA_INV_MODE = $80040091;
  E_VISA_SESN_NLOCKED = $8004009C;
  E_VISA_MEM_NSHARED = $8004009D;
  E_VISA_LIBRARY_NFOUND = $8004009E;
  E_VISA_NSUP_INTR = $8004009F;
  E_VISA_INV_LINE = $800400A0;
  E_VISA_FILE_ACCESS = $800400A1;
  E_VISA_FILE_IO = $800400A2;
  E_VISA_NSUP_LINE = $800400A3;
  E_VISA_NSUP_MECH = $800400A4;
  E_VISA_INTF_NUM_NCONFIG = $800400A5;
  E_VISA_CONN_LOST = $800400A6;

// Constants for enum EventType
type
  EventType = TOleEnum;
const
  EVENT_IO_COMPLETION = $3FFF2009;
  EVENT_TRIG = $BFFF200A;
  EVENT_SERVICE_REQ = $3FFF200B;
  EVENT_CLEAR = $3FFF200D;
  EVENT_EXCEPTION = $BFFF200E;
  EVENT_GPIB_CIC = $3FFF2012;
  EVENT_GPIB_TALK = $3FFF2013;
  EVENT_GPIB_LISTEN = $3FFF2014;
  EVENT_VXI_VME_SYSFAIL = $3FFF201D;
  EVENT_VXI_VME_SYSRESET = $3FFF201E;
  EVENT_VXI_SIGP = $3FFF2020;
  EVENT_VXI_VME_INTR = $BFFF2021;
  EVENT_TCPIP_CONNECT = $3FFF2036;
  EVENT_USB_INTR = $3FFF2037;
  ALL_ENABLED_EVENTS = $3FFF7FFF;
  CUSTOM_EVENT_TYPE = $FFFFFFFF;

// Constants for enum HardwareInterfaceType
type
  HardwareInterfaceType = TOleEnum;
const
  INTF_GPIB = $00000001;
  INTF_VXI = $00000002;
  INTF_GPIB_VXI = $00000003;
  INTF_ASRL = $00000004;
  INTF_TCPIP = $00000006;
  INTF_USB = $00000007;

// Constants for enum IOProtocol
type
  IOProtocol = TOleEnum;
const
  PROT_NORMAL = $00000001;
  PROT_FDC = $00000002;
  PROT_HS488 = $00000003;
  PROT_4882_STRS = $00000004;
  PROT_USBTMC_VENDOR = $00000005;

// Constants for enum FDCMode
type
  FDCMode = TOleEnum;
const
  FDC_NORMAL = $00000001;
  FDC_STREAM = $00000002;

// Constants for enum AddressSpace
type
  AddressSpace = TOleEnum;
const
  LOCAL_SPACE = $00000000;
  VXI_A16_SPACE = $00000001;
  VXI_A24_SPACE = $00000002;
  VXI_A32_SPACE = $00000003;
  OPAQUE_SPACE = $FFFFFFFF;

// Constants for enum EventMechanism
type
  EventMechanism = TOleEnum;
const
  EVENT_QUEUE = $00000001;
  EVENT_HNDLR = $00000002;
  EVENT_SUSPEND_HNDLR = $00000004;
  EVENT_ALL_MECH = $FFFFFFFF;

// Constants for enum TriggerLine
type
  TriggerLine = TOleEnum;
const
  TRIG_ALL = $FFFFFFFE;
  TRIG_SW = $FFFFFFFF;
  TRIG_TTL0 = $00000000;
  TRIG_TTL1 = $00000001;
  TRIG_TTL2 = $00000002;
  TRIG_TTL3 = $00000003;
  TRIG_TTL4 = $00000004;
  TRIG_TTL5 = $00000005;
  TRIG_TTL6 = $00000006;
  TRIG_TTL7 = $00000007;
  TRIG_ECL0 = $00000008;
  TRIG_ECL1 = $00000009;
  TRIG_PANEL_IN = $0000001B;
  TRIG_PANEL_OUT = $0000001C;

// Constants for enum TriggerProtocol
type
  TriggerProtocol = TOleEnum;
const
  TRIG_PROT_DEFAULT = $00000000;
  TRIG_PROT_ON = $00000001;
  TRIG_PROT_OFF = $00000002;
  TRIG_PROT_SYNC = $00000005;

// Constants for enum BufferMask
type
  BufferMask = TOleEnum;
const
  IO_IN_BUF = $00000010;
  IO_OUT_BUF = $00000020;
  IO_IN_AND_OUT_BUFS = $00000030;

// Constants for enum Timeout
type
  Timeout = TOleEnum;
const
  TMO_IMMEDIATE = $00000000;
  TMO_INFINITE = $FFFFFFFF;

// Constants for enum AccessMode
type
  AccessMode = TOleEnum;
const
  NO_LOCK = $00000000;
  EXCLUSIVE_LOCK = $00000001;
  SHARED_LOCK = $00000002;
  LOAD_CONFIG = $00000004;

// Constants for enum SerialParity
type
  SerialParity = TOleEnum;
const
  ASRL_PAR_NONE = $00000000;
  ASRL_PAR_ODD = $00000001;
  ASRL_PAR_EVEN = $00000002;
  ASRL_PAR_MARK = $00000003;
  ASRL_PAR_SPACE = $00000004;

// Constants for enum SerialStopBits
type
  SerialStopBits = TOleEnum;
const
  ASRL_STOP_ONE = $0000000A;
  ASRL_STOP_ONE5 = $0000000F;
  ASRL_STOP_TWO = $00000014;

// Constants for enum SerialFlowControl
type
  SerialFlowControl = TOleEnum;
const
  ASRL_FLOW_NONE = $00000000;
  ASRL_FLOW_XON_XOFF = $00000001;
  ASRL_FLOW_RTS_CTS = $00000002;
  ASRL_FLOW_DTR_DSR = $00000004;
  ASRL_FLOW_RTS_CTS_AND_XON_XOFF = $00000003;
  ASRL_FLOW_DTR_DSR_AND_XON_XOFF = $00000005;

// Constants for enum SerialEndConst
type
  SerialEndConst = TOleEnum;
const
  ASRL_END_NONE = $00000000;
  ASRL_END_LAST_BIT = $00000001;
  ASRL_END_TERMCHAR = $00000002;
  ASRL_END_BREAK = $00000003;

// Constants for enum LineState
type
  LineState = TOleEnum;
const
  STATE_ASSERTED = $00000001;
  STATE_UNASSERTED = $00000000;
  STATE_UNKNOWN = $FFFFFFFF;

// Constants for enum VXIMemoryAccessPrivilege
type
  VXIMemoryAccessPrivilege = TOleEnum;
const
  DATA_PRIV = $00000000;
  DATA_NPRIV = $00000001;
  PROG_PRIV = $00000002;
  PROG_NPRIV = $00000003;
  BLCK_PRIV = $00000004;
  BLCK_NPRIV = $00000005;
  D64_PRIV = $00000006;
  D64_NPRIV = $00000007;

// Constants for enum DataWidth
type
  DataWidth = TOleEnum;
const
  WIDTH_8 = $00000001;
  WIDTH_16 = $00000002;
  WIDTH_32 = $00000004;

// Constants for enum RENControlConst
type
  RENControlConst = TOleEnum;
const
  GPIB_REN_DEASSERT = $00000000;
  GPIB_REN_ASSERT = $00000001;
  GPIB_REN_GTL_AND_DEASSERT = $00000002;
  GPIB_REN_ASSERT_AND_ADDRESS = $00000003;
  GPIB_REN_LLO = $00000004;
  GPIB_REN_ADDRESS_AND_LLO = $00000005;
  GPIB_REN_GTL = $00000006;

// Constants for enum ATNControlConst
type
  ATNControlConst = TOleEnum;
const
  GPIB_ATN_DEASSERT = $00000000;
  GPIB_ATN_ASSERT = $00000001;
  GPIB_ATN_DEASSERT_HANDSHAKE = $00000002;
  GPIB_ATN_ASSERT_IMMEDIATE = $00000003;

// Constants for enum GPIBAddressState
type
  GPIBAddressState = TOleEnum;
const
  GPIB_UNADDRESSED = $00000000;
  GPIB_TALKER = $00000001;
  GPIB_LISTENER = $00000002;

// Constants for enum VXICommandQuery
type
  VXICommandQuery = TOleEnum;
const
  VXI_CMD16 = $00000200;
  VXI_CMD16_RESP16 = $00000202;
  VXI_RESP16 = $00000002;
  VXI_CMD32 = $00000400;
  VXI_CMD32_RESP16 = $00000402;
  VXI_CMD32_RESP32 = $00000404;
  VXI_RESP32 = $00000004;

// Constants for enum AssertInterruptConst
type
  AssertInterruptConst = TOleEnum;
const
  ASSERT_SIGNAL = $FFFFFFFF;
  ASSERT_USE_ASSIGNED = $00000000;
  ASSERT_IRQ1 = $00000001;
  ASSERT_IRQ2 = $00000002;
  ASSERT_IRQ3 = $00000003;
  ASSERT_IRQ4 = $00000004;
  ASSERT_IRQ5 = $00000005;
  ASSERT_IRQ6 = $00000006;
  ASSERT_IRQ7 = $00000007;

// Constants for enum AssertUtilityConst
type
  AssertUtilityConst = TOleEnum;
const
  ASSERT_SYSRESET = $00000001;
  ASSERT_SYSFAIL = $00000002;
  DEASSERT_SYSFAIL = $00000003;

// Constants for enum VXIDevClass
type
  VXIDevClass = TOleEnum;
const
  VXI_CLASS_MEMORY = $00000000;
  VXI_CLASS_EXTENDED = $00000001;
  VXI_CLASS_MESSAGE = $00000002;
  VXI_CLASS_REGISTER = $00000003;
  VXI_CLASS_OTHER = $00000004;

// Constants for enum IEEEASCIIType
type
  IEEEASCIIType = TOleEnum;
const
  ASCIIType_I2 = $00000002;
  ASCIIType_I4 = $00000003;
  ASCIIType_R4 = $00000004;
  ASCIIType_R8 = $00000005;
  ASCIIType_BSTR = $00000008;
  ASCIIType_Any = $0000000C;
  ASCIIType_UI1 = $00000011;

// Constants for enum IEEEBinaryType
type
  IEEEBinaryType = TOleEnum;
const
  BinaryType_I2 = $00000002;
  BinaryType_I4 = $00000003;
  BinaryType_R4 = $00000004;
  BinaryType_R8 = $00000005;
  BinaryType_UI1 = $00000011;

// Constants for enum ConflictHandlerType
type
  ConflictHandlerType = TOleEnum;
const
  NotChosen = $00000000;
  ChosenByResourceManager = $00000001;
  ChosenByUser = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IVisaSession = interface;
  IEventManager = interface;
  IEvent = interface;
  IEventHandler = interface;
  IResourceManager = interface;
  IResourceManager3 = interface;
  IBaseMessage = interface;
  IMessage = interface;
  IAsyncMessage = interface;
  IRegister = interface;
  ISharedRegister = interface;
  IGpib = interface;
  IGpibIntfc = interface;
  IGpibIntfcMessage = interface;
  ISerial = interface;
  ITcpipInstr = interface;
  ITcpipSocket = interface;
  IUsb = interface;
  IVxi = interface;
  IVxi3 = interface;
  IVxiMemacc = interface;
  IVxiBackplane = interface;
  IEventIOCompletion = interface;
  IEventTrigger = interface;
  IEventVxiSignal = interface;
  IEventVxiVmeInterrupt = interface;
  IEventGpibCIC = interface;
  IEventUsbInterrupt = interface;
  IFormattedIO488 = interface;
  IVisaConflictTableManager = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ResourceManager = IResourceManager3;
  FormattedIO488 = IFormattedIO488;
  VisaConflictTableManager = IVisaConflictTableManager;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}
  PPSafeArray2 = ^PSafeArray; {*}
  PPSafeArray3 = ^PSafeArray; {*}
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IVisaSession
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF03-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IVisaSession = interface(IUnknown)
    ['{DB8CBF03-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_ComponentVersion(out pVal: Integer): HResult; stdcall;
    function Get_SpecVersion(out pVal: Integer): HResult; stdcall;
    function Get_HardwareInterfaceName(out pVal: WideString): HResult; stdcall;
    function Get_HardwareInterfaceNumber(out pVal: Smallint): HResult; stdcall;
    function Get_HardwareInterfaceType(out pVal: Smallint): HResult; stdcall;
    function Get_LockState(out pVal: AccessMode): HResult; stdcall;
    function Get_OptionString(out pVal: WideString): HResult; stdcall;
    function Get_ProgID(out pVal: WideString): HResult; stdcall;
    function Get_ResourceName(out pVal: WideString): HResult; stdcall;
    function Get_SessionType(out pVal: WideString): HResult; stdcall;
    function Get_SoftwareManufacturerID(out pVal: Smallint): HResult; stdcall;
    function Get_SoftwareManufacturerName(out pVal: WideString): HResult; stdcall;
    function Get_Timeout(out pVal: Integer): HResult; stdcall;
    function Set_Timeout(pVal: Integer): HResult; stdcall;
    function Get_LastStatus(out pVal: HResult): HResult; stdcall;
    function GetAttribute(attribute: Integer; out pAttrState: OleVariant): HResult; stdcall;
    function SetAttribute(attribute: Integer; attrState: OleVariant): HResult; stdcall;
    function LockRsrc(type_: AccessMode; lockTimeout: Integer; const requestedKey: WideString; 
                      out pAccessKey: WideString): HResult; stdcall;
    function UnlockRsrc: HResult; stdcall;
    function Init(const ResourceName: WideString; mode: AccessMode; initTimeout: Integer; 
                  const OptionString: WideString): HResult; stdcall;
    function Close: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventManager
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF14-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventManager = interface(IVisaSession)
    ['{DB8CBF14-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_MaximumQueueLength(out pVal: Integer): HResult; stdcall;
    function Set_MaximumQueueLength(pVal: Integer): HResult; stdcall;
    function EnableEvent(type_: EventType; mech: EventMechanism; customEventType: Integer): HResult; stdcall;
    function DisableEvent(type_: EventType; mech: EventMechanism; customEventType: Integer): HResult; stdcall;
    function DiscardEvents(type_: EventType; mech: EventMechanism; customEventType: Integer): HResult; stdcall;
    function WaitOnEvent(waitTimeout: Integer; type_: EventType; customEventType: Integer; 
                         out pEvent: IEvent): HResult; stdcall;
    function InstallHandler(type_: EventType; const handler: IEventHandler; userHandle: Integer; 
                            customEventType: Integer): HResult; stdcall;
    function UninstallHandler(type_: EventType; userHandle: Integer; customEventType: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEvent
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF12-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEvent = interface(IUnknown)
    ['{DB8CBF12-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_type_(out pVal: EventType): HResult; stdcall;
    function Get_CustomEventTypeNumber(out pVal: Integer): HResult; stdcall;
    function GetAttribute(attribute: Integer; out pAttrState: OleVariant): HResult; stdcall;
    function SetAttribute(attribute: Integer; attrState: OleVariant): HResult; stdcall;
    function Close: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventHandler
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF13-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventHandler = interface(IUnknown)
    ['{DB8CBF13-D6D3-11D4-AA51-00A024EE30BD}']
    function HandleEvent(const vi: IEventManager; const event: IEvent; userHandle: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IResourceManager
// Flags:     (272) Hidden OleAutomation
// GUID:      {DB8CBF02-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IResourceManager = interface(IUnknown)
    ['{DB8CBF02-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_SoftwareManufacturerName(out pVal: WideString): HResult; stdcall;
    function Get_SoftwareManufacturerID(out pVal: Smallint): HResult; stdcall;
    function Get_Description(out pDesc: WideString): HResult; stdcall;
    function Get_ComponentVersion(out pVal: Integer): HResult; stdcall;
    function Get_ProgID(out pVal: WideString): HResult; stdcall;
    function Get_SpecVersion(out pVal: Integer): HResult; stdcall;
    function FindRsrc(const expr: WideString; out pFindList: PSafeArray): HResult; stdcall;
    function Open(const ResourceName: WideString; mode: AccessMode; openTimeout: Integer; 
                  const OptionString: WideString; out vi: IVisaSession): HResult; stdcall;
    function ParseRsrc(const ResourceName: WideString; var pInterfaceType: Smallint; 
                       var pInterfaceNumber: Smallint; var pSessionType: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IResourceManager3
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF20-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IResourceManager3 = interface(IResourceManager)
    ['{DB8CBF20-D6D3-11D4-AA51-00A024EE30BD}']
    function ParseRsrcEx(const ResourceName: WideString; var pInterfaceType: Smallint; 
                         var pInterfaceNumber: Smallint; var pSessionType: WideString; 
                         var pUnaliasedExpandedResourceName: WideString; 
                         var pAliasIfExists: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IBaseMessage
// Flags:     (272) Hidden OleAutomation
// GUID:      {DB8CBF04-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IBaseMessage = interface(IVisaSession)
    ['{DB8CBF04-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_IOProtocol(out pVal: IOProtocol): HResult; stdcall;
    function Set_IOProtocol(pVal: IOProtocol): HResult; stdcall;
    function Get_SendEndEnabled(out pVal: WordBool): HResult; stdcall;
    function Set_SendEndEnabled(pVal: WordBool): HResult; stdcall;
    function Get_TerminationCharacter(out pVal: Byte): HResult; stdcall;
    function Set_TerminationCharacter(pVal: Byte): HResult; stdcall;
    function Get_TerminationCharacterEnabled(out pVal: WordBool): HResult; stdcall;
    function Set_TerminationCharacterEnabled(pVal: WordBool): HResult; stdcall;
    function AssertTrigger(protocol: TriggerProtocol): HResult; stdcall;
    function Clear: HResult; stdcall;
    function ReadSTB(out pStatusByte: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMessage
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF05-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IMessage = interface(IBaseMessage)
    ['{DB8CBF05-D6D3-11D4-AA51-00A024EE30BD}']
    function Read(count: Integer; out pBuffer: PSafeArray): HResult; stdcall;
    function ReadString(count: Integer; out pBuffer: WideString): HResult; stdcall;
    function Write(var buffer: PSafeArray; count: Integer; out pRetCount: Integer): HResult; stdcall;
    function WriteString(const buffer: WideString; out pRetCount: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IAsyncMessage
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF06-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IAsyncMessage = interface(IBaseMessage)
    ['{DB8CBF06-D6D3-11D4-AA51-00A024EE30BD}']
    function Read(count: Integer; out pJobId: Integer): HResult; stdcall;
    function Write(var buffer: PSafeArray; count: Integer; out pJobId: Integer): HResult; stdcall;
    function WriteString(const buffer: WideString; out pJobId: Integer): HResult; stdcall;
    function Terminate(jobId: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IRegister
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF07-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IRegister = interface(IVisaSession)
    ['{DB8CBF07-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_DestinationBigEndian(out pVal: WordBool): HResult; stdcall;
    function Set_DestinationBigEndian(pVal: WordBool): HResult; stdcall;
    function Get_DestinationIncrement(out pVal: Integer): HResult; stdcall;
    function Set_DestinationIncrement(pVal: Integer): HResult; stdcall;
    function Get_SourceBigEndian(out pVal: WordBool): HResult; stdcall;
    function Set_SourceBigEndian(pVal: WordBool): HResult; stdcall;
    function Get_SourceIncrement(out pVal: Integer): HResult; stdcall;
    function Set_SourceIncrement(pVal: Integer): HResult; stdcall;
    function In8(space: Smallint; offset: Integer; out pVal8: Byte): HResult; stdcall;
    function In16(space: Smallint; offset: Integer; out pVal16: Smallint): HResult; stdcall;
    function In32(space: Smallint; offset: Integer; out pVal32: Integer): HResult; stdcall;
    function Out8(space: Smallint; offset: Integer; val8: Byte): HResult; stdcall;
    function Out16(space: Smallint; offset: Integer; val16: Smallint): HResult; stdcall;
    function Out32(space: Smallint; offset: Integer; val32: Integer): HResult; stdcall;
    function MoveIn8(space: Smallint; offset: Integer; length: Integer; out pBuf8: PSafeArray): HResult; stdcall;
    function MoveIn16(space: Smallint; offset: Integer; length: Integer; out pBuf16: PSafeArray): HResult; stdcall;
    function MoveIn32(space: Smallint; offset: Integer; length: Integer; out pBuf32: PSafeArray): HResult; stdcall;
    function MoveOut8(space: Smallint; offset: Integer; length: Integer; var buf8: PSafeArray): HResult; stdcall;
    function MoveOut16(space: Smallint; offset: Integer; length: Integer; var buf16: PSafeArray): HResult; stdcall;
    function MoveOut32(space: Smallint; offset: Integer; length: Integer; var buf32: PSafeArray): HResult; stdcall;
    function Move(srcSpace: Smallint; srcOffset: Integer; srcWidth: DataWidth; destSpace: Smallint; 
                  destOffset: Integer; destWidth: DataWidth; length: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISharedRegister
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF08-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  ISharedRegister = interface(IVisaSession)
    ['{DB8CBF08-D6D3-11D4-AA51-00A024EE30BD}']
    function AllocateMemory(size: Integer; out pOffset: Integer): HResult; stdcall;
    function FreeMemory(offset: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGpib
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF09-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IGpib = interface(IVisaSession)
    ['{DB8CBF09-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_PrimaryAddress(out pVal: Smallint): HResult; stdcall;
    function Get_RENState(out pVal: LineState): HResult; stdcall;
    function Get_RepeatAddressingEnabled(out pVal: WordBool): HResult; stdcall;
    function Set_RepeatAddressingEnabled(pVal: WordBool): HResult; stdcall;
    function Get_SecondaryAddress(out pVal: Smallint): HResult; stdcall;
    function Get_UnaddressingEnabled(out pVal: WordBool): HResult; stdcall;
    function Set_UnaddressingEnabled(pVal: WordBool): HResult; stdcall;
    function ControlREN(mode: RENControlConst): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGpibIntfc
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF0A-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IGpibIntfc = interface(IVisaSession)
    ['{DB8CBF0A-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_AddressingState(out pVal: GPIBAddressState): HResult; stdcall;
    function Get_ATNState(out pVal: LineState): HResult; stdcall;
    function Get_DevStatusByte(out pVal: Byte): HResult; stdcall;
    function Set_DevStatusByte(pVal: Byte): HResult; stdcall;
    function Get_CICState(out pVal: WordBool): HResult; stdcall;
    function Get_HS488CBLLength(out pVal: Smallint): HResult; stdcall;
    function Set_HS488CBLLength(pVal: Smallint): HResult; stdcall;
    function Get_NDACState(out pVal: LineState): HResult; stdcall;
    function Get_PrimaryAddress(out pVal: Smallint): HResult; stdcall;
    function Set_PrimaryAddress(pVal: Smallint): HResult; stdcall;
    function Get_RENState(out pVal: LineState): HResult; stdcall;
    function Get_SecondaryAddress(out pVal: Smallint): HResult; stdcall;
    function Set_SecondaryAddress(pVal: Smallint): HResult; stdcall;
    function Get_SRQState(out pVal: LineState): HResult; stdcall;
    function Get_SysControlState(out pVal: WordBool): HResult; stdcall;
    function Set_SysControlState(pVal: WordBool): HResult; stdcall;
    function Command(var buffer: PSafeArray; count: Integer; out pRetCount: Integer): HResult; stdcall;
    function ControlATN(mode: ATNControlConst): HResult; stdcall;
    function ControlREN(mode: RENControlConst): HResult; stdcall;
    function PassControl(primAddr: Smallint; secAddr: Smallint): HResult; stdcall;
    function SendIFC: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGpibIntfcMessage
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF0B-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IGpibIntfcMessage = interface(IVisaSession)
    ['{DB8CBF0B-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_SendEndEnabled(out pVal: WordBool): HResult; stdcall;
    function Set_SendEndEnabled(pVal: WordBool): HResult; stdcall;
    function Get_TerminationCharacter(out pVal: Byte): HResult; stdcall;
    function Set_TerminationCharacter(pVal: Byte): HResult; stdcall;
    function Get_TerminationCharacterEnabled(out pVal: WordBool): HResult; stdcall;
    function Set_TerminationCharacterEnabled(pVal: WordBool): HResult; stdcall;
    function AssertTrigger(protocol: TriggerProtocol): HResult; stdcall;
    function Read(count: Integer; out pBuffer: PSafeArray): HResult; stdcall;
    function ReadString(count: Integer; out pBuffer: WideString): HResult; stdcall;
    function Write(var buffer: PSafeArray; count: Integer; out pRetCount: Integer): HResult; stdcall;
    function WriteString(const buffer: WideString; out pRetCount: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISerial
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF0C-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  ISerial = interface(IVisaSession)
    ['{DB8CBF0C-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_BytesAvailable(out pVal: Integer): HResult; stdcall;
    function Get_BaudRate(out pVal: Integer): HResult; stdcall;
    function Set_BaudRate(pVal: Integer): HResult; stdcall;
    function Get_DataBits(out pVal: Smallint): HResult; stdcall;
    function Set_DataBits(pVal: Smallint): HResult; stdcall;
    function Get_ClearToSendState(out pVal: LineState): HResult; stdcall;
    function Get_DataCarrierDetectState(out pVal: LineState): HResult; stdcall;
    function Get_DataSetReadyState(out pVal: LineState): HResult; stdcall;
    function Get_DataTerminalReadyState(out pVal: LineState): HResult; stdcall;
    function Set_DataTerminalReadyState(pVal: LineState): HResult; stdcall;
    function Get_EndIn(out pVal: SerialEndConst): HResult; stdcall;
    function Set_EndIn(pVal: SerialEndConst): HResult; stdcall;
    function Get_EndOut(out pVal: SerialEndConst): HResult; stdcall;
    function Set_EndOut(pVal: SerialEndConst): HResult; stdcall;
    function Get_FlowControl(out pVal: SerialFlowControl): HResult; stdcall;
    function Set_FlowControl(pVal: SerialFlowControl): HResult; stdcall;
    function Get_Parity(out pVal: SerialParity): HResult; stdcall;
    function Set_Parity(pVal: SerialParity): HResult; stdcall;
    function Get_RingIndicatorState(out pVal: LineState): HResult; stdcall;
    function Get_RequestToSendState(out pVal: LineState): HResult; stdcall;
    function Set_RequestToSendState(pVal: LineState): HResult; stdcall;
    function Get_StopBits(out pVal: SerialStopBits): HResult; stdcall;
    function Set_StopBits(pVal: SerialStopBits): HResult; stdcall;
    function Get_ReplacementCharacter(out pVal: Byte): HResult; stdcall;
    function Set_ReplacementCharacter(pVal: Byte): HResult; stdcall;
    function Get_XONCharacter(out pVal: Byte): HResult; stdcall;
    function Set_XONCharacter(pVal: Byte): HResult; stdcall;
    function Get_XOFFCharacter(out pVal: Byte): HResult; stdcall;
    function Set_XOFFCharacter(pVal: Byte): HResult; stdcall;
    function SetBufferSize(mask: BufferMask; size: Integer): HResult; stdcall;
    function Flush(mask: BufferMask; discard: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITcpipInstr
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF0D-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  ITcpipInstr = interface(IVisaSession)
    ['{DB8CBF0D-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_Address(out pVal: WideString): HResult; stdcall;
    function Get_HostName(out pVal: WideString): HResult; stdcall;
    function Get_DeviceName(out pVal: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITcpipSocket
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF0E-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  ITcpipSocket = interface(IVisaSession)
    ['{DB8CBF0E-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_Address(out pVal: WideString): HResult; stdcall;
    function Get_HostName(out pVal: WideString): HResult; stdcall;
    function Get_KeepAlive(out pVal: WordBool): HResult; stdcall;
    function Set_KeepAlive(pVal: WordBool): HResult; stdcall;
    function Get_NoDelay(out pVal: WordBool): HResult; stdcall;
    function Set_NoDelay(pVal: WordBool): HResult; stdcall;
    function Get_Port(out pVal: Smallint): HResult; stdcall;
    function SetBufferSize(mask: BufferMask; size: Integer): HResult; stdcall;
    function Flush(mask: BufferMask; discard: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUsb
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF24-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IUsb = interface(IVisaSession)
    ['{DB8CBF24-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_ManufacturerID(out pVal: Smallint): HResult; stdcall;
    function Get_ManufacturerName(out pVal: WideString): HResult; stdcall;
    function Get_ModelCode(out pVal: Smallint): HResult; stdcall;
    function Get_ModelName(out pVal: WideString): HResult; stdcall;
    function Get_Is4882Compliant(out pVal: WordBool): HResult; stdcall;
    function Get_UsbSerialNumber(out pVal: WideString): HResult; stdcall;
    function Get_UsbInterfaceNumber(out pVal: Smallint): HResult; stdcall;
    function Get_UsbProtocol(out pVal: Smallint): HResult; stdcall;
    function Get_MaximumInterruptSize(out pVal: Smallint): HResult; stdcall;
    function Set_MaximumInterruptSize(pVal: Smallint): HResult; stdcall;
    function ControlREN(mode: RENControlConst): HResult; stdcall;
    function ControlOut(bmRequestType: Smallint; bRequest: Smallint; wValue: Smallint; 
                        wIndex: Smallint; wLength: Smallint; var buffer: PSafeArray): HResult; stdcall;
    function ControlIn(bmRequestType: Smallint; bRequest: Smallint; wValue: Smallint; 
                       wIndex: Smallint; wLength: Smallint; out pBuf: PSafeArray): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVxi
// Flags:     (272) Hidden OleAutomation
// GUID:      {DB8CBF0F-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IVxi = interface(IVisaSession)
    ['{DB8CBF0F-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_CommanderLA(out pVal: Smallint): HResult; stdcall;
    function Get_DestinationAccessPrivilege(out pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Set_DestinationAccessPrivilege(pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Get_DeviceClass(out pVal: VXIDevClass): HResult; stdcall;
    function Get_FastDataChannel(out pVal: Smallint): HResult; stdcall;
    function Set_FastDataChannel(pVal: Smallint): HResult; stdcall;
    function Get_FastDataChannelMode(out pVal: FDCMode): HResult; stdcall;
    function Set_FastDataChannelMode(pVal: FDCMode): HResult; stdcall;
    function Get_FastDataChannelUsePair(out pVal: WordBool): HResult; stdcall;
    function Set_FastDataChannelUsePair(pVal: WordBool): HResult; stdcall;
    function Get_ImmediateServant(out pVal: WordBool): HResult; stdcall;
    function Get_LogicalAddress(out pVal: Smallint): HResult; stdcall;
    function Get_MainframeLogicalAddress(out pVal: Smallint): HResult; stdcall;
    function Get_ManufacturerID(out pVal: Smallint): HResult; stdcall;
    function Get_ManufacturerName(out pVal: WideString): HResult; stdcall;
    function Get_MemoryBase(out pVal: Integer): HResult; stdcall;
    function Get_MemorySize(out pVal: Integer): HResult; stdcall;
    function Get_MemorySpace(out pVal: Smallint): HResult; stdcall;
    function Get_ModelCode(out pVal: Smallint): HResult; stdcall;
    function Get_ModelName(out pVal: WideString): HResult; stdcall;
    function Get_TriggerID(out pVal: TriggerLine): HResult; stdcall;
    function Set_TriggerID(pVal: TriggerLine): HResult; stdcall;
    function Get_Slot(out pVal: Smallint): HResult; stdcall;
    function Get_SourceAccessPrivilege(out pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Set_SourceAccessPrivilege(pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Get_TriggerSupport(out pVal: Integer): HResult; stdcall;
    function AssertTrigger(protocol: TriggerProtocol): HResult; stdcall;
    function CommandQuery(mode: VXICommandQuery; cmd: Integer; out pResponse: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVxi3
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF22-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IVxi3 = interface(IVxi)
    ['{DB8CBF22-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_Is4882Compliant(out pVal: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVxiMemacc
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF10-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IVxiMemacc = interface(IRegister)
    ['{DB8CBF10-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_DestinationAccessPrivilege(out pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Set_DestinationAccessPrivilege(pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Get_SourceAccessPrivilege(out pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Set_SourceAccessPrivilege(pVal: VXIMemoryAccessPrivilege): HResult; stdcall;
    function Get_LogicalAddress(out pVal: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVxiBackplane
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF11-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IVxiBackplane = interface(IVisaSession)
    ['{DB8CBF11-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_MainframeLA(out pVal: Smallint): HResult; stdcall;
    function Get_TriggerID(out pVal: TriggerLine): HResult; stdcall;
    function Set_TriggerID(pVal: TriggerLine): HResult; stdcall;
    function Get_TriggerStatus(out pVal: Integer): HResult; stdcall;
    function Get_TriggerSupport(out pVal: Integer): HResult; stdcall;
    function Get_VxiVmeInterruptStatus(out pVal: Smallint): HResult; stdcall;
    function Get_VxiVmeSysfailStatus(out pVal: LineState): HResult; stdcall;
    function AssertInterruptSignal(mode: AssertInterruptConst; statusID: Integer): HResult; stdcall;
    function AssertTrigger(protocol: TriggerProtocol): HResult; stdcall;
    function AssertUtilSignal(line: AssertUtilityConst): HResult; stdcall;
    function MapTrigger(trigSrc: TriggerLine; trigDest: TriggerLine; mode: Smallint): HResult; stdcall;
    function UnmapTrigger(trigSrc: TriggerLine; trigDest: TriggerLine): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventIOCompletion
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF15-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventIOCompletion = interface(IEvent)
    ['{DB8CBF15-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_IOStatus(out pVal: HResult): HResult; stdcall;
    function Get_jobId(out pVal: Integer): HResult; stdcall;
    function Get_ReturnCount(out pVal: Integer): HResult; stdcall;
    function Get_ReadBuffer(out pVal: PSafeArray): HResult; stdcall;
    function Get_ReadBufferAsString(out pVal: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventTrigger
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF16-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventTrigger = interface(IEvent)
    ['{DB8CBF16-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_TriggerID(out pVal: TriggerLine): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventVxiSignal
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF17-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventVxiSignal = interface(IEvent)
    ['{DB8CBF17-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_SignalStatusID(out pVal: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventVxiVmeInterrupt
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF18-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventVxiVmeInterrupt = interface(IEvent)
    ['{DB8CBF18-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_InterruptStatusID(out pVal: Integer): HResult; stdcall;
    function Get_InterruptLevel(out pVal: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventGpibCIC
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF19-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventGpibCIC = interface(IEvent)
    ['{DB8CBF19-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_CICState(out pVal: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventUsbInterrupt
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF23-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IEventUsbInterrupt = interface(IEvent)
    ['{DB8CBF23-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_DataBuffer(out pVal: PSafeArray): HResult; stdcall;
    function Get_IOStatus(out pVal: HResult): HResult; stdcall;
    function Get_InterruptSize(out pVal: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IFormattedIO488
// Flags:     (256) OleAutomation
// GUID:      {DB8CBF1A-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IFormattedIO488 = interface(IUnknown)
    ['{DB8CBF1A-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_IO(out pVal: IMessage): HResult; stdcall;
    function _Set_IO(const pVal: IMessage): HResult; stdcall;
    function Get_InstrumentBigEndian(out pVal: WordBool): HResult; stdcall;
    function Set_InstrumentBigEndian(pVal: WordBool): HResult; stdcall;
    function WriteString(const data: WideString; flushAndEND: WordBool): HResult; stdcall;
    function WriteNumber(data: OleVariant; type_: IEEEASCIIType; flushAndEND: WordBool): HResult; stdcall;
    function WriteList(var data: OleVariant; type_: IEEEASCIIType; const listSeperator: WideString; 
                       flushAndEND: WordBool): HResult; stdcall;
    function WriteIEEEBlock(const Command: WideString; data: OleVariant; flushAndEND: WordBool): HResult; stdcall;
    function ReadString(out pData: WideString): HResult; stdcall;
    function ReadNumber(type_: IEEEASCIIType; flushToEND: WordBool; out pData: OleVariant): HResult; stdcall;
    function ReadList(type_: IEEEASCIIType; const listSeperator: WideString; out pData: OleVariant): HResult; stdcall;
    function ReadIEEEBlock(type_: IEEEBinaryType; seekToBlock: WordBool; flushToEND: WordBool; 
                           out pData: OleVariant): HResult; stdcall;
    function FlushWrite(sendEND: WordBool): HResult; stdcall;
    function FlushRead: HResult; stdcall;
    function SetBufferSize(mask: BufferMask; size: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVisaConflictTableManager
// Flags:     (272) Hidden OleAutomation
// GUID:      {DB8CBF1B-D6D3-11D4-AA51-00A024EE30BD}
// *********************************************************************//
  IVisaConflictTableManager = interface(IUnknown)
    ['{DB8CBF1B-D6D3-11D4-AA51-00A024EE30BD}']
    function Get_StoreConflictsOnly(out pVal: WordBool): HResult; stdcall;
    function Set_StoreConflictsOnly(pVal: WordBool): HResult; stdcall;
    function Get_ConflictTableFilename(out pVal: WideString): HResult; stdcall;
    function Get_NumberOfResources(out pVal: Integer): HResult; stdcall;
    function CreateHandler(interfaceType: Smallint; interfaceNumber: Smallint; 
                           const SessionType: WideString; const vsrmGuid: WideString; 
                           type_: ConflictHandlerType; const miscComments: WideString): HResult; stdcall;
    function DeleteHandler(interfaceType: Smallint; interfaceNumber: Smallint; 
                           const SessionType: WideString; const vsrmGuid: WideString): HResult; stdcall;
    function DeleteHandlerByGUID(const vsrmGuid: WideString): HResult; stdcall;
    function DeleteResourceByIndex(tableIndex: Integer): HResult; stdcall;
    function FindChosenHandler(interfaceType: Smallint; interfaceNumber: Smallint; 
                               const SessionType: WideString; var pVsrmGuid: WideString; 
                               var pType: ConflictHandlerType): HResult; stdcall;
    function QueryResource(tableIndex: Integer; var pInterfaceType: Smallint; 
                           var pInterfaceNumber: Smallint; var pSessionType: WideString; 
                           var pNumHandlers: Smallint): HResult; stdcall;
    function QueryResourceHandler(tableIndex: Integer; handlerIndex: Smallint; 
                                  var pVsrmGuid: WideString; var pType: ConflictHandlerType; 
                                  var pMiscComments: WideString): HResult; stdcall;
    function FlushToFile: HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoResourceManager provides a Create and CreateRemote method to          
// create instances of the default interface IResourceManager3 exposed by              
// the CoClass ResourceManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoResourceManager = class
    class function Create: IResourceManager3;
    class function CreateRemote(const MachineName: string): IResourceManager3;
  end;

// *********************************************************************//
// The Class CoFormattedIO488 provides a Create and CreateRemote method to          
// create instances of the default interface IFormattedIO488 exposed by              
// the CoClass FormattedIO488. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFormattedIO488 = class
    class function Create: IFormattedIO488;
    class function CreateRemote(const MachineName: string): IFormattedIO488;
  end;

// *********************************************************************//
// The Class CoVisaConflictTableManager provides a Create and CreateRemote method to          
// create instances of the default interface IVisaConflictTableManager exposed by              
// the CoClass VisaConflictTableManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisaConflictTableManager = class
    class function Create: IVisaConflictTableManager;
    class function CreateRemote(const MachineName: string): IVisaConflictTableManager;
  end;

implementation

uses ComObj;

class function CoResourceManager.Create: IResourceManager3;
begin
  Result := CreateComObject(CLASS_ResourceManager) as IResourceManager3;
end;

class function CoResourceManager.CreateRemote(const MachineName: string): IResourceManager3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ResourceManager) as IResourceManager3;
end;

class function CoFormattedIO488.Create: IFormattedIO488;
begin
  Result := CreateComObject(CLASS_FormattedIO488) as IFormattedIO488;
end;

class function CoFormattedIO488.CreateRemote(const MachineName: string): IFormattedIO488;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FormattedIO488) as IFormattedIO488;
end;

class function CoVisaConflictTableManager.Create: IVisaConflictTableManager;
begin
  Result := CreateComObject(CLASS_VisaConflictTableManager) as IVisaConflictTableManager;
end;

class function CoVisaConflictTableManager.CreateRemote(const MachineName: string): IVisaConflictTableManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisaConflictTableManager) as IVisaConflictTableManager;
end;

end.
