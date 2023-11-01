library IEEE;
use ieee.std_logic_1164.all;

entity lut4 is
    generic(INIT : std_logic_vector(15 downto 0));
    Port(
        in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        in3 : in std_logic;
        out0: out std_logic
    );
end lut4;

architecture Behavioral of lut4 is

    signal input : std_logic_vector(3 downto 0);

begin

    input <= in3&in2&in1&in0;

    LUT4 : process(input)
    begin
        case input is
            when "0000" =>
                out0<= INIT(0);
            when "0001" =>
                out0<= INIT(1);
            when "0010" =>
                out0<= INIT(2);
            when "0011" =>
                out0<= INIT(3);
            when "0100" =>
                out0<= INIT(4);
            when "0101" =>
                out0<= INIT(5);
            when "0110" =>
                out0<= INIT(6);
            when "0111" =>
                out0<= INIT(7);
            when "1000" =>
                out0<= INIT(8);
            when "1001" =>
                out0<= INIT(9);
            when "1010" =>
                out0<= INIT(10);
            when "1011" =>
                out0<= INIT(11);
            when "1100" =>
                out0<= INIT(12);
            when "1101" =>
                out0<= INIT(13);
            when "1110" =>
                out0<= INIT(14);
            when others =>
                out0<= INIT(15);    
        end case;
    end process;
end Behavioral;
