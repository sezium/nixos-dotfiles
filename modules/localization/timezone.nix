# -----------------------------------------------------------------------------
# Timezone Configuration
# -----------------------------------------------------------------------------
#
# Reference: https://nixos.org/manual/nixos/stable/#sec-timezone
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  time.timeZone = "Europe/Rome";  
  # Sets the system timezone to Europe/Rome.
  #
  # This affects:
  # - System clock and logs
  # - Timestamps in applications that use the system time
  #
  # Make sure this matches your local time zone to avoid incorrect time displays.
}
