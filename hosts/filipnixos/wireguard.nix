{...}: {
  networking.wg-quick.interfaces.wg0 = {
    address = [
      "10.100.1.0/16"
    ];

    peers = [
      {
        publicKey = "4f8Qr2M09vJn8ag6EM9MTK6bYS8jRfz1bqQLeCJ5izo=";
        allowedIPs = [ "10.100.0.1/16" ];
        endpoint = "138.201.36.152:51820";
      }
    ];

    privateKeyFile = "/etc/wireguard/nw.key";
  };
}
