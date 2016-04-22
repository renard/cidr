--- # -*-  yaml -*-

# Device example
devices:
 
  - name: c7600.example.com
    username: cird
    password: password-for-cidr
    enable: enable-password
    protocol: ssh
    driver: cisco7600
    
  # No need to enable
  - name: sw1.example.com
    username: cidr
    password: password-for-cidr
    driver: foundry-fls
    protocol: ssh
    same-as:
      - sw2.example.com
      - sw3.example.com
      - sw4.example.com

  - name: jm8.example.com
    username: cidr
    password: password-for-cirdr
    driver: juniper-m
    protocol: ssh
   
  - name: swc.example.com
    username: cidr
    password: password-for-cirdr
    driver: cisco-catalyst
    protocol: ssh
