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
program test_cwRuntime;
uses
  cwTest,
  cwTest.Standard,
  test_cwVectors.sVector2,
  test_cwVectors.sVector3,
  test_cwVectors.sVector4,
  test_cwVectors.sMatrix2x2,
  test_cwVectors.sMatrix3x3,
  test_cwVectors.sMatrix4x4,
  test_cwVectors.sRay,
  test_cwVectors.dVector2,
  test_cwVectors.dVector3,
  test_cwVectors.dVector4,
  test_cwVectors.dMatrix2x2,
  test_cwVectors.dMatrix3x3,
  test_cwVectors.dMatrix4x4,
  test_cwVectors.dRay,
  test_cwVectors.eVector2,
  test_cwVectors.eVector3,
  test_cwVectors.eVector4,
  test_cwVectors.eMatrix2x2,
  test_cwVectors.eMatrix3x3,
  test_cwVectors.eMatrix4x4,
  test_cwVectors.eRay,
  test.cwUnicode.Codec.Standard,
  Test.cwUnicode.UnicodeString.Standard,
  test_cwTypes.ExtendedHelper,
  test_cwTypes.DoubleHelper,
  test_cwTypes.DateTimeHelper,
  test_cwTypes.CharHelper,
  test_cwTypes.BooleanHelper,
  test_cwTypes.Uint64Helper,
  test_cwTypes.Uint32Helper,
  test_cwTypes.Uint16Helper,
  test_cwTypes.Uint8Helper,
  test_cwTypes.StringHelper,
  test_cwTypes.SingleHelper,
  test_cwTypes.PointerHelper,
  test_cwTypes.NativeUintHelper,
  test_cwTypes.Int64Helper,
  test_cwTypes.Int32Helper,
  test_cwTypes.Int16Helper,
  test_cwTypes.Int8Helper,
  test_cwLog.inserts.static,
  test_cwCollections.RingBuffer,
  test_cwCollections.Stack,
  test_cwCollections.Dictionary,
  test_cwCollections.List
;

var
  R: nativeuint;

begin
  R := TestSuite.Run( 'cwRuntime', [TConsoleReport.Create] );
  if ParamStr(1)='ide' then begin
    Readln;
  end;
  System.ExitCode := R;
end.
