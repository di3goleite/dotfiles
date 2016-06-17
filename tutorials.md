List monitors and hdmi devices:

```
sudo xrandr --prop
```

List Wifi network available:

```
sudo iwlist wlp8s0 scan | grep SSID
```

Connect to a Wifi network

```
nmcli d wifi connect hue password 123tapioca
```

Change brightness (0-900):

```
echo 0 | sudo tee /sys/class/backlight/acpi_video0/brightness
```

Set proxy:

```
export http_proxy="10.65.16.2:3128"
```

Unset proxy

```
unset http_proxy
```
