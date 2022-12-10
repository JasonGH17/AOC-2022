program app;
{$mode objfpc}

uses classes, sysutils, strutils;

const FNAME = 'input.txt';

type 
    AAStr = array of array of String;
    TStringDynArray = array of AnsiString;
    TArrInt = array of Integer;
    TArrStr = array of String;

var 
    data: TStringList;
    cmd: String;
    cmdSplit: TStringDynArray;
    cmdIndex: Integer;
    cmdParams: array of Integer = ();
    i, j: Integer;
    tmpStr: String;
    tmp: array of String = ();
    cratesp1: AAStr = (('N','V','C','S'), ('S','N','H','J','M','Z'), ('D','N','J','G','T','C','M'), ('M','R','W','J','F','D','T'), ('H','F','P'), ('J','H','Z','T','C'), ('Z','L','S','F','Q','R','P','D'), ('W','P','F','D','H','L','S','C'), ('Z','G','N','F','P','M','S','D'));
    cratesp2: AAStr = (('N','V','C','S'), ('S','N','H','J','M','Z'), ('D','N','J','G','T','C','M'), ('M','R','W','J','F','D','T'), ('H','F','P'), ('J','H','Z','T','C'), ('Z','L','S','F','Q','R','P','D'), ('W','P','F','D','H','L','S','C'), ('Z','G','N','F','P','M','S','D'));

    (* Idk how to use pascal so no stack parser *)

procedure pushI(var arr: TArrInt; x: Integer);
begin
    SetLength(arr, Length(arr) + 1);
    arr[High(arr)] := x;
end;

procedure pushS(var arr: TArrStr; str: String);
begin
    SetLength(arr, Length(arr) + 1);
    arr[High(arr)] := str;
end;

function popS(var arr: TArrStr): String;
begin
    if not(Length(arr) = 0) then
    begin
        result := arr[High(arr)];
        SetLength(arr, High(arr));
    end;
end;

begin
    if(FileExists(FNAME)) then
    begin
        data := TStringList.Create;
        try
            data.LoadFromFile(FName);

            for j := 0 to (Length(cratesp1)) do
                for i := 0 to (Length(cratesp1[j]) div 2)-1 do
                begin
                    tmpStr := cratesp1[j, i];
                    cratesp1[j, i] := cratesp1[j, Length(cratesp1[j])-i-1];
                    cratesp1[j, Length(cratesp1[j])-i-1] := tmpStr;
                end;
            for j := 0 to (Length(cratesp2)) do
                for i := 0 to (Length(cratesp2[j]) div 2)-1 do
                begin
                    tmpStr := cratesp2[j, i];
                    cratesp2[j, i] := cratesp2[j, Length(cratesp2[j])-i-1];
                    cratesp2[j, Length(cratesp2[j])-i-1] := tmpStr;
                end;

            (* Part 1 *)
            for cmd in data do
            begin
                cmdSplit := SplitString(cmd, ' ');
                SetLength(cmdParams, 0);
                for cmdIndex := 0 to Length(cmdSplit) do
                begin
                    if not(cmdIndex mod 2 = 0) then
                    begin
                        pushI(cmdParams, StrToInt(cmdSplit[cmdIndex]));
                    end;
                end;

                for i := 1 to cmdParams[0] do
                begin
                    pushS(cratesp1[cmdParams[2] - 1], popS(cratesp1[cmdParams[1] - 1]));
                    pushS(tmp, popS(cratesp2[cmdParams[1] - 1]))
                end;
                
                for i := 0 to Length(tmp) - 1 do
                    pushS(cratesp2[cmdParams[2] - 1], popS(tmp));
            end;

            WriteLn('Part 1:');
            for i := 0 to Length(cratesp1)-1 do
                Write(popS(cratesp1[i]));
            WriteLn();
            WriteLn('Part 2:');
            for i := 0 to Length(cratesp2)-1 do
                Write(popS(cratesp2[i]));
            WriteLn();

            (* Part 2 *)

        finally
        end;
    end else writeln('File input.txt not found...');
end.
