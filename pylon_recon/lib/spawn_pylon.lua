local function spawn_pylon(pos)
    local pylon = Scene:add_polygon({
        position = pos,
        points = {
            vec2((-11 / 12) * 0.5, (-8 / 12) * 0.5),
            vec2((-11 / 12) * 0.5, -0.5),
            vec2((11 / 12) * 0.5, -0.5),
            vec2((11 / 12) * 0.5, (-8 / 12) * 0.5),
            vec2((1 / 12) * 0.5, 0.5),
            vec2((-1 / 12) * 0.5, 0.5),
        },
        -- color = Color:hex(0xffcb81),
        color = Color:rgba(0,0,0,0),
        is_static = false,
    });
    pylon:set_name("player_100");

    local sprite_1 = Scene:add_attachment({
        name = "Image",
        component = {
            name = "Image",
            code = nil,
        },
        parent = pylon,
        local_position = vec2(0, 0),
        local_angle = 0,
        image = "./packages/@carroted/pylon_recon/assets/textures/entities/cone.png",
        size = 1 / 12,
        color = Color:hex(0xffffff),
        flip_x = false,
    });
    local sprite_2 = Scene:add_attachment({
        name = "Image",
        component = {
            name = "Image",
            code = nil,
        },
        parent = pylon,
        local_position = vec2(0, 0),
        local_angle = 0,
        image = "./packages/@carroted/pylon_recon/assets/textures/entities/cone.png",
        size = 1 / 12,
        color = Color:rgba(0,0,0,0),
        flip_x = true,
    });

    local hash = Scene:add_component({
        name = "Pylon",
        id = "@carroted/pylon_recon/pylon",
        version = "0.1.0",
        code = require('./packages/@carroted/pylon_recon/lib/pylon.lua', 'string')
    });

    pylon:add_component(hash);

    pylon:send_event("@carroted/pylon_recon/pylon/init", {
        sprite_1 = sprite_1.guid,
        sprite_2 = sprite_2.guid,
    });
end;

return spawn_pylon;