{*****************************************************************************
* 版本信息:
*     浅诺桌面管理工具v1.0
* 文件名称:
*     QnDeskMng.dpr
* 内容摘要:
*     限制程序运行次数，1次
* 历史记录:
*     2013.2.1 created by xzj
******************************************************************************}
program QnDeskMng;

uses
  Forms,
  SysUtils,
  Windows,
  UseShortcutKey in 'UseShortcutKey.pas' {FormUse};

{$R *.res}
var
MutexHandle: THandle;//禁止程序启动多次
hPrevInst: Boolean;
v_AppName:string;
begin
 v_AppName:=ExtractFilename(Application.Exename);
//禁止程序启动多次开始
 	MutexHandle := CreateMutex(nil, TRUE,pchar(v_AppName));
 	if MutexHandle <> 0 then
  begin
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      MessageBox(0,pchar('提示:'+v_AppName+'程序已经启动了,请不要重复开启!'),'[浅诺桌面管理v1.0]提示...', mb_IconHand);

      hPrevInst := TRUE;
      CloseHandle(MutexHandle);
      Halt;
    end
    else
    begin
     hPrevInst := FALSE;
    end;
  end
  else
  begin
 	  hPrevInst := FALSE;
  end;
//禁止程序启动多次结束
  Application.Initialize;
  Application.Title := '浅诺桌面管理工具v1.0';
  Application.CreateForm(TFormUse, FormUse);
  Application.Run;
end.

