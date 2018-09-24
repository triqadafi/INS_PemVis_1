unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    MemoA: TMemo;
    MemoB: TMemo;
    ButtonOpen: TButton;
    ButtonProcess: TButton;
    ButtonSave: TButton;
    OpenDialogMain: TOpenDialog;
    SaveDialogMain: TSaveDialog;
    Image1: TImage;
    procedure ButtonProcessClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function leadingZero(n: Integer) : String;
var return: string;
begin
  if n < 10 then
    return := '00'
  else if n < 100 then
    return := '0';
  result := return + inttostr(n);
end;


procedure TForm1.ButtonProcessClick(Sender: TObject);
var
  i: Integer;
  line: string;
begin
  MemoB.Lines.Clear;
  for i := 0 to MemoA.Lines.Count-1 do
  begin
    line := MemoA.Lines[i];
    MemoB.Lines.Add(leadingZero(i+1) + ': ' + line);
  end;
end;

procedure TForm1.ButtonOpenClick(Sender: TObject);
begin
  if OpenDialogMain.Execute then
  begin
    MemoA.Lines.LoadFromFile(OpenDialogMain.FileName);
  end
end;

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin  
  if SaveDialogMain.Execute then
  begin
    MemoB.Lines.SaveToFile(SaveDialogMain.FileName);
    ShowMessage('File berhasil disimpan');
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MemoA.Lines.Clear;
  MemoB.Lines.Clear;
  MemoA.Lines.Add('Buka file terlebih dahulu');
end;

end.
