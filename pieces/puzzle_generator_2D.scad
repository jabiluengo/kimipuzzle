// Element parameters
valence = 1;
positive = false;
element = "Br";
width = 114.7;

// Main parameters
thinkness = 2;
text_size = 10;
cylinder_radius = 8;
multipler = 30;
connection_tolerance = 0.4;

// Main program

projection()
if (positive){
    TextBlock(element,positive);
    Connection(valence,positive);
    }
else{
    difference(){
    TextBlock(element,positive);
    Connection(valence,positive);
}
}

// Modules definition.

module Connection(number,sign){
    if (sign){
      difference() {
      translate([width/2+cylinder_radius/2,-multipler*(valence-1)/2,thinkness/2]) lineup(number,multipler) cylinder(thinkness,cylinder_radius-connection_tolerance,cylinder_radius-connection_tolerance, true);
    translate([0,0,thinkness/2]) cube([width,valence*multipler-(connection_tolerance*2),thinkness], center=true);
      }
          }
    else{
        translate([-width/2+cylinder_radius/2,-multipler*(valence-1)/2,thinkness/2]) lineup(number,multipler) cylinder(thinkness,cylinder_radius,cylinder_radius, true);
        
    }
}
module lineup(num, space) {
   for (i = [0 : valence-1])
     translate([ 0, space*i, 0 ]) children(0);
}
module TextBlock(letter,sign) {
    if (sign){
    difference() {
        translate([0,0,thinkness/2]) cube([width,valence*multipler-(connection_tolerance*2),thinkness], center=true);
        translate([0,0,0]) {
            // convexity is needed for correct preview
            // since characters can be highly concave
            linear_extrude(thinkness, convexity=4)
                text(letter, 
                     size=text_size,
                     font="Liberation Sans:style=Bold",
                     halign="center",
                     valign="center");
        }
    }
    }
   else{    
           difference() {
       translate([0,0,thinkness/2]) cube([width-2*connection_tolerance,valence*multipler,thinkness], center=true);
        translate([cylinder_radius*4/6,0,0]) {
            // convexity is needed for correct preview
            // since characters can be highly concave
            linear_extrude(thinkness, convexity=4)
                text(letter, 
                     size=text_size,
                     font="Liberation Sans:style=Bold",
                     halign="center",
                     valign="center");
        }
    }
}
}

echo(version=version());
// Written by Leire Enrique, Yulia Iparragirre, Irati Arrillaga and Jabi Luengo <jluengoe@herrikide.eus>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
