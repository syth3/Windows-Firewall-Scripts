# Delete all old rules
Remove-NetFirewallRule -All

# Allow DNS Server
New-NetFirewallRule -DisplayName "DNS In Server" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 53
New-NetFirewallRule -DisplayName "DNS Out Server" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 53

# Allow DNS Client (I assumed that the AD server needs to get it's DNS from somewhere)
New-NetFirewallRule -DisplayName "DNS In Client" -Direction Inbound -Action Allow -Protocol UDP -RemotePort 53
New-NetFirewallRule -DisplayName "DNS Out Client" -Direction Outbound -Action Allow -Protocol UDP -RemotePort 53

# Allow RPC
New-NetFirewallRule -DisplayName "RPC In" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 135
New-NetFirewallRule -DisplayName "RPC Out" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 135

# Allow LDAP
New-NetFirewallRule -DisplayName "LDAP TCP In" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 389,636,3268,3269
New-NetFirewallRule -DisplayName "LDAP UDP In" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 389
New-NetFirewallRule -DisplayName "LDAP TCP Out" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 389,636,3268,3269
New-NetFirewallRule -DisplayName "LDAP UDP Out" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 389

# Allow Kerberos
New-NetFirewallRule -DisplayName "Kerberos TCP In" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 88,464
New-NetFirewallRule -DisplayName "Kerberos UDP In" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 88,464
New-NetFirewallRule -DisplayName "Kerberos TCP Out" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 88,464
New-NetFirewallRule -DisplayName "Kerberos UDP Out" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 88,464

# Allow SMB
New-NetFirewallRule -DisplayName "SMB TCP In" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 445
New-NetFirewallRule -DisplayName "SMB UDP In" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 445
New-NetFirewallRule -DisplayName "SMB TCP Out" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 445
New-NetFirewallRule -DisplayName "SMB UDP Out" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 445

# Allow Windows Time
New-NetFirewallRule -DisplayName "Windows Time In" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 123
New-NetFirewallRule -DisplayName "Windows Time Out" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 123

# Allow ICMP
New-NetFirewallRule -DisplayName "ICMP" -Direction Inbound -Action Allow -Protocol ICMPv4 -IcmpType 0,8
New-NetFirewallRule -DisplayName "ICMP" -Direction Outbound -Action Allow -Protocol ICMPv4 -IcmpType 0,8

# Allow Client Web Access
New-NetFirewallRule -DisplayName "Web" -Direction Inbound -Action Allow -Protocol TCP -RemotePort 80,443
New-NetFirewallRule -DisplayName "Web" -Direction Outbound -Action Allow -Protocol TCP -RemotePort 80,443

# Set default rule for all profiles to deny for both ingress and egress
Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultInboundAction Block -DefaultOutboundAction Block
