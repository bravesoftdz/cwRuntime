{$ifdef license}
(*
  Copyright 2020 ChapmanWorld LLC ( https://chapmanworld.com )

  Redistribution and use in source and binary forms, with or without modification,
  are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice,
     this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation and/or
     other materials provided with the distribution.

  3. Neither the name of the copyright holder nor the names of its contributors may be
     used to endorse or promote products derived from this software without specific prior
     written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
  IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)
{$endif}
unit testcase.cwThreading.Internal.TaskSetCollection;
{$ifdef fpc} {$mode delphiunicode} {$endif}
{$M+}

interface
uses
  cwTest
, cwTest.Standard
;

type
  TTestTaskSetCollection = class(TTestCase)
  published
    procedure TestNextTaskRecord;
  end;

implementation
uses
  cwThreading
, cwThreading.Internal
, cwThreading.Internal.TaskSet.Standard
, cwThreading.Internal.TaskSetCollection.Standard
;

{$region ' A dummy task for testing'}
type
  (* A dummy task which sets the boolean,
     pointed to by PtrBoolean in the constructor, to TRUE *)
  pNativeuint = ^Nativeuint;
  TTestTask = class( TInterfacedObject, ITask )
  private
    fPtrNativeuint: pNativeuint;
  strict private //- ITask -//
    procedure Execute;
  public
    constructor Create( const PtrNativeuint: pNativeuint ); reintroduce;
  end;

procedure TTestTask.Execute;
begin
  inc(fPtrNativeuint^);
end;

constructor TTestTask.Create(const PtrNativeuint: pNativeuint);
begin
  inherited Create;
  fPtrNativeuint := PtrNativeuint;
end;

{$endregion}

procedure TTestTaskSetCollection.TestNextTaskRecord;
const
  cTestTasks = 50;
  cTaskSets = 20;
var
  idx: nativeuint;
  FetchedTaskRecord: ITaskRecord;
  TaskArray: array[0..cTestTasks] of ITask;
  RetrievedCount: nativeuint;
  TaskSetCollection: ITaskSetCollection;
begin
  // Arrange:
  RetrievedCount := 0;
  for idx := 0 to pred(cTestTasks) do begin
    TaskArray[idx] := TTestTask.Create( @RetrievedCount );
  end;
  TaskSetCollection := TTaskSetCollection.Create;
  for idx := 0 to pred(cTaskSets) do begin
    TaskSetCollection.AddTaskSet( TTaskset.Create(TaskArray) );
  end;
  // Act:
  repeat
    FetchedTaskRecord := TaskSetCollection.getNextTask;
    if assigned(FetchedTaskRecord) then begin
      FetchedTaskRecord.Execute;
    end;
  until (FetchedTaskRecord=nil);
  // Asert:
  TTest.IsFalse(assigned(FetchedTaskRecord),'Last task retrieved should be nil');
  TTest.Expect(nativeuint(cTestTasks*cTaskSets),RetrievedCount);
end;

initialization
  TestSuite.RegisterTestCase(TTestTaskSetCollection);

end.

