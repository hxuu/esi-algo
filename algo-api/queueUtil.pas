unit queueUtil;
  
interface
  
uses
  Classes, SysUtils, StrUtils;

type
 QueueNode = ^Node;
 Node = record
   data: String;
   next: QueueNode;
 end;

function convertLineToQueue(const line: String): QueueNode;
procedure convertLineToArr(const line: String; var arr: TStringArray);
procedure printQueue(const head: QueueNode);
procedure freeQueue(var head: QueueNode);
function isEmpty(const head: QueueNode): Boolean;
procedure enqueue(var head: QueueNode; const value: String);
function dequeue(var head: QueueNode): String;
function size(const head: QueueNode): Integer;


  
implementation


function convertLineToQueue(const line: String): QueueNode;
var
  strArr: TStringArray;
  i: Integer;
  newNode, currNode, prevNode: QueueNode;
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
      prevNode^.next := newNode;

    prevNode := newNode;
    if i = Low(strArr) then
      currNode := newNode;
  end;

  if currNode <> nil then
    currNode^.next := Result;
end;

procedure convertLineToArr(const line: String; var arr: TStringArray);
begin
  arr := SplitString(Line, ' ');
end;

procedure printQueue(const head: QueueNode);
var
  currNode: QueueNode;
begin
  if head = nil then
  begin
    WriteLn('Queue is empty.');
    Exit;
  end;

  currNode := head;
  repeat
    Write(currNode^.data, ' ');
    currNode := currNode^.next;
  until currNode = head;
  WriteLn;
end;

procedure freeQueue(var head: QueueNode);
var
  tempNode, nextNode: QueueNode;
begin
  if head = nil then
    Exit;

  tempNode := head;
  repeat
    nextNode := tempNode^.next;
    Dispose(tempNode);
    tempNode := nextNode;
  until tempNode = head;

  head := nil;
end;

function isEmpty(const head: QueueNode): Boolean;
begin
  Result := head = nil;
end;

procedure enqueue(var head: QueueNode; const value: String);
var
  newNode, lastNode: QueueNode;
begin
  New(newNode);
  newNode^.data := value;
  if head = nil then
  begin
    head := newNode;
    head^.next := head;
  end
  else
  begin
    lastNode := head;
    while lastNode^.next <> head do
      lastNode := lastNode^.next;
    lastNode^.next := newNode;
    newNode^.next := head;
  end;
end;

function dequeue(var head: QueueNode): String;
var
  tempNode: QueueNode;
begin
  Result := '';
  if head = nil then
    Exit;

  Result := head^.data;
  tempNode := head;
  while tempNode^.next <> head do
    tempNode := tempNode^.next;

  if head = head^.next then
    head := nil
  else
  begin
    tempNode^.next := head^.next;
    head := head^.next;
  end;

  Dispose(tempNode);
end;

function size(const head: QueueNode): Integer;
var
  currNode: QueueNode;
begin
  Result := 0;
  if head = nil then
    Exit;

  currNode := head;
  repeat
    Inc(Result);
    currNode := currNode^.next;
  until currNode = head;
end;

end.
