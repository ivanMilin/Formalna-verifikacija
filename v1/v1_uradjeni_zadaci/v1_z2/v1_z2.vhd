-- Milin Ivan e1-079-2023
-- Zadatak(pdf strana 22)
-- "Koristeci IFV odrediti da li Bulovo kolo sa slike 1.3 implementira Bulovu fukciju zadatu formulom"
-- out = (!A!B!C!E!F + A!B!CE!F + !AB!C!EF + AB!CEF + !A!BC!G!H + A!BCG!H + !ABC!GH + ABCGH)!D + D .
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity v1_z2 is
	Port(
		clk : in std_logic;
		rst : in std_logic;
		a : in std_logic;
		b : in std_logic;
		c : in std_logic;
		d : in std_logic;
		e : in std_logic;
		f : in std_logic;
		g : in std_logic;
		h : in std_logic;
		out0 : out std_logic;
		out1 : out std_logic);
end v1_z2;

architecture Behavioral of v1_z2 is

signal out1_formula : std_logic;
signal mux_out : std_logic; --mux output
signal dec0 : 	std_logic_vector(3 downto 0); 
signal dec1: 	std_logic_vector(3 downto 0);
signal sel: 	std_logic_vector(3 downto 0);

begin 

sel <= d&c&b&a;

out1_formula <= ((((not a) and (not b) and (not c) and (not e) and (not f)) or 
		(a and (not b) and (not c) and e and (not f)) or 
		((not a) and b and (not c) and (not e) and f) or 
		(a and b and (not c) and e and f) or 
		((not a) and (not b) and c and (not g) and (not h)) or 
		(a and (not b) and c and g and (not h)) or 
		((not a) and b and c and (not g) and h) or 
		(a and b and c and g and h)) and (not d)) or d;

dekoder0 : process(e,f) is
begin
	if (e='0' and f='0') then
		dec0 <="0001";
	elsif(e='1' and f='0') then
		dec0 <="0010";
	elsif(e='0' and f='1') then
		dec0 <="0100";
	else	
		dec0 <="1000";
	end if;
end process;

dekoder1 : process(g,h) is
begin
	if(g='0' and h='0') then
		dec1 <= "0001";
	elsif(g='1' and h='0') then
		dec1 <= "0010";
	elsif(g='0' and h='1') then
		dec1 <= "0100";
	else	
		dec1 <= "1000";
	end if;
end process;


mux : process(sel) is 
begin
	case sel is
		when "0000" =>
			mux_out <= dec0(0);				
		when "0001" =>
			mux_out <= dec0(1);
		when "0010" =>
			mux_out <= dec0(2);
		when "0011" =>
			mux_out <= dec0(3);
		when "0100" =>
			mux_out <= dec1(0);
		when "0101" =>
			mux_out <= dec1(1);
		when "0110" =>
			mux_out <= dec1(2);
		when "0111" =>
			mux_out <= dec1(3);
		when others =>
			mux_out <= '1';
	end case;
end process;

reg : process(clk) is
begin
	if(rst = '1') then
		out0 <= '0';
		out1 <= '0';		
	elsif(rising_edge(clk)) then
		out0 <= mux_out;
		out1 <= out1_formula;
	end if;	
end process;

end Behavioral;
