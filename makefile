hi: build/hi.o
	ld -s -o bin/hi build/hi.o

build/hi.o: src/hi.asm
	nasm -f elf64 src/hi.asm -o build/hi.o

clean:
	rm -fr bin/* build/*

