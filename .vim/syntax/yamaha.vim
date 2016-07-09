" Vim syntax file
" Language:		YamahaRT config
" Maintainer:	okkiroxx
" Last Change:	2016/7/9
" Credits:

setlocal iskeyword+=*,-,.,/

syn match	yamahaNumber	"\(\s\|,\|=\|-\|\[\)\@<=[0-9]*\(\s\|,\|=\|\]\|$\)\@="
syn match	yamahaString	\".*"\
syn match	yamahaTime		"[0-9]\{1,2}:[0-9]\{1,2}"
syn match	yamahaIPv4		"\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}"
							\ nextgroup=yamahaSubnet
syn match	yamahaSubnet	"[0-9a-zA-Z]\@<=\/\d\{1,2}\(\s\|$\)\@="
syn match	yamahaEmail		"\S*@\S*"
syn match	yamahaURL		"\(\S\+\.\)\{1,}\S\+"
syn match	yamahaTunnel	"tunnel[0-9*]*"
syn match	yamahaVlan		"vlan[0-9*]*"
syn match	yamahaPP		"pp[0-9*]*"
syn match	yamahaBind		"[0-9a-zA-Z]*-[0-9a-zA-Z]*"
syn match	yamahaSplitinto	"split-into-[1-9:]\+"
syn match	yamahaPort		"\(tcp\|udp\)\/[0-9]\+"
syn match	yamahaComment	"^#.*$"

syn keyword yamahaStatement		user admin
syn keyword yamahaStatement		password prompt login security class
syn keyword yamahaStatement		source-route directed-broadcast
syn keyword yamahaStatement		administrator console ip provider pp pppoe
syn keyword yamahaStatement		tunnel ipsec nat dhcp dns pptp upnp
syn keyword yamahaStatement		select ppp mtu
syn keyword yamahaStatement		filter descriptor
syn keyword yamahaStatement		name keepalive
syn keyword yamahaStatement		address route proxyarp
syn keyword yamahaStatement		always-on use disconnect
syn keyword yamahaStatement		auth secure server bind
syn keyword yamahaStatement		netvolante-dns hostname host
syn keyword yamahaStatement		remote service pool interval
syn keyword yamahaStatement		routing connection type
syn keyword yamahaStatement		default gateway
syn keyword yamahaStatement		accept myname dynamic
syn keyword yamahaStatement		lcp mru ipcp ipaddress msext ccp
syn keyword yamahaStatement		enable disable set
syn keyword yamahaStatement		request username
syn keyword yamahaStatement		ipv6cp group
syn keyword yamahaStatement		sa policy ike log heartbeat local
syn keyword yamahaStatement		pre-shared-key
syn keyword yamahaStatement		text mss limit
syn keyword yamahaStatement		encapsulation time
syn keyword yamahaStatement		reject reject-nolog restrict
syn keyword yamahaStatement		static-pass-nolog static-pass-log
syn keyword yamahaStatement		pass pass-nolog pass-log
syn keyword yamahaStatement		established except
syn keyword yamahaStatement		tcpfin tcprst
syn keyword yamahaStatement		masquerade static refresh
syn keyword yamahaStatement		compliant except scope spoof
syn keyword yamahaStatement		recursive syslog
syn keyword yamahaStatement		call prohibit auth-error
syn keyword yamahaStatement		analog supplementary-service pseudo call-waiting
syn keyword yamahaStatement		extension dial prefix line sip
syn keyword yamahaStatement		alarm data httpd
syn keyword yamahaStatement		notice tftp schedule at ntpdate
syn keyword yamahaStatement		intrusion detection process
syn keyword yamahaStatement		l2tp nat-traversal transport mail
syn keyword yamahaStatement		port-based-option
syn keyword yamahaStatement		external refer sshd
syn keyword yamahaStatement		key generate encrypted description connect
syn keyword yamahaStatement		inbound list stealth
syn keyword yamahaStatement		outer inner incoming
syn keyword yamahaStatement		snmp sysname retry
syn keyword yamahaStatement		statistics cpu memory
syn keyword yamahaStatement		ipv6 rtadv send mld router version
syn keyword yamahaStatement		hash endpoint
syn keyword yamahaStatement		vlan mapping


syn keyword yamahaBuiltin	in out on off none all
syn keyword yamahaBuiltin	lan1 lan2 lan3
syn keyword yamahaBuiltin	isdn-terminal
syn keyword yamahaBuiltin	retry-interval count
syn keyword yamahaBuiltin	pap chap mschap mschap-v2
syn keyword yamahaBuiltin	anonymous mppe-any
syn keyword yamahaBuiltin	esp 3des-cbc md5-hmac sha-hmac aes-cbc sha
syn keyword yamahaBuiltin	auto normal
syn keyword yamahaBuiltin	udp tcp icmp www nntp *
syn keyword yamahaBuiltin	netbios_ns-netbios_ssn
syn keyword yamahaBuiltin	netbios_ns netbios_dgm netbios_ssn
syn keyword yamahaBuiltin	ident ftpdata domain ntp gre
syn keyword yamahaBuiltin	ftp smtp pop3 telnet submission
syn keyword yamahaBuiltin	rfc2131 remain-silent
syn keyword yamahaBuiltin	any private lan
syn keyword yamahaBuiltin	port smtp-auth plain
syn keyword yamahaBuiltin	http netmeeting
syn keyword yamahaBuiltin	General Mail IPsec fqdn





hi link yamahaNumber	Number
hi link yamahaTime		Number
hi link yamahaString	String
hi link yamahaIPv4		Number
hi link yamahaSubnet	Number
hi link yamahaEmail		String
hi link yamahaURL		String
hi link yamahaBind		String
hi link yamahaTunnel	Function
hi link yamahaVlan		Function
hi link yamahaPP		Function
hi link yamahaComment	Comment
hi link yamahaStatement	Statement
hi link yamahaEqual		Statement
hi link yamahaBuiltin	Function
hi link yamahaSplitinto	Function
hi link yamahaPort		Function
