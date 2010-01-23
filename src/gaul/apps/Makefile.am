CFLAGS=`guile-config compile`
LIBS=`guile-config link`

O_FILES=gaul.o

all: gaul

gaul: $(O_FILES)
	$(CC) $(O_FILES) $(LIBS) -o gaul

clean:
	-rm -rf gaul $(O_FILES)
