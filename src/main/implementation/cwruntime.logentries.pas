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
unit cwRuntime.LogEntries;
{$ifdef fpc} {$mode delphiunicode} {$endif}

interface

resourcestring
  le_IndexOutOfBounds                 = '{CA1B1695-17C4-49A9-8460-908ED702F5AA} Index out of bounds "(%index%)".';
  le_StreamDoesNotSupportClear        = '{1FFC5715-B4A1-4E0A-8DB6-D3F6969AE372} Stream does not support the Clear() method.';
  le_CannotEncodeUnknownUnicodeFormat = '{751F423E-FE14-4E9E-8708-D4560CCE39BF} Cannot encode to unicode format utfUnknown.';
  le_FailedThreadTerminate            = '{9798567B-E753-47EE-A51D-EB3A0A01E11B} Thread (%index%) failed to terminate gracefully.';
  le_OSAPIError                       = '{0155B3C1-F5AA-47A4-8C33-A606F57A9DC3} An Operating System error occurred on (%call%) value (%value%).';
  le_DuplicateMessageChannel          = '{C038923C-B2D4-400C-977C-C890C1A1D873} Message channel name must be unique. (%channel%) is already in use.';
  le_ThreadAlreadyStarted             = '{A2BD6971-AEB3-4696-A149-B04FA8BD1005} Thread is already started.';
  le_FileNotFound                     = '{0A32412A-196B-40B2-8880-5D73DE46E3F1} File not found "(%filename%)"';
  le_ModuleNotLoaded                  = '{F6881310-4F2E-4D5B-8A4B-8318EDF8D4AD} DynLib failed to load module "(%module%)"';
  le_FailedToLoadEntryPoint           = '{B425D9C3-262A-425B-85BB-149E79A4C9CC} Failed to locate entrypoint "(%entrypoint%)" in library "(%library%)"';
  le_NoHighPrecisionTimer             = '{6EB4740F-C483-47CE-A78C-7CD2CC4D97EC} Unable to access high-precision timer device.';

implementation
{$ifndef fpc}
uses
  cwLog.Standard
;
{$endif}

initialization
  {$ifndef fpc}
  Log.RegisterLogEntry(le_IndexOutOfBounds);
  Log.RegisterLogEntry(le_StreamDoesNotSupportClear);
  Log.RegisterLogEntry(le_CannotEncodeUnknownUnicodeFormat);
  Log.RegisterLogEntry(le_FailedThreadTerminate);
  Log.RegisterLogEntry(le_OSAPIError);
  Log.RegisterLogEntry(le_DuplicateMessageChannel);
  Log.RegisterLogEntry(le_ThreadAlreadyStarted);
  Log.RegisterLogEntry(le_NoHighPrecisionTimer);
  {$endif}

finalization

end.

