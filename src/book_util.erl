-module(book_util).
-export([join/2, list_as_string/1, to_string/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% join/2
% Joins a string list into a single string using Sep as Separator
%
% @param Sep - Separator for the concatenation of all strings in List.
% @params List - List of strings to be joined.
% @return String - single string with the result of concatenating all strings and injecting Sep between them.
join(Sep, List) -> list_as_string(join(Sep, List, [])).

join(_Sep, [],      Acc) -> lists:reverse(Acc);
join( Sep, [A],     Acc) -> join(Sep, [], [A | Acc]);
join( Sep, [A,B|T], Acc) -> join(Sep, [B|T], [Sep, A | Acc]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% list_as_string/1
% Turns a string list into a single string
%
% @param List - list of strings to be joined.
% @return String - with the result of concatenating all the strings in List.
list_as_string(List) -> list_as_string(List, "").

list_as_string([],      Acc) -> Acc;
list_as_string([A],     Acc) -> Acc ++ to_string(A);
list_as_string([A,B|T], Acc) -> list_as_string([B|T], Acc ++ to_string(A)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% to_string/1
% Converts a binary string into a common list string. Also acts as identity on list strings
%
% @param A - Binary String or List String
% @return List String - the result of converting A to a List String.
to_string(A) when is_binary(A) -> binary_to_list(A);
to_string(A) when is_list(A) -> A.
