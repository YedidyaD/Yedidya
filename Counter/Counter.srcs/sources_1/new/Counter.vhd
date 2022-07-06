----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/06/2022 11:31:28 AM
-- Design Name: 
-- Module Name: Counter - Counter_ARC
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    Port ( CLOCK    : in STD_LOGIC;
           RESET    : in STD_LOGIC;
           CE       : in STD_LOGIC;
           COUNTER  : out STD_LOGIC_VECTOR (9 downto 0));
end Counter;

architecture Counter_ARC of Counter is
    signal COUNT : STD_LOGIC_VECTOR (9 downto 0);
begin

    process (CLOCK)
        begin
            if (CLOCK' event and CLOCK = '1') then
                if (RESET = '1') then
                    COUNT <= (others => '0');
                else
                    if (CE = '1') then
                        COUNT <= COUNT + 1;
                    end if;
                end if;
            end if;
    end process;
    
    COUNTER <= COUNT;
            
end Counter_ARC;
