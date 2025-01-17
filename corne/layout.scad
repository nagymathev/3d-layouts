include <parameters.scad>
include <stabilizer_spacing.scad>

/* [Layout Values] */
/* Layout Format (each key):
    [
        [                                       // Location Data
            [x_location, y_location],
            key_size,
            [rotation, rotation_x, rotation_y],
        ],
        [                                       // Borders
            top_border,
            bottom_border,
            left_border,
            right_border
        ],
        extra_data                              // Extra data (depending on component type)
    ]
*/

// Keyswitch Layout
//     (extra_data = rotate_column)
base_switch_layout = [
  // Left Hand
  [[[0,0.375],1,[0,0,0]],[1,1,1,1],false],
  [[[0,1.375],1,[0,0,0]],[1,1,1,1],false],
  [[[0,2.375],1,[0,0,0]],[1,1,1,1],false],
  [[[1,0.375],1,[0,0,0]],[1,1,1,1],false],
  [[[1,1.375],1,[0,0,0]],[1,1,1,1],false],
  [[[1,2.375],1,[0,0,0]],[1,1,1,1],false],
  [[[2,0.125],1,[0,0,0]],[1,1,1,1],false],
  [[[2,1.125],1,[0,0,0]],[1,1,1,1],false],
  [[[2,2.125],1,[0,0,0]],[1,1+4.765*mm,1,1],false],
  [[[3,0],1,[0,0,0]],[1,1,1,1],false],
  [[[3,1],1,[0,0,0]],[1,1,1,1],false],
  [[[3,2],1,[0,0,0]],[1,1+7.14*mm,1,1],false],
  [[[4,0.125],1,[0,0,0]],[1,1,1,1],false],
  [[[4,1.125],1,[0,0,0]],[1,1,1,1],false],
  [[[4,2.125],1,[0,0,0]],[1,1,1,1],false],
  [[[5,0.25],1,[0,0,0]],[1,1,1,1],false],
  [[[5,1.25],1,[0,0,0]],[1,1,1,1],false],
  [[[5,2.25],1,[0,0,0]],[1,1,1,1.5],false],
  [[[3.5,3.16],1,[0,0,0]],[3,1,1,2],false],
  [[[4.5,3.16],1,[-15,4.5,4.16]],[3,1,2,2.6],false],
  [[[3.966,3.419],1.5,[-120,5.466,4.419]],[1,3,7.35+0.25*unit*mm,1+0.25*unit*mm],false],
//  Right Hand (uncomment if you want a combined layout
//  [[[14,0.375],1,[0,0,0]],[1,1,1,1],false],
//  [[[14,1.375],1,[0,0,0]],[1,1,1,1],false],
//  [[[14,2.375],1,[0,0,0]],[1,1,1,1],false],
//  [[[13,0.375],1,[0,0,0]],[1,1,1,1],false],
//  [[[13,1.375],1,[0,0,0]],[1,1,1,1],false],
//  [[[13,2.375],1,[0,0,0]],[1,1,1,1],false],
//  [[[12,0.125],1,[0,0,0]],[1,1,1,1],false],
//  [[[12,1.125],1,[0,0,0]],[1,1,1,1],false],
//  [[[12,2.125],1,[0,0,0]],[1,1,1,1],false],
//  [[[11,0],1,[0,0,0]],[1,1,1,1],false],
//  [[[11,1],1,[0,0,0]],[1,1,1,1],false],
//  [[[11,2],1,[0,0,0]],[1,1,1,1],false],
//  [[[10,0.125],1,[0,0,0]],[1,1,1,1],false],
//  [[[10,1.125],1,[0,0,0]],[1,1,1,1],false],
//  [[[10,2.125],1,[0,0,0]],[1,1,1,1],false],
//  [[[9,0.25],1,[0,0,0]],[1,1,1,1],false],
//  [[[9,1.25],1,[0,0,0]],[1,1,1,1],false],
//  [[[9,2.25],1,[0,0,0]],[1,1,1,1],false],
//  [[[10.5,3.16],1,[0,0,0]],[3,1,2,1],false],
//  [[[9.534,3.419],1.5,[120,9.534,4.419]],[1,3,1+0.25*unit*mm,1+0.25*unit*mm],false],
//  [[[9.5,3.16],1,[15,10.5,4.16]],[3,1,2,2],false],
];

// MCU Position(s)
base_mcu_layout = [
    [[[6,0.5],mcu_h_unit_size],[0,1*unit*mm,h_border_width,0]],
];

// TRRS Position(s)
base_trrs_layout = [
    // [[[6.5,2.5],1,[-90,7,3]],[0,h_unit/2+h_border_width,0,20*mm]],
];

// Stabilizer layout
//     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
//     (see stabilizer_spacing.scad for presets)
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [
    [[[6.1,2.5],1,[0,0,0]],[0,0,0,0], [10, 20]],
];

// Plate Layout (if different than PCB)
//     (extra_data = component_type)
base_plate_layout = [
    concat(
        slice(base_switch_layout, [0,-3], ["switch"]),
        [[[[6,0.5],mcu_h_unit_size],[-5,0,h_border_width,0], ["mcu"], [false, false, false, true]]],
    ),
    slice(base_switch_layout, [-3,-2], ["switch"]),
    slice(base_switch_layout, [-1,0], ["switch"]),
];

// Whether to only use base_plate_layout to generate the plate footprint
use_plate_layout_only = true;

// Standoff layout
//     (extra_data = [standoff_integration_override, standoff_attachment_override])
base_standoff_layout = [
    // PCB-Plate
    [[[0.5,0.35]]],
    [[[0.5,2.7]]],
    [[[2.5,1.6]]],
    [[[5.5,0.75]]],
    [[[6.2,3]]],
    
    //PCB-Backplate
    [[[-0.5,-0.2]],[0,0,0,0],["plate", "backplate",0]],
    [[[-0.5,2.9]],[0,0,0,0],["plate", "backplate",0]],
    [[[5.5,-0.3]],[0,0,0,0],["plate", "backplate",0]],
    [[[7,0.2]],[0,0,0,0],["plate", "backplate",0]],
    [[[5.8,4.35]],[0,0,0,0],["plate", "backplate",0]],
];

// Whether to flip the layout
invert_layout_flag = false;

// Whether the layout is staggered-row or staggered-column
layout_type = "column";  // [column, row]

