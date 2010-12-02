#!/bin/bash
# scripted by Daniel Manjarres 9-24-2008
# useful for ECE411 students to not have to restart the simulator
# just to reload a program
# update 10-10-09 to support the alternative format used by the mp2.1 test code
# update 11-3-2009 to support split instruction/data memories

if [ -z "$1" ]
then
	echo "Usage: $0 memvectors.vhd [clock period] [memory path[,second_memory_path]]"
	echo
	echo
	echo "will produce a modelsim 'do' file that loads the given program"
	echo "file into memory and initializes the simulator"
	exit 1
fi

if [ ! -e "$1" ]
then
	echo file "$1" not found
	exit 2
fi

#this is an example of how setting up multiple DRAMS might look
#DEFAULT_MEMPATHS="/mp1_cpu/idram/vhdl_memory,/mp1_cpu/ddram/vhdl_memory"
DEFAULT_MEMPATHS="/mp3_cpu/memory/DRAM/vhdl_memory"

DEFAULT_CLOCK=34

CLOCK=${2:-${DEFAULT_CLOCK}}
HALF_CLOCK=$((CLOCK/2))
MEMPATHS=${3:-$DEFAULT_MEMPATHS}

(
cat << EOF
echo "--- Executing initialization force file for $1 ---"

echo "Setting clock period to $CLOCK ns, starting at $CLOCK ns."
force /clk 1  0
force /clk 0 $HALF_CLOCK -r $CLOCK
force /clk 1 $CLOCK -r $CLOCK

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

-- echo "Initializing the processor."
-- force /start_h 0 @0
-- force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
-- force /start_h 0 @ 100

echo "Done initializing processor, loading $1 program code."
EOF

for MEMPATH in $(echo "$MEMPATHS" | tr "," " ")
do
	#must also handle the syntax
	#mem(288) := X"C0";

	cat $1 | tr -d " " | (while read a; do echo "change ${MEMPATH}/"${a}; done) |
			sed -e s/":=To_stdlogicvector("/" "/g |
			sed -e s/:=/" "/g |
			sed -e s/");"//g
done

cat << EOF
run 5
echo "Done loading $1 program code."
EOF

) > $1.do
