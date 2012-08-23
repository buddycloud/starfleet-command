modules_enabled = {
   "roster"; "saslauth"; "tls"; "dialback"; "disco"; "time"; "ping"; "posix";
   "register"; "bosh"; "watchregistrations"; "compression"; "legacyauth";
};
daemonize = true

storage = "sql"
sql     = { driver = "PostgreSQL"; database = "sfc_prosody"; host = "localhost" ;
            username = "sfc"; password = "sfc_s3cr3t_p4ssw0rd" }
admins  = { "picard@enterprise.sf", "sisko@ds9.sf", "janeway@voyager.sf" }
pidfile = ".pid/prosody.pid"
log     = {
   debug = "log/prosody.dbg";
   info  = "log/prosody.log";
   error = "log/prosody.err";
}

bosh_ports = {{ interface = "127.0.0.1"; port = 5280; }}
consider_bosh_secure = true

-- enterprise.sf
VirtualHost "enterprise.sf"
  authentication     = "internal_hashed"
  allow_registration = false
  anonymous_login    = false

VirtualHost "anon.enterprise.sf"
  authentication     = "anonymous"
  allow_registration = false
  anonymous_login    = true
  disallow_s2s       = true

Component "buddycloud.enterprise.sf"
  component_secret   = "sfc_p4ssw0rd"
Component "topics.enterprise.sf"
  component_secret   = "sfc_p4ssw0rd"

-- ds9.sf
VirtualHost "ds9.sf"
  authentication     = "internal_hashed"
  allow_registration = false
  anonymous_login    = false

VirtualHost "anon.ds9.sf"
  authentication     = "anonymous"
  allow_registration = false
  anonymous_login    = true
  disallow_s2s       = true

Component "buddycloud.ds9.sf"
  component_secret   = "sfc_p4ssw0rd"
Component "topics.ds9.sf"
  component_secret   = "sfc_p4ssw0rd"

-- voyager.sf
VirtualHost "voyager.sf"
  authentication     = "internal_hashed"
  allow_registration = false
  anonymous_login    = false

VirtualHost "anon.voyager.sf"
  authentication     = "anonymous"
  allow_registration = false
  anonymous_login    = true
  disallow_s2s       = true

Component "buddycloud.voyager.sf"
  component_secret   = "sfc_p4ssw0rd"
Component "topics.voyager.sf"
  component_secret   = "sfc_p4ssw0rd"
