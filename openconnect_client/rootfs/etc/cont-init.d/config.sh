#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Third Party Add-on: OpenConnect Client
# Creates the interface configuration for OpenConnect VPN
# ==============================================================================
declare -a list
declare gateway
declare user
declare password
declare interface
declare config

if ! bashio::fs.directory_exists '/ssl/openconnect'; then
    mkdir -p /ssl/openconnect ||
        bashio::exit.nok "Could not create openconnect storage folder!"
fi

# Get interface and config file location
interface="oc0"

config="/etc/openconnect/${interface}.conf"

# Check if at least 1 gateway value and if true get the OpenConnect gateway
if ! bashio::config.has_value 'openconnect.gateway'; then
    bashio::exit.nok 'You need a gateway configured for OpenConnect'
else
    gateway=$(bashio::config 'openconnect.gateway')
    echo "server = ${gateway}" > "${config}"
fi

# Check if at least 1 user value and if true get the OpenConnect username
if ! bashio::config.has_value 'openconnect.username'; then
    bashio::exit.nok 'You need a username configured for OpenConnect'
else
    user=$(bashio::config 'openconnect.username')
    echo "user = ${user}" >> "${config}"
fi

# Check if at least 1 password value and if true get the OpenConnect password
if ! bashio::config.has_value 'openconnect.password'; then
    bashio::exit.nok 'You need a password configured for OpenConnect'
else
    password=$(bashio::config 'openconnect.password')
    echo "passwd = ${password}" >> "${config}"
fi

# Check if custom authgroup value
if bashio::config.has_value 'openconnect.authgroup'; then
    authgroup=$(bashio::config 'openconnect.authgroup')
    echo "authgroup = ${authgroup}" >> "${config}"
fi

# Check if custom script value
if bashio::config.has_value 'openconnect.script'; then
    script=$(bashio::config 'openconnect.script')
    echo "script = ${script}" >> "${config}"
fi

# Check if custom CA file value
if bashio::config.has_value 'openconnect.cafile'; then
    cafile=$(bashio::config 'openconnect.cafile')
    echo "cafile = ${cafile}" >> "${config}"
fi

# Check if custom server certificate value
if bashio::config.has_value 'openconnect.servercert'; then
    servercert=$(bashio::config 'openconnect.servercert')
    echo "servercert = ${servercert}" >> "${config}"
fi

# Check if custom certificate value
if bashio::config.has_value 'openconnect.certificate'; then
    certificate=$(bashio::config 'openconnect.certificate')
    echo "certificate = ${certificate}" >> "${config}"
fi

# Check if custom private key value
if bashio::config.has_value 'openconnect.privatekey'; then
    privatekey=$(bashio::config 'openconnect.privatekey')
    echo "privatekey = ${privatekey}" >> "${config}"
fi

# Check if custom key password value
if bashio::config.has_value 'openconnect.keypassword'; then
    keypassword=$(bashio::config 'openconnect.keypassword')
    echo "keypassword = ${keypassword}" >> "${config}"
fi

# Check if custom user agent value
if bashio::config.has_value 'openconnect.useragent'; then
    useragent=$(bashio::config 'openconnect.useragent')
    echo "useragent = ${useragent}" >> "${config}"
fi

bashio::log.info "Completed OpenConnect client configuration: [${config}]"
