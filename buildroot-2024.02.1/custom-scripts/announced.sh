#!/bin/sh
  
  #Destination IP and Port
  DEST_IP=192.168.15.4
  DEST_PORT=7001
  INTERFACE="eth0"
  
  
  while [ true ]; do
    # Get IP addr, Hostname and MAC Addr
    IP_ADDRESS=$(ip addr show $INTERFACE | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
    HOSTNAME=$(hostname)
    MAC_ADDRESS=$(ip link show $INTERFACE | awk '/ether/ {print $2}')
    
    # Combine the information
    MESSAGE="IP Address: $IP_ADDRESS, Hostname: $HOSTNAME, MAC Addr: $MAC_ADDRESS"
      
    # Send the message through UDP
    echo "$MESSAGE" | nc -uw 1 $DEST_IP $DEST_PORT
    
    echo "Message sent: $MESSAGE"
  
    # Wait for 1 second before the next run
    sleep 1
  done
