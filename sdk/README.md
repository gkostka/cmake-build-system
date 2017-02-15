unified-sdk: about
=====

Get all git submodules:
```
git submodule update --init --recursive
```

Debug via openocd & eclipse. Tools needed: 
 - Eclipse Luna (or Mars) for C/C++ developers
 - GNU ARM Eclipse Plugin
 - Open On-Chip Debugger 0.9.0

Openocd options:
 - SAM-ICE or J-LINK:

```
openocd -f interface/jlink.cfg -f board/atmel_sam4e_ek.cfg -c "init" -c "halt" -c "adapter_khz 5000"
```
 - ATMEL-ICE:

```
openocd -f interface/cmsis-dap.cfg -f board/atmel_sam4e_ek.cfg -c "init" -c "halt" -c "adapter_khz 5000"
```

Erase & unlock flash via openocd cli:
```
telnet localhost  -r 4444
flash erase_address unlock 0x00400000 0x100000
```
 
Unlock MCU after ERASE pin asserting:
```
telnet localhost  -r 4444
at91sam4 gpnvm set 1
```
