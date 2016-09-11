{*****************************************************************************
* �汾��Ϣ:
*     ǳŵ�����������v1.0
* �ļ�����:
*     QnDeskMng.dpr
* ����ժҪ:
*     ���Ƴ������д�����1��
* ��ʷ��¼:
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
MutexHandle: THandle;//��ֹ�����������
hPrevInst: Boolean;
v_AppName:string;
begin
 v_AppName:=ExtractFilename(Application.Exename);
//��ֹ����������ο�ʼ
 	MutexHandle := CreateMutex(nil, TRUE,pchar(v_AppName));
 	if MutexHandle <> 0 then
  begin
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      MessageBox(0,pchar('��ʾ:'+v_AppName+'�����Ѿ�������,�벻Ҫ�ظ�����!'),'[ǳŵ�������v1.0]��ʾ...', mb_IconHand);

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
//��ֹ����������ν���
  Application.Initialize;
  Application.Title := 'ǳŵ�����������v1.0';
  Application.CreateForm(TFormUse, FormUse);
  Application.Run;
end.
