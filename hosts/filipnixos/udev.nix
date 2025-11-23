{...}: {
  services.udev.extraRules = ''
    # input (forgot why I needed it, but ig it has to stay here)
    KERNEL=="event*", SUBSYSTEM=="input", MODE="0666"
    # PS5 DualSense controller, wine/proton needs permissions
    KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0666", TAG+="uaccess"
    KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0666", TAG+="uaccess"
  '';

  hardware.uinput.enable = true;
}
