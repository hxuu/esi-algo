unit stackUtil;
  
interface
  
uses
  Classes, SysUtils, StrUtils;

type
 StackNode = ^Node;
 Node = record
   data: String;
   next: StackNode;
 end;

function convertLineToStack(const line: String): StackNode;
procedure convertLineToArr(const line: String; var arr: TStringArray);
procedure printStack(const head: StackNode);
procedure freeStack(var head: StackNode);
function isEmpty(const head: StackNode): Boolean;
procedure push(var head: StackNode; const value: String);
function pop(var head: StackNode): String;
function size(const head: StackNode): Integer;


  
implementation


function convertLineToStack(const line: String): StackNode;
var
  strArr: TStringArray;
  i: Integer;
  newNode, currNode, Result: StackNode;
begin
  strArr := SplitString(Line, ' ');
  Result := nil;
  currNode := nil;

  for i := Low(strArr) to High(strArr) do
  begin
    New(newNode);
    newNode^.data := strArr[i];
    newNode^.next := nil;

    if Result = nil then
      Result := newNode
    else
      currNode^.next := newNode;

    currNode := newNode;
  end;

  convertLineToStack := Result;
end;

procedure convertLineToArr(const line: String; var arr: TStringArray);
begin
  arr := SplitString(Line, ' ');
end;

procedure printStack(const head: StackNode);
var
  currNode: StackNode;
begin
  currNode := head;
  while currNode <> nil do
  begin
    Write(currNode^.data, ' ');
    currNode := currNode^.next;
  end;
  WriteLn;
end;

procedure freeStack(var head: StackNode);
var
  tempNode: StackNode;
begin
  while head <> nil do
  begin
    tempNode := head;
    head := head^.next;
    Dispose(tempNode);
  end;
end;

procedure push(var head: StackNode; const value: String);
var
  newNode: StackNode;
begin
  New(newNode);
  newNode^.data := value;
  newNode^.next := head;
  head := newNode;
end;

function pop(var head: StackNode): String;
var
  tempNode: StackNode;
  Result: String;
begin
  Result := '';
  if head = nil then
    Exit;

  Result := head^.data;
  tempNode := head;
  head := head^.next;
  Dispose(tempNode);

  pop := Result;
end;

function top(const head: StackNode): String;
var
  Result: String;
begin
  Result := '';
  if head <> nil then
    Result := head^.data;
end;

function isEmpty(const head: StackNode): Boolean;
begin
  isEmpty := head = nil;
end;

function size(const head: StackNode): Integer;
var
  currNode: StackNode;
  Result: Integer;
begin
  Result := 0;
  currNode := head;
  while currNode <> nil do
  begin
    Inc(Result);
    currNode := currNode^.next;
  end;
  size := Result;
end;

end.