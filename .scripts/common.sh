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

NORMAL="\033[0;0m"
BOLD="\033[0;1m"

LGRAY="\033[1;30m"
LRED="\033[1;31m"
LGREEN="\033[1;32m"
LYELLOW="\033[1;33m"
LBLUE="\033[1;34m"
LMAGENTA="\033[1;35m"
LCYAN="\033[1;36m"

function bold() { echo -e "${BOLD}$1 ${NORMAL}"; }
function err() { echo -e "${LRED}$1 ${NORMAL}"; }
function cyan() { echo -e "${LCYAN}$1 ${NORMAL}"; }
function yellow() { echo -e "${LYELLOW}$1 ${NORMAL}"; }

function sfc_logo() {
    # ASCII art by Joshua Bell
    # http://startrekasciiart.blogspot.fr/2011/06/starfleet-symbol.html
    yellow '                                 .^.'
    yellow '                                /   \'
    yellow '                               /     \'
    yellow '                       *******/       \*******'
    yellow '                  ***** *****/         \***** *****'
    yellow '              ***** ********/           \******** *****'
    yellow '             *** **********/             \********** ***'
    yellow '              ***** ******/               \****** *****'
    yellow '                  ***** */        _**_     \* *****'
    yellow '                       */      _-******\    \*'
    yellow '                       /    _-" *****   "\   \'
    yellow '                       \__-"              "\_/'
    echo
}
