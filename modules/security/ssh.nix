# -----------------------------------------------------------------------------
# OpenSSH Server Configuration
# -----------------------------------------------------------------------------
#
# Reference: https://nixos.org/manual/nixos/stable/#sec-openssh
# Last updated: 2025-10-09
#
# -----------------------------------------------------------------------------
{
  services.openssh = {
    enable = true;  
    # Enables the OpenSSH server, allowing remote SSH connections.

    ports = [ 22 ];  
    # List of ports that the SSH server listens on. Default is 22.
    # Can be changed for security or network requirements.

    settings = {
      PasswordAuthentication = true;  
      # Allows login using passwords. For better security, consider using SSH keys
      # and setting this to false.

      AllowUsers = null;  
      # Determines which users can log in via SSH.
      # null → all users are allowed.
      # Example: [ "user1" "user2" ] to restrict access.

      UseDns = true;  
      # Resolves client IPs to hostnames using DNS.
      # Can slow down login if DNS is slow. Set to false to improve performance.

      X11Forwarding = true;  
      # Disables X11 forwarding (GUI applications over SSH).
      # Set to true if you need to run graphical apps remotely.

      PermitRootLogin = "prohibit-password";  
      # Controls root login over SSH:
      # "yes" → root can login with password or key
      # "without-password" → root can login only with key
      # "prohibit-password" → root login allowed only with key (recommended)
      # "forced-commands-only" → root can login with key, forced command required
      # "no" → root login disabled
    };
  };
}
