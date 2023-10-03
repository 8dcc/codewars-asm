
ASM=nasm
ASMFLAGS=-g -f elf64

OBJDIR=obj
ASM_OBJS=$(addprefix $(OBJDIR)/, $(patsubst %.asm, %.o, $(wildcard *.asm)))

.PHONY: all clean

all: $(ASM_OBJS)

clean:
	rm -rf $(OBJDIR)

$(OBJDIR)/%.o: %.asm
	@mkdir -p $(dir $@)
	$(ASM) $(ASMFLAGS) -o $@ $<
