library ieee;
use ieee.std_logic_1164.all;

entity simple_example is

    port (
        clk : in  std_logic;            -- Clock
        rst : in  std_logic;            -- Synchronous reset
        a   : in  std_logic;
        b   : in  std_logic;
        r0  : out std_logic;
        r1  : out std_logic;
        r2  : out std_logic);

end entity simple_example;

architecture rtl of simple_example is
    signal r0_d  : std_logic;
    signal r1_d  : std_logic;
    signal r2_d  : std_logic;
    signal sel_w : std_logic_vector(1 downto 0);
begin  -- architecture rtl

    sel_w <= a & b;

    reg_p : process (clk) is
    begin  -- process reg_p
        if rising_edge(clk) then
            if rst = '1' then
                r0 <= '0';
                r1 <= '0';
                r2 <= '0';
            else
                r0 <= r0_d;
                r1 <= r1_d;
                r2 <= r2_d;
            end if;
        end if;
    end process reg_p;

    r0_d <= a and b;

    r1_p : process (sel_w) is
    begin  -- process r1_p
        case sel_w is
            when "00"   => r1_d <= '0';
            when "01"   => r1_d <= '0';
            when "10"   => r1_d <= '0';
            when others => r1_d <= '1';
        end case;
    end process r1_p;

    r2_p : process (sel_w) is
    begin  -- process r2_p
        case sel_w is
            when "00"   => r2_d <= '0';
            when "01"   => r2_d <= '1';
            when "10"   => r2_d <= '0';
            when others => r2_d <= '1';
        end case;
    end process r2_p;
end architecture rtl;
