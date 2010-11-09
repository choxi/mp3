-- VHDL Entity ece411.L1_Controller.symbol
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 20:54:26 11/08/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L1_Controller IS
   PORT( 
      RESET_L      : IN     std_logic;
      clk          : IN     std_logic;
      dirty        : IN     std_logic;
      miss         : IN     std_logic;
      pmresp_h     : IN     std_logic;
      PMREAD_L     : OUT    std_logic;
      PMWRITE_L    : OUT    std_logic;
      in_idlehit   : OUT    std_logic;
      in_load      : OUT    std_logic;
      in_writeback : OUT    std_logic
   );

-- Declarations

END L1_Controller ;

--
-- VHDL Architecture ece411.L1_Controller.fsm
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 20:54:26 11/08/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF L1_Controller IS

   TYPE STATE_TYPE IS (
      IDLE_HIT,
      WRITE_BACK,
      LOAD
   );
 
   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state";

   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= IDLE_HIT;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      dirty,
      miss,
      pmresp_h
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN IDLE_HIT => 
            IF (miss = '1'
                AND dirty = '1') THEN 
               next_state <= WRITE_BACK;
            ELSIF (miss = '1'
                   AND dirty = '0') THEN 
               next_state <= LOAD;
            ELSE
               next_state <= IDLE_HIT;
            END IF;
         WHEN WRITE_BACK => 
            IF (pmresp_h = '1') THEN 
               next_state <= LOAD;
            ELSE
               next_state <= WRITE_BACK;
            END IF;
         WHEN LOAD => 
            IF (pmresp_h = '1') THEN 
               next_state <= IDLE_HIT;
            ELSE
               next_state <= LOAD;
            END IF;
         WHEN OTHERS =>
            next_state <= IDLE_HIT;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      PMREAD_L <= '1';
      PMWRITE_L <= '1';
      in_idlehit <= '1';
      in_load <= '0';
      in_writeback <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN IDLE_HIT => 
            in_idlehit <= '1';
         WHEN WRITE_BACK => 
            pmwrite_l <= '0' after 3ns;
            in_writeback <= '1';
            in_idlehit <= '0';
         WHEN LOAD => 
            pmread_l <= '0' after 3ns;
            in_load <= '1';
            in_idlehit <= '0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
