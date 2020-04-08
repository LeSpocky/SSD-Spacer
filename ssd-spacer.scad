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
base_height = 7;
target_height = 9.5;
tolerance_height = 0.2;
tolerance_width = 0.6;

spacer_length = ata_length - tolerance_width;
spacer_width = ata_width - tolerance_width;
spacer_height = target_height - base_height - tolerance_height;

inner_corner = 3;
frame_width = 5;

comb_dia = 9.5;
comb_wall = 1.5;
comb_plus = frame_width + 1;
comb_off = [ 1.5, 0.7, 0 ];

translate( [0, 0, spacer_height/2] )
{
	union() {
		difference() {
			roundedBox( [spacer_width, spacer_length, spacer_height],
						inner_corner + frame_width, true );
			roundedBox( [spacer_width - frame_width * 2,
						 spacer_length - frame_width * 2,
						 spacer_height * 2],
						inner_corner, true);
		}
		translate( [-(spacer_width - comb_plus)/2,
					  -(spacer_length - comb_plus)/2,
					  -(spacer_height / 2)] + comb_off )
		{
			linear_extrude(spacer_height)
				honeycomb( spacer_width - comb_plus,
						   spacer_length - comb_plus,
						   comb_dia, comb_wall );
		}
	}
}

%translate( [0, 0, -base_height/2] )
	roundedBox( [ata_width, ata_length, base_height], 2, true );
