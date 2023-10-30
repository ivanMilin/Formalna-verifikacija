library ieee;
use ieee.std_logic_1164.all;

entity and_proc is

    port (
        clk : in std_logic;
        rst : in std_logic;
        a   : in std_logic;
        b   : in std_logic;
        c   : out std_logic
        );

end entity and_proc;

architecture rtl of and_proc is

begin

    process (clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                c <= '0';
            else
                c <= a and b;
            end if;
        end if;
    end process;

end architecture rtl;
