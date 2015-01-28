TARGET := lsock.so
CFLAGS := -g -Wall -I/usr/local/include -I/usr/include/lua5.2 -I/usr/include/x86_64-linux-gnu
LDFLAGS :=  --shared -fPIC -L/usr/lib/x86_64-linux-gnu

all : lsock.c
	gcc -o $(TARGET) $(CFLAGS) $^ $(LDFLAGS) 

clean :
	rm -f lsock.so
