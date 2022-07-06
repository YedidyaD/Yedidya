----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/06/2022 11:41:09 AM
-- Design Name: 
-- Module Name: Counter_tb - Counter_tb_ARC
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_tb is
--  Port ( );
end Counter_tb;

architecture Counter_tb_ARC of Counter_tb is

    component Counter is
        Port ( CLOCK    : in STD_LOGIC;
               RESET    : in STD_LOGIC;
               CE       : in STD_LOGIC;
               COUNTER  : out STD_LOGIC_VECTOR (9 downto 0));
    end component;

    signal CLOCK_tb     : STD_LOGIC := '0';
    signal RESET_tb     : STD_LOGIC := '0';
    signal CE_tb        : STD_LOGIC := '0';
    signal COUNTER_tb   : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
    
    constant clock_period : time := 10ns;

begin

    UUT: Counter port map (
                            CLOCK   => CLOCK_tb,
                            RESET   => RESET_tb,
                            CE      => CE_tb,
                            COUNTER => COUNTER_tb
                            );
                            
    CLOCK_tb <= not(CLOCK_tb) after clock_period;
    RESET_tb <= '1',
                '0' after (10 * clock_period);
                
    CE_tb <=    '0',
                '1' after (20 * clock_period);

end Counter_tb_ARC;
