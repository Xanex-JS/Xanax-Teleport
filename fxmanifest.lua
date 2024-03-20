fx_version 'cerulean'
games { 'gta5' }
author 'DropBear'

ui_page 'src/index.html'

files { 
    'src/index.html', 
    'src/index.css', 
    'src/index.js'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua',
    'config.lua'
}

server_scripts {
    'server/*.lua',
    'config.lua'
}