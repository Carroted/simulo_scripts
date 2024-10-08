local function spawn_flingstick(pos)
    local flingstick = Scene:add_box({
        position = pos,
        size = vec2(34/12, 5/12),
        color = Color:rgba(0,0,0,0),
        is_static = false,
    });

    Scene:add_attachment({
        name = "Image",
        component = {
            name = "Image",
            code = nil,
        },
        parent = flingstick,
        local_position = vec2(0, 0),
        local_angle = 0,
        image = "./packages/@carroted/pylon_recon/assets/textures/weapons/flingstick.png",
        size = 1 / 12,
        color = Color:hex(0xffffff),
    });

    local hash = Scene:add_component({
        name = "Weapon",
        id = "@carroted/pylon_recon/weapon",
        version = "0.1.0",
        code = require('./packages/@carroted/pylon_recon/lib/weapon.lua', 'string')
    });

    flingstick:add_component({ hash = hash });

    return flingstick;
end;

return spawn_flingstick;