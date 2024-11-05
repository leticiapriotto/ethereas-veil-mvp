// cards.js
function set_cards_lists_and_position() {
    sprite_y_position = room_height / 2;
    sprite_x_positions = [
        room_width / 4,
        room_width / 2,
        3 * room_width / 4
    ];
    
    first_decision_sprites = [spr_card_order_1, spr_card_chaos_5, spr_card_decaptado_4];
    second_decision_sprites = [spr_card_decaptado_4, spr_card_moon_2, spr_card_world_3];
    third_decision_sprites = [spr_card_order_1, spr_card_world_3, spr_card_chaos_5];
}

function set_cards_descriptions() {
    first_decision_descriptions = [
        "The High Priestess - Description for the High Priestess card.",
        "The Lovers - Description for the Lovers card.",
        "Death - Description for the Death card."
    ];

    second_decision_descriptions = [
        "The Fool - Description for the Fool card.",
        "The Emperor - Description for the Emperor card.",
        "Strength - Description for the Strength card."
    ];

    third_decision_descriptions = [
        "The Tower - Description for the Tower card.",
        "The Devil - Description for the Devil card.",
        "Justice - Description for the Justice card."
    ];
}

function get_sprite_list(_node_title) {
    switch (_node_title) {
        case "First Decision":
            return first_decision_sprites;
        case "Second Decision":
            return second_decision_sprites;
        case "Third Decision":
            return third_decision_sprites;
        default:
            return undefined;
    }
}
