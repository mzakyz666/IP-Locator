#!/usr/bin/perl
#IP Geolocation
#https://errorcybernews.com
#Kernel Panic
#API documentation - http://ip-api.com/docs/
#you can see you external ip using this Bash script:
#read COUNTRY IP <<< $(wget -qO- http://ip-api.com/line/?fields=countryCode,query); echo $IP $COUNTRY
#It may give you error if you havent updated your perl libs
#So to update and install. For Kali Linux or similliary, use command: $ apt-get install liblocal-lib-perl

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
print color 'bold bright_yellow';
 
print q{

················································································
································pPC·········)bp·································
····························pQDP··············)QDbp·····························
························ppDDDPc·················)DDDDpc·························
······················DDDDDP······················cDDDDDD·······················
·····················dDDDDD·························DDDDD·······················
·····················)DDDDD························)DDDDD·······················
·····················)DDDDDp·······················)DDDDD·······················
·····················)DDDDDC·········ppDpc·········DDDDDD·······················
·····················(DDDDDD·····spDDDDDDDDDp······DDDDDDP······················
·····················QDDDDDD··pDDDDDDPS·)DDDDDDbp·)DDDDDDb······················
·····················DDDDDDDbppc)PC·········PPScppDDDDDDDC······················
··················pDDDDDDDDDDDDDDDpc·······ppDDDDDDDDDDDDDDbp···················
··············spDDDDDDDDDDDDDDDDDDDDDDD·DDDDDDDDDDDDDDDDDDDDDDDp················
···········pDDDDDDDDDDDDDDDDDDDDPPPPPPP·PPPPPPQDDDDDDDDDDDDDDDDDDDbp············
·······spDDDDDDDDDDPCc·)p)DDDDDDDp···········dDDDDDDP·p··)PPDDDDDDDDDDp·········
·······SDDDDDDPCc······)DDbc)DDDDDb·········QDDDDPSpDDD········)PDDDDDDP········
·······SDDP············)DDDP···)DPP)·······)PDP····DDDD·············DDDP········
·······SDD·············)DDDP·····)DDDp···dDDD······DDDD·············)DDP········
·······SDP·············)DDDb······DDDDp·pDDDD······DDDD··············DDP········
·······SD··············)DDDDDDpc··DDDDDDDDDDC··ppDDDDDD··············)DP········
·······SP·················)PDDDDD·SDDDDDDDDDP)DDDDDPS·················)P········
·······(······················PDDb)DDDDDDDDD·DDPC······················P········
·································)sDDDDDDDDD·c··································
·······························spDDDDDDDDDDDDDp·································
····························spDDDDDDDDDDDDDDDDDDDp······························
············)PDbppc······spDDDDDDDDDPPc·)PDDDDDDDDDDp·······sppQPPc·············
················)PDDDDDDDDDDDDDDPPc·········)PDDDDDDDDDDDDDDDP··················
····················)PDDDDDDPCc··················SDDDDDDDPS·····················
························)S···························)C·························
················································································
       ####### ######  ######  ####### ######     #         ###   #       
       #       #     # #     # #     # #     #    #    #   #   #  #    #  
       #       #     # #     # #     # #     #    #    #  #     # #    #  
       #####   ######  ######  #     # ######     #    #  #     # #    #  
       #       #   #   #   #   #     # #   #      ####### #     # ####### 
       #       #    #  #    #  #     # #    #          #   #   #       #  
       ####### #     # #     # ####### #     #         #    ###        # 

IP Geolocation Tool  

------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Usage : ./iplocation.pl [host] [ip] [domain] \n\nEx:  ./iplocation.pl  www.google.com \n     ./iplocation.pl  216.58.210.206\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] City: ", $info->{'city'}, "\n";
print "  [+] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Geo: ", "Latitude: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  [+] Time: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [+] As number/name: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Country code: ", $info->{'countryCode'}, "\n"; 
print "  [+] Status: ", $info->{'status'}, "\n"; 
print "\n";
# EOF
