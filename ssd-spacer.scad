/**
 *	SSD-Spacer
 *
 *	SPDX-FileCopyrightText: Alexander Dahl <alex@netz39.de>
 *	SPDX-License-Identifier: CC-BY-SA-4.0
 */

use <MCAD/boxes.scad>
use <honeycomb.scad>

ata_length = 100;
ata_width = 69;
spacer_height = 9.5 - 7 - 0.1;

inner_corner = 3;
frame_width = 5;

comb_dia = 9.5;
comb_wall = 1.5;
comb_plus = frame_width + 1;
comb_off = [ 1.5, 0.7, 0 ];

union() {
    difference() {
        roundedBox( [ata_width, ata_length, spacer_height],
					inner_corner + frame_width, true );
        roundedBox( [ata_width - frame_width * 2,
		             ata_length - frame_width * 2,
		             spacer_height * 2],
					inner_corner, true);
    }
	translate( [-(ata_width - comb_plus)/2,
				  -(ata_length - comb_plus)/2,
				  -(spacer_height / 2)] + comb_off )
	{
        linear_extrude(spacer_height)
            honeycomb( ata_width - comb_plus,
					   ata_length - comb_plus,
					   comb_dia, comb_wall );
	}
}
