# 🎈 RedM Balloon Script

Script profissional de balão para RedM sem sistema de pagamento.

## 📋 Características

✅ **Balão Realista**
- Física de voo realista
- Controles intuitivos
- Múltiplos locais de spawn

✅ **Sistema de Acesso Flexível**
- Acesso para todos
- Acesso apenas para admins
- Sistema de whitelist

✅ **Interface Profissional**
- HUD em tempo real
- Indicadores de altitude e saúde
- Controles na tela

## 🚀 Instalação

1. Faça download do arquivo ZIP
2. Extraia a pasta `balloon` para `resources/`
3. Adicione em seu `server.cfg`:
```
ensure balloon
```
4. Reinicie o servidor

## 🎮 Comandos

- `/balao` - Abre menu para escolher local de spawn
- `/spawnbalao [número]` - Spawn direto em um local
- `/destruirbalao` - Destrói o balão ativo
- `/balloonadmin [playerid]` - Dá acesso ao balão (Admin)

## ⌨️ Controles de Voo

| Tecla | Ação |
|-------|------|
| **Q** | Subir |
| **Z** | Descer |
| **W** | Mover para Frente |
| **S** | Mover para Trás |
| **A/D** ou **←/→** | Girar |
| **G** | Sair |

## ⚙️ Configuração

Edite `shared/shared.lua` para:

```lua
Config.AccessMode = 'all'  -- 'all', 'admin' ou 'whitelist'

Config.BalloonPhysics = {
    MaxAltitude = 500.0,      -- Altitude máxima
    MinAltitude = 10.0,       -- Altitude mínima
    AscentSpeed = 2.5,        -- Velocidade de subida
    DescentSpeed = 1.8,       -- Velocidade de descida
    DriftSpeed = 0.8,         -- Velocidade de movimento horizontal
}
```

## 📍 Locais de Spawn Pré-configurados

1. **Strawberry**
2. **Rhodes**
3. **Saint Denis**
4. **Annesburg**

Para adicionar novos locais, edite o array `Config.SpawnLocations` em `shared/shared.lua`.

## 🔧 Requisitos

- RedM Framework
- Lua 5.4+

## 📝 Licença

Use livremente em seu servidor RedM!

## 🤝 Suporte

Para dúvidas ou melhorias, abra uma issue no GitHub.
