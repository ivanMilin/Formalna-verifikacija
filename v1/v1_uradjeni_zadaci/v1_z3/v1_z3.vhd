library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity v1_z3 is
Port(
    clk,rst : in std_logic;
    RT1, RDY1, START1, ENDD1, HELP1 : out std_logic;          -- ZADATAK 1.
    ER2 : out std_logic;                                      -- ZADATAK 2.
    ER3, RDY3 : out std_logic;                                -- ZADATAK 3.
    RDY4, START4 : out std_logic;                             -- ZADATAK 4.
    ENDD5, STOP5, ER5, RDY5, START5 : out std_logic;          -- ZADATAK 5.
    ENDD6, STOP6, ER6, RDY6 : out std_logic;                  -- ZADATAK 6.
    ENDD7, START7, STATUS_VALID7, INSTARTSV7 : out std_logic; -- ZADATAK 7.
    RT8, ENABLE8 : out std_logic;                             -- ZADATAK 8.
    RDY9, START9, INTERRUPT9 : out std_logic;                 -- ZADATAK 9.
    ACK10, REQ10 : out std_logic                              -- ZADATAK 10.  
);
end v1_z3;

architecture Behavioral of v1_z3 is

    signal cnt : integer range 0 to 15;

begin

    counter : process(clk,rst)
    begin
        if(rst = '1') then
            cnt <= 0;    
        elsif(rising_edge(clk)) then  
            cnt <= cnt + 1;
        end if;
    end process;

	process(cnt) is
	begin
		if(cnt < 4) then
			HELP1 <= '1';
		else 
			HELP1 <= '0';
		end if;
	end process;

    -- ===================  ZADATAK 1.  =================== 
    RT1     <= '1' when (cnt < 4) or (cnt = 8) else '0';
    RDY1    <= '1' when (cnt = 5) else '0';
    START1  <= '1' when (cnt = 8) else '0';
    ENDD1   <= '1' when (cnt = 6) else '0';
    -- ===================  ZADATAK 2.  ===================
    ER2     <= '1' when (cnt > 0) and (cnt < 3)  else 
               '1' when (cnt > 6) and (cnt < 10) else '0';
    -- ===================  ZADATAK 3.  ===================
    ER3     <= '1' when (cnt = 1) else
               '1' when (cnt > 4) and (cnt < 7) else
               '1' when (cnt = 9) else
               '0';
    RDY3    <= '1' when (cnt > 0) and (cnt < 3) else
               '1' when (cnt = 5) else
               '1' when (cnt = 9) else
               '0';
    -- ===================  ZADATAK 4.  ===================
    RDY4    <= '1' when (cnt = 6) else '0';
    START4  <= '1' when (cnt = 2) else '0';
    -- ===================  ZADATAK 5.  ===================
    ENDD5   <= '1' when (cnt = 2) else
               '0';
    STOP5   <= '0';
    ER5     <= '1' when (cnt = 10) else '0';
    RDY5    <= '1' when (cnt > 0) and (cnt <3)  else
               '1' when (cnt > 7) and (cnt <11) else
               '0'; 
    START5  <= '1' when (cnt = 8) else '0';
    -- ===================  ZADATAK 6.  ===================
    ENDD6   <= '1' when (cnt = 2)  else '0';
    STOP6   <= '1' when (cnt = 5)  else '0';
    ER6     <= '1' when (cnt = 10) else '0';
    RDY6    <= '1' when (cnt > 0) and (cnt < 3)  else
               '1' when (cnt > 3) and (cnt < 7)  else
               '1' when (cnt > 8) and (cnt < 11) else
               '0';
    -- ===================  ZADATAK 7.  ===================
    ENDD7   <= '1' when (cnt = 3) else '0';
    START7  <= '1' when (cnt = 5) else '0';
    STATUS_VALID7 <= '1' when (cnt = 10) else '0';
    INSTARTSV7    <= '1' when (cnt > 2) and (cnt < 8) else '0';
    -- ===================  ZADATAK 8.  ===================
    RT8     <= '1' when (cnt < 3) else '0';
    ENABLE8 <= '1' when (cnt = 7) else '0';
    -- ===================  ZADATAK 9.  ===================
    RDY9       <= '1' when (cnt > 1) and (cnt < 8) else '0';
    START9     <= '1' when (cnt > 4) and (cnt < 8) else '0';
    INTERRUPT9 <= '1' when (cnt = 7) else '0';
    -- ===================  ZADATAK 10.  ===================
    ACK10   <= '1' when (cnt = 6) else '0';
    REQ10    <= '1' when (cnt = 1) else '0';

end Behavioral;
