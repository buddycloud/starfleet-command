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

function sfc_clean_db() {
    for ship in enterprise ds9 voyager; do
        psql -U sfc -d sfc_$ship <<EOF
DELETE FROM affiliations;
DELETE FROM items;
DELETE FROM node_config;
DELETE FROM subscriptions;
DELETE FROM nodes;
EOF
    done
}

function sfc_build_server() {
    cd buddycloud-server
    npm install .
    cd ..
}

function sfc_build_client() {
    cd buddycloud-webclient
    ./configure
    cd ..
}

function sfc_server() {
    function _start_prosody() {
        echo "Starting prosody..."
        prosody --config .cfg/prosody.cfg.lua
        sleep 1
        if ! [ -e ".pid/prosody.pid" ]; then
            err "Could not start prosody"
            exit 1
        fi
    }
    function _stop_prosody() {
        echo "Stopping prosody..."
        if [ -e ".pid/prosody.pid" ]; then
            kill `cat .pid/prosody.pid`
            [[ -e ".pid/prosody.pid" ]] && rm .pid/prosody.pid
        fi
    }

    function _start_server() {
        server=$1
        echo "Launching $server..."
        cd buddycloud-server
        node -- lib/main.js --config ../.cfg/server-$server.js &
        jobs -p | tail -1 > ../.pid/$server.pid
        cd ..
    }
    function _stop_server() {
        server=$1
        echo "Destroying $server..."
        if [ -e ".pid/$server.pid" ]; then
            rm .pid/$server.pid
        fi
    }

    function _start_all() {
        _start_prosody
        for server in enterprise ds9 voyager; do
            _start_server $server
        done
    }
    function _stop_all() {
        echo -e "\r"
        for server in enterprise ds9 voyager; do
            _stop_server $server
        done
        _stop_prosody
    }

    for d in .pid log; do
        [[ ! -d "$d" ]] && mkdir "$d"
    done

    trap _stop_all SIGINT
    _start_all
    wait
}

function sfc_client() {
    function _start_all() {
        # Prepare assets directories
        for server in enterprise ds9 voyager; do
            assets_dir="assets-$server"
            [[ -d "$assets_dir" ]] && rm -rf $assets_dir
            cp -a assets $assets_dir
            rm $assets_dir/config.js
            ln -s ../../.cfg/client-$server.js $assets_dir/config.js
        done

        ./development -p 3000 --assets assets-enterprise &
        ./development -p 3001 --assets assets-ds9        &
        ./development -p 3002 --assets assets-voyager    &
    }

    function _stop_all() {
        echo -e "\r"
        for server in enterprise ds9 voyager; do
            assets_dir="assets-$server"
            [[ -d "$assets_dir" ]] && rm -rf $assets_dir
        done
    }

    cd buddycloud-webclient
    trap _stop_all SIGINT
    _start_all
    sleep 8
    bold "enterprise.sf: http://127.0.0.1:3000"
    bold "ds9.sf:        http://127.0.0.1:3001"
    bold "voyager.sf:    http://127.0.0.1:3002"
    wait
}
