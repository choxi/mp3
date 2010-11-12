FILENAME = mp31
$(FILENAME): $(FILENAME).asm
	LC3bAssembler $(FILENAME).asm -v
	doify.sh $(FILENAME).vhd
	mv $(FILENAME).vhd.do $(FILENAME).do

clean:
	rm -f *.vhd
