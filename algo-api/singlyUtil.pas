unit singlyUtil;
  
interface
  
uses
  Classes, SysUtils, StrUtils;

type
 ListNode = ^Node;
 Node = record
   data: String;
   next: ListNode;
 end;

function convertLineToLL(const line: String): ListNode;
procedure convertLineToArr(const line: String; var arr: TStringArray);
procedure printLinkedList(const head: ListNode);
procedure freeLinkedList(var head: ListNode);

  
implementation


function convertLineToLL(const line: String): ListNode;
var
  parts: TStringArray;
  i: Integer;
  head, currentNode, newNode: ListNode;
begin
  parts := SplitString(Line, ' ');
  head := nil;
  currentNode := nil;

  for i := Low(parts) to High(parts) do
    begin
      New(newNode);
      newNode^.Data := parts[i];
      newNode^.Next := nil;

      if head = nil then
        head := newNode
      else
        currentNode^.Next := newNode;

      currentNode := newNode;
    end;

  convertLineToLL := head;
end;


procedure convertLineToArr(const line: String; var arr: TStringArray);
var
  parts: TStringArray;
  i: Integer;
begin
  parts := SplitString(Line, ' ');
  SetLength(arr, Length(parts));
  for i := Low(parts) to High(parts) do
    arr[i] := parts[i];
end;

procedure printLinkedList(const head: ListNode);
var
  currentNode: ListNode;
begin
  currentNode := Head;
  while currentNode <> nil do
    begin
      Write(currentNode^.Data, ' ');
      currentNode := currentNode^.Next;
    end;
end;


procedure freeLinkedList(var head: ListNode);
var
  currentNode, nextNode: ListNode;
begin
  currentNode := head;
  while currentNode <> nil do
  begin
    nextNode := currentNode^.Next;
    Dispose(currentNode);
    currentNode := nextNode;
  end;
  head := nil;
end;
  
  
end.