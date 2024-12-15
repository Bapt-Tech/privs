-- Liste des utilisateurs par rôle
local owners = {
    "Bapt-admin",
    "Uther"
}
local admins = {
    "thoph",
    "Ethris",
    "GHG",
    "FireAdmin_999",
    "WolfiAdmin_444",
    "plus22",
    "Kingtebi"
}

local builders = {
    "King_build",
    "Albadmin",
    "jojo",
    "Arsenic",
    "-SkyBuilder-"
}

local moderators = {
    "Kingtebi"
}

-- Fonction pour vérifier si une valeur est dans une table
local function table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Fonction pour attribuer les privilèges
local function assign_privileges(player_name)
    if table_contains(admins, player_name) then
        minetest.set_player_privs(player_name, {builder = true, give = true, maphack = true, areas = true, area_high_limit = true, weather_manager = true, basic_privs = true, teleport = true, shout = true, bring = true, interact = true, admin = true, settime = true, noclip = true, fly = true, fast = true, kick = true, ban = true, worldedit = true, give = true})

    elseif table_contains(owners, player_name) then
        minetest.set_player_privs(player_name, {builder = true, ranks_gestion = true, give = true, maphack = true, areas = true, area_high_limit = true, debug = true, weather_manager = true, basic_privs = true, privs = true, teleport = true, shout = true, bring = true, interact = true, admin = true, settime = true, noclip = true, fly = true, fast = true, kick = true, server = true, ban = true, worldedit = true, give = true})

    elseif table_contains(builders, player_name) then
        minetest.set_player_privs(player_name, {builder = true, give = true, settime = true, areas = true, area_high_limit = true, worldedit = true, interact = true, shout = true, weather_manager = true, fly = true, noclip = true, fast = true})

    elseif table_contains(moderators, player_name) then
        minetest.set_player_privs(player_name, {kick = true, interact = true, shout = true, ban = true, weather_manager = true})

    else
        minetest.set_player_privs(player_name, {interact = true, shout = true})
    end
end

-- Fonction appelée lors de la connexion d'un joueur
minetest.register_on_joinplayer(function(player)
    local player_name = player:get_player_name()
    assign_privileges(player_name)
end)
