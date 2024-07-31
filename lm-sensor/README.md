### LM-SENSORS:

**lm-sensors (`Linux-monitoring sensors`) is a free open-source powerful and versatile software tool, used for monitoring the temperature, voltage, humidity, chassis intrusions, and fan speeds of various hardware components in Linux systems.** It interacts with sensor chips built into motherboards and provides real-time data about system health, which can be crucial for diagnosing hardware issues and ensuring optimal performance.

**lm-sensors was originally created by Rudolf Marek and has been maintained and developed by various contributors over time.** The project is now managed by the lm-sensors development team, which includes volunteers and contributors from the open-source community. The tool is part of the Hardware Monitoring (`hwmon`) subsystem in the Linux kernel, and its development has involved contributions from numerous individuals who have worked on sensor chip support, kernel modules, and user-space utilities.

**During 2001/2004, the lm_sensors package was not recommended for use on IBM ThinkPads due to potential (`EEPROM`) corruption issues on some models when aggressively probing for (`I2C`) devices.** 

> This has since been dealt with, and the separate README file dedicated to ThinkPads was removed in 2007. In 2013, the sensors-detect command of lm-sensors began disrupting the gamma correction settings of some laptop display screens. This occurs while it is probing the (`I2C/SMBus`) adapters for connected hardware monitoring devices. Probing of these devices was disabled by default.
