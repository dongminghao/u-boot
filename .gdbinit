# 

# J-LINK GDB SERVER initialization 

# 

# This connects to a GDB Server listening 

# for commands on localhost at tcp port 2331 

target remote 192.168.0.104:2331 #首先连接主机的GDB Server，端口都是2331。

#注意主机的GDB Server勾掉"Localhost only"选项，否则连接不上 

# Set JTAG speed to 30 kHz 

monitor speed 30 

 

# Set GDBServer to little endian 

monitor endian little 

 

# Reset the chip to get to a known state. 

monitor reset 

 

# 

# CPU core initialization 

# 

 

# Set the processor mode 

monitor reg cpsr = 0xd3 

 

#disable watchdog 

monitor MemU32 0x53000000 = 0x00000000 

 

#disable interrupt 

monitor MemU32 0x4A000008 = 0xFFFFFFFF #INTMSK 

monitor MemU32 0x4A00000C = 0x00007FFF #INTSUBMSK 

 

#set clock 

monitor MemU32 0x4C000000 = 0x00FFFFFF 

monitor MemU32 0x4C000014 = 0x00000005 

monitor MemU32 0x4C000004 = 0x0005C011 

 

#config sdram 

monitor MemU32 0x48000000 = 0x22011110 #conw 

monitor MemU32 0x48000004 = 0x00000700 #bank0 

monitor MemU32 0x48000008 = 0x00000700 #bank1 

monitor MemU32 0x4800000C = 0x00000700 #bank2 

monitor MemU32 0x48000010 = 0x00000700 #bank3 

monitor MemU32 0x48000014 = 0x00000700 #bank4 

monitor MemU32 0x48000018 = 0x00000700 #bank5 

monitor MemU32 0x4800001C = 0x00018005 #bank6 

monitor MemU32 0x48000020 = 0x00018005 #bank7 

monitor MemU32 0x48000024 = 0x008E04F4 #vREFRESH 

monitor MemU32 0x48000028 = 0xB1 #vBANKSIZE -- 128M/128M --- should 

monitor MemU32 0x4800002c = 0x30 #vMRSRB6 

monitor MemU32 0x48000030 = 0x30 #vMRSRB7 

 

# Set auto JTAG speed 

monitor speed auto 

 

# Setup GDB FOR FASTER DOWNLOADS 

set remote memory-write-packet-size 1024 

set remote memory-write-packet-size fixed 

 

# Load the program executable called "image.elf" 

# load image.elf 
load u-boot

b _start 

#load 

continue 

