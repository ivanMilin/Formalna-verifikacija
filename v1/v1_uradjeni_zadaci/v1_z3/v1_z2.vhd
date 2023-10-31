-- -- Milin Ivan e1-079-2023
-- Zadatak(pdf strana 32)
-- "Na slici 2.3 je dat zlatni model Bulovog kola, realizovan koriscenjem MUX kola."
-- "Na slici 2.3 je prikazana implementacija Bulovog kola koriscenjem cetvorobitnih LUT-ova"
-- "Modelovati sisteme u VHDL-u, a zatim koriscenjem IFV-a ispitati da li su Bulova kola sa slika 2.3 i 2.4 logicki ekvivalentna"

library IEEE;
use IEEE.std_logic_1164.all;

entity v1_z2 is 
    Port(
    a, b, c, d, e, f : in std_logic;
    clk, rst : in std_logic;
    out1, out2 : out std_logic
    );       
end v1_z2;

architecture Structural of v1_z2 is

    signal mux_out : std_logic;
    signal sel : std_logic_vector(2 downto 0);
    signal out_0, out_1, out_2, out_3 : std_logic;

begin
	
    sel <= d&e&f;

    mux : process(sel) 
    begin
        case sel is
            when "000" =>
                mux_out <= b;
            when "001" =>
                mux_out <= b;
            when "010" =>
                mux_out <= c;
            when "011" =>
                mux_out <= a;
            when "100" =>
                mux_out <= '1';
            when "101" =>
                mux_out <= '0';
            when "110" =>
                mux_out <= '1';
            when others =>
                mux_out <= '0';
        end case;
    end process;

    --gornji levo
    lut0 : entity work.lut4 
    generic map(INIT => "0101001101010000")
    Port map(
        in3  => b, 
        in2  => d, 
        in1  => e, 
        in0  => f,
        out0 => out_0);
    
    --donji levo
    lut1 : entity work.lut4
    generic map(INIT => "0000010000000000")
    Port map(
        in3  => c, 
        in2  => d, 
        in1  => e, 
        in0  => f,
        out0 => out_1);

    --gornji desno
    lut2 : entity work.lut4
    generic map(INIT => "0000100000000000")
    Port map(
        in3  => a, 
        in2  => d, 
        in1  => e, 
        in0  => f,
        out0 => out_2);

    --donji desno
    lut3 : entity work.lut4
    generic map(INIT => "1111111111111110")
    Port map(
        in3  => '0', 
        in2  => out_2, 
        in1  => out_0, 
        in0  => out_1,
        out0 => out_3);

    reg : process(clk, rst) 
    begin
        if(rst = '1') then
            out1 <= '0';
            out2 <= '0';
        elsif(rising_edge(clk)) then
            out1 <= mux_out;
            out2 <= out_3;
        end if;
    end process;
end Structural;
