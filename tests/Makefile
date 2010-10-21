$FILENAME = "mp31"
mp31: mp31.asm
	LC3bAssembler mp31.asm -v
	doify.sh mp31.vhd
	mv mp31.vhd.do mp31.do

clean:
	rm -f *.vhd
