hi: build/hi.o
	ld -s -o bin/hi build/hi.o

build/hi.o: hi.asm
	nasm -f elf64 hi.asm -o build/hi.o

clean:
	rm -fr bin/* build/*

