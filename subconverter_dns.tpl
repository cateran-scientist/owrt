dns:
  enable: true
  nameserver:
  - 9.9.9.9#PG_DNS
  - 149.112.112.112#PG_DNS
  - 8.8.8.8#PG_DNS
  - 8.8.4.4#PG_DNS
  - tls://dns.quad9.net#PG_DNS
  - tls://dns.google#PG_DNS
  - tls://1.1.1.1#PG_DNS
  - tls://jp.tiar.app#PG_DNS
  - tls://dot.tiar.app#PG_DNS
  - https://dns.quad9.net/dns-query#PG_DNS
  - https://dns.google/dns-query#PG_DNS
  - https://dns.cloudflare.com/dns-query#PG_DNS
  - https://1.1.1.1/dns-query#PG_DNS
  - https://public.dns.iij.jp/dns-query#PG_DNS
  - https://jp.tiar.app/dns-query#PG_DNS
  - https://jp.tiarap.org/dns-query#PG_DNS
  - https://doh.dnslify.com/dns-query#PG_DNS
  - https://dns.twnic.tw/dns-query#PG_DNS
  - https://dns.oszx.co/dns-query#PG_DNS
  - https://doh.applied-privacy.net/query#PG_DNS
  - https://dnsforge.de/dns-query#PG_DNS
  - https://doh.ffmuc.net/dns-query#PG_DNS
  - https://doh.mullvad.net/dns-query#PG_DNS
  default-nameserver:
  - 8.8.8.8#PG_DNS
  - 1.1.1.1#PG_DNS
  - 9.9.9.9#PG_DNS
  - 94.140.14.14#PG_DNS
{% if default(request.direct_dns, "") != "" %}
  proxy-server-nameserver:
  - {{ request.direct_dns }}
  nameserver-policy:
    geosite:cn:
    - {{ request.direct_dns }}
{% else if default(global.direct_dns, "") != "" %}
  proxy-server-nameserver:
  - {{ global.direct_dns }}
  nameserver-policy:
    geosite:cn:
    - {{ global.direct_dns }}
{% endif %}
