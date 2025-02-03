{lib, ...}: {
  time = {
    timeZone = lib.mkDefault "America/Chicago";
    hardwareClockInLocalTime = lib.mkDefault true;
  };
}
