Build system test project
=====

Compile :
```
make generate 
cd build_project_name
make -j4
```
 
Debug connection (USB to Serial converter):
```
picocom -b 115200 /dev/ttyUSB0 --imap lfcrlf
```

Console connection (USB CDC class):
```
picocom -b 115200 /dev/ttyACM0 --imap lfcrlf
 ```
Detailed debug instructions in sdk/README.md.