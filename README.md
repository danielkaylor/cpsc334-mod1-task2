# cpsc334-mod1-task2
Generative Art for CPSC 334 Module 1, Task 2

This is an example of generative art made for the Becton Center Café display at Yale University. It is named *TODO*.

In order for this to run on boot on the Raspberry Pi, do the following:

1. Create a bash script with the following contents:

```
export DISPLAY=:0.0
/usr/local/bin/processing-java --sketch=/home/pi/Desktop/module_1 --run
```

2. Add the following line of code to /etc/xdg/lxsession/LXDE-pi/autostart:

```
@bash /home/pi/path-to-bash-script
```

replacing ```path-to-bash-script``` with the path to the bash script you just wrote.

3. Reboot the Pi, or continue on and reboot at the end of setup.

The Becton Center Café display does not need to worry about overscanning, but the default settings on the Pi will assume overscan is a problem, reducing the size of the display and putting black bars around the edges. Use the following steps to avoid this problem:

1. Open /boot/config.txt with a text editor.

2. Scroll down until you see ```#disable_overscan=1```. It is probably commented out.

3. Uncomment the line and make sure it says ```disable_overscan=1```.

4. Reboot the Pi, or continue on and reboot at the end of setup.

Finally, the Raspberry Pi will go to sleep after a certain amount of time without any user input. This is not ideal for a generative piece of art. You can disable this feature with the following steps:

1. Open /etc/lightdm/lightdm.conf with a text editor.

2. Scroll down until you see ```#xserver-command=X```, which can be found under \[SEAT:\*]. It is most likely commented out.

3. Uncomment this line and add arguments to the end so it looks like this:

```
xserver-command=X -s 0 -dpms
```

4. Reboot the Pi.

That's it! Go off and enjoy *TODO*!
