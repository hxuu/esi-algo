unit treeUtil;
  
interface
  
uses
  Classes, SysUtils, StrUtils;

type
 TreeNode = ^Node;
 Node = record
   data: String;
   left, right: TreeNode;
 end;

function convertLineToTree(const line: String): TreeNode;
procedure convertLineToArr(const line: String; var arr: TStringArray);
procedure printTree(const head: TreeNode);
procedure printTreeInOrder(const root: TreeNode);
procedure freeTree(var head: TreeNode);


  
implementation


function convertLineToTree(const line: String): TreeNode;
var
  strArr: TStringArray;
  i: Integer;
  rootNode, currNode, parentNode: TreeNode;
begin
  strArr := SplitString(Line, ' ');
  Result := nil;
  currNode := nil;

  for i := Low(strArr) to High(strArr) do
  begin
    New(currNode);
    currNode^.data := strArr[i];
    currNode^.left := nil;
    currNode^.right := nil;

    if Result = nil then
      Result := currNode
    else
    begin
      parentNode := Result;
      while True do
      begin
        if currNode^.data < parentNode^.data then
        begin
          if parentNode^.left = nil then
          begin
            parentNode^.left := currNode;
            Break;
          end
          else
            parentNode := parentNode^.left;
        end
        else
        begin
          if parentNode^.right = nil then
          begin
            parentNode^.right := currNode;
            Break;
          end
          else
            parentNode := parentNode^.right;
        end;
      end;
    end;
  end;
end;

procedure convertLineToArr(const line: String; var arr: TStringArray);
begin
  arr := SplitString(Line, ' ');
end;

procedure printTreeInOrder(const root: TreeNode);
begin
  if root <> nil then
  begin
    printTreeInOrder(root^.left);
    Write(root^.data, ' ');
    printTreeInOrder(root^.right);
  end;
end;

procedure printTree(const head: TreeNode);
begin
  if head = nil then
    WriteLn('Tree is empty.')
  else
  begin
    Write('In-order traversal: ');
    printTreeInOrder(head);
    WriteLn;
  end;
end;

procedure freeTree(var head: TreeNode);
begin
  if head <> nil then
  begin
    freeTree(head^.left);
    freeTree(head^.right);
    Dispose(head);
    head := nil;
  end;
end;


end.