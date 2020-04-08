﻿{$ifdef license}
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
///  <summary>
///    Library for handling vector/matrix operations in cpu.
///  </summary>
unit cwVectors;
{$ifdef fpc}
  {$mode delphiunicode}
  {$modeswitch arrayoperators-}
  {.$coperators on}
  {.$modeswitch advancedrecords+}
{$endif}

interface
uses
  cwTypes
;

type

{$region ' hVector2'}

  ///  <summary>
  ///    Represents a vector with 2 elements (X,Y / U,V)
  ///  </summary>
  hVector2 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of half ): hVector2;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of half ): hVector2;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: hVector2; const b: array of half ): hVector2; overload;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of half; const b: hVector2 ): hVector2; overload;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: hVector2; const b: array of half ): hVector2;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of half; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: hVector2; const b: array of half ): hVector2;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of half; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: hVector2; const b: array of half ): hVector2;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of half; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: hVector2; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Operator overload provides for addition of a half to a vector.
    ///  </summary>
    class operator Add( const a: hVector2; const b: half ): hVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: hVector2; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract(const a: hVector2; const b: half ): hVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: hVector2; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: hVector2; const b: half ): hVector2;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: hVector2; const b: hVector2 ): hVector2;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: hVector2; const b: half ): hVector2;

    ///  <summary>
    ///    Creates a new vector based on X,Y values.
    ///  </summary>
    class function Create( const X: half; const Y: half ): hVector2; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: hVector2 ): half;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: hVector2;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: hVector2;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: half;

    case uint8 of
      0: (
        X: half;
        Y: half;
      );
      1: (
        U: half;
        V: half;
      );
      2: (
        S: half;
        T: half;
      );
  end;
{$endregion}

{$region ' sVector2'}

  ///  <summary>
  ///    Represents a vector with 2 elements (X,Y / U,V)
  ///  </summary>
  sVector2 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of single ): sVector2;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of single ): sVector2;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: sVector2; const b: array of single ): sVector2; overload;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of single; const b: sVector2 ): sVector2; overload;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: sVector2; const b: array of single ): sVector2;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of single; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: sVector2; const b: array of single ): sVector2;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of single; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: sVector2; const b: array of single ): sVector2;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of single; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: sVector2; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Operator overload provides for addition of a single to a vector.
    ///  </summary>
    class operator Add( const a: sVector2; const b: single ): sVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: sVector2; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract(const a: sVector2; const b: single ): sVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: sVector2; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: sVector2; const b: single ): sVector2;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: sVector2; const b: sVector2 ): sVector2;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: sVector2; const b: single ): sVector2;

    ///  <summary>
    ///    Creates a new vector based on X,Y values.
    ///  </summary>
    class function Create( const X: single; const Y: single ): sVector2; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: sVector2 ): single;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: sVector2;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: sVector2;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: single;

    case uint8 of
      0: (
        X: single;
        Y: single;
      );
      1: (
        U: single;
        V: single;
      );
      2: (
        S: single;
        T: single;
      );
  end;
{$endregion}

{$region ' dVector2'}

  ///  <summary>
  ///    Represents a vector with 2 elements (X,Y / U,V)
  ///  </summary>
  dVector2 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of double ): dVector2;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of double ): dVector2;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: dVector2; const b: array of double ): dVector2; overload;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of double; const b: dVector2 ): dVector2; overload;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: dVector2; const b: array of double ): dVector2;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of double; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: dVector2; const b: array of double ): dVector2;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of double; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: dVector2; const b: array of double ): dVector2;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of double; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: dVector2; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Operator overload provides for addition of a double to a vector.
    ///  </summary>
    class operator Add( const a: dVector2; const b: double ): dVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: dVector2; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract(const a: dVector2; const b: double ): dVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: dVector2; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: dVector2; const b: double ): dVector2;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: dVector2; const b: dVector2 ): dVector2;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: dVector2; const b: double ): dVector2;

    ///  <summary>
    ///    Creates a new vector based on X,Y values.
    ///  </summary>
    class function Create( const X: double; const Y: double ): dVector2; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: dVector2 ): double;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: dVector2;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: dVector2;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: double;

    case uint8 of
      0: (
        X: double;
        Y: double;
      );
      1: (
        U: double;
        V: double;
      );
      2: (
        S: double;
        T: double;
      );
  end;
{$endregion}

{$region ' eVector2'}

  ///  <summary>
  ///    Represents a vector with 2 elements (X,Y / U,V)
  ///  </summary>
  eVector2 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of extended ): eVector2;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of extended ): eVector2;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: eVector2; const b: array of extended ): eVector2; overload;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of extended; const b: eVector2 ): eVector2; overload;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: eVector2; const b: array of extended ): eVector2;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of extended; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: eVector2; const b: array of extended ): eVector2;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of extended; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: eVector2; const b: array of extended ): eVector2;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of extended; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: eVector2; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Operator overload provides for addition of a extended to a vector.
    ///  </summary>
    class operator Add( const a: eVector2; const b: extended ): eVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: eVector2; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract(const a: eVector2; const b: extended ): eVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: eVector2; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: eVector2; const b: extended ): eVector2;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: eVector2; const b: eVector2 ): eVector2;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: eVector2; const b: extended ): eVector2;

    ///  <summary>
    ///    Creates a new vector based on X,Y values.
    ///  </summary>
    class function Create( const X: extended; const Y: extended ): eVector2; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: eVector2 ): extended;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: eVector2;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: eVector2;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: extended;

    case uint8 of
      0: (
        X: extended;
        Y: extended;
      );
      1: (
        U: extended;
        V: extended;
      );
      2: (
        S: extended;
        T: extended;
      );
  end;
{$endregion}

{$region ' hVector3'}

  ///  <summary>
  ///    Represents a vector with 3 elements (X,Y,Z), (R,G,B).
  ///  </summary>
  hVector3 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of half ): hVector3;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of half ): hVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: hVector3; const b: array of half ): hVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of half; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: hVector3; const b: array of half ): hVector3;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of half; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: hVector3; const b: array of half ): hVector3;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of half; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: hVector3; const b: array of half ): hVector3;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of half; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: hVector3; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: hVector3; const b: half ): hVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: hVector3; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: hVector3; const b: half ): hVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: hVector3; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: hVector3; const b: half ): hVector3;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: hVector3; const b: hVector3 ): hVector3;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: hVector3; const b: half ): hVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Implicit( const a: hVector2 ): hVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Explicit( const a: hVector2 ): hVector3;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Implicit( const a: hVector3 ): hVector2;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Explicit( const a: hVector3 ): hVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z values.
    ///  </summary>
    class function Create( const X: half; const Y: half; const Z: half ): hVector3; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: hVector3 ): half;

    ///  <summary>
    ///    Returns the cross product of this vector with another.
    ///  </summary>
    function cross( const a: hVector3 ): hVector3;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: hVector3;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: hVector3;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: half;

      case uint8 of
      0: (
          X: half;
          Y: half;
          Z: half;
      );
      1: (
          R: half;
          G: half;
          B: half;
      );
  end;

  ///  <summary>
  ///    An alias of Vector3 which represents a point in 3d space.
  ///  </summary>
  hVertex = hVector3;
{$endregion}

{$region ' sVector3'}

  ///  <summary>
  ///    Represents a vector with 3 elements (X,Y,Z), (R,G,B).
  ///  </summary>
  sVector3 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of single ): sVector3;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of single ): sVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: sVector3; const b: array of single ): sVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of single; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: sVector3; const b: array of single ): sVector3;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of single; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: sVector3; const b: array of single ): sVector3;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of single; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: sVector3; const b: array of single ): sVector3;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of single; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: sVector3; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: sVector3; const b: single ): sVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: sVector3; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: sVector3; const b: single ): sVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: sVector3; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: sVector3; const b: single ): sVector3;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: sVector3; const b: sVector3 ): sVector3;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: sVector3; const b: single ): sVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Implicit( const a: sVector2 ): sVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Explicit( const a: sVector2 ): sVector3;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Implicit( const a: sVector3 ): sVector2;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Explicit( const a: sVector3 ): sVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z values.
    ///  </summary>
    class function Create( const X: single; const Y: single; const Z: single ): sVector3; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: sVector3 ): single;

    ///  <summary>
    ///    Returns the cross product of this vector with another.
    ///  </summary>
    function cross( const a: sVector3 ): sVector3;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: sVector3;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: sVector3;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: single;

      case uint8 of
      0: (
          X: single;
          Y: single;
          Z: single;
      );
      1: (
          R: single;
          G: single;
          B: single;
      );
  end;

  ///  <summary>
  ///    An alias of Vector3 which represents a point in 3d space.
  ///  </summary>
  sVertex = sVector3;
{$endregion}

{$region ' dVector3'}

  ///  <summary>
  ///    Represents a vector with 3 elements (X,Y,Z), (R,G,B).
  ///  </summary>
  dVector3 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of double ): dVector3;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of double ): dVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: dVector3; const b: array of double ): dVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of double; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: dVector3; const b: array of double ): dVector3;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of double; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: dVector3; const b: array of double ): dVector3;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of double; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: dVector3; const b: array of double ): dVector3;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of double; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: dVector3; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: dVector3; const b: double ): dVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: dVector3; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: dVector3; const b: double ): dVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: dVector3; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: dVector3; const b: double ): dVector3;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: dVector3; const b: dVector3 ): dVector3;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: dVector3; const b: double ): dVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Implicit( const a: dVector2 ): dVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Explicit( const a: dVector2 ): dVector3;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Implicit( const a: dVector3 ): dVector2;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Explicit( const a: dVector3 ): dVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z values.
    ///  </summary>
    class function Create( const X: double; const Y: double; const Z: double ): dVector3; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: dVector3 ): double;

    ///  <summary>
    ///    Returns the cross product of this vector with another.
    ///  </summary>
    function cross( const a: dVector3 ): dVector3;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: dVector3;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: dVector3;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: double;

      case uint8 of
      0: (
          X: double;
          Y: double;
          Z: double;
      );
      1: (
          R: double;
          G: double;
          B: double;
      );
  end;

  ///  <summary>
  ///    An alias of Vector3 which represents a point in 3d space.
  ///  </summary>
  dVertex = dVector3;
{$endregion}

{$region ' eVector3'}

  ///  <summary>
  ///    Represents a vector with 3 elements (X,Y,Z), (R,G,B).
  ///  </summary>
  eVector3 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of extended ): eVector3;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of extended ): eVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: eVector3; const b: array of extended ): eVector3;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of extended; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: eVector3; const b: array of extended ): eVector3;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of extended; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: eVector3; const b: array of extended ): eVector3;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of extended; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: eVector3; const b: array of extended ): eVector3;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of extended; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: eVector3; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: eVector3; const b: extended ): eVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: eVector3; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: eVector3; const b: extended ): eVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: eVector3; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: eVector3; const b: extended ): eVector3;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: eVector3; const b: eVector3 ): eVector3;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: eVector3; const b: extended ): eVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Implicit( const a: eVector2 ): eVector3;

    ///  <summary>
    ///    Allows assignment of a Vector2 to the Vector3, dropping the Z
    ///    element.
    ///  </summary>
    class operator Explicit( const a: eVector2 ): eVector3;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Implicit( const a: eVector3 ): eVector2;

    ///  <summary>
    ///    Allows assignment of a Vector3 to the Vector2, setting the Z
    ///    element to 0;
    ///  </summary>
    class operator Explicit( const a: eVector3 ): eVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z values.
    ///  </summary>
    class function Create( const X: extended; const Y: extended; const Z: extended ): eVector3; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: eVector3 ): extended;

    ///  <summary>
    ///    Returns the cross product of this vector with another.
    ///  </summary>
    function cross( const a: eVector3 ): eVector3;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: eVector3;

    ///  <summary>
    ///    Returns the unit vector of this one.
    ///  </summary>
    function UnitVector: eVector3;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: extended;

      case uint8 of
      0: (
          X: extended;
          Y: extended;
          Z: extended;
      );
      1: (
          R: extended;
          G: extended;
          B: extended;
      );
  end;

  ///  <summary>
  ///    An alias of Vector3 which represents a point in 3d space.
  ///  </summary>
  eVertex = eVector3;
{$endregion}

{$region ' hVector4'}
  ///  <summary>
  ///    Represents a vector with four elements.
  ///   (X,Y,Z,W or R,G,B,A or U1,V1,U2,V2)
  ///  </summary>
  hVector4 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of half ): hVector4;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of half ): hVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: hVector4; const b: array of half ): hVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of half; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: hVector4; const b: array of half ): hVector4;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of half; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: hVector4; const b: array of half ): hVector4;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of half; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: hVector4; const b: array of half ): hVector4;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of half; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: hVector4; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: hVector4; const b: half ): hVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: hVector4; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: hVector4; const b: half ): hVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: hVector4; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: hVector4; const b: half ): hVector4;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: hVector4; const b: hVector4 ): hVector4;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: hVector4; const b: half ): hVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Implicit( const a: hVector3 ): hVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Explicit( const a: hVector3 ): hVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Implicit( const a: hVector2 ): hVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Explicit( const a: hVector2 ): hVector4;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Implicit( const a: hVector4 ): hVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Explicit( const a: hVector4 ): hVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Implicit( const a: hVector4 ): hVector2;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Explicit( const a: hVector4 ): hVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z,W values.
    ///  </summary>
    class function Create( const X: half; const Y: half; const Z: half; const W: half ): hVector4; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: hVector4 ): half;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: hVector4;

    ///  <summary>
    ///    Returns the unit vector of this vector.
    ///  </summary>
    function UnitVector: hVector4;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: half;

      case uint8 of
      0: (
          X: half;
          Y: half;
          Z: half;
          W: half;
      );
      1: (
          R: half;
          G: half;
          B: half;
          A: half;
      );
      2: (
          U1: half;
          V1: half;
          U2: half;
          V2: half;
      );
  end;

{$endregion}

{$region ' sVector4'}
  ///  <summary>
  ///    Represents a vector with four elements.
  ///   (X,Y,Z,W or R,G,B,A or U1,V1,U2,V2)
  ///  </summary>
  sVector4 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of single ): sVector4;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of single ): sVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: sVector4; const b: array of single ): sVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of single; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: sVector4; const b: array of single ): sVector4;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of single; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: sVector4; const b: array of single ): sVector4;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of single; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: sVector4; const b: array of single ): sVector4;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of single; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: sVector4; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: sVector4; const b: single ): sVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: sVector4; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: sVector4; const b: single ): sVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: sVector4; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: sVector4; const b: single ): sVector4;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: sVector4; const b: sVector4 ): sVector4;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: sVector4; const b: single ): sVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Implicit( const a: sVector3 ): sVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Explicit( const a: sVector3 ): sVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Implicit( const a: sVector2 ): sVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Explicit( const a: sVector2 ): sVector4;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Implicit( const a: sVector4 ): sVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Explicit( const a: sVector4 ): sVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Implicit( const a: sVector4 ): sVector2;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Explicit( const a: sVector4 ): sVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z,W values.
    ///  </summary>
    class function Create( const X: single; const Y: single; const Z: single; const W: single ): sVector4; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: sVector4 ): single;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: sVector4;

    ///  <summary>
    ///    Returns the unit vector of this vector.
    ///  </summary>
    function UnitVector: sVector4;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: single;

      case uint8 of
      0: (
          X: single;
          Y: single;
          Z: single;
          W: single;
      );
      1: (
          R: single;
          G: single;
          B: single;
          A: single;
      );
      2: (
          U1: single;
          V1: single;
          U2: single;
          V2: single;
      );
  end;

{$endregion}

{$region ' dVector4'}
  ///  <summary>
  ///    Represents a vector with four elements.
  ///   (X,Y,Z,W or R,G,B,A or U1,V1,U2,V2)
  ///  </summary>
  dVector4 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of double ): dVector4;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of double ): dVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: dVector4; const b: array of double ): dVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of double; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: dVector4; const b: array of double ): dVector4;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of double; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: dVector4; const b: array of double ): dVector4;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of double; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: dVector4; const b: array of double ): dVector4;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of double; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: dVector4; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: dVector4; const b: double ): dVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: dVector4; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: dVector4; const b: double ): dVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: dVector4; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: dVector4; const b: double ): dVector4;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: dVector4; const b: dVector4 ): dVector4;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: dVector4; const b: double ): dVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Implicit( const a: dVector3 ): dVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Explicit( const a: dVector3 ): dVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Implicit( const a: dVector2 ): dVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Explicit( const a: dVector2 ): dVector4;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Implicit( const a: dVector4 ): dVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Explicit( const a: dVector4 ): dVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Implicit( const a: dVector4 ): dVector2;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Explicit( const a: dVector4 ): dVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z,W values.
    ///  </summary>
    class function Create( const X: double; const Y: double; const Z: double; const W: double ): dVector4; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: dVector4 ): double;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: dVector4;

    ///  <summary>
    ///    Returns the unit vector of this vector.
    ///  </summary>
    function UnitVector: dVector4;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: double;

      case uint8 of
      0: (
          X: double;
          Y: double;
          Z: double;
          W: double;
      );
      1: (
          R: double;
          G: double;
          B: double;
          A: double;
      );
      2: (
          U1: double;
          V1: double;
          U2: double;
          V2: double;
      );
  end;

{$endregion}

{$region ' eVector4'}
  ///  <summary>
  ///    Represents a vector with four elements.
  ///   (X,Y,Z,W or R,G,B,A or U1,V1,U2,V2)
  ///  </summary>
  eVector4 = record

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Implicit( const a: array of extended ): eVector4;

    ///  <summary>
    ///    Allows creation of a vector from an array of floats.
    ///    (Size of array must match size of vector)
    ///  </summary>
    class operator Explicit( const a: array of extended ): eVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    //     resulting vector.
    ///  </summary>
    class operator Add( const a: eVector4; const b: array of extended ): eVector4;

    ///  <summary>
    ///    Allows addition of a vector to an array, and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Add( const a: array of extended; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Allows subtraction of an array from a vector and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: eVector4; const b: array of extended ): eVector4;

    ///  <summary>
    ///    Allows subtraction of a vector from an array and returns
    ///    the resulting vector.
    ///  </summary>
    class operator Subtract( const a: array of extended; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Allows the multiplication of a vector and an array, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: eVector4; const b: array of extended ): eVector4;

    ///  <summary>
    ///    Allows the multiplication of an array and a vector, and returns
    ///    the resulting vector. (hadamard)
    ///  </summary>
    class operator Multiply( const a: array of extended; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Allows the division of a vector by an array and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: eVector4; const b: array of extended ): eVector4;

    ///  <summary>
    ///    Allows the division of an array by a vector and returns the
    ///    resulting vector.
    ///  </summary>
    class operator Divide( const a: array of extended; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Operator overload provides for addition of one vector to another.
    ///  </summary>
    class operator Add( const a: eVector4; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a vector.
    ///  </summary>
    class operator Add( const a: eVector4; const b: extended ): eVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one vector from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: eVector4; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a vector.
    ///  </summary>
    class operator Subtract( const a: eVector4; const b: extended ): eVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one vector by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: eVector4; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a vector by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: eVector4; const b: extended ): eVector4;

    ///  <summary>
    ///    Operator overload to provide for division of one vector by
    ///    another.
    ///  </summary>
    class operator Divide( const a: eVector4; const b: eVector4 ): eVector4;

    ///  <summary>
    ///    Operator overload to provide for division of a vector by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: eVector4; const b: extended ): eVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Implicit( const a: eVector3 ): eVector4;

    ///  <summary>
    ///    Allows assignment of Vector3 to Vector4 in which W is set to 1.
    ///  </summary>
    class operator Explicit( const a: eVector3 ): eVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Implicit( const a: eVector2 ): eVector4;

    ///  <summary>
    ///    Allows assignment of Vector2 to Vector4 in which Z is set 0 and W
    ///    is set to 1.
    ///  </summary>
    class operator Explicit( const a: eVector2 ): eVector4;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Implicit( const a: eVector4 ): eVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector3 in which the W
    ///    coordinate is dropped.
    ///  </summary>
    class operator Explicit( const a: eVector4 ): eVector3;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Implicit( const a: eVector4 ): eVector2;

    ///  <summary>
    ///    Allows assignment of a Vector4 to a Vector2 in which the Z and W
    ///    coordinates are dropped.
    ///  </summary>
    class operator Explicit( const a: eVector4 ): eVector2;

    ///  <summary>
    ///    Creates a new vector from X,Y,Z,W values.
    ///  </summary>
    class function Create( const X: extended; const Y: extended; const Z: extended; const W: extended ): eVector4; overload; static;

    ///  <summary>
    ///    Returns the dot product of this vector with another.
    ///  </summary>
    function dot( const a: eVector4 ): extended;

    ///  <summary>
    ///    Returns this vector normaized.
    ///  </summary>
    function normalized: eVector4;

    ///  <summary>
    ///    Returns the unit vector of this vector.
    ///  </summary>
    function UnitVector: eVector4;

    ///  <summary>
    ///    Returns the magnitude of the vector.
    ///  </summary>
    function magnitude: extended;

      case uint8 of
      0: (
          X: extended;
          Y: extended;
          Z: extended;
          W: extended;
      );
      1: (
          R: extended;
          G: extended;
          B: extended;
          A: extended;
      );
      2: (
          U1: extended;
          V1: extended;
          U2: extended;
          V2: extended;
      );
  end;

{$endregion}

{$region ' hMatrix2x2'}

  ///  <summary>
  ///    Represents a 2x2 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  hMatrix2x2 = record

    m00, m10,
    m01, m11: half;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add(const a: hMatrix2x2; const b: half ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: hMatrix2x2; const b: half ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: hMatrix2x2; const b: half ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: hMatrix2x2; const b: half ): hMatrix2x2;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: half; const _m10: half; const _m01: half; const _m11: half ): hMatrix2x2; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: hMatrix2x2 ): hMatrix2x2; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: hVector2 ): hVector2; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: hMatrix2x2;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: hMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: hVector2 ): hMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation (around z) to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotation( const degrees: half ): hMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: hVector2 ): hMatrix2x2; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: half;

    ///  <summary>
    ///    Returns the cofactor of the matrix.
    ///  </summary>
    function cofactor: hMatrix2x2;

    ///  <summary>
    ///    Returns the adjugate of the matrix.
    ///  </summary>
    function adjugate: hMatrix2x2;

    ///  <summary>
    ///    Returns the inverse of the matrix.
    ///  </summary>
    function inverse: hMatrix2x2;

  end;

{$endregion}

{$region ' sMatrix2x2'}

  ///  <summary>
  ///    Represents a 2x2 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  sMatrix2x2 = record

    m00, m10,
    m01, m11: single;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add(const a: sMatrix2x2; const b: single ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: sMatrix2x2; const b: single ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: sMatrix2x2; const b: single ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: sMatrix2x2; const b: single ): sMatrix2x2;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: single; const _m10: single; const _m01: single; const _m11: single ): sMatrix2x2; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: sMatrix2x2 ): sMatrix2x2; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: sVector2 ): sVector2; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: sMatrix2x2;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: sMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: sVector2 ): sMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation (around z) to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotation( const degrees: single ): sMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: sVector2 ): sMatrix2x2; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: single;

    ///  <summary>
    ///    Returns the cofactor of the matrix.
    ///  </summary>
    function cofactor: sMatrix2x2;

    ///  <summary>
    ///    Returns the adjugate of the matrix.
    ///  </summary>
    function adjugate: sMatrix2x2;

    ///  <summary>
    ///    Returns the inverse of the matrix.
    ///  </summary>
    function inverse: sMatrix2x2;

  end;

{$endregion}

{$region ' dMatrix2x2'}

  ///  <summary>
  ///    Represents a 2x2 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  dMatrix2x2 = record

    m00, m10,
    m01, m11: double;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add(const a: dMatrix2x2; const b: double ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: dMatrix2x2; const b: double ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: dMatrix2x2; const b: double ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: dMatrix2x2; const b: double ): dMatrix2x2;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: double; const _m10: double; const _m01: double; const _m11: double ): dMatrix2x2; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: dMatrix2x2 ): dMatrix2x2; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: dVector2 ): dVector2; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: dMatrix2x2;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: dMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: dVector2 ): dMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation (around z) to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotation( const degrees: double ): dMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: dVector2 ): dMatrix2x2; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: double;

    ///  <summary>
    ///    Returns the cofactor of the matrix.
    ///  </summary>
    function cofactor: dMatrix2x2;

    ///  <summary>
    ///    Returns the adjugate of the matrix.
    ///  </summary>
    function adjugate: dMatrix2x2;

    ///  <summary>
    ///    Returns the inverse of the matrix.
    ///  </summary>
    function inverse: dMatrix2x2;

  end;

{$endregion}

{$region ' eMatrix2x2'}

  ///  <summary>
  ///    Represents a 2x2 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  eMatrix2x2 = record

    m00, m10,
    m01, m11: extended;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add(const a: eMatrix2x2; const b: extended ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: eMatrix2x2; const b: extended ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: eMatrix2x2; const b: extended ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: eMatrix2x2; const b: extended ): eMatrix2x2;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: extended; const _m10: extended; const _m01: extended; const _m11: extended ): eMatrix2x2; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: eMatrix2x2 ): eMatrix2x2; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: eVector2 ): eVector2; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: eMatrix2x2;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: eMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: eVector2 ): eMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation (around z) to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotation( const degrees: extended ): eMatrix2x2; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: eVector2 ): eMatrix2x2; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: extended;

    ///  <summary>
    ///    Returns the cofactor of the matrix.
    ///  </summary>
    function cofactor: eMatrix2x2;

    ///  <summary>
    ///    Returns the adjugate of the matrix.
    ///  </summary>
    function adjugate: eMatrix2x2;

    ///  <summary>
    ///    Returns the inverse of the matrix.
    ///  </summary>
    function inverse: eMatrix2x2;

  end;

{$endregion}

{$region ' hMatrix3x3'}

  ///  <summary>
  ///    Represents a 3x3 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  hMatrix3x3 = record

    m00, m10, m20,
    m01, m11, m21,
    m02, m12, m22: half;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: hMatrix3x3; const b: half ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: hMatrix3x3; const b: half ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: hMatrix3x3; const b: half ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: hMatrix3x3; const b: half ): hMatrix3x3;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: half; const _m10: half; const _m20: half; const _m01: half; const _m11: half; const _m21: half; const _m02: half; const _m12: half; const _m22: half ): hMatrix3x3; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: hMatrix3x3 ): hMatrix3x3; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: hVector3 ): hVector3; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: hMatrix3x3;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: hMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: hVector3 ): hMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: half ): hMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: half ): hMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: half ): hMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: hVector3 ): hMatrix3x3; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: half;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: hMatrix3x3;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: hMatrix3x3;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: hMatrix3x3;

  end;

{$endregion}

{$region ' sMatrix3x3'}

  ///  <summary>
  ///    Represents a 3x3 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  sMatrix3x3 = record

    m00, m10, m20,
    m01, m11, m21,
    m02, m12, m22: single;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: sMatrix3x3; const b: single ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: sMatrix3x3; const b: single ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: sMatrix3x3; const b: single ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: sMatrix3x3; const b: single ): sMatrix3x3;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: single; const _m10: single; const _m20: single; const _m01: single; const _m11: single; const _m21: single; const _m02: single; const _m12: single; const _m22: single ): sMatrix3x3; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: sMatrix3x3 ): sMatrix3x3; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: sVector3 ): sVector3; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: sMatrix3x3;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: sMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: sVector3 ): sMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: single ): sMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: single ): sMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: single ): sMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: sVector3 ): sMatrix3x3; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: single;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: sMatrix3x3;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: sMatrix3x3;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: sMatrix3x3;

  end;

{$endregion}

{$region ' dMatrix3x3'}

  ///  <summary>
  ///    Represents a 3x3 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  dMatrix3x3 = record

    m00, m10, m20,
    m01, m11, m21,
    m02, m12, m22: double;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: dMatrix3x3; const b: double ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: dMatrix3x3; const b: double ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: dMatrix3x3; const b: double ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: dMatrix3x3; const b: double ): dMatrix3x3;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: double; const _m10: double; const _m20: double; const _m01: double; const _m11: double; const _m21: double; const _m02: double; const _m12: double; const _m22: double ): dMatrix3x3; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: dMatrix3x3 ): dMatrix3x3; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: dVector3 ): dVector3; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: dMatrix3x3;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: dMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: dVector3 ): dMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: double ): dMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: double ): dMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: double ): dMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: dVector3 ): dMatrix3x3; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: double;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: dMatrix3x3;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: dMatrix3x3;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: dMatrix3x3;

  end;

{$endregion}

{$region ' eMatrix3x3'}

  ///  <summary>
  ///    Represents a 3x3 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  eMatrix3x3 = record

    m00, m10, m20,
    m01, m11, m21,
    m02, m12, m22: extended;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: eMatrix3x3; const b: extended ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: eMatrix3x3; const b: extended ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: eMatrix3x3; const b: extended ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: eMatrix3x3; const b: extended ): eMatrix3x3;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: extended; const _m10: extended; const _m20: extended; const _m01: extended; const _m11: extended; const _m21: extended; const _m02: extended; const _m12: extended; const _m22: extended ): eMatrix3x3; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: eMatrix3x3 ): eMatrix3x3; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: eVector3 ): eVector3; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: eMatrix3x3;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: eMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: eVector3 ): eMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: extended ): eMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: extended ): eMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: extended ): eMatrix3x3; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: eVector3 ): eMatrix3x3; static;

    ///  <summary>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: extended;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: eMatrix3x3;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: eMatrix3x3;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: eMatrix3x3;

  end;

{$endregion}

{$region ' hMatrix4x4'}

  ///  <summary>
  ///    Represents a 4x4 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  hMatrix4x4 = record

    m00, m10, m20, m30,
    m01, m11, m21, m31,
    m02, m12, m22, m32,
    m03, m13, m23, m33: half;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: hMatrix4x4; const b: half ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: hMatrix4x4; const b: half ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: hMatrix4x4; const b: half ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: hMatrix4x4; const b: half ): hMatrix4x4;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: half; const _m10: half; const _m20: half; const _m30: half; const _m01: half; const _m11: half; const _m21: half; const _m31: half; const _m02: half; const _m12: half; const _m22: half; const _m32: half; const _m03: half; const _m13: half; const _m23: half; const _m33: half ): hMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors of length 3.
    ///    Remaining space is filled with identity.
    ///  </summary>
    class function Create( const Row0: hVector3; const Row1: hVector3; const Row2: hVector3; const Row3: hVector3 ): hMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors.
    ///  </summary>
    class function Create( const Row0: hVector4; const Row1: hVector4; const Row2: hVector4; const Row3: hVector4 ): hMatrix4x4; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: hMatrix4x4 ): hMatrix4x4; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: hVector4 ): hVector4; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: hMatrix4x4;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: hMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: hVector3 ): hMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: half ): hMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: half ): hMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: half ): hMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: hVector3 ): hMatrix4x4; static;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: hMatrix4x4;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: hMatrix4x4;

    ///  <sumamry>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: half;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: hMatrix4x4;

    ///  <summary>
    ///    Creates a view matrix based on the eye position, target(look-at) and
    ///    the up-direction for the coordinate space.
    ///  </summary>
    class function CreateView( const eye: hVector3; const target: hVector3; const Up: hVector3 ): hMatrix4x4; static;

    ///  <summary>
    ///    Creates a perspective matrix based on the viewing angle, aspect ratio,
    ///    near and far clipping planes.
    ///  </summary>
    class function CreatePerspective( const angleDeg: half; const ratio: half; const _near: half; const _far: half ): hMatrix4x4; static;

  end;

{$endregion}

{$region ' sMatrix4x4'}

  ///  <summary>
  ///    Represents a 4x4 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  sMatrix4x4 = record

    m00, m10, m20, m30,
    m01, m11, m21, m31,
    m02, m12, m22, m32,
    m03, m13, m23, m33: single;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: sMatrix4x4; const b: single ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: sMatrix4x4; const b: single ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: sMatrix4x4; const b: single ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: sMatrix4x4; const b: single ): sMatrix4x4;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: single; const _m10: single; const _m20: single; const _m30: single; const _m01: single; const _m11: single; const _m21: single; const _m31: single; const _m02: single; const _m12: single; const _m22: single; const _m32: single; const _m03: single; const _m13: single; const _m23: single; const _m33: single ): sMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors of length 3.
    ///    Remaining space is filled with identity.
    ///  </summary>
    class function Create( const Row0: sVector3; const Row1: sVector3; const Row2: sVector3; const Row3: sVector3 ): sMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors.
    ///  </summary>
    class function Create( const Row0: sVector4; const Row1: sVector4; const Row2: sVector4; const Row3: sVector4 ): sMatrix4x4; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: sMatrix4x4 ): sMatrix4x4; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: sVector4 ): sVector4; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: sMatrix4x4;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: sMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: sVector3 ): sMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: single ): sMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: single ): sMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: single ): sMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: sVector3 ): sMatrix4x4; static;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: sMatrix4x4;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: sMatrix4x4;

    ///  <sumamry>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: single;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: sMatrix4x4;

    ///  <summary>
    ///    Creates a view matrix based on the eye position, target(look-at) and
    ///    the up-direction for the coordinate space.
    ///  </summary>
    class function CreateView( const eye: sVector3; const target: sVector3; const Up: sVector3 ): sMatrix4x4; static;

    ///  <summary>
    ///    Creates a perspective matrix based on the viewing angle, aspect ratio,
    ///    near and far clipping planes.
    ///  </summary>
    class function CreatePerspective( const angleDeg: single; const ratio: single; const _near: single; const _far: single ): sMatrix4x4; static;

  end;

{$endregion}

{$region ' dMatrix4x4'}

  ///  <summary>
  ///    Represents a 4x4 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  dMatrix4x4 = record

    m00, m10, m20, m30,
    m01, m11, m21, m31,
    m02, m12, m22, m32,
    m03, m13, m23, m33: double;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: dMatrix4x4; const b: double ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: dMatrix4x4; const b: double ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: dMatrix4x4; const b: double ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: dMatrix4x4; const b: double ): dMatrix4x4;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: double; const _m10: double; const _m20: double; const _m30: double; const _m01: double; const _m11: double; const _m21: double; const _m31: double; const _m02: double; const _m12: double; const _m22: double; const _m32: double; const _m03: double; const _m13: double; const _m23: double; const _m33: double ): dMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors of length 3.
    ///    Remaining space is filled with identity.
    ///  </summary>
    class function Create( const Row0: dVector3; const Row1: dVector3; const Row2: dVector3; const Row3: dVector3 ): dMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors.
    ///  </summary>
    class function Create( const Row0: dVector4; const Row1: dVector4; const Row2: dVector4; const Row3: dVector4 ): dMatrix4x4; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: dMatrix4x4 ): dMatrix4x4; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: dVector4 ): dVector4; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: dMatrix4x4;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: dMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: dVector3 ): dMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: double ): dMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: double ): dMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: double ): dMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: dVector3 ): dMatrix4x4; static;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: dMatrix4x4;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: dMatrix4x4;

    ///  <sumamry>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: double;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: dMatrix4x4;

    ///  <summary>
    ///    Creates a view matrix based on the eye position, target(look-at) and
    ///    the up-direction for the coordinate space.
    ///  </summary>
    class function CreateView( const eye: dVector3; const target: dVector3; const Up: dVector3 ): dMatrix4x4; static;

    ///  <summary>
    ///    Creates a perspective matrix based on the viewing angle, aspect ratio,
    ///    near and far clipping planes.
    ///  </summary>
    class function CreatePerspective( const angleDeg: double; const ratio: double; const _near: double; const _far: double ): dMatrix4x4; static;

  end;

{$endregion}

{$region ' eMatrix4x4'}

  ///  <summary>
  ///    Represents a 4x4 matrix.
  ///    Addressed as xy (m21 = m.x=2 m.y=1)
  ///  </summary>
  eMatrix4x4 = record

    m00, m10, m20, m30,
    m01, m11, m21, m31,
    m02, m12, m22, m32,
    m03, m13, m23, m33: extended;

    ///  <summary>
    ///    Operator overload provides for addition of one Matrix to another.
    ///  </summary>
    class operator Add( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for addition of a float to a Matrix.
    ///  </summary>
    class operator Add( const a: eMatrix4x4; const b: extended ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of one Matrix from
    ///    another.
    ///  </summary>
    class operator Subtract( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload provides for subtraction of a float from
    //     a Matrix.
    ///  </summary>
    class operator Subtract( const a: eMatrix4x4; const b: extended ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of one Matrix by
    ///    another (hadamard multiplication/scale).
    ///  </summary>
    class operator Multiply( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for multiplication of a Matrix by
    ///    a float. (scale)
    ///  </summary>
    class operator Multiply( const a: eMatrix4x4; const b: extended ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of one Matrix by
    ///    another.
    ///  </summary>
    class operator Divide( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;

    ///  <summary>
    ///    Operator overload to provide for division of a Matrix by a
    ///    float.
    ///  </summary>
    class operator Divide( const a: eMatrix4x4; const b: extended ): eMatrix4x4;

    ///  <summary>
    ///    Creates a new matrix based on the 16 floating point values provided.
    ///    Matrix addressed XxY
    ///  </summary>
    class function Create( const _m00: extended; const _m10: extended; const _m20: extended; const _m30: extended; const _m01: extended; const _m11: extended; const _m21: extended; const _m31: extended; const _m02: extended; const _m12: extended; const _m22: extended; const _m32: extended; const _m03: extended; const _m13: extended; const _m23: extended; const _m33: extended ): eMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors of length 3.
    ///    Remaining space is filled with identity.
    ///  </summary>
    class function Create( const Row0: eVector3; const Row1: eVector3; const Row2: eVector3; const Row3: eVector3 ): eMatrix4x4; overload; static;

    ///  <summary>
    ///    Creates a new matrix from four row vectors.
    ///  </summary>
    class function Create( const Row0: eVector4; const Row1: eVector4; const Row2: eVector4; const Row3: eVector4 ): eMatrix4x4; overload; static;

    ///  <summary>
    ///    The dot product of another matrix with this one.
    ///  </summary>
    function dot( const a: eMatrix4x4 ): eMatrix4x4; overload;

    ///  <summary>
    ///    Provides the dot product of a vector with this matrix.
    ///  </summary>
    function dot( const a: eVector4 ): eVector4; overload;

    ///  <summary>
    ///    Returns a matrix which is the transpose of this one.
    ///  </summary>
    function transpose: eMatrix4x4;

    ///  <summary>
    ///    Returns the identity matrix.
    ///  </summary>
    class function identity: eMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform translation based on the vector t.
    ///  </summary>
    class function translation( const t: eVector3 ): eMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around x to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationX( const degrees: extended ): eMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around y to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationY( const degrees: extended ): eMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform rotation around z to a specified number
    ///    of degrees.
    ///  </summary>
    class function rotationZ( const degrees: extended ): eMatrix4x4; static;

    ///  <summary>
    ///    Returns a matrix to perform scaling in three dimensions based on
    ///    the vector s.
    ///  </summary>
    class function scale( const s: eVector3 ): eMatrix4x4; static;

    ///  <summary>
    ///    Returns the adjugate of this matrix.
    ///  </summary>
    function adjugate: eMatrix4x4;

    ///  <summary>
    ///    Returns the cofactor of this matrix.
    ///  </summary>
    function cofactor: eMatrix4x4;

    ///  <sumamry>
    ///    Returns the determinant of the matrix.
    ///  </summary>
    function determinant: extended;

    ///  <summary>
    ///    Returns the inverse of this matrix.
    ///  </summary>
    function inverse: eMatrix4x4;

    ///  <summary>
    ///    Creates a view matrix based on the eye position, target(look-at) and
    ///    the up-direction for the coordinate space.
    ///  </summary>
    class function CreateView( const eye: eVector3; const target: eVector3; const Up: eVector3 ): eMatrix4x4; static;

    ///  <summary>
    ///    Creates a perspective matrix based on the viewing angle, aspect ratio,
    ///    near and far clipping planes.
    ///  </summary>
    class function CreatePerspective( const angleDeg: extended; const ratio: extended; const _near: extended; const _far: extended ): eMatrix4x4; static;

  end;

{$endregion}

{$region ' hRay'}

  ///  <summary>
  ///    Represents a ray in 3D space.
  ///  </summary>
  hRay = record
  private
    fDirection: hVector3;
  private
    procedure setDirection(const Value: hVector3);
  public
    ///  <summary>
    ///    A vertex representing the initial point of the ray in 3d space.
    ///  </summary>
    Origin: hVertex;

    ///  <summary>
    ///    The length of the ray.
    ///  </summmary>
    Length: half;

    ///  <summary>
    ///    A unit vector representing the direction that the ray is cast
    ///    away from the origin.
    ///  </summary>
    property Direction: hVector3 read fDirection write setDirection;

    ///  <summary>
    ///    Creates a new ray between two vertices representing the
    ///    start and end of the ray.
    ///  </summary>
    class function Create( const aOrigin: hVertex; const aDestination: hVertex ): hRay; overload; static;

    ///  <summary>
    ///    Creates a new ray given an origin, direction and length.
    ///  </summary>
    class function Create( const aOrigin: hVertex; const aDirection: hVector3; const aLength: half ): hRay; overload; static;

    ///  <summary>
    ///    Performs Origin + (Direction * Length) to get the terminating
    ///    vertex for the ray. This will raise an exception if Length is
    ///    either INF (infinity) or NAN (not-a-number).
    ///  </summary>
    function Destination: hVertex;
  end;

{$endregion}

{$region ' sRay'}

  ///  <summary>
  ///    Represents a ray in 3D space.
  ///  </summary>
  sRay = record
  private
    fDirection: sVector3;
  private
    procedure setDirection(const Value: sVector3);
  public
    ///  <summary>
    ///    A vertex representing the initial point of the ray in 3d space.
    ///  </summary>
    Origin: sVertex;

    ///  <summary>
    ///    The length of the ray.
    ///  </summmary>
    Length: single;

    ///  <summary>
    ///    A unit vector representing the direction that the ray is cast
    ///    away from the origin.
    ///  </summary>
    property Direction: sVector3 read fDirection write setDirection;

    ///  <summary>
    ///    Creates a new ray between two vertices representing the
    ///    start and end of the ray.
    ///  </summary>
    class function Create( const aOrigin: sVertex; const aDestination: sVertex ): sRay; overload; static;

    ///  <summary>
    ///    Creates a new ray given an origin, direction and length.
    ///  </summary>
    class function Create( const aOrigin: sVertex; const aDirection: sVector3; const aLength: single ): sRay; overload; static;

    ///  <summary>
    ///    Performs Origin + (Direction * Length) to get the terminating
    ///    vertex for the ray. This will raise an exception if Length is
    ///    either INF (infinity) or NAN (not-a-number).
    ///  </summary>
    function Destination: sVertex;
  end;

{$endregion}

{$region ' dRay'}

  ///  <summary>
  ///    Represents a ray in 3D space.
  ///  </summary>
  dRay = record
  private
    fDirection: dVector3;
  private
    procedure setDirection(const Value: dVector3);
  public
    ///  <summary>
    ///    A vertex representing the initial point of the ray in 3d space.
    ///  </summary>
    Origin: dVertex;

    ///  <summary>
    ///    The length of the ray.
    ///  </summmary>
    Length: double;

    ///  <summary>
    ///    A unit vector representing the direction that the ray is cast
    ///    away from the origin.
    ///  </summary>
    property Direction: dVector3 read fDirection write setDirection;

    ///  <summary>
    ///    Creates a new ray between two vertices representing the
    ///    start and end of the ray.
    ///  </summary>
    class function Create( const aOrigin: dVertex; const aDestination: dVertex ): dRay; overload; static;

    ///  <summary>
    ///    Creates a new ray given an origin, direction and length.
    ///  </summary>
    class function Create( const aOrigin: dVertex; const aDirection: dVector3; const aLength: double ): dRay; overload; static;

    ///  <summary>
    ///    Performs Origin + (Direction * Length) to get the terminating
    ///    vertex for the ray. This will raise an exception if Length is
    ///    either INF (infinity) or NAN (not-a-number).
    ///  </summary>
    function Destination: dVertex;
  end;

{$endregion}

{$region ' eRay'}

  ///  <summary>
  ///    Represents a ray in 3D space.
  ///  </summary>
  eRay = record
  private
    fDirection: eVector3;
  private
    procedure setDirection(const Value: eVector3);
  public
    ///  <summary>
    ///    A vertex representing the initial point of the ray in 3d space.
    ///  </summary>
    Origin: eVertex;

    ///  <summary>
    ///    The length of the ray.
    ///  </summmary>
    Length: extended;

    ///  <summary>
    ///    A unit vector representing the direction that the ray is cast
    ///    away from the origin.
    ///  </summary>
    property Direction: eVector3 read fDirection write setDirection;

    ///  <summary>
    ///    Creates a new ray between two vertices representing the
    ///    start and end of the ray.
    ///  </summary>
    class function Create( const aOrigin: eVertex; const aDestination: eVertex ): eRay; overload; static;

    ///  <summary>
    ///    Creates a new ray given an origin, direction and length.
    ///  </summary>
    class function Create( const aOrigin: eVertex; const aDirection: eVector3; const aLength: extended ): eRay; overload; static;

    ///  <summary>
    ///    Performs Origin + (Direction * Length) to get the terminating
    ///    vertex for the ray. This will raise an exception if Length is
    ///    either INF (infinity) or NAN (not-a-number).
    ///  </summary>
    function Destination: eVertex;
  end;

{$endregion}

{$region ' hPlane'}

  ///  <summary>
  ///    Represents a plane in 3D space as a pair of unit vectors.
  ///  </summary>
  hPlane = record
  private
    fNormal: hVector3;
  private
    procedure setNormal( const Value: hVector3 );
  public
    Origin: hVertex;
    property Normal: hVector3 read fNormal write setNormal;
  public
    ///  <summary>
    ///    Creates a plane when given an origin and a normal.
    ///  </summary>
    class function Create( const aOrigin: hVertex; const aNormal: hVector3 ): hPlane; static;

    ///  <summary>
    ///    Returns the distance of vertex P from the plane.
    ///  </summary>
//    function distance( P: Vertex ): float;

    ///  <summary>
    ///    Returns true if the provided ray intersects with this plane.
    ///  </summary>
    function Intersect( const aRay: hRay ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray
    ///    with this plane.
    ///  </summary>
    function Intersection( const aRay: hRay ): hVertex;
  end;

{$endregion}

{$region ' sPlane'}

  ///  <summary>
  ///    Represents a plane in 3D space as a pair of unit vectors.
  ///  </summary>
  sPlane = record
  private
    fNormal: sVector3;
  private
    procedure setNormal( const Value: sVector3 );
  public
    Origin: sVertex;
    property Normal: sVector3 read fNormal write setNormal;
  public
    ///  <summary>
    ///    Creates a plane when given an origin and a normal.
    ///  </summary>
    class function Create( const aOrigin: sVertex; const aNormal: sVector3 ): sPlane; static;

    ///  <summary>
    ///    Returns the distance of vertex P from the plane.
    ///  </summary>
//    function distance( P: Vertex ): float;

    ///  <summary>
    ///    Returns true if the provided ray intersects with this plane.
    ///  </summary>
    function Intersect( const aRay: sRay ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray
    ///    with this plane.
    ///  </summary>
    function Intersection( const aRay: sRay ): sVertex;
  end;

{$endregion}

{$region ' dPlane'}

  ///  <summary>
  ///    Represents a plane in 3D space as a pair of unit vectors.
  ///  </summary>
  dPlane = record
  private
    fNormal: dVector3;
  private
    procedure setNormal( const Value: dVector3 );
  public
    Origin: dVertex;
    property Normal: dVector3 read fNormal write setNormal;
  public
    ///  <summary>
    ///    Creates a plane when given an origin and a normal.
    ///  </summary>
    class function Create( const aOrigin: dVertex; const aNormal: dVector3 ): dPlane; static;

    ///  <summary>
    ///    Returns the distance of vertex P from the plane.
    ///  </summary>
//    function distance( P: Vertex ): float;

    ///  <summary>
    ///    Returns true if the provided ray intersects with this plane.
    ///  </summary>
    function Intersect( const aRay: dRay ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray
    ///    with this plane.
    ///  </summary>
    function Intersection( const aRay: dRay ): dVertex;
  end;

{$endregion}

{$region ' ePlane'}

  ///  <summary>
  ///    Represents a plane in 3D space as a pair of unit vectors.
  ///  </summary>
  ePlane = record
  private
    fNormal: eVector3;
  private
    procedure setNormal( const Value: eVector3 );
  public
    Origin: eVertex;
    property Normal: eVector3 read fNormal write setNormal;
  public
    ///  <summary>
    ///    Creates a plane when given an origin and a normal.
    ///  </summary>
    class function Create( const aOrigin: eVertex; const aNormal: eVector3 ): ePlane; static;

    ///  <summary>
    ///    Returns the distance of vertex P from the plane.
    ///  </summary>
//    function distance( P: Vertex ): float;

    ///  <summary>
    ///    Returns true if the provided ray intersects with this plane.
    ///  </summary>
    function Intersect( const aRay: eRay ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray
    ///    with this plane.
    ///  </summary>
    function Intersection( const aRay: eRay ): eVertex;
  end;

{$endregion}

{$region ' hSphere'}

  ///  <summary>
  ///    Represents a sphere as a vertex (as it's origin) and a radius.
  ///  </summary>
  hSphere = record

    ///  <summary>
    ///    A Vertex representing the location of the sphere.
    ///  </summary>
    Origin: hVertex;

    ///  <summary>
    ///    Represents the radius of the sphere about the origin.
    ///  </summary>
    Radius: half;

    ///  <summary>
    ///    Returns true of the provided ray intersects with this sphere.
    ///  </summary>
//    function Intersect( const aRay: Ray ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray with
    ///    this sphere.
    ///  </summary>
//    function Intersection( const aRay: Ray ): Vertex;
  end;

{$endregion}

{$region ' sSphere'}

  ///  <summary>
  ///    Represents a sphere as a vertex (as it's origin) and a radius.
  ///  </summary>
  sSphere = record

    ///  <summary>
    ///    A Vertex representing the location of the sphere.
    ///  </summary>
    Origin: sVertex;

    ///  <summary>
    ///    Represents the radius of the sphere about the origin.
    ///  </summary>
    Radius: single;

    ///  <summary>
    ///    Returns true of the provided ray intersects with this sphere.
    ///  </summary>
//    function Intersect( const aRay: Ray ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray with
    ///    this sphere.
    ///  </summary>
//    function Intersection( const aRay: Ray ): Vertex;
  end;

{$endregion}

{$region ' dSphere'}

  ///  <summary>
  ///    Represents a sphere as a vertex (as it's origin) and a radius.
  ///  </summary>
  dSphere = record

    ///  <summary>
    ///    A Vertex representing the location of the sphere.
    ///  </summary>
    Origin: dVertex;

    ///  <summary>
    ///    Represents the radius of the sphere about the origin.
    ///  </summary>
    Radius: double;

    ///  <summary>
    ///    Returns true of the provided ray intersects with this sphere.
    ///  </summary>
//    function Intersect( const aRay: Ray ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray with
    ///    this sphere.
    ///  </summary>
//    function Intersection( const aRay: Ray ): Vertex;
  end;

{$endregion}

{$region ' eSphere'}

  ///  <summary>
  ///    Represents a sphere as a vertex (as it's origin) and a radius.
  ///  </summary>
  eSphere = record

    ///  <summary>
    ///    A Vertex representing the location of the sphere.
    ///  </summary>
    Origin: eVertex;

    ///  <summary>
    ///    Represents the radius of the sphere about the origin.
    ///  </summary>
    Radius: extended;

    ///  <summary>
    ///    Returns true of the provided ray intersects with this sphere.
    ///  </summary>
//    function Intersect( const aRay: Ray ): boolean;

    ///  <summary>
    ///    Returns a vertex which represents the intersection of a ray with
    ///    this sphere.
    ///  </summary>
//    function Intersection( const aRay: Ray ): Vertex;
  end;

{$endregion}

{$region ' Aliases'}

type
  Vector2   = sVector2;
  Vector3   = sVector3;
  Vector4   = sVector4;
  Vertex    = sVertex;
  Matrix2x2 = sMatrix2x2;
  Matrix3x3 = sMatrix3x3;
  Matrix4x4 = sMatrix4x4;
  Ray       = sRay;
  Plane     = sPlane;
  Spehere   = sSphere;

{$endregion}

implementation
uses
  math,
  sysutils;

{$region ' Exceptions'}

type
  EInvalidArrayLength2 = class(Exception)
    constructor Create; reintroduce;
  end;

  EInvalidArrayLength3 = class(Exception)
    constructor Create; reintroduce;
  end;

  EInvalidArrayLength4 = class(Exception)
    constructor Create; reintroduce;
  end;

constructor EInvalidArrayLength2.Create;
begin
  inherited Create('Invalid array length for vector 2.');
end;

constructor EInvalidArrayLength3.Create;
begin
  inherited Create('Invalid array length for vector 3.');
end;

constructor EInvalidArrayLength4.Create;
begin
  inherited Create('Invalid array length for vector 4.');
end;

{$endregion}

{$region ' hVector2'}

class operator hVector2.Add( const a: hVector2; const b: hVector2 ): hVector2;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
end;

class operator hVector2.Add( const a: hVector2; const b: half ): hVector2;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
end;

class operator hVector2.Add( const a: hVector2; const b: array of half ): hVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
end;

class operator hVector2.Add( const a: array of half; const b: hVector2 ): hVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := b.X + a[0];
  Result.Y := b.Y + a[1];
end;

class function hVector2.Create( const X: half; const Y: half ): hVector2;
begin
  Result.X := X;
  Result.Y := Y;
end;

class operator hVector2.Divide( const a: hVector2; const b: hVector2 ): hVector2;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
end;

class operator hVector2.Divide( const a: hVector2; const b: half ): hVector2;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
end;

class operator hVector2.Divide( const a: hVector2; const b: array of half ): hVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
end;

class operator hVector2.Divide( const a: array of half; const b: hVector2 ): hVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
end;

function hVector2.dot( const a: hVector2 ): half;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y);
end;

class operator hVector2.Explicit(const a: array of half): hVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(half)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector2.Implicit( const a: array of half ): hVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(half)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function hVector2.magnitude: half;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y) );
end;

class operator hVector2.Multiply( const a: hVector2; const b: hVector2 ): hVector2;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
end;

class operator hVector2.Multiply( const a: hVector2; const b: half ): hVector2;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
end;

class operator hVector2.Multiply( const a: hVector2; const b: array of half ): hVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
end;

class operator hVector2.Multiply( const a: array of half; const b: hVector2 ): hVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
end;

function hVector2.normalized: hVector2;
var
  M: half;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
end;

class operator hVector2.Subtract( const a: hVector2; const b: array of half ): hVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
end;

class operator hVector2.Subtract( const a: array of half; const b: hVector2 ): hVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
end;

class operator hVector2.Subtract( const a: hVector2; const b: half ): hVector2;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
end;

function hVector2.UnitVector: hVector2;
var
  fMagnitude: half;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
end;

class operator hVector2.Subtract( const a: hVector2; const b: hVector2 ): hVector2;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
end;

{$endregion}

{$region ' sVector2'}

class operator sVector2.Add( const a: sVector2; const b: sVector2 ): sVector2;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
end;

class operator sVector2.Add( const a: sVector2; const b: single ): sVector2;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
end;

class operator sVector2.Add( const a: sVector2; const b: array of single ): sVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
end;

class operator sVector2.Add( const a: array of single; const b: sVector2 ): sVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := b.X + a[0];
  Result.Y := b.Y + a[1];
end;

class function sVector2.Create( const X: single; const Y: single ): sVector2;
begin
  Result.X := X;
  Result.Y := Y;
end;

class operator sVector2.Divide( const a: sVector2; const b: sVector2 ): sVector2;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
end;

class operator sVector2.Divide( const a: sVector2; const b: single ): sVector2;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
end;

class operator sVector2.Divide( const a: sVector2; const b: array of single ): sVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
end;

class operator sVector2.Divide( const a: array of single; const b: sVector2 ): sVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
end;

function sVector2.dot( const a: sVector2 ): single;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y);
end;

class operator sVector2.Explicit(const a: array of single): sVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(single)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector2.Implicit( const a: array of single ): sVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(single)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function sVector2.magnitude: single;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y) );
end;

class operator sVector2.Multiply( const a: sVector2; const b: sVector2 ): sVector2;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
end;

class operator sVector2.Multiply( const a: sVector2; const b: single ): sVector2;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
end;

class operator sVector2.Multiply( const a: sVector2; const b: array of single ): sVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
end;

class operator sVector2.Multiply( const a: array of single; const b: sVector2 ): sVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
end;

function sVector2.normalized: sVector2;
var
  M: single;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
end;

class operator sVector2.Subtract( const a: sVector2; const b: array of single ): sVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
end;

class operator sVector2.Subtract( const a: array of single; const b: sVector2 ): sVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
end;

class operator sVector2.Subtract( const a: sVector2; const b: single ): sVector2;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
end;

function sVector2.UnitVector: sVector2;
var
  fMagnitude: single;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
end;

class operator sVector2.Subtract( const a: sVector2; const b: sVector2 ): sVector2;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
end;

{$endregion}

{$region ' dVector2'}

class operator dVector2.Add( const a: dVector2; const b: dVector2 ): dVector2;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
end;

class operator dVector2.Add( const a: dVector2; const b: double ): dVector2;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
end;

class operator dVector2.Add( const a: dVector2; const b: array of double ): dVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
end;

class operator dVector2.Add( const a: array of double; const b: dVector2 ): dVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := b.X + a[0];
  Result.Y := b.Y + a[1];
end;

class function dVector2.Create( const X: double; const Y: double ): dVector2;
begin
  Result.X := X;
  Result.Y := Y;
end;

class operator dVector2.Divide( const a: dVector2; const b: dVector2 ): dVector2;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
end;

class operator dVector2.Divide( const a: dVector2; const b: double ): dVector2;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
end;

class operator dVector2.Divide( const a: dVector2; const b: array of double ): dVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
end;

class operator dVector2.Divide( const a: array of double; const b: dVector2 ): dVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
end;

function dVector2.dot( const a: dVector2 ): double;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y);
end;

class operator dVector2.Explicit(const a: array of double): dVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(double)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector2.Implicit( const a: array of double ): dVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(double)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function dVector2.magnitude: double;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y) );
end;

class operator dVector2.Multiply( const a: dVector2; const b: dVector2 ): dVector2;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
end;

class operator dVector2.Multiply( const a: dVector2; const b: double ): dVector2;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
end;

class operator dVector2.Multiply( const a: dVector2; const b: array of double ): dVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
end;

class operator dVector2.Multiply( const a: array of double; const b: dVector2 ): dVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
end;

function dVector2.normalized: dVector2;
var
  M: double;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
end;

class operator dVector2.Subtract( const a: dVector2; const b: array of double ): dVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
end;

class operator dVector2.Subtract( const a: array of double; const b: dVector2 ): dVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
end;

class operator dVector2.Subtract( const a: dVector2; const b: double ): dVector2;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
end;

function dVector2.UnitVector: dVector2;
var
  fMagnitude: double;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
end;

class operator dVector2.Subtract( const a: dVector2; const b: dVector2 ): dVector2;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
end;

{$endregion}

{$region ' eVector2'}

class operator eVector2.Add( const a: eVector2; const b: eVector2 ): eVector2;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
end;

class operator eVector2.Add( const a: eVector2; const b: extended ): eVector2;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
end;

class operator eVector2.Add( const a: eVector2; const b: array of extended ): eVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
end;

class operator eVector2.Add( const a: array of extended; const b: eVector2 ): eVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := b.X + a[0];
  Result.Y := b.Y + a[1];
end;

class function eVector2.Create( const X: extended; const Y: extended ): eVector2;
begin
  Result.X := X;
  Result.Y := Y;
end;

class operator eVector2.Divide( const a: eVector2; const b: eVector2 ): eVector2;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
end;

class operator eVector2.Divide( const a: eVector2; const b: extended ): eVector2;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
end;

class operator eVector2.Divide( const a: eVector2; const b: array of extended ): eVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
end;

class operator eVector2.Divide( const a: array of extended; const b: eVector2 ): eVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
end;

function eVector2.dot( const a: eVector2 ): extended;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y);
end;

class operator eVector2.Explicit(const a: array of extended): eVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(extended)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector2.Implicit( const a: array of extended ): eVector2;
var
  L: uint32;
begin
  L := Length(a);
  if (L>2) or (L=0) then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(extended)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function eVector2.magnitude: extended;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y) );
end;

class operator eVector2.Multiply( const a: eVector2; const b: eVector2 ): eVector2;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
end;

class operator eVector2.Multiply( const a: eVector2; const b: extended ): eVector2;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
end;

class operator eVector2.Multiply( const a: eVector2; const b: array of extended ): eVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
end;

class operator eVector2.Multiply( const a: array of extended; const b: eVector2 ): eVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
end;

function eVector2.normalized: eVector2;
var
  M: extended;
begin
  M := Self.magnitude;
  if M=0 then begin
    Result := Self;
    exit;
  end;
  Result.X := X / M;
  Result.Y := Y / M;
end;

class operator eVector2.Subtract( const a: eVector2; const b: array of extended ): eVector2;
begin
  if length(b)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
end;

class operator eVector2.Subtract( const a: array of extended; const b: eVector2 ): eVector2;
begin
  if length(a)<>2 then begin
    raise
      EInvalidArrayLength2.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
end;

class operator eVector2.Subtract( const a: eVector2; const b: extended ): eVector2;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
end;

function eVector2.UnitVector: eVector2;
var
  fMagnitude: extended;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
end;

class operator eVector2.Subtract( const a: eVector2; const b: eVector2 ): eVector2;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
end;

{$endregion}

{$region ' hVector3'}

class operator hVector3.Add( const a: hVector3; const b: hVector3 ): hVector3;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
end;

class operator hVector3.Add( const a: hVector3; const b: half ): hVector3;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
end;

class operator hVector3.Add( const a: hVector3; const b: array of half ): hVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
end;

class operator hVector3.Add( const a: array of half; const b: hVector3 ): hVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
end;

class function hVector3.Create( const X: half; const Y: half; const Z: half ): hVector3;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function hVector3.cross( const a: hVector3 ): hVector3;
begin
  Result.X := (Self.Y * A.Z) - (Self.Z * A.Y);
  Result.Y := (Self.Z * A.X) - (Self.X * A.Z);
  Result.Z := (Self.X * A.Y) - (Self.Y * A.X);
end;

class operator hVector3.Divide( const a: hVector3; const b: hVector3 ): hVector3;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
end;

class operator hVector3.Divide( const a: hVector3; const b: half ): hVector3;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
end;

class operator hVector3.Divide( const a: hVector3; const b: array of half ): hVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
end;

class operator hVector3.Divide( const a: array of half; const b: hVector3 ): hVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
end;

function hVector3.dot( const a: hVector3 ): half;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z);
end;

class operator hVector3.Explicit( const a: hVector2 ): hVector3;
begin
  {$hints off} Move(a,Result,sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator hVector3.Explicit( const a: hVector3 ): hVector2;
begin
  {$hints off} Move(a,Result,sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector3.Implicit( const a: hVector2 ): hVector3;
begin
  {$hints off} Move(a,Result,sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator hVector3.Implicit( const a: hVector3 ): hVector2;
begin
  {$hints off} Move(a,Result,sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector3.Implicit( const a: array of half ): hVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(half)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector3.Explicit( const a: array of half ): hVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(half)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function hVector3.magnitude: half;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
end;

class operator hVector3.Multiply( const a: hVector3; const b: array of half ): hVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
end;

class operator hVector3.Multiply( const a: array of half; const b: hVector3 ): hVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
end;

class operator hVector3.Multiply( const a: hVector3; const b: hVector3 ): hVector3;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
end;

class operator hVector3.Multiply( const a: hVector3; const b: half ): hVector3;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
end;

function hVector3.normalized: hVector3;
var
  M: half;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
end;

class operator hVector3.Subtract( const a: hVector3; const b: array of half ): hVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
end;

class operator hVector3.Subtract( const a: array of half; const b: hVector3 ): hVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
end;

class operator hVector3.Subtract( const a: hVector3; const b: half ): hVector3;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
end;

function hVector3.UnitVector: hVector3;
var
   fMagnitude: half;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
end;

class operator hVector3.Subtract( const a: hVector3; const b: hVector3 ): hVector3;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
end;

{$endregion}

{$region ' sVector3'}

class operator sVector3.Add( const a: sVector3; const b: sVector3 ): sVector3;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
end;

class operator sVector3.Add( const a: sVector3; const b: single ): sVector3;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
end;

class operator sVector3.Add( const a: sVector3; const b: array of single ): sVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
end;

class operator sVector3.Add( const a: array of single; const b: sVector3 ): sVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
end;

class function sVector3.Create( const X: single; const Y: single; const Z: single ): sVector3;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function sVector3.cross( const a: sVector3 ): sVector3;
begin
  Result.X := (Self.Y * A.Z) - (Self.Z * A.Y);
  Result.Y := (Self.Z * A.X) - (Self.X * A.Z);
  Result.Z := (Self.X * A.Y) - (Self.Y * A.X);
end;

class operator sVector3.Divide( const a: sVector3; const b: sVector3 ): sVector3;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
end;

class operator sVector3.Divide( const a: sVector3; const b: single ): sVector3;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
end;

class operator sVector3.Divide( const a: sVector3; const b: array of single ): sVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
end;

class operator sVector3.Divide( const a: array of single; const b: sVector3 ): sVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
end;

function sVector3.dot( const a: sVector3 ): single;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z);
end;

class operator sVector3.Explicit( const a: sVector2 ): sVector3;
begin
  {$hints off} Move(a,Result,sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator sVector3.Explicit( const a: sVector3 ): sVector2;
begin
  {$hints off} Move(a,Result,sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector3.Implicit( const a: sVector2 ): sVector3;
begin
  {$hints off} Move(a,Result,sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator sVector3.Implicit( const a: sVector3 ): sVector2;
begin
  {$hints off} Move(a,Result,sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector3.Implicit( const a: array of single ): sVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(single)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector3.Explicit( const a: array of single ): sVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(single)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function sVector3.magnitude: single;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
end;

class operator sVector3.Multiply( const a: sVector3; const b: array of single ): sVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
end;

class operator sVector3.Multiply( const a: array of single; const b: sVector3 ): sVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
end;

class operator sVector3.Multiply( const a: sVector3; const b: sVector3 ): sVector3;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
end;

class operator sVector3.Multiply( const a: sVector3; const b: single ): sVector3;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
end;

function sVector3.normalized: sVector3;
var
  M: single;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
end;

class operator sVector3.Subtract( const a: sVector3; const b: array of single ): sVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
end;

class operator sVector3.Subtract( const a: array of single; const b: sVector3 ): sVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
end;

class operator sVector3.Subtract( const a: sVector3; const b: single ): sVector3;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
end;

function sVector3.UnitVector: sVector3;
var
   fMagnitude: single;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
end;

class operator sVector3.Subtract( const a: sVector3; const b: sVector3 ): sVector3;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
end;

{$endregion}

{$region ' dVector3'}

class operator dVector3.Add( const a: dVector3; const b: dVector3 ): dVector3;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
end;

class operator dVector3.Add( const a: dVector3; const b: double ): dVector3;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
end;

class operator dVector3.Add( const a: dVector3; const b: array of double ): dVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
end;

class operator dVector3.Add( const a: array of double; const b: dVector3 ): dVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
end;

class function dVector3.Create( const X: double; const Y: double; const Z: double ): dVector3;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function dVector3.cross( const a: dVector3 ): dVector3;
begin
  Result.X := (Self.Y * A.Z) - (Self.Z * A.Y);
  Result.Y := (Self.Z * A.X) - (Self.X * A.Z);
  Result.Z := (Self.X * A.Y) - (Self.Y * A.X);
end;

class operator dVector3.Divide( const a: dVector3; const b: dVector3 ): dVector3;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
end;

class operator dVector3.Divide( const a: dVector3; const b: double ): dVector3;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
end;

class operator dVector3.Divide( const a: dVector3; const b: array of double ): dVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
end;

class operator dVector3.Divide( const a: array of double; const b: dVector3 ): dVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
end;

function dVector3.dot( const a: dVector3 ): double;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z);
end;

class operator dVector3.Explicit( const a: dVector2 ): dVector3;
begin
  {$hints off} Move(a,Result,sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator dVector3.Explicit( const a: dVector3 ): dVector2;
begin
  {$hints off} Move(a,Result,sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector3.Implicit( const a: dVector2 ): dVector3;
begin
  {$hints off} Move(a,Result,sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator dVector3.Implicit( const a: dVector3 ): dVector2;
begin
  {$hints off} Move(a,Result,sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector3.Implicit( const a: array of double ): dVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(double)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector3.Explicit( const a: array of double ): dVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(double)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function dVector3.magnitude: double;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
end;

class operator dVector3.Multiply( const a: dVector3; const b: array of double ): dVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
end;

class operator dVector3.Multiply( const a: array of double; const b: dVector3 ): dVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
end;

class operator dVector3.Multiply( const a: dVector3; const b: dVector3 ): dVector3;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
end;

class operator dVector3.Multiply( const a: dVector3; const b: double ): dVector3;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
end;

function dVector3.normalized: dVector3;
var
  M: double;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
end;

class operator dVector3.Subtract( const a: dVector3; const b: array of double ): dVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
end;

class operator dVector3.Subtract( const a: array of double; const b: dVector3 ): dVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
end;

class operator dVector3.Subtract( const a: dVector3; const b: double ): dVector3;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
end;

function dVector3.UnitVector: dVector3;
var
   fMagnitude: double;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
end;

class operator dVector3.Subtract( const a: dVector3; const b: dVector3 ): dVector3;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
end;

{$endregion}

{$region ' eVector3'}

class operator eVector3.Add( const a: eVector3; const b: eVector3 ): eVector3;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
end;

class operator eVector3.Add( const a: eVector3; const b: extended ): eVector3;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
end;

class operator eVector3.Add( const a: eVector3; const b: array of extended ): eVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
end;

class operator eVector3.Add( const a: array of extended; const b: eVector3 ): eVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
end;

class function eVector3.Create( const X: extended; const Y: extended; const Z: extended ): eVector3;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function eVector3.cross( const a: eVector3 ): eVector3;
begin
  Result.X := (Self.Y * A.Z) - (Self.Z * A.Y);
  Result.Y := (Self.Z * A.X) - (Self.X * A.Z);
  Result.Z := (Self.X * A.Y) - (Self.Y * A.X);
end;

class operator eVector3.Divide( const a: eVector3; const b: eVector3 ): eVector3;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
end;

class operator eVector3.Divide( const a: eVector3; const b: extended ): eVector3;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
end;

class operator eVector3.Divide( const a: eVector3; const b: array of extended ): eVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
end;

class operator eVector3.Divide( const a: array of extended; const b: eVector3 ): eVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
end;

function eVector3.dot( const a: eVector3 ): extended;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z);
end;

class operator eVector3.Explicit( const a: eVector2 ): eVector3;
begin
  {$hints off} Move(a,Result,sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator eVector3.Explicit( const a: eVector3 ): eVector2;
begin
  {$hints off} Move(a,Result,sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector3.Implicit( const a: eVector2 ): eVector3;
begin
  {$hints off} Move(a,Result,sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
end;

class operator eVector3.Implicit( const a: eVector3 ): eVector2;
begin
  {$hints off} Move(a,Result,sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector3.Implicit( const a: array of extended ): eVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(extended)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector3.Explicit( const a: array of extended ): eVector3;
var
  L: uint32;
begin
  L := Length(a);
  if (L>3) or (L=0) then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(extended)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

function eVector3.magnitude: extended;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
end;

class operator eVector3.Multiply( const a: eVector3; const b: array of extended ): eVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
end;

class operator eVector3.Multiply( const a: array of extended; const b: eVector3 ): eVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
end;

class operator eVector3.Multiply( const a: eVector3; const b: eVector3 ): eVector3;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
end;

class operator eVector3.Multiply( const a: eVector3; const b: extended ): eVector3;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
end;

function eVector3.normalized: eVector3;
var
  M: extended;
begin
  M := Self.magnitude;
  if M=0 then begin
    Result := Self;
    exit;
  end;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
end;

class operator eVector3.Subtract( const a: eVector3; const b: array of extended ): eVector3;
begin
  if length(b)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
end;

class operator eVector3.Subtract( const a: array of extended; const b: eVector3 ): eVector3;
begin
  if length(a)<>3 then begin
    raise
      EInvalidArrayLength3.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
end;

class operator eVector3.Subtract( const a: eVector3; const b: extended ): eVector3;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
end;

function eVector3.UnitVector: eVector3;
var
   fMagnitude: extended;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
end;

class operator eVector3.Subtract( const a: eVector3; const b: eVector3 ): eVector3;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
end;

{$endregion}

{$region ' hVector4'}

class operator hVector4.Add( const a: hVector4; const b: hVector4 ): hVector4;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
  Result.W := A.W + B.W;
end;

class operator hVector4.Add( const a: hVector4; const b: half ): hVector4;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
  Result.W := A.W + B;
end;

class operator hVector4.Add( const a: hVector4; const b: array of half ): hVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
  Result.W := a.W + b[3];
end;

class operator hVector4.Add( const a: array of half; const b: hVector4 ): hVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
  Result.W := a[3] + b.W;
end;

class function hVector4.Create( const X: half; const Y: half; const Z: half; const W: half ): hVector4;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
  Result.W := W;
end;

class operator hVector4.Divide( const a: hVector4; const b: hVector4 ): hVector4;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
  Result.W := A.W / B.W;
end;

class operator hVector4.Divide( const a: hVector4; const b: half ): hVector4;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
  Result.W := A.W / B;
end;

class operator hVector4.Divide( const a: hVector4; const b: array of half ): hVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
  Result.W := a.W / b[3];
end;

class operator hVector4.Divide( const a: array of half; const b: hVector4 ): hVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
  Result.W := a[3] / b.W;
end;

function hVector4.dot( const a: hVector4 ): half;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z) + (Self.W * A.W);
end;

function hVector4.magnitude: half;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
end;

class operator hVector4.Multiply( const a: hVector4; const b: array of half ): hVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
  Result.W := a.W * b[3];
end;

class operator hVector4.Multiply( const a: array of half; const b: hVector4 ): hVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
  Result.W := a[3] * b.W;
end;

class operator hVector4.Multiply( const a: hVector4; const b: hVector4 ): hVector4;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
  Result.W := A.W * B.W;
end;

class operator hVector4.Multiply( const a: hVector4; const b: half ): hVector4;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
  Result.W := A.W * B;
end;

function hVector4.normalized: hVector4;
var
  M: half;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
  Result.W := W / M;
end;

class operator hVector4.Subtract( const a: hVector4; const b: array of half ): hVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
  Result.W := a.W - b[3];
end;

class operator hVector4.Subtract( const a: array of half; const b: hVector4 ): hVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
  Result.W := a[3] - b.W;
end;

class operator hVector4.Subtract( const a: hVector4; const b: half ): hVector4;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
  Result.W := A.W - B;
end;

function hVector4.UnitVector: hVector4;
var
   fMagnitude: half;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
  Result.W := W / fMagnitude;
end;

class operator hVector4.Subtract( const a: hVector4; const b: hVector4 ): hVector4;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
  Result.W := A.W - B.W;
end;

class operator hVector4.Explicit( const a: hVector3 ): hVector4;
begin
  {$hints off} Move(a,Result,sizeof(hVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator hVector4.Explicit( const a: hVector2 ): hVector4;
begin
  {$hints off} Move(a,Result,Sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator hVector4.Implicit( const a: hVector3 ): hVector4;
begin
  {$hints off} Move(a,Result,sizeof(hVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator hVector4.Implicit( const a: hVector2 ): hVector4;
begin
  {$hints off} Move(a,Result,sizeof(hVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator hVector4.Explicit( const a: hVector4 ): hVector3;
begin
  {$hints off} Move(a,Result,sizeof(hVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector4.Explicit( const a: hVector4 ): hVector2;
begin
  {$hints off} Move(a,Result,sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector4.Implicit( const a: hVector4 ): hVector3;
begin
  {$hints off} Move(a,Result,sizeof(hVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector4.Implicit( const a: hVector4 ): hVector2;
begin
  {$hints off} Move(a,Result,sizeof(hVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector4.Implicit( const a: array of half ): hVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(half)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator hVector4.Explicit( const a: array of half ): hVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(half)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

{$endregion}

{$region ' sVector4'}

class operator sVector4.Add( const a: sVector4; const b: sVector4 ): sVector4;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
  Result.W := A.W + B.W;
end;

class operator sVector4.Add( const a: sVector4; const b: single ): sVector4;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
  Result.W := A.W + B;
end;

class operator sVector4.Add( const a: sVector4; const b: array of single ): sVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
  Result.W := a.W + b[3];
end;

class operator sVector4.Add( const a: array of single; const b: sVector4 ): sVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
  Result.W := a[3] + b.W;
end;

class function sVector4.Create( const X: single; const Y: single; const Z: single; const W: single ): sVector4;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
  Result.W := W;
end;

class operator sVector4.Divide( const a: sVector4; const b: sVector4 ): sVector4;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
  Result.W := A.W / B.W;
end;

class operator sVector4.Divide( const a: sVector4; const b: single ): sVector4;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
  Result.W := A.W / B;
end;

class operator sVector4.Divide( const a: sVector4; const b: array of single ): sVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
  Result.W := a.W / b[3];
end;

class operator sVector4.Divide( const a: array of single; const b: sVector4 ): sVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
  Result.W := a[3] / b.W;
end;

function sVector4.dot( const a: sVector4 ): single;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z) + (Self.W * A.W);
end;

function sVector4.magnitude: single;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
end;

class operator sVector4.Multiply( const a: sVector4; const b: array of single ): sVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
  Result.W := a.W * b[3];
end;

class operator sVector4.Multiply( const a: array of single; const b: sVector4 ): sVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
  Result.W := a[3] * b.W;
end;

class operator sVector4.Multiply( const a: sVector4; const b: sVector4 ): sVector4;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
  Result.W := A.W * B.W;
end;

class operator sVector4.Multiply( const a: sVector4; const b: single ): sVector4;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
  Result.W := A.W * B;
end;

function sVector4.normalized: sVector4;
var
  M: single;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
  Result.W := W / M;
end;

class operator sVector4.Subtract( const a: sVector4; const b: array of single ): sVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
  Result.W := a.W - b[3];
end;

class operator sVector4.Subtract( const a: array of single; const b: sVector4 ): sVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
  Result.W := a[3] - b.W;
end;

class operator sVector4.Subtract( const a: sVector4; const b: single ): sVector4;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
  Result.W := A.W - B;
end;

function sVector4.UnitVector: sVector4;
var
   fMagnitude: single;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
  Result.W := W / fMagnitude;
end;

class operator sVector4.Subtract( const a: sVector4; const b: sVector4 ): sVector4;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
  Result.W := A.W - B.W;
end;

class operator sVector4.Explicit( const a: sVector3 ): sVector4;
begin
  {$hints off} Move(a,Result,sizeof(sVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator sVector4.Explicit( const a: sVector2 ): sVector4;
begin
  {$hints off} Move(a,Result,Sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator sVector4.Implicit( const a: sVector3 ): sVector4;
begin
  {$hints off} Move(a,Result,sizeof(sVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator sVector4.Implicit( const a: sVector2 ): sVector4;
begin
  {$hints off} Move(a,Result,sizeof(sVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator sVector4.Explicit( const a: sVector4 ): sVector3;
begin
  {$hints off} Move(a,Result,sizeof(sVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector4.Explicit( const a: sVector4 ): sVector2;
begin
  {$hints off} Move(a,Result,sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector4.Implicit( const a: sVector4 ): sVector3;
begin
  {$hints off} Move(a,Result,sizeof(sVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector4.Implicit( const a: sVector4 ): sVector2;
begin
  {$hints off} Move(a,Result,sizeof(sVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector4.Implicit( const a: array of single ): sVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(single)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator sVector4.Explicit( const a: array of single ): sVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(single)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

{$endregion}

{$region ' dVector4'}

class operator dVector4.Add( const a: dVector4; const b: dVector4 ): dVector4;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
  Result.W := A.W + B.W;
end;

class operator dVector4.Add( const a: dVector4; const b: double ): dVector4;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
  Result.W := A.W + B;
end;

class operator dVector4.Add( const a: dVector4; const b: array of double ): dVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
  Result.W := a.W + b[3];
end;

class operator dVector4.Add( const a: array of double; const b: dVector4 ): dVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
  Result.W := a[3] + b.W;
end;

class function dVector4.Create( const X: double; const Y: double; const Z: double; const W: double ): dVector4;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
  Result.W := W;
end;

class operator dVector4.Divide( const a: dVector4; const b: dVector4 ): dVector4;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
  Result.W := A.W / B.W;
end;

class operator dVector4.Divide( const a: dVector4; const b: double ): dVector4;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
  Result.W := A.W / B;
end;

class operator dVector4.Divide( const a: dVector4; const b: array of double ): dVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
  Result.W := a.W / b[3];
end;

class operator dVector4.Divide( const a: array of double; const b: dVector4 ): dVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
  Result.W := a[3] / b.W;
end;

function dVector4.dot( const a: dVector4 ): double;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z) + (Self.W * A.W);
end;

function dVector4.magnitude: double;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
end;

class operator dVector4.Multiply( const a: dVector4; const b: array of double ): dVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
  Result.W := a.W * b[3];
end;

class operator dVector4.Multiply( const a: array of double; const b: dVector4 ): dVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
  Result.W := a[3] * b.W;
end;

class operator dVector4.Multiply( const a: dVector4; const b: dVector4 ): dVector4;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
  Result.W := A.W * B.W;
end;

class operator dVector4.Multiply( const a: dVector4; const b: double ): dVector4;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
  Result.W := A.W * B;
end;

function dVector4.normalized: dVector4;
var
  M: double;
begin
  M := Self.magnitude;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
  Result.W := W / M;
end;

class operator dVector4.Subtract( const a: dVector4; const b: array of double ): dVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
  Result.W := a.W - b[3];
end;

class operator dVector4.Subtract( const a: array of double; const b: dVector4 ): dVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
  Result.W := a[3] - b.W;
end;

class operator dVector4.Subtract( const a: dVector4; const b: double ): dVector4;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
  Result.W := A.W - B;
end;

function dVector4.UnitVector: dVector4;
var
   fMagnitude: double;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
  Result.W := W / fMagnitude;
end;

class operator dVector4.Subtract( const a: dVector4; const b: dVector4 ): dVector4;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
  Result.W := A.W - B.W;
end;

class operator dVector4.Explicit( const a: dVector3 ): dVector4;
begin
  {$hints off} Move(a,Result,sizeof(dVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator dVector4.Explicit( const a: dVector2 ): dVector4;
begin
  {$hints off} Move(a,Result,Sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator dVector4.Implicit( const a: dVector3 ): dVector4;
begin
  {$hints off} Move(a,Result,sizeof(dVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator dVector4.Implicit( const a: dVector2 ): dVector4;
begin
  {$hints off} Move(a,Result,sizeof(dVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator dVector4.Explicit( const a: dVector4 ): dVector3;
begin
  {$hints off} Move(a,Result,sizeof(dVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector4.Explicit( const a: dVector4 ): dVector2;
begin
  {$hints off} Move(a,Result,sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector4.Implicit( const a: dVector4 ): dVector3;
begin
  {$hints off} Move(a,Result,sizeof(dVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector4.Implicit( const a: dVector4 ): dVector2;
begin
  {$hints off} Move(a,Result,sizeof(dVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector4.Implicit( const a: array of double ): dVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(double)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator dVector4.Explicit( const a: array of double ): dVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(double)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

{$endregion}

{$region ' eVector4'}

class operator eVector4.Add( const a: eVector4; const b: eVector4 ): eVector4;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
  Result.W := A.W + B.W;
end;

class operator eVector4.Add( const a: eVector4; const b: extended ): eVector4;
begin
  Result.X := A.X + B;
  Result.Y := A.Y + B;
  Result.Z := A.Z + B;
  Result.W := A.W + B;
end;

class operator eVector4.Add( const a: eVector4; const b: array of extended ): eVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X + b[0];
  Result.Y := a.Y + b[1];
  Result.Z := a.Z + b[2];
  Result.W := a.W + b[3];
end;

class operator eVector4.Add( const a: array of extended; const b: eVector4 ): eVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] + b.X;
  Result.Y := a[1] + b.Y;
  Result.Z := a[2] + b.Z;
  Result.W := a[3] + b.W;
end;

class function eVector4.Create( const X: extended; const Y: extended; const Z: extended; const W: extended ): eVector4;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
  Result.W := W;
end;

class operator eVector4.Divide( const a: eVector4; const b: eVector4 ): eVector4;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
  Result.W := A.W / B.W;
end;

class operator eVector4.Divide( const a: eVector4; const b: extended ): eVector4;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
  Result.W := A.W / B;
end;

class operator eVector4.Divide( const a: eVector4; const b: array of extended ): eVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X / b[0];
  Result.Y := a.Y / b[1];
  Result.Z := a.Z / b[2];
  Result.W := a.W / b[3];
end;

class operator eVector4.Divide( const a: array of extended; const b: eVector4 ): eVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] / b.X;
  Result.Y := a[1] / b.Y;
  Result.Z := a[2] / b.Z;
  Result.W := a[3] / b.W;
end;

function eVector4.dot( const a: eVector4 ): extended;
begin
  Result := (Self.X * A.X) + (Self.Y * A.Y) + (Self.Z * A.Z) + (Self.W * A.W);
end;

function eVector4.magnitude: extended;
begin
  // = Sqrt of vector dot product with self.
  Result := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
end;

class operator eVector4.Multiply( const a: eVector4; const b: array of extended ): eVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X * b[0];
  Result.Y := a.Y * b[1];
  Result.Z := a.Z * b[2];
  Result.W := a.W * b[3];
end;

class operator eVector4.Multiply( const a: array of extended; const b: eVector4 ): eVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] * b.X;
  Result.Y := a[1] * b.Y;
  Result.Z := a[2] * b.Z;
  Result.W := a[3] * b.W;
end;

class operator eVector4.Multiply( const a: eVector4; const b: eVector4 ): eVector4;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
  Result.W := A.W * B.W;
end;

class operator eVector4.Multiply( const a: eVector4; const b: extended ): eVector4;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
  Result.W := A.W * B;
end;

function eVector4.normalized: eVector4;
var
  M: extended;
begin
  M := Self.magnitude;
  if M=0 then begin
    Result := Self;
    exit;
  end;
  Result.X := X / M;
  Result.Y := Y / M;
  Result.Z := Z / M;
  Result.W := W / M;
end;

class operator eVector4.Subtract( const a: eVector4; const b: array of extended ): eVector4;
begin
  if length(b)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a.X - b[0];
  Result.Y := a.Y - b[1];
  Result.Z := a.Z - b[2];
  Result.W := a.W - b[3];
end;

class operator eVector4.Subtract( const a: array of extended; const b: eVector4 ): eVector4;
begin
  if length(a)<>4 then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  Result.X := a[0] - b.X;
  Result.Y := a[1] - b.Y;
  Result.Z := a[2] - b.Z;
  Result.W := a[3] - b.W;
end;

class operator eVector4.Subtract( const a: eVector4; const b: extended ): eVector4;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
  Result.W := A.W - B;
end;

function eVector4.UnitVector: eVector4;
var
   fMagnitude: extended;
begin
  fMagnitude := Sqrt( (X*X)+(Y*Y)+(Z*Z)+(W*W) );
  Result.X := X / fMagnitude;
  Result.Y := Y / fMagnitude;
  Result.Z := Z / fMagnitude;
  Result.W := W / fMagnitude;
end;

class operator eVector4.Subtract( const a: eVector4; const b: eVector4 ): eVector4;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
  Result.W := A.W - B.W;
end;

class operator eVector4.Explicit( const a: eVector3 ): eVector4;
begin
  {$hints off} Move(a,Result,sizeof(eVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator eVector4.Explicit( const a: eVector2 ): eVector4;
begin
  {$hints off} Move(a,Result,Sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator eVector4.Implicit( const a: eVector3 ): eVector4;
begin
  {$hints off} Move(a,Result,sizeof(eVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.W := 1;
end;

class operator eVector4.Implicit( const a: eVector2 ): eVector4;
begin
  {$hints off} Move(a,Result,sizeof(eVector3)); {$hints on} //- FPC, Result not initialized (it is)
  Result.Z := 0;
  Result.W := 1;
end;

class operator eVector4.Explicit( const a: eVector4 ): eVector3;
begin
  {$hints off} Move(a,Result,sizeof(eVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector4.Explicit( const a: eVector4 ): eVector2;
begin
  {$hints off} Move(a,Result,sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector4.Implicit( const a: eVector4 ): eVector3;
begin
  {$hints off} Move(a,Result,sizeof(eVector3)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector4.Implicit( const a: eVector4 ): eVector2;
begin
  {$hints off} Move(a,Result,sizeof(eVector2)); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector4.Implicit( const a: array of extended ): eVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(extended)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

class operator eVector4.Explicit( const a: array of extended ): eVector4;
var
  L: uint32;
begin
  L := Length(a);
  if (L>4) or (L=0) then begin
    raise
      EInvalidArrayLength4.Create;
  end;
  {$hints off} Move(A[0],Result,sizeof(extended)*L); {$hints on} //- FPC, Result not initialized (it is)
end;

{$endregion}

{$region ' hMatrix2x2'}

class operator hMatrix2x2.Add( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
end;

class operator hMatrix2x2.Add( const a: hMatrix2x2; const b: half ): hMatrix2x2;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
end;

function hMatrix2x2.adjugate: hMatrix2x2;
begin
  Result.m00 := m11;
  Result.m01 := 0-m01;
  Result.m10 := 0-m10;
  Result.m11 := m00;
end;

function hMatrix2x2.cofactor: hMatrix2x2;
begin
  Result.m00 := m11;
  Result.m10 := 0-m01;
  Result.m01 := 0-m10;
  Result.m11 := m00;
end;

class function hMatrix2x2.Create( const _m00: half; const _m10: half; const _m01: half; const _m11: half ): hMatrix2x2;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m01 := _m01;
  Result.m11 := _m11;
end;

function hMatrix2x2.determinant: half;
begin
  Result := (m00 * m11) - (m01 * m10);
end;

class operator hMatrix2x2.Divide( const a: hMatrix2x2; const b: half ): hMatrix2x2;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
end;

class operator hMatrix2x2.Divide( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
end;

function hMatrix2x2.dot( const a: hMatrix2x2 ): hMatrix2x2;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11);
end;

function hMatrix2x2.dot( const a: hVector2 ): hVector2;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y);
  Result.Y := (m01 * A.X) + (m11 * A.Y);
end;

class function hMatrix2x2.identity: hMatrix2x2;
begin
  Result := hMatrix2x2.Create
  (
     1, 0,
     0, 1
  );
end;

function hMatrix2x2.inverse: hMatrix2x2;
var
  D: half;
begin
  // Get determinant.
  D := 1 / ((m00 * m11) - (m01 * m10));
  // Adjugate and inverse.
  Result.m00 := m11*D;
  Result.m01 := 0-m01*D;
  Result.m10 := 0-m10*D;
  Result.m11 := m00*D;
end;

class operator hMatrix2x2.Multiply( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
end;

class operator hMatrix2x2.Multiply( const a: hMatrix2x2; const b: half ): hMatrix2x2;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
end;

class function hMatrix2x2.rotation( const degrees: half ): hMatrix2x2;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix2x2.Create(
    cos(d), -sin(d),
    sin(d), cos(d)
  );
end;

class function hMatrix2x2.scale( const s: hVector2 ): hMatrix2x2;
begin
  Result := hMatrix2x2.Create(
   s.X, 0,
   0,   s.Y
  );
end;

class operator hMatrix2x2.Subtract( const a: hMatrix2x2; const b: half ): hMatrix2x2;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
end;

class function hMatrix2x2.translation( const t: hVector2 ): hMatrix2x2;
begin
  Result := hMatrix2x2.Create(
    1, t.X,
    0, t.Y
  );
end;

function hMatrix2x2.transpose: hMatrix2x2;
begin
  Result := hMatrix2x2.Create(
   m00, m01,
   m10, m11
  );
end;

class operator hMatrix2x2.Subtract( const a: hMatrix2x2; const b: hMatrix2x2 ): hMatrix2x2;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
end;

{$endregion}

{$region ' sMatrix2x2'}

class operator sMatrix2x2.Add( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
end;

class operator sMatrix2x2.Add( const a: sMatrix2x2; const b: single ): sMatrix2x2;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
end;

function sMatrix2x2.adjugate: sMatrix2x2;
begin
  Result.m00 := m11;
  Result.m01 := 0-m01;
  Result.m10 := 0-m10;
  Result.m11 := m00;
end;

function sMatrix2x2.cofactor: sMatrix2x2;
begin
  Result.m00 := m11;
  Result.m10 := 0-m01;
  Result.m01 := 0-m10;
  Result.m11 := m00;
end;

class function sMatrix2x2.Create( const _m00: single; const _m10: single; const _m01: single; const _m11: single ): sMatrix2x2;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m01 := _m01;
  Result.m11 := _m11;
end;

function sMatrix2x2.determinant: single;
begin
  Result := (m00 * m11) - (m01 * m10);
end;

class operator sMatrix2x2.Divide( const a: sMatrix2x2; const b: single ): sMatrix2x2;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
end;

class operator sMatrix2x2.Divide( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
end;

function sMatrix2x2.dot( const a: sMatrix2x2 ): sMatrix2x2;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11);
end;

function sMatrix2x2.dot( const a: sVector2 ): sVector2;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y);
  Result.Y := (m01 * A.X) + (m11 * A.Y);
end;

class function sMatrix2x2.identity: sMatrix2x2;
begin
  Result := sMatrix2x2.Create
  (
     1, 0,
     0, 1
  );
end;

function sMatrix2x2.inverse: sMatrix2x2;
var
  D: single;
begin
  // Get determinant.
  D := 1 / ((m00 * m11) - (m01 * m10));
  // Adjugate and inverse.
  Result.m00 := m11*D;
  Result.m01 := 0-m01*D;
  Result.m10 := 0-m10*D;
  Result.m11 := m00*D;
end;

class operator sMatrix2x2.Multiply( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
end;

class operator sMatrix2x2.Multiply( const a: sMatrix2x2; const b: single ): sMatrix2x2;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
end;

class function sMatrix2x2.rotation( const degrees: single ): sMatrix2x2;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix2x2.Create(
    cos(d), -sin(d),
    sin(d), cos(d)
  );
end;

class function sMatrix2x2.scale( const s: sVector2 ): sMatrix2x2;
begin
  Result := sMatrix2x2.Create(
   s.X, 0,
   0,   s.Y
  );
end;

class operator sMatrix2x2.Subtract( const a: sMatrix2x2; const b: single ): sMatrix2x2;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
end;

class function sMatrix2x2.translation( const t: sVector2 ): sMatrix2x2;
begin
  Result := sMatrix2x2.Create(
    1, t.X,
    0, t.Y
  );
end;

function sMatrix2x2.transpose: sMatrix2x2;
begin
  Result := sMatrix2x2.Create(
   m00, m01,
   m10, m11
  );
end;

class operator sMatrix2x2.Subtract( const a: sMatrix2x2; const b: sMatrix2x2 ): sMatrix2x2;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
end;

{$endregion}

{$region ' dMatrix2x2'}

class operator dMatrix2x2.Add( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
end;

class operator dMatrix2x2.Add( const a: dMatrix2x2; const b: double ): dMatrix2x2;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
end;

function dMatrix2x2.adjugate: dMatrix2x2;
begin
  Result.m00 := m11;
  Result.m01 := 0-m01;
  Result.m10 := 0-m10;
  Result.m11 := m00;
end;

function dMatrix2x2.cofactor: dMatrix2x2;
begin
  Result.m00 := m11;
  Result.m10 := 0-m01;
  Result.m01 := 0-m10;
  Result.m11 := m00;
end;

class function dMatrix2x2.Create( const _m00: double; const _m10: double; const _m01: double; const _m11: double ): dMatrix2x2;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m01 := _m01;
  Result.m11 := _m11;
end;

function dMatrix2x2.determinant: double;
begin
  Result := (m00 * m11) - (m01 * m10);
end;

class operator dMatrix2x2.Divide( const a: dMatrix2x2; const b: double ): dMatrix2x2;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
end;

class operator dMatrix2x2.Divide( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
end;

function dMatrix2x2.dot( const a: dMatrix2x2 ): dMatrix2x2;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11);
end;

function dMatrix2x2.dot( const a: dVector2 ): dVector2;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y);
  Result.Y := (m01 * A.X) + (m11 * A.Y);
end;

class function dMatrix2x2.identity: dMatrix2x2;
begin
  Result := dMatrix2x2.Create
  (
     1, 0,
     0, 1
  );
end;

function dMatrix2x2.inverse: dMatrix2x2;
var
  D: double;
begin
  // Get determinant.
  D := 1 / ((m00 * m11) - (m01 * m10));
  // Adjugate and inverse.
  Result.m00 := m11*D;
  Result.m01 := 0-m01*D;
  Result.m10 := 0-m10*D;
  Result.m11 := m00*D;
end;

class operator dMatrix2x2.Multiply( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
end;

class operator dMatrix2x2.Multiply( const a: dMatrix2x2; const b: double ): dMatrix2x2;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
end;

class function dMatrix2x2.rotation( const degrees: double ): dMatrix2x2;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix2x2.Create(
    cos(d), -sin(d),
    sin(d), cos(d)
  );
end;

class function dMatrix2x2.scale( const s: dVector2 ): dMatrix2x2;
begin
  Result := dMatrix2x2.Create(
   s.X, 0,
   0,   s.Y
  );
end;

class operator dMatrix2x2.Subtract( const a: dMatrix2x2; const b: double ): dMatrix2x2;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
end;

class function dMatrix2x2.translation( const t: dVector2 ): dMatrix2x2;
begin
  Result := dMatrix2x2.Create(
    1, t.X,
    0, t.Y
  );
end;

function dMatrix2x2.transpose: dMatrix2x2;
begin
  Result := dMatrix2x2.Create(
   m00, m01,
   m10, m11
  );
end;

class operator dMatrix2x2.Subtract( const a: dMatrix2x2; const b: dMatrix2x2 ): dMatrix2x2;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
end;

{$endregion}

{$region ' eMatrix2x2'}

class operator eMatrix2x2.Add( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
end;

class operator eMatrix2x2.Add( const a: eMatrix2x2; const b: extended ): eMatrix2x2;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
end;

function eMatrix2x2.adjugate: eMatrix2x2;
begin
  Result.m00 := m11;
  Result.m01 := 0-m01;
  Result.m10 := 0-m10;
  Result.m11 := m00;
end;

function eMatrix2x2.cofactor: eMatrix2x2;
begin
  Result.m00 := m11;
  Result.m10 := 0-m01;
  Result.m01 := 0-m10;
  Result.m11 := m00;
end;

class function eMatrix2x2.Create( const _m00: extended; const _m10: extended; const _m01: extended; const _m11: extended ): eMatrix2x2;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m01 := _m01;
  Result.m11 := _m11;
end;

function eMatrix2x2.determinant: extended;
begin
  Result := (m00 * m11) - (m01 * m10);
end;

class operator eMatrix2x2.Divide( const a: eMatrix2x2; const b: extended ): eMatrix2x2;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
end;

class operator eMatrix2x2.Divide( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
end;

function eMatrix2x2.dot( const a: eMatrix2x2 ): eMatrix2x2;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11);
end;

function eMatrix2x2.dot( const a: eVector2 ): eVector2;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y);
  Result.Y := (m01 * A.X) + (m11 * A.Y);
end;

class function eMatrix2x2.identity: eMatrix2x2;
begin
  Result := eMatrix2x2.Create
  (
     1, 0,
     0, 1
  );
end;

function eMatrix2x2.inverse: eMatrix2x2;
var
  D: extended;
begin
  // Get determinant.
  D := 1 / ((m00 * m11) - (m01 * m10));
  // Adjugate and inverse.
  Result.m00 := m11*D;
  Result.m01 := 0-m01*D;
  Result.m10 := 0-m10*D;
  Result.m11 := m00*D;
end;

class operator eMatrix2x2.Multiply( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
end;

class operator eMatrix2x2.Multiply( const a: eMatrix2x2; const b: extended ): eMatrix2x2;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
end;

class function eMatrix2x2.rotation( const degrees: extended ): eMatrix2x2;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix2x2.Create(
    cos(d), -sin(d),
    sin(d), cos(d)
  );
end;

class function eMatrix2x2.scale( const s: eVector2 ): eMatrix2x2;
begin
  Result := eMatrix2x2.Create(
   s.X, 0,
   0,   s.Y
  );
end;

class operator eMatrix2x2.Subtract( const a: eMatrix2x2; const b: extended ): eMatrix2x2;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
end;

class function eMatrix2x2.translation( const t: eVector2 ): eMatrix2x2;
begin
  Result := eMatrix2x2.Create(
    1, t.X,
    0, t.Y
  );
end;

function eMatrix2x2.transpose: eMatrix2x2;
begin
  Result := eMatrix2x2.Create(
   m00, m01,
   m10, m11
  );
end;

class operator eMatrix2x2.Subtract( const a: eMatrix2x2; const b: eMatrix2x2 ): eMatrix2x2;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
end;

{$endregion}

{$region ' hMatrix3x3'}

class operator hMatrix3x3.Add( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
end;

class operator hMatrix3x3.Add( const a: hMatrix3x3; const b: half ): hMatrix3x3;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
end;

function hMatrix3x3.adjugate: hMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor and transpose.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m01 := (0 - ((m01*m22) - (m21*m02)));
  Result.m02 := ((m01*m12) - (m11*m02));
  Result.m10 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m12 := (0 - ((m00*m12) - (m10*m02)));
  Result.m20 := ((m10*m21) - (m20*m11));
  Result.m21 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

function hMatrix3x3.cofactor: hMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m10 := (0 - ((m01*m22) - (m21*m02)));
  Result.m20 := ((m01*m12) - (m11*m02));
  Result.m01 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m21 := (0 - ((m00*m12) - (m10*m02)));
  Result.m02 := ((m10*m21) - (m20*m11));
  Result.m12 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

class function hMatrix3x3.Create( const _m00: half; const _m10: half; const _m20: half; const _m01: half; const _m11: half; const _m21: half; const _m02: half; const _m12: half; const _m22: half ): hMatrix3x3;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
end;

function hMatrix3x3.determinant: half;
begin
  Result := ((m00*m11*m22) + (m10*m21*m02) + (m20*m01*m12)) -
            ((m02*m11*m20) + (m12*m21*m00) + (m22*m01*m10));
end;

class operator hMatrix3x3.Divide( const a: hMatrix3x3; const b: half ): hMatrix3x3;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
end;

class operator hMatrix3x3.Divide( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
end;

function hMatrix3x3.dot( const a: hMatrix3x3 ): hMatrix3x3;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22);
end;

function hMatrix3x3.dot( const a: hVector3 ): hVector3;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z);
end;

class function hMatrix3x3.identity: hMatrix3x3;
begin
  Result := hMatrix3x3.Create
  (
     1, 0, 0,
     0, 1, 0,
     0, 0, 1
  );
end;

function hMatrix3x3.inverse: hMatrix3x3;
var
  D: half;
begin
  //- Calculate determinant
  D := 1 / (((m00 * m11 * m22)    +
             (m10 * m21 * m02)    +
             ( m20 * m01 * m12 )) -
             ((m02 * m11 * m20)   +
             ( m12 * m21 * m00 )  +
             ( m22 * m01 * m10 )));
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  Result.m00 := ((m11*m22) - (m12*m21)) * D;
  Result.m01 := (0 - ((m01*m22) - (m21*m02))) * D;
  Result.m02 := ((m01*m12) - (m11*m02)) * D;
  Result.m10 := (0 - ((m10*m22) - (m20*m12))) * D;
  Result.m11 := ((m00*m22) - (m20*m02)) * D;
  Result.m12 := (0 - ((m00*m12) - (m10*m02))) * D;
  Result.m20 := ((m10*m21) - (m20*m11)) * D;
  Result.m21 := (0 - ((m00*m21) - (m20*m01))) * D;
  Result.m22 := ((m00*m11) - (m10*m01)) * D;
end;

class operator hMatrix3x3.Multiply( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
end;

class operator hMatrix3x3.Multiply( const a: hMatrix3x3; const b: half ): hMatrix3x3;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
end;

class function hMatrix3x3.rotationX( const degrees: half ): hMatrix3x3;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix3x3.Create(
    1,  0,             0,
    0,  cos(d),  -sin(d),
    0,  sin(d),   cos(d)
  );
end;

class function hMatrix3x3.rotationY( const degrees: half ): hMatrix3x3;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix3x3.Create(
    cos(d),   0,  sin(d),
    0,        1,       0,
    -sin(d),  0,  cos(d)
  );
end;

class function hMatrix3x3.rotationZ( const degrees: half ): hMatrix3x3;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix3x3.Create(
    cos(d), -sin(d),  0,
    sin(d), cos(d),   0,
    0,            0,  1
  );
end;

class function hMatrix3x3.scale( const s: hVector3 ): hMatrix3x3;
begin
  Result := hMatrix3x3.Create(
   s.X, 0,   0,
   0,   s.Y, 0,
   0,   0,   s.Z
  );
end;

class operator hMatrix3x3.Subtract( const a: hMatrix3x3; const b: half ): hMatrix3x3;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
end;

class function hMatrix3x3.translation( const t: hVector3 ): hMatrix3x3;
begin
  Result := hMatrix3x3.Create(
    1, 0, t.X,
    0, 1, t.Y,
    0, 0, t.Z
  );
end;

function hMatrix3x3.transpose: hMatrix3x3;
begin
  Result := hMatrix3x3.Create(
   m00, m01, m02,
   m10, m11, m12,
   m20, m21, m22
  );
end;

class operator hMatrix3x3.Subtract( const a: hMatrix3x3; const b: hMatrix3x3 ): hMatrix3x3;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
end;


{$endregion}

{$region ' sMatrix3x3'}

class operator sMatrix3x3.Add( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
end;

class operator sMatrix3x3.Add( const a: sMatrix3x3; const b: single ): sMatrix3x3;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
end;

function sMatrix3x3.adjugate: sMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor and transpose.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m01 := (0 - ((m01*m22) - (m21*m02)));
  Result.m02 := ((m01*m12) - (m11*m02));
  Result.m10 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m12 := (0 - ((m00*m12) - (m10*m02)));
  Result.m20 := ((m10*m21) - (m20*m11));
  Result.m21 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

function sMatrix3x3.cofactor: sMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m10 := (0 - ((m01*m22) - (m21*m02)));
  Result.m20 := ((m01*m12) - (m11*m02));
  Result.m01 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m21 := (0 - ((m00*m12) - (m10*m02)));
  Result.m02 := ((m10*m21) - (m20*m11));
  Result.m12 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

class function sMatrix3x3.Create( const _m00: single; const _m10: single; const _m20: single; const _m01: single; const _m11: single; const _m21: single; const _m02: single; const _m12: single; const _m22: single ): sMatrix3x3;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
end;

function sMatrix3x3.determinant: single;
begin
  Result := ((m00*m11*m22) + (m10*m21*m02) + (m20*m01*m12)) -
            ((m02*m11*m20) + (m12*m21*m00) + (m22*m01*m10));
end;

class operator sMatrix3x3.Divide( const a: sMatrix3x3; const b: single ): sMatrix3x3;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
end;

class operator sMatrix3x3.Divide( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
end;

function sMatrix3x3.dot( const a: sMatrix3x3 ): sMatrix3x3;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22);
end;

function sMatrix3x3.dot( const a: sVector3 ): sVector3;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z);
end;

class function sMatrix3x3.identity: sMatrix3x3;
begin
  Result := sMatrix3x3.Create
  (
     1, 0, 0,
     0, 1, 0,
     0, 0, 1
  );
end;

function sMatrix3x3.inverse: sMatrix3x3;
var
  D: single;
begin
  //- Calculate determinant
  D := 1 / (((m00 * m11 * m22)    +
             (m10 * m21 * m02)    +
             ( m20 * m01 * m12 )) -
             ((m02 * m11 * m20)   +
             ( m12 * m21 * m00 )  +
             ( m22 * m01 * m10 )));
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  Result.m00 := ((m11*m22) - (m12*m21)) * D;
  Result.m01 := (0 - ((m01*m22) - (m21*m02))) * D;
  Result.m02 := ((m01*m12) - (m11*m02)) * D;
  Result.m10 := (0 - ((m10*m22) - (m20*m12))) * D;
  Result.m11 := ((m00*m22) - (m20*m02)) * D;
  Result.m12 := (0 - ((m00*m12) - (m10*m02))) * D;
  Result.m20 := ((m10*m21) - (m20*m11)) * D;
  Result.m21 := (0 - ((m00*m21) - (m20*m01))) * D;
  Result.m22 := ((m00*m11) - (m10*m01)) * D;
end;

class operator sMatrix3x3.Multiply( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
end;

class operator sMatrix3x3.Multiply( const a: sMatrix3x3; const b: single ): sMatrix3x3;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
end;

class function sMatrix3x3.rotationX( const degrees: single ): sMatrix3x3;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix3x3.Create(
    1,  0,             0,
    0,  cos(d),  -sin(d),
    0,  sin(d),   cos(d)
  );
end;

class function sMatrix3x3.rotationY( const degrees: single ): sMatrix3x3;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix3x3.Create(
    cos(d),   0,  sin(d),
    0,        1,       0,
    -sin(d),  0,  cos(d)
  );
end;

class function sMatrix3x3.rotationZ( const degrees: single ): sMatrix3x3;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix3x3.Create(
    cos(d), -sin(d),  0,
    sin(d), cos(d),   0,
    0,            0,  1
  );
end;

class function sMatrix3x3.scale( const s: sVector3 ): sMatrix3x3;
begin
  Result := sMatrix3x3.Create(
   s.X, 0,   0,
   0,   s.Y, 0,
   0,   0,   s.Z
  );
end;

class operator sMatrix3x3.Subtract( const a: sMatrix3x3; const b: single ): sMatrix3x3;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
end;

class function sMatrix3x3.translation( const t: sVector3 ): sMatrix3x3;
begin
  Result := sMatrix3x3.Create(
    1, 0, t.X,
    0, 1, t.Y,
    0, 0, t.Z
  );
end;

function sMatrix3x3.transpose: sMatrix3x3;
begin
  Result := sMatrix3x3.Create(
   m00, m01, m02,
   m10, m11, m12,
   m20, m21, m22
  );
end;

class operator sMatrix3x3.Subtract( const a: sMatrix3x3; const b: sMatrix3x3 ): sMatrix3x3;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
end;


{$endregion}

{$region ' dMatrix3x3'}

class operator dMatrix3x3.Add( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
end;

class operator dMatrix3x3.Add( const a: dMatrix3x3; const b: double ): dMatrix3x3;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
end;

function dMatrix3x3.adjugate: dMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor and transpose.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m01 := (0 - ((m01*m22) - (m21*m02)));
  Result.m02 := ((m01*m12) - (m11*m02));
  Result.m10 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m12 := (0 - ((m00*m12) - (m10*m02)));
  Result.m20 := ((m10*m21) - (m20*m11));
  Result.m21 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

function dMatrix3x3.cofactor: dMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m10 := (0 - ((m01*m22) - (m21*m02)));
  Result.m20 := ((m01*m12) - (m11*m02));
  Result.m01 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m21 := (0 - ((m00*m12) - (m10*m02)));
  Result.m02 := ((m10*m21) - (m20*m11));
  Result.m12 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

class function dMatrix3x3.Create( const _m00: double; const _m10: double; const _m20: double; const _m01: double; const _m11: double; const _m21: double; const _m02: double; const _m12: double; const _m22: double ): dMatrix3x3;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
end;

function dMatrix3x3.determinant: double;
begin
  Result := ((m00*m11*m22) + (m10*m21*m02) + (m20*m01*m12)) -
            ((m02*m11*m20) + (m12*m21*m00) + (m22*m01*m10));
end;

class operator dMatrix3x3.Divide( const a: dMatrix3x3; const b: double ): dMatrix3x3;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
end;

class operator dMatrix3x3.Divide( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
end;

function dMatrix3x3.dot( const a: dMatrix3x3 ): dMatrix3x3;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22);
end;

function dMatrix3x3.dot( const a: dVector3 ): dVector3;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z);
end;

class function dMatrix3x3.identity: dMatrix3x3;
begin
  Result := dMatrix3x3.Create
  (
     1, 0, 0,
     0, 1, 0,
     0, 0, 1
  );
end;

function dMatrix3x3.inverse: dMatrix3x3;
var
  D: double;
begin
  //- Calculate determinant
  D := 1 / (((m00 * m11 * m22)    +
             (m10 * m21 * m02)    +
             ( m20 * m01 * m12 )) -
             ((m02 * m11 * m20)   +
             ( m12 * m21 * m00 )  +
             ( m22 * m01 * m10 )));
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  Result.m00 := ((m11*m22) - (m12*m21)) * D;
  Result.m01 := (0 - ((m01*m22) - (m21*m02))) * D;
  Result.m02 := ((m01*m12) - (m11*m02)) * D;
  Result.m10 := (0 - ((m10*m22) - (m20*m12))) * D;
  Result.m11 := ((m00*m22) - (m20*m02)) * D;
  Result.m12 := (0 - ((m00*m12) - (m10*m02))) * D;
  Result.m20 := ((m10*m21) - (m20*m11)) * D;
  Result.m21 := (0 - ((m00*m21) - (m20*m01))) * D;
  Result.m22 := ((m00*m11) - (m10*m01)) * D;
end;

class operator dMatrix3x3.Multiply( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
end;

class operator dMatrix3x3.Multiply( const a: dMatrix3x3; const b: double ): dMatrix3x3;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
end;

class function dMatrix3x3.rotationX( const degrees: double ): dMatrix3x3;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix3x3.Create(
    1,  0,             0,
    0,  cos(d),  -sin(d),
    0,  sin(d),   cos(d)
  );
end;

class function dMatrix3x3.rotationY( const degrees: double ): dMatrix3x3;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix3x3.Create(
    cos(d),   0,  sin(d),
    0,        1,       0,
    -sin(d),  0,  cos(d)
  );
end;

class function dMatrix3x3.rotationZ( const degrees: double ): dMatrix3x3;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix3x3.Create(
    cos(d), -sin(d),  0,
    sin(d), cos(d),   0,
    0,            0,  1
  );
end;

class function dMatrix3x3.scale( const s: dVector3 ): dMatrix3x3;
begin
  Result := dMatrix3x3.Create(
   s.X, 0,   0,
   0,   s.Y, 0,
   0,   0,   s.Z
  );
end;

class operator dMatrix3x3.Subtract( const a: dMatrix3x3; const b: double ): dMatrix3x3;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
end;

class function dMatrix3x3.translation( const t: dVector3 ): dMatrix3x3;
begin
  Result := dMatrix3x3.Create(
    1, 0, t.X,
    0, 1, t.Y,
    0, 0, t.Z
  );
end;

function dMatrix3x3.transpose: dMatrix3x3;
begin
  Result := dMatrix3x3.Create(
   m00, m01, m02,
   m10, m11, m12,
   m20, m21, m22
  );
end;

class operator dMatrix3x3.Subtract( const a: dMatrix3x3; const b: dMatrix3x3 ): dMatrix3x3;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
end;


{$endregion}

{$region ' eMatrix3x3'}

class operator eMatrix3x3.Add( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
end;

class operator eMatrix3x3.Add( const a: eMatrix3x3; const b: extended ): eMatrix3x3;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
end;

function eMatrix3x3.adjugate: eMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor and transpose.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m01 := (0 - ((m01*m22) - (m21*m02)));
  Result.m02 := ((m01*m12) - (m11*m02));
  Result.m10 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m12 := (0 - ((m00*m12) - (m10*m02)));
  Result.m20 := ((m10*m21) - (m20*m11));
  Result.m21 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

function eMatrix3x3.cofactor: eMatrix3x3;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 := ((m11*m22) - (m12*m21));
  Result.m10 := (0 - ((m01*m22) - (m21*m02)));
  Result.m20 := ((m01*m12) - (m11*m02));
  Result.m01 := (0 - ((m10*m22) - (m20*m12)));
  Result.m11 := ((m00*m22) - (m20*m02));
  Result.m21 := (0 - ((m00*m12) - (m10*m02)));
  Result.m02 := ((m10*m21) - (m20*m11));
  Result.m12 := (0 - ((m00*m21) - (m20*m01)));
  Result.m22 := ((m00*m11) - (m10*m01));
end;

class function eMatrix3x3.Create( const _m00: extended; const _m10: extended; const _m20: extended; const _m01: extended; const _m11: extended; const _m21: extended; const _m02: extended; const _m12: extended; const _m22: extended ): eMatrix3x3;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
end;

function eMatrix3x3.determinant: extended;
begin
  Result := ((m00*m11*m22) + (m10*m21*m02) + (m20*m01*m12)) -
            ((m02*m11*m20) + (m12*m21*m00) + (m22*m01*m10));
end;

class operator eMatrix3x3.Divide( const a: eMatrix3x3; const b: extended ): eMatrix3x3;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
end;

class operator eMatrix3x3.Divide( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
end;

function eMatrix3x3.dot( const a: eMatrix3x3 ): eMatrix3x3;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22);
end;

function eMatrix3x3.dot( const a: eVector3 ): eVector3;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z);
end;

class function eMatrix3x3.identity: eMatrix3x3;
begin
  Result := eMatrix3x3.Create
  (
     1, 0, 0,
     0, 1, 0,
     0, 0, 1
  );
end;

function eMatrix3x3.inverse: eMatrix3x3;
var
  D: extended;
begin
  //- Calculate determinant
  D := 1 / (((m00 * m11 * m22)    +
             (m10 * m21 * m02)    +
             ( m20 * m01 * m12 )) -
             ((m02 * m11 * m20)   +
             ( m12 * m21 * m00 )  +
             ( m22 * m01 * m10 )));
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  Result.m00 := ((m11*m22) - (m12*m21)) * D;
  Result.m01 := (0 - ((m01*m22) - (m21*m02))) * D;
  Result.m02 := ((m01*m12) - (m11*m02)) * D;
  Result.m10 := (0 - ((m10*m22) - (m20*m12))) * D;
  Result.m11 := ((m00*m22) - (m20*m02)) * D;
  Result.m12 := (0 - ((m00*m12) - (m10*m02))) * D;
  Result.m20 := ((m10*m21) - (m20*m11)) * D;
  Result.m21 := (0 - ((m00*m21) - (m20*m01))) * D;
  Result.m22 := ((m00*m11) - (m10*m01)) * D;
end;

class operator eMatrix3x3.Multiply( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
end;

class operator eMatrix3x3.Multiply( const a: eMatrix3x3; const b: extended ): eMatrix3x3;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
end;

class function eMatrix3x3.rotationX( const degrees: extended ): eMatrix3x3;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix3x3.Create(
    1,  0,             0,
    0,  cos(d),  -sin(d),
    0,  sin(d),   cos(d)
  );
end;

class function eMatrix3x3.rotationY( const degrees: extended ): eMatrix3x3;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix3x3.Create(
    cos(d),   0,  sin(d),
    0,        1,       0,
    -sin(d),  0,  cos(d)
  );
end;

class function eMatrix3x3.rotationZ( const degrees: extended ): eMatrix3x3;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix3x3.Create(
    cos(d), -sin(d),  0,
    sin(d), cos(d),   0,
    0,            0,  1
  );
end;

class function eMatrix3x3.scale( const s: eVector3 ): eMatrix3x3;
begin
  Result := eMatrix3x3.Create(
   s.X, 0,   0,
   0,   s.Y, 0,
   0,   0,   s.Z
  );
end;

class operator eMatrix3x3.Subtract( const a: eMatrix3x3; const b: extended ): eMatrix3x3;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
end;

class function eMatrix3x3.translation( const t: eVector3 ): eMatrix3x3;
begin
  Result := eMatrix3x3.Create(
    1, 0, t.X,
    0, 1, t.Y,
    0, 0, t.Z
  );
end;

function eMatrix3x3.transpose: eMatrix3x3;
begin
  Result := eMatrix3x3.Create(
   m00, m01, m02,
   m10, m11, m12,
   m20, m21, m22
  );
end;

class operator eMatrix3x3.Subtract( const a: eMatrix3x3; const b: eMatrix3x3 ): eMatrix3x3;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
end;


{$endregion}

{$region ' hMatrix4x4'}

class operator hMatrix4x4.Add( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m30 := a.m30 + b.m30;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m31 := a.m31 + b.m31;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
  Result.m32 := a.m32 + b.m32;
  Result.m03 := a.m03 + b.m03;
  Result.m13 := a.m13 + b.m13;
  Result.m23 := a.m23 + b.m23;
  Result.m33 := a.m33 + b.m33;
end;

class operator hMatrix4x4.Add( const a: hMatrix4x4; const b: half ): hMatrix4x4;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m30 := a.m30 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m31 := a.m31 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
  Result.m32 := a.m32 + b;
  Result.m03 := a.m03 + b;
  Result.m13 := a.m13 + b;
  Result.m23 := a.m23 + b;
  Result.m33 := a.m33 + b;
end;

function hMatrix4x4.adjugate: hMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m01 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m02 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m03 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m10 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m12 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m13 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m20 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m21 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m23 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m30 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m31 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m32 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

function hMatrix4x4.cofactor: hMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m10 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m20 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m30 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m01 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m21 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m31 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m02 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m12 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m32 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m03 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m13 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m23 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

class function hMatrix4x4.Create( const _m00: half; const _m10: half; const _m20: half; const _m30: half; const _m01: half; const _m11: half; const _m21: half; const _m31: half; const _m02: half; const _m12: half; const _m22: half; const _m32: half; const _m03: half; const _m13: half; const _m23: half; const _m33: half ): hMatrix4x4;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m30 := _m30;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m31 := _m31;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
  Result.m32 := _m32;
  Result.m03 := _m03;
  Result.m13 := _m13;
  Result.m23 := _m23;
  Result.m33 := _m33;
end;

class function hMatrix4x4.Create( const Row0: hVector4; const Row1: hVector4; const Row2: hVector4; const Row3: hVector4 ): hMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(half)*4); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(half)*4);
  Move(Row2,Result.m02,sizeof(half)*4);
  Move(Row3,Result.m03,sizeof(half)*4);
end;

class function hMatrix4x4.CreatePerspective( const angleDeg: half; const ratio: half; const _near: half; const _far: half ): hMatrix4x4;
var
  tan_half_angle: half;
begin
  tan_half_angle := tan(degtorad(angleDeg)/2);
  Result.m00 := 1 / (ratio*tan_half_angle);
  Result.m10 := 0;
  Result.m20 := 0;
  Result.m30 := 0;
  Result.m01 := 0;
  Result.m11 := 1 / tan_half_angle;
  Result.m21 := 0;
  Result.m31 := 0;
  Result.m02 := 0;
  Result.m12 := 0;
  Result.m22 := (_near+_far)/(_near-_far);
  Result.m32 := (2*_near-_far)/(_near-_far);
  Result.m03 := 0;
  Result.m13 := 0;
  Result.m23 := -1;
  Result.m33 := 0;
end;

class function hMatrix4x4.Create( const Row0: hVector3; const Row1: hVector3; const Row2: hVector3; const Row3: hVector3 ): hMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(half)*3); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(half)*3);
  Move(Row2,Result.m02,sizeof(half)*3);
  Move(Row3,Result.m03,sizeof(half)*3);
  Result.m30 := 0;
  Result.m31 := 0;
  Result.m32 := 0;
  Result.m33 := 1;
end;

class function hMatrix4x4.CreateView( const eye: hVector3; const target: hVector3; const Up: hVector3 ): hMatrix4x4;
var
  vz: hVector3;
  vx: hVector3;
  vy: hVector3;
begin
  vz := (eye-target).normalized;
  vx := up.cross(vz).normalized;
  vy := vz.cross(vx);
  Result := hMatrix4x4.Create(
              vx.X,           VY.X,           vZ.X, 0,
              vx.Y,           VY.y,           VZ.y, 0,
              vx.Z,           VY.Z,           VZ.Z, 0,
    0-(vx.dot(eye)), 0-(vy.dot(eye)), 0-(vz.dot(eye)), 1 ).transpose;
end;

function hMatrix4x4.determinant: half;
begin
  Result :=
  (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21))))  +
  (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21))))) +
  (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11))))  +
  (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)))));
end;

class operator hMatrix4x4.Divide( const a: hMatrix4x4; const b: half ): hMatrix4x4;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m30 := a.m30 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m31 := a.m31 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
  Result.m32 := a.m32 / b;
  Result.m03 := a.m03 / b;
  Result.m13 := a.m13 / b;
  Result.m23 := a.m23 / b;
  Result.m33 := a.m33 / b;
end;

class operator hMatrix4x4.Divide( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m30 := a.m30 / b.m30;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m31 := a.m31 / b.m31;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
  Result.m32 := a.m32 / b.m32;
  Result.m03 := a.m03 / b.m03;
  Result.m13 := a.m13 / b.m13;
  Result.m23 := a.m23 / b.m23;
  Result.m33 := a.m33 / b.m33;
end;

function hMatrix4x4.dot( const a: hMatrix4x4 ): hMatrix4x4;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02) + (m30 * A.m03);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12) + (m30 * A.m13);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22) + (m30 * A.m23);
  Result.m30 := (m00 * A.m30) + (m10 * A.m31) + (m20 * A.m32) + (m30 * A.m33);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02) + (m31 * A.m03);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12) + (m31 * A.m13);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22) + (m31 * A.m23);
  Result.m31 := (m01 * A.m30) + (m11 * A.m31) + (m21 * A.m32) + (m31 * A.m33);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02) + (m32 * A.m03);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12) + (m32 * A.m13);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22) + (m32 * A.m23);
  Result.m32 := (m02 * A.m30) + (m12 * A.m31) + (m22 * A.m32) + (m32 * A.m33);
  Result.m03 := (m03 * A.m00) + (m13 * A.m01) + (m23 * A.m02) + (m33 * A.m03);
  Result.m13 := (m03 * A.m10) + (m13 * A.m11) + (m23 * A.m12) + (m33 * A.m13);
  Result.m23 := (m03 * A.m20) + (m13 * A.m21) + (m23 * A.m22) + (m33 * A.m23);
  Result.m33 := (m03 * A.m30) + (m13 * A.m31) + (m23 * A.m32) + (m33 * A.m33);
end;

function hMatrix4x4.dot( const a: hVector4 ): hVector4;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z) + (m30 * A.W);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z) + (m31 * A.W);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z) + (m32 * A.W);
  Result.W := (m03 * A.X) + (m13 * A.Y) + (m23 * A.Z) + (m33 * A.W);
end;

class function hMatrix4x4.identity: hMatrix4x4;
begin
  Result := hMatrix4x4.Create
  (
     1, 0, 0, 0,
     0, 1, 0, 0,
     0, 0, 1, 0,
     0, 0, 0, 1
  );
end;

function hMatrix4x4.inverse: hMatrix4x4;
var
  D: half;
begin
  D := (
    (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))))  +
    (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))))) +
    (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))))  +
    (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11)))))
  );
  D := 1/D;
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 := D * (  (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))));
  Result.m01 := D * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))));
  Result.m02 := D * (  (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))));
  Result.m03 := D * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11))));
  Result.m10 := D * (0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30) + (m23*m32*m10)+(m33*m12*m20))));
  Result.m11 := D * (  (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30) + (m23*m32*m00)+(m33*m02*m20))));
  Result.m12 := D * (0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30) + (m13*m32*m00)+(m33*m02*m10))));
  Result.m13 := D * (  (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20) + (m13*m22*m00)+(m23*m02*m10))));
  Result.m20 := D * (  (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30) + (m23*m31*m10)+(m33*m11*m20))));
  Result.m21 := D * (0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30) + (m23*m31*m00)+(m33*m01*m20))));
  Result.m22 := D * (  (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30) + (m13*m31*m00)+(m33*m01*m10))));
  Result.m23 := D * (0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20) + (m13*m21*m00)+(m23*m01*m10))));
  Result.m30 := D * (0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30) + (m22*m31*m10)+(m32*m11*m20))));
  Result.m31 := D * (  (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30) + (m22*m31*m00)+(m32*m01*m20))));
  Result.m32 := D * (0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30) + (m13*m31*m00)+(m32*m01*m10))));
  Result.m33 := D * (  (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20) + (m12*m21*m00)+(m22*m01*m10))));
end;

class operator hMatrix4x4.Multiply( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m30 := a.m30 * b.m30;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m31 := a.m31 * b.m31;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
  Result.m32 := a.m32 * b.m32;
  Result.m03 := a.m03 * b.m03;
  Result.m13 := a.m13 * b.m13;
  Result.m23 := a.m23 * b.m23;
  Result.m33 := a.m33 * b.m33;
end;

class operator hMatrix4x4.Multiply( const a: hMatrix4x4; const b: half ): hMatrix4x4;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m30 := a.m30 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m31 := a.m31 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
  Result.m32 := a.m32 * b;
  Result.m03 := a.m03 * b;
  Result.m13 := a.m13 * b;
  Result.m23 := a.m23 * b;
  Result.m33 := a.m33 * b;
end;

class function hMatrix4x4.rotationX( const degrees: half ): hMatrix4x4;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix4x4.Create(
    1,  0,             0,  0,
    0,  cos(d),  -sin(d),  0,
    0,  sin(d),   cos(d),  0,
    0,  0,             0,  1
  );
end;

class function hMatrix4x4.rotationY( const degrees: half ): hMatrix4x4;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix4x4.Create(
    cos(d),   0,  sin(d),  0,
    0,        1,       0,  0,
    -sin(d),  0,  cos(d),  0,
    0,        0,       0,  1
  );
end;

class function hMatrix4x4.rotationZ( const degrees: half ): hMatrix4x4;
var
  d: half;
begin
  d := degrees*Pi/180;
  Result := hMatrix4x4.Create(
    cos(d), -sin(d),  0,  0,
    sin(d), cos(d),   0,  0,
    0,            0,  1,  0,
    0,            0,  0,  1
  );
end;

class function hMatrix4x4.scale( const s: hVector3 ): hMatrix4x4;
begin
  Result := hMatrix4x4.Create(
   s.X, 0,   0,   0,
   0,   s.Y, 0,   0,
   0,   0,   s.Z, 0,
   0,   0,   0,   1
  );
end;

class operator hMatrix4x4.Subtract( const a: hMatrix4x4; const b: half ): hMatrix4x4;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m30 := a.m30 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m31 := a.m31 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
  Result.m32 := a.m32 - b;
  Result.m03 := a.m03 - b;
  Result.m13 := a.m13 - b;
  Result.m23 := a.m23 - b;
  Result.m33 := a.m33 - b;
end;

class function hMatrix4x4.translation( const t: hVector3 ): hMatrix4x4;
begin
  Result := hMatrix4x4.Create(
    1, 0, 0, t.X,
    0, 1, 0, t.Y,
    0, 0, 1, t.Z,
    0, 0, 0, 1
  );
end;

function hMatrix4x4.transpose: hMatrix4x4;
begin
  Result := hMatrix4x4.Create(
   m00, m01, m02, m03,
   m10, m11, m12, m13,
   m20, m21, m22, m23,
   m30, m31, m32, m33
  );
end;

class operator hMatrix4x4.Subtract( const a: hMatrix4x4; const b: hMatrix4x4 ): hMatrix4x4;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m30 := a.m30 - b.m30;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m31 := a.m31 - b.m31;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
  Result.m32 := a.m32 - b.m32;
  Result.m03 := a.m03 - b.m03;
  Result.m13 := a.m13 - b.m13;
  Result.m23 := a.m23 - b.m23;
  Result.m33 := a.m33 - b.m33;
end;

{$endregion}

{$region ' sMatrix4x4'}

class operator sMatrix4x4.Add( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m30 := a.m30 + b.m30;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m31 := a.m31 + b.m31;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
  Result.m32 := a.m32 + b.m32;
  Result.m03 := a.m03 + b.m03;
  Result.m13 := a.m13 + b.m13;
  Result.m23 := a.m23 + b.m23;
  Result.m33 := a.m33 + b.m33;
end;

class operator sMatrix4x4.Add( const a: sMatrix4x4; const b: single ): sMatrix4x4;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m30 := a.m30 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m31 := a.m31 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
  Result.m32 := a.m32 + b;
  Result.m03 := a.m03 + b;
  Result.m13 := a.m13 + b;
  Result.m23 := a.m23 + b;
  Result.m33 := a.m33 + b;
end;

function sMatrix4x4.adjugate: sMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m01 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m02 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m03 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m10 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m12 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m13 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m20 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m21 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m23 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m30 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m31 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m32 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

function sMatrix4x4.cofactor: sMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m10 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m20 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m30 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m01 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m21 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m31 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m02 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m12 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m32 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m03 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m13 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m23 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

class function sMatrix4x4.Create( const _m00: single; const _m10: single; const _m20: single; const _m30: single; const _m01: single; const _m11: single; const _m21: single; const _m31: single; const _m02: single; const _m12: single; const _m22: single; const _m32: single; const _m03: single; const _m13: single; const _m23: single; const _m33: single ): sMatrix4x4;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m30 := _m30;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m31 := _m31;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
  Result.m32 := _m32;
  Result.m03 := _m03;
  Result.m13 := _m13;
  Result.m23 := _m23;
  Result.m33 := _m33;
end;

class function sMatrix4x4.Create( const Row0: sVector4; const Row1: sVector4; const Row2: sVector4; const Row3: sVector4 ): sMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(single)*4); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(single)*4);
  Move(Row2,Result.m02,sizeof(single)*4);
  Move(Row3,Result.m03,sizeof(single)*4);
end;

class function sMatrix4x4.CreatePerspective( const angleDeg: single; const ratio: single; const _near: single; const _far: single ): sMatrix4x4;
var
  tan_half_angle: single;
begin
  tan_half_angle := tan(degtorad(angleDeg)/2);
  Result.m00 := 1 / (ratio*tan_half_angle);
  Result.m10 := 0;
  Result.m20 := 0;
  Result.m30 := 0;
  Result.m01 := 0;
  Result.m11 := 1 / tan_half_angle;
  Result.m21 := 0;
  Result.m31 := 0;
  Result.m02 := 0;
  Result.m12 := 0;
  Result.m22 := (_near+_far)/(_near-_far);
  Result.m32 := (2*_near-_far)/(_near-_far);
  Result.m03 := 0;
  Result.m13 := 0;
  Result.m23 := -1;
  Result.m33 := 0;
end;

class function sMatrix4x4.Create( const Row0: sVector3; const Row1: sVector3; const Row2: sVector3; const Row3: sVector3 ): sMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(single)*3); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(single)*3);
  Move(Row2,Result.m02,sizeof(single)*3);
  Move(Row3,Result.m03,sizeof(single)*3);
  Result.m30 := 0;
  Result.m31 := 0;
  Result.m32 := 0;
  Result.m33 := 1;
end;

class function sMatrix4x4.CreateView( const eye: sVector3; const target: sVector3; const Up: sVector3 ): sMatrix4x4;
var
  vz: sVector3;
  vx: sVector3;
  vy: sVector3;
begin
  vz := (eye-target).normalized;
  vx := up.cross(vz).normalized;
  vy := vz.cross(vx);
  Result := sMatrix4x4.Create(
              vx.X,           VY.X,           vZ.X, 0,
              vx.Y,           VY.y,           VZ.y, 0,
              vx.Z,           VY.Z,           VZ.Z, 0,
    -(vx.dot(eye)), -(vy.dot(eye)), -(vz.dot(eye)), 1 ).transpose;
end;

function sMatrix4x4.determinant: single;
begin
  Result :=
  (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21))))  +
  (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21))))) +
  (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11))))  +
  (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)))));
end;

class operator sMatrix4x4.Divide( const a: sMatrix4x4; const b: single ): sMatrix4x4;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m30 := a.m30 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m31 := a.m31 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
  Result.m32 := a.m32 / b;
  Result.m03 := a.m03 / b;
  Result.m13 := a.m13 / b;
  Result.m23 := a.m23 / b;
  Result.m33 := a.m33 / b;
end;

class operator sMatrix4x4.Divide( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m30 := a.m30 / b.m30;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m31 := a.m31 / b.m31;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
  Result.m32 := a.m32 / b.m32;
  Result.m03 := a.m03 / b.m03;
  Result.m13 := a.m13 / b.m13;
  Result.m23 := a.m23 / b.m23;
  Result.m33 := a.m33 / b.m33;
end;

function sMatrix4x4.dot( const a: sMatrix4x4 ): sMatrix4x4;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02) + (m30 * A.m03);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12) + (m30 * A.m13);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22) + (m30 * A.m23);
  Result.m30 := (m00 * A.m30) + (m10 * A.m31) + (m20 * A.m32) + (m30 * A.m33);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02) + (m31 * A.m03);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12) + (m31 * A.m13);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22) + (m31 * A.m23);
  Result.m31 := (m01 * A.m30) + (m11 * A.m31) + (m21 * A.m32) + (m31 * A.m33);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02) + (m32 * A.m03);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12) + (m32 * A.m13);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22) + (m32 * A.m23);
  Result.m32 := (m02 * A.m30) + (m12 * A.m31) + (m22 * A.m32) + (m32 * A.m33);
  Result.m03 := (m03 * A.m00) + (m13 * A.m01) + (m23 * A.m02) + (m33 * A.m03);
  Result.m13 := (m03 * A.m10) + (m13 * A.m11) + (m23 * A.m12) + (m33 * A.m13);
  Result.m23 := (m03 * A.m20) + (m13 * A.m21) + (m23 * A.m22) + (m33 * A.m23);
  Result.m33 := (m03 * A.m30) + (m13 * A.m31) + (m23 * A.m32) + (m33 * A.m33);
end;

function sMatrix4x4.dot( const a: sVector4 ): sVector4;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z) + (m30 * A.W);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z) + (m31 * A.W);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z) + (m32 * A.W);
  Result.W := (m03 * A.X) + (m13 * A.Y) + (m23 * A.Z) + (m33 * A.W);
end;

class function sMatrix4x4.identity: sMatrix4x4;
begin
  Result := sMatrix4x4.Create
  (
     1, 0, 0, 0,
     0, 1, 0, 0,
     0, 0, 1, 0,
     0, 0, 0, 1
  );
end;

function sMatrix4x4.inverse: sMatrix4x4;
var
  D: single;
begin
  D := (
    (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))))  +
    (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))))) +
    (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))))  +
    (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11)))))
  );
  if (D=0) then begin
    exit;    // ought not be necessary, but... life isn't always fair.
  end;
  D := 1/D;
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 := D * (  (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))));
  Result.m01 := D * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))));
  Result.m02 := D * (  (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))));
  Result.m03 := D * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11))));
  Result.m10 := D * (0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30) + (m23*m32*m10)+(m33*m12*m20))));
  Result.m11 := D * (  (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30) + (m23*m32*m00)+(m33*m02*m20))));
  Result.m12 := D * (0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30) + (m13*m32*m00)+(m33*m02*m10))));
  Result.m13 := D * (  (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20) + (m13*m22*m00)+(m23*m02*m10))));
  Result.m20 := D * (  (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30) + (m23*m31*m10)+(m33*m11*m20))));
  Result.m21 := D * (0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30) + (m23*m31*m00)+(m33*m01*m20))));
  Result.m22 := D * (  (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30) + (m13*m31*m00)+(m33*m01*m10))));
  Result.m23 := D * (0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20) + (m13*m21*m00)+(m23*m01*m10))));
  Result.m30 := D * (0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30) + (m22*m31*m10)+(m32*m11*m20))));
  Result.m31 := D * (  (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30) + (m22*m31*m00)+(m32*m01*m20))));
  Result.m32 := D * (0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30) + (m13*m31*m00)+(m32*m01*m10))));
  Result.m33 := D * (  (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20) + (m12*m21*m00)+(m22*m01*m10))));
end;

class operator sMatrix4x4.Multiply( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m30 := a.m30 * b.m30;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m31 := a.m31 * b.m31;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
  Result.m32 := a.m32 * b.m32;
  Result.m03 := a.m03 * b.m03;
  Result.m13 := a.m13 * b.m13;
  Result.m23 := a.m23 * b.m23;
  Result.m33 := a.m33 * b.m33;
end;

class operator sMatrix4x4.Multiply( const a: sMatrix4x4; const b: single ): sMatrix4x4;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m30 := a.m30 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m31 := a.m31 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
  Result.m32 := a.m32 * b;
  Result.m03 := a.m03 * b;
  Result.m13 := a.m13 * b;
  Result.m23 := a.m23 * b;
  Result.m33 := a.m33 * b;
end;

class function sMatrix4x4.rotationX( const degrees: single ): sMatrix4x4;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix4x4.Create(
    1,  0,             0,  0,
    0,  cos(d),  -sin(d),  0,
    0,  sin(d),   cos(d),  0,
    0,  0,             0,  1
  );
end;

class function sMatrix4x4.rotationY( const degrees: single ): sMatrix4x4;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix4x4.Create(
    cos(d),   0,  sin(d),  0,
    0,        1,       0,  0,
    -sin(d),  0,  cos(d),  0,
    0,        0,       0,  1
  );
end;

class function sMatrix4x4.rotationZ( const degrees: single ): sMatrix4x4;
var
  d: single;
begin
  d := degrees*Pi/180;
  Result := sMatrix4x4.Create(
    cos(d), -sin(d),  0,  0,
    sin(d), cos(d),   0,  0,
    0,            0,  1,  0,
    0,            0,  0,  1
  );
end;

class function sMatrix4x4.scale( const s: sVector3 ): sMatrix4x4;
begin
  Result := sMatrix4x4.Create(
   s.X, 0,   0,   0,
   0,   s.Y, 0,   0,
   0,   0,   s.Z, 0,
   0,   0,   0,   1
  );
end;

class operator sMatrix4x4.Subtract( const a: sMatrix4x4; const b: single ): sMatrix4x4;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m30 := a.m30 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m31 := a.m31 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
  Result.m32 := a.m32 - b;
  Result.m03 := a.m03 - b;
  Result.m13 := a.m13 - b;
  Result.m23 := a.m23 - b;
  Result.m33 := a.m33 - b;
end;

class function sMatrix4x4.translation( const t: sVector3 ): sMatrix4x4;
begin
  Result := sMatrix4x4.Create(
    1, 0, 0, t.X,
    0, 1, 0, t.Y,
    0, 0, 1, t.Z,
    0, 0, 0, 1
  );
end;

function sMatrix4x4.transpose: sMatrix4x4;
begin
  Result := sMatrix4x4.Create(
   m00, m01, m02, m03,
   m10, m11, m12, m13,
   m20, m21, m22, m23,
   m30, m31, m32, m33
  );
end;

class operator sMatrix4x4.Subtract( const a: sMatrix4x4; const b: sMatrix4x4 ): sMatrix4x4;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m30 := a.m30 - b.m30;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m31 := a.m31 - b.m31;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
  Result.m32 := a.m32 - b.m32;
  Result.m03 := a.m03 - b.m03;
  Result.m13 := a.m13 - b.m13;
  Result.m23 := a.m23 - b.m23;
  Result.m33 := a.m33 - b.m33;
end;

{$endregion}

{$region ' dMatrix4x4'}

class operator dMatrix4x4.Add( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m30 := a.m30 + b.m30;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m31 := a.m31 + b.m31;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
  Result.m32 := a.m32 + b.m32;
  Result.m03 := a.m03 + b.m03;
  Result.m13 := a.m13 + b.m13;
  Result.m23 := a.m23 + b.m23;
  Result.m33 := a.m33 + b.m33;
end;

class operator dMatrix4x4.Add( const a: dMatrix4x4; const b: double ): dMatrix4x4;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m30 := a.m30 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m31 := a.m31 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
  Result.m32 := a.m32 + b;
  Result.m03 := a.m03 + b;
  Result.m13 := a.m13 + b;
  Result.m23 := a.m23 + b;
  Result.m33 := a.m33 + b;
end;

function dMatrix4x4.adjugate: dMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m01 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m02 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m03 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m10 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m12 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m13 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m20 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m21 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m23 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m30 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m31 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m32 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

function dMatrix4x4.cofactor: dMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m10 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m20 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m30 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m01 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m21 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m31 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m02 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m12 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m32 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m03 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m13 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m23 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

class function dMatrix4x4.Create( const _m00: double; const _m10: double; const _m20: double; const _m30: double; const _m01: double; const _m11: double; const _m21: double; const _m31: double; const _m02: double; const _m12: double; const _m22: double; const _m32: double; const _m03: double; const _m13: double; const _m23: double; const _m33: double ): dMatrix4x4;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m30 := _m30;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m31 := _m31;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
  Result.m32 := _m32;
  Result.m03 := _m03;
  Result.m13 := _m13;
  Result.m23 := _m23;
  Result.m33 := _m33;
end;

class function dMatrix4x4.Create( const Row0: dVector4; const Row1: dVector4; const Row2: dVector4; const Row3: dVector4 ): dMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(double)*4); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(double)*4);
  Move(Row2,Result.m02,sizeof(double)*4);
  Move(Row3,Result.m03,sizeof(double)*4);
end;

class function dMatrix4x4.CreatePerspective( const angleDeg: double; const ratio: double; const _near: double; const _far: double ): dMatrix4x4;
var
  tan_half_angle: double;
begin
  tan_half_angle := tan(degtorad(angleDeg)/2);
  Result.m00 := 1 / (ratio*tan_half_angle);
  Result.m10 := 0;
  Result.m20 := 0;
  Result.m30 := 0;
  Result.m01 := 0;
  Result.m11 := 1 / tan_half_angle;
  Result.m21 := 0;
  Result.m31 := 0;
  Result.m02 := 0;
  Result.m12 := 0;
  Result.m22 := (_near+_far)/(_near-_far);
  Result.m32 := (2*_near-_far)/(_near-_far);
  Result.m03 := 0;
  Result.m13 := 0;
  Result.m23 := -1;
  Result.m33 := 0;
end;

class function dMatrix4x4.Create( const Row0: dVector3; const Row1: dVector3; const Row2: dVector3; const Row3: dVector3 ): dMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(double)*3); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(double)*3);
  Move(Row2,Result.m02,sizeof(double)*3);
  Move(Row3,Result.m03,sizeof(double)*3);
  Result.m30 := 0;
  Result.m31 := 0;
  Result.m32 := 0;
  Result.m33 := 1;
end;

class function dMatrix4x4.CreateView( const eye: dVector3; const target: dVector3; const Up: dVector3 ): dMatrix4x4;
var
  vz: dVector3;
  vx: dVector3;
  vy: dVector3;
begin
  vz := (eye-target).normalized;
  vx := up.cross(vz).normalized;
  vy := vz.cross(vx);
  Result := dMatrix4x4.Create(
              vx.X,           VY.X,           vZ.X, 0,
              vx.Y,           VY.y,           VZ.y, 0,
              vx.Z,           VY.Z,           VZ.Z, 0,
    -(vx.dot(eye)), -(vy.dot(eye)), -(vz.dot(eye)), 1 ).transpose;
end;

function dMatrix4x4.determinant: double;
begin
  Result :=
  (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21))))  +
  (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21))))) +
  (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11))))  +
  (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)))));
end;

class operator dMatrix4x4.Divide( const a: dMatrix4x4; const b: double ): dMatrix4x4;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m30 := a.m30 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m31 := a.m31 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
  Result.m32 := a.m32 / b;
  Result.m03 := a.m03 / b;
  Result.m13 := a.m13 / b;
  Result.m23 := a.m23 / b;
  Result.m33 := a.m33 / b;
end;

class operator dMatrix4x4.Divide( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m30 := a.m30 / b.m30;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m31 := a.m31 / b.m31;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
  Result.m32 := a.m32 / b.m32;
  Result.m03 := a.m03 / b.m03;
  Result.m13 := a.m13 / b.m13;
  Result.m23 := a.m23 / b.m23;
  Result.m33 := a.m33 / b.m33;
end;

function dMatrix4x4.dot( const a: dMatrix4x4 ): dMatrix4x4;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02) + (m30 * A.m03);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12) + (m30 * A.m13);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22) + (m30 * A.m23);
  Result.m30 := (m00 * A.m30) + (m10 * A.m31) + (m20 * A.m32) + (m30 * A.m33);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02) + (m31 * A.m03);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12) + (m31 * A.m13);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22) + (m31 * A.m23);
  Result.m31 := (m01 * A.m30) + (m11 * A.m31) + (m21 * A.m32) + (m31 * A.m33);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02) + (m32 * A.m03);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12) + (m32 * A.m13);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22) + (m32 * A.m23);
  Result.m32 := (m02 * A.m30) + (m12 * A.m31) + (m22 * A.m32) + (m32 * A.m33);
  Result.m03 := (m03 * A.m00) + (m13 * A.m01) + (m23 * A.m02) + (m33 * A.m03);
  Result.m13 := (m03 * A.m10) + (m13 * A.m11) + (m23 * A.m12) + (m33 * A.m13);
  Result.m23 := (m03 * A.m20) + (m13 * A.m21) + (m23 * A.m22) + (m33 * A.m23);
  Result.m33 := (m03 * A.m30) + (m13 * A.m31) + (m23 * A.m32) + (m33 * A.m33);
end;

function dMatrix4x4.dot( const a: dVector4 ): dVector4;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z) + (m30 * A.W);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z) + (m31 * A.W);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z) + (m32 * A.W);
  Result.W := (m03 * A.X) + (m13 * A.Y) + (m23 * A.Z) + (m33 * A.W);
end;

class function dMatrix4x4.identity: dMatrix4x4;
begin
  Result := dMatrix4x4.Create
  (
     1, 0, 0, 0,
     0, 1, 0, 0,
     0, 0, 1, 0,
     0, 0, 0, 1
  );
end;

function dMatrix4x4.inverse: dMatrix4x4;
var
  D: double;
begin
  D := (
    (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))))  +
    (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))))) +
    (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))))  +
    (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11)))))
  );
  if (D=0) then begin
    exit;    // ought not be necessary, but... life isn't always fair.
  end;
  D := 1/D;
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 := D * (  (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))));
  Result.m01 := D * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))));
  Result.m02 := D * (  (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))));
  Result.m03 := D * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11))));
  Result.m10 := D * (0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30) + (m23*m32*m10)+(m33*m12*m20))));
  Result.m11 := D * (  (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30) + (m23*m32*m00)+(m33*m02*m20))));
  Result.m12 := D * (0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30) + (m13*m32*m00)+(m33*m02*m10))));
  Result.m13 := D * (  (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20) + (m13*m22*m00)+(m23*m02*m10))));
  Result.m20 := D * (  (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30) + (m23*m31*m10)+(m33*m11*m20))));
  Result.m21 := D * (0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30) + (m23*m31*m00)+(m33*m01*m20))));
  Result.m22 := D * (  (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30) + (m13*m31*m00)+(m33*m01*m10))));
  Result.m23 := D * (0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20) + (m13*m21*m00)+(m23*m01*m10))));
  Result.m30 := D * (0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30) + (m22*m31*m10)+(m32*m11*m20))));
  Result.m31 := D * (  (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30) + (m22*m31*m00)+(m32*m01*m20))));
  Result.m32 := D * (0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30) + (m13*m31*m00)+(m32*m01*m10))));
  Result.m33 := D * (  (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20) + (m12*m21*m00)+(m22*m01*m10))));
end;

class operator dMatrix4x4.Multiply( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m30 := a.m30 * b.m30;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m31 := a.m31 * b.m31;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
  Result.m32 := a.m32 * b.m32;
  Result.m03 := a.m03 * b.m03;
  Result.m13 := a.m13 * b.m13;
  Result.m23 := a.m23 * b.m23;
  Result.m33 := a.m33 * b.m33;
end;

class operator dMatrix4x4.Multiply( const a: dMatrix4x4; const b: double ): dMatrix4x4;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m30 := a.m30 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m31 := a.m31 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
  Result.m32 := a.m32 * b;
  Result.m03 := a.m03 * b;
  Result.m13 := a.m13 * b;
  Result.m23 := a.m23 * b;
  Result.m33 := a.m33 * b;
end;

class function dMatrix4x4.rotationX( const degrees: double ): dMatrix4x4;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix4x4.Create(
    1,  0,             0,  0,
    0,  cos(d),  -sin(d),  0,
    0,  sin(d),   cos(d),  0,
    0,  0,             0,  1
  );
end;

class function dMatrix4x4.rotationY( const degrees: double ): dMatrix4x4;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix4x4.Create(
    cos(d),   0,  sin(d),  0,
    0,        1,       0,  0,
    -sin(d),  0,  cos(d),  0,
    0,        0,       0,  1
  );
end;

class function dMatrix4x4.rotationZ( const degrees: double ): dMatrix4x4;
var
  d: double;
begin
  d := degrees*Pi/180;
  Result := dMatrix4x4.Create(
    cos(d), -sin(d),  0,  0,
    sin(d), cos(d),   0,  0,
    0,            0,  1,  0,
    0,            0,  0,  1
  );
end;

class function dMatrix4x4.scale( const s: dVector3 ): dMatrix4x4;
begin
  Result := dMatrix4x4.Create(
   s.X, 0,   0,   0,
   0,   s.Y, 0,   0,
   0,   0,   s.Z, 0,
   0,   0,   0,   1
  );
end;

class operator dMatrix4x4.Subtract( const a: dMatrix4x4; const b: double ): dMatrix4x4;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m30 := a.m30 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m31 := a.m31 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
  Result.m32 := a.m32 - b;
  Result.m03 := a.m03 - b;
  Result.m13 := a.m13 - b;
  Result.m23 := a.m23 - b;
  Result.m33 := a.m33 - b;
end;

class function dMatrix4x4.translation( const t: dVector3 ): dMatrix4x4;
begin
  Result := dMatrix4x4.Create(
    1, 0, 0, t.X,
    0, 1, 0, t.Y,
    0, 0, 1, t.Z,
    0, 0, 0, 1
  );
end;

function dMatrix4x4.transpose: dMatrix4x4;
begin
  Result := dMatrix4x4.Create(
   m00, m01, m02, m03,
   m10, m11, m12, m13,
   m20, m21, m22, m23,
   m30, m31, m32, m33
  );
end;

class operator dMatrix4x4.Subtract( const a: dMatrix4x4; const b: dMatrix4x4 ): dMatrix4x4;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m30 := a.m30 - b.m30;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m31 := a.m31 - b.m31;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
  Result.m32 := a.m32 - b.m32;
  Result.m03 := a.m03 - b.m03;
  Result.m13 := a.m13 - b.m13;
  Result.m23 := a.m23 - b.m23;
  Result.m33 := a.m33 - b.m33;
end;

{$endregion}

{$region ' eMatrix4x4'}

class operator eMatrix4x4.Add( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;
begin
  Result.m00 := a.m00 + b.m00;
  Result.m10 := a.m10 + b.m10;
  Result.m20 := a.m20 + b.m20;
  Result.m30 := a.m30 + b.m30;
  Result.m01 := a.m01 + b.m01;
  Result.m11 := a.m11 + b.m11;
  Result.m21 := a.m21 + b.m21;
  Result.m31 := a.m31 + b.m31;
  Result.m02 := a.m02 + b.m02;
  Result.m12 := a.m12 + b.m12;
  Result.m22 := a.m22 + b.m22;
  Result.m32 := a.m32 + b.m32;
  Result.m03 := a.m03 + b.m03;
  Result.m13 := a.m13 + b.m13;
  Result.m23 := a.m23 + b.m23;
  Result.m33 := a.m33 + b.m33;
end;

class operator eMatrix4x4.Add( const a: eMatrix4x4; const b: extended ): eMatrix4x4;
begin
  Result.m00 := a.m00 + b;
  Result.m10 := a.m10 + b;
  Result.m20 := a.m20 + b;
  Result.m30 := a.m30 + b;
  Result.m01 := a.m01 + b;
  Result.m11 := a.m11 + b;
  Result.m21 := a.m21 + b;
  Result.m31 := a.m31 + b;
  Result.m02 := a.m02 + b;
  Result.m12 := a.m12 + b;
  Result.m22 := a.m22 + b;
  Result.m32 := a.m32 + b;
  Result.m03 := a.m03 + b;
  Result.m13 := a.m13 + b;
  Result.m23 := a.m23 + b;
  Result.m33 := a.m33 + b;
end;

function eMatrix4x4.adjugate: eMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m01 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m02 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m03 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m10 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m12 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m13 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m20 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m21 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m23 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m30 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m31 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m32 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

function eMatrix4x4.cofactor: eMatrix4x4;
begin
  //- Calculate matrix of minors and co-factor.
  Result.m00 :=   (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21)));
  Result.m10 := 0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21)));
  Result.m20 :=   (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11)));
  Result.m30 := 0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)));
  Result.m01 := 0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30)+(m23*m32*m10)+(m33*m12*m20)));
  Result.m11 :=   (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30)+(m23*m32*m00)+(m33*m02*m20)));
  Result.m21 := 0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30)+(m13*m32*m00)+(m33*m02*m10)));
  Result.m31 :=   (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20)+(m13*m22*m00)+(m23*m02*m10)));
  Result.m02 :=   (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30)+(m23*m31*m10)+(m33*m11*m20)));
  Result.m12 := 0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30)+(m23*m31*m00)+(m33*m01*m20)));
  Result.m22 :=   (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30)+(m13*m31*m00)+(m33*m01*m10)));
  Result.m32 := 0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20)+(m13*m21*m00)+(m23*m01*m10)));
  Result.m03 := 0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30)+(m22*m31*m10)+(m32*m11*m20)));
  Result.m13 :=   (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30)+(m22*m31*m00)+(m32*m01*m20)));
  Result.m23 := 0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30)+(m13*m31*m00)+(m32*m01*m10)));
  Result.m33 :=   (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20)+(m12*m21*m00)+(m22*m01*m10)));
end;

class function eMatrix4x4.Create( const _m00: extended; const _m10: extended; const _m20: extended; const _m30: extended; const _m01: extended; const _m11: extended; const _m21: extended; const _m31: extended; const _m02: extended; const _m12: extended; const _m22: extended; const _m32: extended; const _m03: extended; const _m13: extended; const _m23: extended; const _m33: extended ): eMatrix4x4;
begin
  Result.m00 := _m00;
  Result.m10 := _m10;
  Result.m20 := _m20;
  Result.m30 := _m30;
  Result.m01 := _m01;
  Result.m11 := _m11;
  Result.m21 := _m21;
  Result.m31 := _m31;
  Result.m02 := _m02;
  Result.m12 := _m12;
  Result.m22 := _m22;
  Result.m32 := _m32;
  Result.m03 := _m03;
  Result.m13 := _m13;
  Result.m23 := _m23;
  Result.m33 := _m33;
end;

class function eMatrix4x4.Create( const Row0: eVector4; const Row1: eVector4; const Row2: eVector4; const Row3: eVector4 ): eMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(extended)*4); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(extended)*4);
  Move(Row2,Result.m02,sizeof(extended)*4);
  Move(Row3,Result.m03,sizeof(extended)*4);
end;

class function eMatrix4x4.CreatePerspective( const angleDeg: extended; const ratio: extended; const _near: extended; const _far: extended ): eMatrix4x4;
var
  tan_extended_angle: extended;
begin
  tan_extended_angle := tan(degtorad(angleDeg)/2);
  Result.m00 := 1 / (ratio*tan_extended_angle);
  Result.m10 := 0;
  Result.m20 := 0;
  Result.m30 := 0;
  Result.m01 := 0;
  Result.m11 := 1 / tan_extended_angle;
  Result.m21 := 0;
  Result.m31 := 0;
  Result.m02 := 0;
  Result.m12 := 0;
  Result.m22 := (_near+_far)/(_near-_far);
  Result.m32 := (2*_near-_far)/(_near-_far);
  Result.m03 := 0;
  Result.m13 := 0;
  Result.m23 := -1;
  Result.m33 := 0;
end;

class function eMatrix4x4.Create( const Row0: eVector3; const Row1: eVector3; const Row2: eVector3; const Row3: eVector3 ): eMatrix4x4;
begin
  {$hints off} Move(Row0,Result.m00,sizeof(extended)*3); {$hints on} //- FPC, Result not initialized (it is)
  Move(Row1,Result.m01,sizeof(extended)*3);
  Move(Row2,Result.m02,sizeof(extended)*3);
  Move(Row3,Result.m03,sizeof(extended)*3);
  Result.m30 := 0;
  Result.m31 := 0;
  Result.m32 := 0;
  Result.m33 := 1;
end;

class function eMatrix4x4.CreateView( const eye: eVector3; const target: eVector3; const Up: eVector3 ): eMatrix4x4;
var
  vz: eVector3;
  vx: eVector3;
  vy: eVector3;
begin
  vz := (eye-target).normalized;
  vx := up.cross(vz).normalized;
  vy := vz.cross(vx);
  Result := eMatrix4x4.Create(
              vx.X,           VY.X,           vZ.X, 0,
              vx.Y,           VY.y,           VZ.y, 0,
              vx.Z,           VY.Z,           VZ.Z, 0,
    -(vx.dot(eye)), -(vy.dot(eye)), -(vz.dot(eye)), 1 ).transpose;
end;

function eMatrix4x4.determinant: extended;
begin
  Result :=
  (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31)+(m23*m32*m11)+(m33*m12*m21))))  +
  (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31)+(m23*m32*m01)+(m33*m02*m21))))) +
  (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31)+(m13*m32*m01)+(m33*m02*m11))))  +
  (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21)+(m13*m22*m01)+(m23*m02*m11)))));
end;

class operator eMatrix4x4.Divide( const a: eMatrix4x4; const b: extended ): eMatrix4x4;
begin
  Result.m00 := a.m00 / b;
  Result.m10 := a.m10 / b;
  Result.m20 := a.m20 / b;
  Result.m30 := a.m30 / b;
  Result.m01 := a.m01 / b;
  Result.m11 := a.m11 / b;
  Result.m21 := a.m21 / b;
  Result.m31 := a.m31 / b;
  Result.m02 := a.m02 / b;
  Result.m12 := a.m12 / b;
  Result.m22 := a.m22 / b;
  Result.m32 := a.m32 / b;
  Result.m03 := a.m03 / b;
  Result.m13 := a.m13 / b;
  Result.m23 := a.m23 / b;
  Result.m33 := a.m33 / b;
end;

class operator eMatrix4x4.Divide( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;
begin
  Result.m00 := a.m00 / b.m00;
  Result.m10 := a.m10 / b.m10;
  Result.m20 := a.m20 / b.m20;
  Result.m30 := a.m30 / b.m30;
  Result.m01 := a.m01 / b.m01;
  Result.m11 := a.m11 / b.m11;
  Result.m21 := a.m21 / b.m21;
  Result.m31 := a.m31 / b.m31;
  Result.m02 := a.m02 / b.m02;
  Result.m12 := a.m12 / b.m12;
  Result.m22 := a.m22 / b.m22;
  Result.m32 := a.m32 / b.m32;
  Result.m03 := a.m03 / b.m03;
  Result.m13 := a.m13 / b.m13;
  Result.m23 := a.m23 / b.m23;
  Result.m33 := a.m33 / b.m33;
end;

function eMatrix4x4.dot( const a: eMatrix4x4 ): eMatrix4x4;
begin
  Result.m00 := (m00 * A.m00) + (m10 * A.m01) + (m20 * A.m02) + (m30 * A.m03);
  Result.m10 := (m00 * A.m10) + (m10 * A.m11) + (m20 * A.m12) + (m30 * A.m13);
  Result.m20 := (m00 * A.m20) + (m10 * A.m21) + (m20 * A.m22) + (m30 * A.m23);
  Result.m30 := (m00 * A.m30) + (m10 * A.m31) + (m20 * A.m32) + (m30 * A.m33);
  Result.m01 := (m01 * A.m00) + (m11 * A.m01) + (m21 * A.m02) + (m31 * A.m03);
  Result.m11 := (m01 * A.m10) + (m11 * A.m11) + (m21 * A.m12) + (m31 * A.m13);
  Result.m21 := (m01 * A.m20) + (m11 * A.m21) + (m21 * A.m22) + (m31 * A.m23);
  Result.m31 := (m01 * A.m30) + (m11 * A.m31) + (m21 * A.m32) + (m31 * A.m33);
  Result.m02 := (m02 * A.m00) + (m12 * A.m01) + (m22 * A.m02) + (m32 * A.m03);
  Result.m12 := (m02 * A.m10) + (m12 * A.m11) + (m22 * A.m12) + (m32 * A.m13);
  Result.m22 := (m02 * A.m20) + (m12 * A.m21) + (m22 * A.m22) + (m32 * A.m23);
  Result.m32 := (m02 * A.m30) + (m12 * A.m31) + (m22 * A.m32) + (m32 * A.m33);
  Result.m03 := (m03 * A.m00) + (m13 * A.m01) + (m23 * A.m02) + (m33 * A.m03);
  Result.m13 := (m03 * A.m10) + (m13 * A.m11) + (m23 * A.m12) + (m33 * A.m13);
  Result.m23 := (m03 * A.m20) + (m13 * A.m21) + (m23 * A.m22) + (m33 * A.m23);
  Result.m33 := (m03 * A.m30) + (m13 * A.m31) + (m23 * A.m32) + (m33 * A.m33);
end;

function eMatrix4x4.dot( const a: eVector4 ): eVector4;
begin
  Result.X := (m00 * A.X) + (m10 * A.Y) + (m20 * A.Z) + (m30 * A.W);
  Result.Y := (m01 * A.X) + (m11 * A.Y) + (m21 * A.Z) + (m31 * A.W);
  Result.Z := (m02 * A.X) + (m12 * A.Y) + (m22 * A.Z) + (m32 * A.W);
  Result.W := (m03 * A.X) + (m13 * A.Y) + (m23 * A.Z) + (m33 * A.W);
end;

class function eMatrix4x4.identity: eMatrix4x4;
begin
  Result := eMatrix4x4.Create
  (
     1, 0, 0, 0,
     0, 1, 0, 0,
     0, 0, 1, 0,
     0, 0, 0, 1
  );
end;

function eMatrix4x4.inverse: eMatrix4x4;
var
  D: extended;
begin
  D := (
    (m00 *    (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))))  +
    (m10 * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))))) +
    (m20 *    (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))))  +
    (m30 * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11)))))
  );
  if (D=0) then begin
    exit;    // ought not be necessary, but... life isn't always fair.
  end;
  D := 1/D;
  //- Calculate matrix of minors and co-factor, transpose for adjugate, and
  //- multiply 1/determinant
  //- Calculate matrix of minors and co-factor and transpose
  Result.m00 := D * (  (((m11*m22*m33)+(m21*m32*m13)+(m31*m12*m23)) - ((m13*m22*m31) + (m23*m32*m11)+(m33*m12*m21))));
  Result.m01 := D * (0-(((m01*m22*m33)+(m21*m32*m03)+(m31*m02*m23)) - ((m03*m22*m31) + (m23*m32*m01)+(m33*m02*m21))));
  Result.m02 := D * (  (((m01*m12*m33)+(m11*m32*m03)+(m31*m02*m13)) - ((m03*m12*m31) + (m13*m32*m01)+(m33*m02*m11))));
  Result.m03 := D * (0-(((m01*m12*m23)+(m11*m22*m03)+(m21*m02*m13)) - ((m03*m12*m21) + (m13*m22*m01)+(m23*m02*m11))));
  Result.m10 := D * (0-(((m10*m22*m33)+(m20*m32*m13)+(m30*m12*m23)) - ((m13*m22*m30) + (m23*m32*m10)+(m33*m12*m20))));
  Result.m11 := D * (  (((m00*m22*m33)+(m20*m32*m03)+(m30*m02*m23)) - ((m03*m22*m30) + (m23*m32*m00)+(m33*m02*m20))));
  Result.m12 := D * (0-(((m00*m12*m33)+(m10*m32*m03)+(m30*m02*m13)) - ((m03*m12*m30) + (m13*m32*m00)+(m33*m02*m10))));
  Result.m13 := D * (  (((m00*m12*m23)+(m10*m22*m03)+(m20*m02*m13)) - ((m03*m12*m20) + (m13*m22*m00)+(m23*m02*m10))));
  Result.m20 := D * (  (((m10*m21*m33)+(m20*m31*m13)+(m30*m11*m23)) - ((m13*m21*m30) + (m23*m31*m10)+(m33*m11*m20))));
  Result.m21 := D * (0-(((m00*m21*m33)+(m20*m31*m03)+(m30*m01*m23)) - ((m03*m21*m30) + (m23*m31*m00)+(m33*m01*m20))));
  Result.m22 := D * (  (((m00*m11*m33)+(m10*m31*m03)+(m30*m01*m13)) - ((m03*m11*m30) + (m13*m31*m00)+(m33*m01*m10))));
  Result.m23 := D * (0-(((m00*m11*m23)+(m10*m21*m03)+(m20*m01*m13)) - ((m03*m11*m20) + (m13*m21*m00)+(m23*m01*m10))));
  Result.m30 := D * (0-(((m10*m21*m32)+(m20*m31*m12)+(m30*m11*m22)) - ((m12*m21*m30) + (m22*m31*m10)+(m32*m11*m20))));
  Result.m31 := D * (  (((m00*m21*m32)+(m20*m31*m02)+(m30*m01*m22)) - ((m02*m21*m30) + (m22*m31*m00)+(m32*m01*m20))));
  Result.m32 := D * (0-(((m00*m11*m32)+(m10*m31*m02)+(m30*m01*m13)) - ((m02*m11*m30) + (m13*m31*m00)+(m32*m01*m10))));
  Result.m33 := D * (  (((m00*m11*m22)+(m10*m21*m02)+(m20*m01*m12)) - ((m02*m11*m20) + (m12*m21*m00)+(m22*m01*m10))));
end;

class operator eMatrix4x4.Multiply( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;
begin
  Result.m00 := a.m00 * b.m00;
  Result.m10 := a.m10 * b.m10;
  Result.m20 := a.m20 * b.m20;
  Result.m30 := a.m30 * b.m30;
  Result.m01 := a.m01 * b.m01;
  Result.m11 := a.m11 * b.m11;
  Result.m21 := a.m21 * b.m21;
  Result.m31 := a.m31 * b.m31;
  Result.m02 := a.m02 * b.m02;
  Result.m12 := a.m12 * b.m12;
  Result.m22 := a.m22 * b.m22;
  Result.m32 := a.m32 * b.m32;
  Result.m03 := a.m03 * b.m03;
  Result.m13 := a.m13 * b.m13;
  Result.m23 := a.m23 * b.m23;
  Result.m33 := a.m33 * b.m33;
end;

class operator eMatrix4x4.Multiply( const a: eMatrix4x4; const b: extended ): eMatrix4x4;
begin
  Result.m00 := a.m00 * b;
  Result.m10 := a.m10 * b;
  Result.m20 := a.m20 * b;
  Result.m30 := a.m30 * b;
  Result.m01 := a.m01 * b;
  Result.m11 := a.m11 * b;
  Result.m21 := a.m21 * b;
  Result.m31 := a.m31 * b;
  Result.m02 := a.m02 * b;
  Result.m12 := a.m12 * b;
  Result.m22 := a.m22 * b;
  Result.m32 := a.m32 * b;
  Result.m03 := a.m03 * b;
  Result.m13 := a.m13 * b;
  Result.m23 := a.m23 * b;
  Result.m33 := a.m33 * b;
end;

class function eMatrix4x4.rotationX( const degrees: extended ): eMatrix4x4;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix4x4.Create(
    1,  0,             0,  0,
    0,  cos(d),  -sin(d),  0,
    0,  sin(d),   cos(d),  0,
    0,  0,             0,  1
  );
end;

class function eMatrix4x4.rotationY( const degrees: extended ): eMatrix4x4;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix4x4.Create(
    cos(d),   0,  sin(d),  0,
    0,        1,       0,  0,
    -sin(d),  0,  cos(d),  0,
    0,        0,       0,  1
  );
end;

class function eMatrix4x4.rotationZ( const degrees: extended ): eMatrix4x4;
var
  d: extended;
begin
  d := degrees*Pi/180;
  Result := eMatrix4x4.Create(
    cos(d), -sin(d),  0,  0,
    sin(d), cos(d),   0,  0,
    0,            0,  1,  0,
    0,            0,  0,  1
  );
end;

class function eMatrix4x4.scale( const s: eVector3 ): eMatrix4x4;
begin
  Result := eMatrix4x4.Create(
   s.X, 0,   0,   0,
   0,   s.Y, 0,   0,
   0,   0,   s.Z, 0,
   0,   0,   0,   1
  );
end;

class operator eMatrix4x4.Subtract( const a: eMatrix4x4; const b: extended ): eMatrix4x4;
begin
  Result.m00 := a.m00 - b;
  Result.m10 := a.m10 - b;
  Result.m20 := a.m20 - b;
  Result.m30 := a.m30 - b;
  Result.m01 := a.m01 - b;
  Result.m11 := a.m11 - b;
  Result.m21 := a.m21 - b;
  Result.m31 := a.m31 - b;
  Result.m02 := a.m02 - b;
  Result.m12 := a.m12 - b;
  Result.m22 := a.m22 - b;
  Result.m32 := a.m32 - b;
  Result.m03 := a.m03 - b;
  Result.m13 := a.m13 - b;
  Result.m23 := a.m23 - b;
  Result.m33 := a.m33 - b;
end;

class function eMatrix4x4.translation( const t: eVector3 ): eMatrix4x4;
begin
  Result := eMatrix4x4.Create(
    1, 0, 0, t.X,
    0, 1, 0, t.Y,
    0, 0, 1, t.Z,
    0, 0, 0, 1
  );
end;

function eMatrix4x4.transpose: eMatrix4x4;
begin
  Result := eMatrix4x4.Create(
   m00, m01, m02, m03,
   m10, m11, m12, m13,
   m20, m21, m22, m23,
   m30, m31, m32, m33
  );
end;

class operator eMatrix4x4.Subtract( const a: eMatrix4x4; const b: eMatrix4x4 ): eMatrix4x4;
begin
  Result.m00 := a.m00 - b.m00;
  Result.m10 := a.m10 - b.m10;
  Result.m20 := a.m20 - b.m20;
  Result.m30 := a.m30 - b.m30;
  Result.m01 := a.m01 - b.m01;
  Result.m11 := a.m11 - b.m11;
  Result.m21 := a.m21 - b.m21;
  Result.m31 := a.m31 - b.m31;
  Result.m02 := a.m02 - b.m02;
  Result.m12 := a.m12 - b.m12;
  Result.m22 := a.m22 - b.m22;
  Result.m32 := a.m32 - b.m32;
  Result.m03 := a.m03 - b.m03;
  Result.m13 := a.m13 - b.m13;
  Result.m23 := a.m23 - b.m23;
  Result.m33 := a.m33 - b.m33;
end;

{$endregion}

{$region ' hRay'}

class function hRay.Create( const aOrigin: hVertex; const aDirection: hVector3; const aLength: half ): hRay;
begin
  Result.Origin := aOrigin;
  Result.Direction := aDirection.UnitVector;
  Result.Length := aLength;
end;

class function hRay.Create( const aOrigin: hVertex; const aDestination: hVertex ): hRay;
var
  V: hVector3;
begin
  Result.Origin := aOrigin;
  V := aDestination - aOrigin;
  Result.Direction := V;
  Result.Length := V.magnitude;
end;

function hRay.Destination: hVertex;
begin
  Result := Origin + (hVector3(Direction) * Length);
end;

procedure hRay.setDirection( const Value: hVector3 );
begin
  fDirection := Value.UnitVector;
end;

{$endregion}

{$region ' sRay'}

class function sRay.Create( const aOrigin: sVertex; const aDirection: sVector3; const aLength: single ): sRay;
begin
  Result.Origin := aOrigin;
  Result.Direction := aDirection.UnitVector;
  Result.Length := aLength;
end;

class function sRay.Create( const aOrigin: sVertex; const aDestination: sVertex ): sRay;
var
  V: sVector3;
begin
  Result.Origin := aOrigin;
  V := aDestination - aOrigin;
  Result.Direction := V;
  Result.Length := V.magnitude;
end;

function sRay.Destination: sVertex;
begin
  Result := Origin + (sVector3(Direction) * Length);
end;

procedure sRay.setDirection( const Value: sVector3 );
begin
  fDirection := Value.UnitVector;
end;

{$endregion}

{$region ' dRay'}

class function dRay.Create( const aOrigin: dVertex; const aDirection: dVector3; const aLength: double ): dRay;
begin
  Result.Origin := aOrigin;
  Result.Direction := aDirection.UnitVector;
  Result.Length := aLength;
end;

class function dRay.Create( const aOrigin: dVertex; const aDestination: dVertex ): dRay;
var
  V: dVector3;
begin
  Result.Origin := aOrigin;
  V := aDestination - aOrigin;
  Result.Direction := V;
  Result.Length := V.magnitude;
end;

function dRay.Destination: dVertex;
begin
  Result := Origin + (dVector3(Direction) * Length);
end;

procedure dRay.setDirection( const Value: dVector3 );
begin
  fDirection := Value.UnitVector;
end;

{$endregion}

{$region ' eRay'}

class function eRay.Create( const aOrigin: eVertex; const aDirection: eVector3; const aLength: extended ): eRay;
begin
  Result.Origin := aOrigin;
  Result.Direction := aDirection.UnitVector;
  Result.Length := aLength;
end;

class function eRay.Create( const aOrigin: eVertex; const aDestination: eVertex ): eRay;
var
  V: eVector3;
begin
  Result.Origin := aOrigin;
  V := aDestination - aOrigin;
  Result.Direction := V;
  Result.Length := V.magnitude;
end;

function eRay.Destination: eVertex;
begin
  Result := Origin + (eVector3(Direction) * Length);
end;

procedure eRay.setDirection( const Value: eVector3 );
begin
  fDirection := Value.UnitVector;
end;

{$endregion}

{$region ' hPlane'}

class function hPlane.Create( const aOrigin: hVertex; const aNormal: hVector3 ): hPlane;
begin
  Result.Origin := aOrigin;
  Result.fNormal := aNormal.normalized;
end;


function hPlane.Intersect( const aRay: hRay ): boolean;
var
  k: half;
  v: hVector3;
  w: hVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := ((k>0) or (k=0)) and ((k<1) or (k=1));
end;

function hPlane.Intersection( const aRay: hRay ): hVertex;
var
  k: half;
  v: hVector3;
  w: hVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := aRay.Origin + (v * k);
end;

procedure hPlane.setNormal( const Value: hVector3 );
begin
  fNormal := Value.normalized;
end;

{$endregion}

{$region ' sPlane'}

class function sPlane.Create( const aOrigin: sVertex; const aNormal: sVector3 ): sPlane;
begin
  Result.Origin := aOrigin;
  Result.fNormal := aNormal.normalized;
end;


function sPlane.Intersect( const aRay: sRay ): boolean;
var
  k: single;
  v: sVector3;
  w: sVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := (k>=0) and (k<=1);
end;

function sPlane.Intersection( const aRay: sRay ): sVertex;
var
  k: single;
  v: sVector3;
  w: sVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := aRay.Origin + (v * k);
end;

procedure sPlane.setNormal( const Value: sVector3 );
begin
  fNormal := Value.normalized;
end;

{$endregion}

{$region ' dPlane'}

class function dPlane.Create( const aOrigin: dVertex; const aNormal: dVector3 ): dPlane;
begin
  Result.Origin := aOrigin;
  Result.fNormal := aNormal.normalized;
end;


function dPlane.Intersect( const aRay: dRay ): boolean;
var
  k: double;
  v: dVector3;
  w: dVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := (k>=0) and (k<=1);
end;

function dPlane.Intersection( const aRay: dRay ): dVertex;
var
  k: double;
  v: dVector3;
  w: dVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := aRay.Origin + (v * k);
end;

procedure dPlane.setNormal( const Value: dVector3 );
begin
  fNormal := Value.normalized;
end;

{$endregion}

{$region ' ePlane'}

class function ePlane.Create( const aOrigin: eVertex; const aNormal: eVector3 ): ePlane;
begin
  Result.Origin := aOrigin;
  Result.fNormal := aNormal.normalized;
end;


function ePlane.Intersect( const aRay: eRay ): boolean;
var
  k: extended;
  v: eVector3;
  w: eVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := (k>=0) and (k<=1);
end;

function ePlane.Intersection( const aRay: eRay ): eVertex;
var
  k: extended;
  v: eVector3;
  w: eVector3;
begin
  v := aRay.Destination;
  w := Origin - aRay.Origin;
  k := (w.dot(fNormal)/v.dot(fNormal));
  Result := aRay.Origin + (v * k);
end;

procedure ePlane.setNormal( const Value: eVector3 );
begin
  fNormal := Value.normalized;
end;

{$endregion}

end.