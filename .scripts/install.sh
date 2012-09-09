# Copyright 2012 Thomas Jost
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software stributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

function sfc_install() {
    bold "buddycloud: the final frontier. This is the installer for the starships"
    bold "Enterprise and Voyager and the station DS9. Their continuing mission: to"
    bold "explore strange new servers, to seek out new bugs and features, to boldly"
    bold "debug where no man ${LGRAY}or bird${BOLD} has debugged before."
    read

    echo "This script will (try to) help you install and configure a few instances"
    echo "of the buddycloud server and web client."
    echo
    echo "You must first install the following components by yourself, probably"
    echo "using your package manager:"
    echo " - prosody 0.8.2: a very good XMPP server written in Lua"
    echo " - postgresql (server + client libraries): a rock-solid SQL database"
    echo " - nodejs: a JavaScript engine based on V8 (same as Google Chrome)"
    echo " - npm: the NodeJS package manager"
    echo " - luasec, lua-zlib, luadbi: libraries needed by prosody"
    echo " - icu, expat (and their -dev parts): libraries needed by the buddycloud"
    echo "   server"
    echo " - git, gcc, make, etc.: common development tools"
    echo
    bold "Go install these now, and press Enter when you're done :)"
    read

    bold "First step: DNS. But local only :) Please add the following lines to your"
    bold "/etc/hosts file, then press Enter."
    echo
    cyan "# BEGIN SFC - Starfleet Command, a federation of buddycloud servers"
    cyan "127.0.0.1 enterprise.sf anon.enterprise.sf buddycloud.enterprise.sf topics.enterprise.sf"
    cyan "127.0.0.1 ds9.sf        anon.ds9.sf        buddycloud.ds9.sf        topics.ds9.sf"
    cyan "127.0.0.1 voyager.sf    anon.voyager.sf    buddycloud.voyager.sf    topics.voyager.sf"
    cyan "# END SFC - Starfleet Command, a federation of buddycloud servers"
    read

    bold "That was easy! Next step: let's configure the DB. Before starting"
    bold "PostgreSQL, please enable local \"trust\" authentication in the"
    bold "pg_hba.conf file. You can disable it later if you want. Then start"
    bold "PostgreSQL, and press Enter."
    read
    psql -U postgres <<EOF
CREATE USER sfc PASSWORD 'sfc_s3cr3t_p4ssw0rd';
CREATE DATABASE sfc_prosody    OWNER sfc TEMPLATE template0 ENCODING 'UTF-8';
CREATE DATABASE sfc_enterprise OWNER sfc TEMPLATE template0 ENCODING 'UTF-8';
CREATE DATABASE sfc_ds9        OWNER sfc TEMPLATE template0 ENCODING 'UTF-8';
CREATE DATABASE sfc_voyager    OWNER sfc TEMPLATE template0 ENCODING 'UTF-8';
EOF

    echo
    bold "Cool! Now we'll create some users in Prosody... (warning messages are fine)"
    echo
    _new_prosody_user picard  enterprise.sf
    _new_prosody_user data    enterprise.sf
    _new_prosody_user laforge enterprise.sf
    _new_prosody_user sisko   ds9.sf
    _new_prosody_user odo     ds9.sf
    _new_prosody_user dax     ds9.sf
    _new_prosody_user janeway voyager.sf
    _new_prosody_user neelix  voyager.sf
    _new_prosody_user 7of9    voyager.sf

    echo
    bold "Time to get serious... Let's build the buddycloud server!"
    echo
    if [ ! -d "buddycloud-server" ]; then
        git clone $buddycloud_server_git_url buddycloud-server
    else
        cd buddycloud-server
        git pull origin master
        cd ..
    fi
    sfc_build_server

    echo
    bold "Getting closer! Populating server DB..."
    echo
    for ship in enterprise ds9 voyager; do
        psql -U sfc -d sfc_$ship < buddycloud-server/postgres/*.sql
    done

    echo
    bold "Almost there! Now building the web client..."
    echo
    if [ ! -d "buddycloud-webclient" ]; then
        git clone $buddycloud_webclient_git_url buddycloud-webclient
    else
        cd buddycloud-webclient
        git pull origin master
        cd ..
    fi
    sfc_build_webclient

    echo
    bold "If you let me download the new web client, I'll give you some cake."
    echo
    if [ ! -d "webclient" ]; then
        git clone $webclient_git_url webclient
    else
        cd webclient
        git pull origin master
        cd ..
    fi

    echo
    bold "The cake is a lie! I still need to download the HTTP API server."
    echo
    if [ ! -d "buddycloud-http-api" ]; then
        git clone $buddycloud_http_api_git_url buddycloud-http-api
    else
        cd buddycloud-http-api
        git pull origin master
        cd ..
    fi
    sfc_build_http_api

    echo
    bold "One last thing: we'll need a simple web server to serve the HTTP API and"
    bold "the new web client."
    echo
    npm install http-server

    echo
    yellow "                ┌──────────────────────┒"
    yellow "                │                      ┃"
    yellow "                │   Congratulations!   ┃"
    yellow "                │                      ┃"
    yellow "                ┕━━━━━━━━━━━━━━━━━━━━━━┛"
    echo
    bold "Starfleet Command has now finished setting up your very own Federation of"
    bold "United Servers."
    echo
    bold "You can start the buddycloud server using ${LCYAN}sfc server${BOLD}, and the web client"
    bold "using ${LCYAN}sfc client${BOLD}."
    echo
    bold "Have fun with buddycloud, and happy hacking!"

}

function _new_prosody_user() {
    prosodyctl --config .cfg/prosody.cfg.lua register $1 $2 abc123
}
