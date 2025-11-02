unit doublyUtil;
  
interface
  
uses
  Classes, SysUtils, StrUtils;

type
 ListNode = ^Node;
 Node = record
   data: String;
   prev, next: ListNode;
 end;

function convertLineToDLL(const line: String; var tail: ListNode): ListNode;
procedure convertLineToArr(const line: String; var arr: TStringArray);
procedure printLinkedList(const head: ListNode);
procedure freeLinkedList(var head: ListNode);

  
implementation

function convertLineToDLL(const line: string; var tail: ListNode): ListNode;
var
  Head, CurrentNode, NewNode: ListNode;
  i: Integer;
  parts: TStringArray;
begin
  parts := SplitString(Line, ' ');
  head := nil;
  currentNode := nil;

  for i := Low(parts) to High(parts) do
    begin
      New(newNode);
      newNode^.Data := parts[i];
      newNode^.next := nil;

      if head = nil then
        head := newNode
      else
        currentNode^.next := newNode;

      currentNode := newNode;
      tail := newNode;
    end;

  convertLineToDLL := head;
end;

procedure freeLinkedList(var head: ListNode);
var
  currentNode, nextNode: ListNode;
begin
  currentNode := head;
  while currentNode <> nil do
  begin
    nextNode := currentNode^.next;
    Dispose(currentNode);
    currentNode := nextNode;
  end;
  head := nil;
end;
  

procedure printLinkedList(const head: ListNode);
var
  currentNode: ListNode;
begin
  currentNode := Head;
  while currentNode <> nil do
    begin
      Write(currentNode^.Data, ' ');
      currentNode := currentNode^.next;
    end;
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

end.