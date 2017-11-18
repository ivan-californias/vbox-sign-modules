# vbox-sign-modules
Scripts for signing virtualbox kernel modules

## Create a key

To create and enroll a key run:
```
./create-key.sh
```

This has to be done just once

## Sign VirtualBox modules

Run the script:
```
./sign-modules.sh
```

This can be done each time VirtualBox brokes due to a kernel update
