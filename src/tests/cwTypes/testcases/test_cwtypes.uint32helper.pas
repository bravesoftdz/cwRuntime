{$ifdef license}
(*
  Copyright 2020 ChapmanWorld LLC ( https://chapmanworld.com )
  All Rights Reserved.
*)
{$endif}
unit test_cwTypes.Uint32Helper;
{$ifdef fpc} {$mode delphiunicode} {$endif}
{$M+}

interface
uses
  cwTest
, cwTest.Standard
, cwTypes
;

type
  TTestUint32Helper = class(TTestCase)
  private
  published
    procedure AsString;
    procedure AsHex;
  end;

implementation

procedure TTestUint32Helper.AsHex;
var
  I: uint32;
  S: string;
begin
  // Arrange:
  I := 12;
  // Act:
  S := I.AsHex(2);
  // Assert:
  TTest.Expect('0C',S);
end;

procedure TTestUint32Helper.AsString;
var
  I: uint32;
  S: string;
begin
  // Arrange:
  I := 12;
  // Act:
  S := I.AsString;
  // Assert:
  TTest.Expect('12',S);
end;

initialization
  TestSuite.RegisterTestCase(TTestUint32Helper);

end.
