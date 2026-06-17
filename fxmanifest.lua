fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'RedM Developer'
description 'Professional Hot Air Balloon Script'
version '1.0.0'

shared_scripts {
    'shared/shared.lua'
}

client_scripts {
    'client/main.lua',
    'client/balloon.lua',
    'client/controls.lua',
    'client/ui.lua'
}

server_scripts {
    'server/main.lua',
    'server/database.lua',
    'server/commands.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

lua54 'yes'
