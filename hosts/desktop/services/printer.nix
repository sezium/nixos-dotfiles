# see https://nixos.wiki/wiki/Printing

# to see device use: avahi-browse -rt _ipp._tcp
# lpinfo -m | grep Brother 
# this if you want to see the driver model 

# also see: http://localhost:631/
# manualmente
# sudo lpadmin -p NOME_STAMPANTE -E -v ipp://192.168.1.105/ipp -m brother-hl1210w.ppd

{ pkgs, ... }:

{


  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-brother-hl1210w  # Driver specifico per HL-1210W (compatibile con HL-1212W)
    ];
  };

  # To set printer static ip see: http://localhost:631/

  hardware.printers = {
    ensureDefaultPrinter = "HL-1212W";
    ensurePrinters = [
    {
      name = "HL-1212W";
      location = "Home";

      deviceUri = "ipp://192.168.1.105/ipp"; 
      model = "brother-HL1210W-cups-en.ppd";

      ppdOptions = {
        PageSize = "A4";
      };
    }
    ];

  };
}
