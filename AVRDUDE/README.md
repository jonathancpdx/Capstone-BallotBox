# Uploading Code Via AVRDUDE & Ubuntu
## Required Downloads
* Ubuntu
* Vim (Or any other text editor)
* avr-gcc
* avr-dude
* avr-libc
---
## Getting Started
Below will list steps to get setup and running

### How to Installing in a Ubuntu VM
```
git clone git@github.com:jonathancpdx/Capstone-BallotBox.git
cd Capstone-BallotBox/AVRSUDE
sudo apt-get install vim avrdude avrdude-doc avr-gcc avr-libc
chmod 755 compile uplaod
```
### Connect the Arduino to the VM
Under Devices -> USB, check the box next to your Arduino device

### How to Compile
```
sudo ./compile
```

### How to Upload
```
sudo ./upload
```
---
## Possible Errors
### Error: avrdude ser_open() can't open device
If you encounter this error it is likely a permission issue. try the following
```
sudo chmod a+rw <LocationOfArduinoDevice>
```
In my case the Adruino was connected at "/dev/tryACM0"
