GPPPARAMS = -m32 -fno-use-cxa-atexit -stdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS =-melf_i386

objects = loader.o kernel.o

%.o: %.cpp
		g++$(GPPPARAMS) -O @ -c $<

%.o: %.s
		as $(ASPARAMS) -o $0 $<

mykernel.bin: linker.id $(objects)
		ld $(LDPARAMS) -T $< -o $@ $(objects)
install: mykernel.bin
		sudo cp $< /boot/mykernel.bin