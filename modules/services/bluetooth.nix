# -----------------------------------------------------------------------------
# Bluetooth configuration
# -----------------------------------------------------------------------------
#
# Reference: https://wiki.nixos.org/wiki/Bluetooth
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  services.blueman.enable = true;         # Enables the Blueman applet for managing Bluetooth devices via a desktop UI

  hardware.bluetooth = {
    enable = true;                        # Enables Bluetooth hardware support
    powerOnBoot = true;                   # Powers on Bluetooth automatically at boot

    settings = {
      General = {
        Experimental = true;              # Shows battery levels of connected devices (if supported by the adapter)
        FastConnectable = true;           # Allows faster reconnections at the cost of slightly higher power usage
      };
      Policy = {
        AutoEnable = true;                # Automatically enables all Bluetooth controllers when found or plugged in
      };
    };
  };
}
