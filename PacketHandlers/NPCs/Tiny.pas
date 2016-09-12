unit Tiny;

interface

Uses MiscData, PlayerData, ItemFunctions,
   Windows, Messages, SysUtils, Variants, Classes,Graphics,
   Controls, Forms, Dialogs, ScktComp, Packets, StdCtrls, Player, MMSystem;


  type
    TinyClass = class(TObject)
    public
      function GetMatchCombine(item: TItem; var player : TPlayer; slot: BYTE) : integer;
      function CompareArmasArch(itemId: integer): boolean;
      function GetSancBonus(sanc: WORD; typ: BYTE) : integer;
      procedure TinyProc(var player : TPlayer; pak : pByte);
  end;

implementation

Uses GlobalDefs, NpcFunctions;

const
  itens       : array[0..9] of WORD = (826,841,811,912,871,937,886,856,904,903);
  itensDmenor : array[0..9] of WORD = (869,960,809,970,2137,2127,839,824,884,907);
  itensDmaior : array[0..9] of WORD = (870,911,810,936,855,2130,2128,840,825,885);
  itensE      : array[0..9] of WORD = (3571,3591,3551,3596,3566,3581,3582,3561,3556,3576);

procedure TinyClass.TinyProc(var player : TPlayer; pak : pByte);
begin

end;


function TinyClass.CompareArmasArch(itemId: integer): boolean;
var i: BYTE; dif: integer;
begin
  result := false;
	for i := 0 to 9 do begin
		dif := itemId - ItemList[itens[i]].Extreme;
		if(dif >= 0) and (dif <= 3)then
			result := true;
	end;
end;


function TinyClass.GetMatchCombine(item: TItem; var player : TPlayer; slot: BYTE): integer;
var ref,chance,dif,dif2,dif3 : integer; i: BYTE;
begin

end;

function TinyClass.GetSancBonus(sanc: WORD; typ: BYTE) : integer;
begin
  result := 0;
	if(sanc=9)then
	begin
		if (typ = 1)then
		  result := 6;
		if (typ = 2)then
		  result := 10;
		if (typ = 3)then
		  result := 14;
	end;
	if(sanc>=230) and (sanc <= 233)then
	begin
		if (typ = 1)then
		  result := 18;
		if (typ = 2)then
		  result := 22;
		if (typ = 3)then
		  result := 26;
  end;
	if(sanc>=234) and (sanc <= 237)then
	begin
		if (typ = 1)then
		  result := 23;
		if (typ = 2)then
		  result := 28;
		if (typ = 3)then
		  result := 34;
	end;
end;

end.
