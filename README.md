# Openvpn ansible!

This ansible will allow you to configure an Openvpn server on a Debian based machine

## No warranty
Please note that the use of this ansible config is at your own risk. Please only use it if you have some knowledge of
Openvpn and Linux so you can fix it if need be.

## What was this tested with ?
- Debian 7
- Raspbian
(but it will probably also work for Ubuntu)

## What this installs:
- Openvpn
- UFW (for firewalling and storing the forwarding rules)
- Postfix mail server (if install_postfix=yes)
- an Openvpn user (after install you need to add/remove users under this user as the keys and files are all owned by this user)
- a vpn certificate for the first user (and removes it to create the crl.pem file)

## You will need a few things

* A clean server with a private network.
* Sudo access for your user to set up Openvpn
* An internal network to connect to (not public ips)
* the public ip of your machine
* the ip you can ssh into the machine (this can be the same as the public)
* copy and fill out this file:  inventory/Openvpn-hosts and customise it to your needs (change the addresses and names!)

## Manual
This thing comes with three scripts on your newly setup vpn server:
addvpnuser          (adds a user, requests a password, requires unique name, and emailaddress as arguments
removevpnuser       (revokes a certificate)
addvpnusernopass    (adds a vpn user without asking for a password. requires a unique name as an argument)

### Adding a vpn account
Run the following command as user openvpn. (It will ask for a password input)
/etc/Openvpn/addvpnuser johndoe john@example.com

### Removing a vpn account
Run the following command as user openvpn:
/etc/Openvpn/removevpnuser johndoe johndoe@example.com

## Why did I write this ?
I wanted to set up a VPN for my home network and servers in the DC. At work I started using a lot of ansible to set up servers.
I wasn't able to find any straightforward "set up Openvpn" ansible playbooks for the way I wanted it.
Since I hate repeating the same work over and over. I thought: "Why not make one myself?"
And here is the result.

## Using this and want to thank me ?
Please conciser donating sending some mBT to me ;)
1KkRZBVJdAox5QohCzbE5DBQHkNQFNThCA

# License

Copyright 2014 John Bakker <me@johnbakker.name>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.