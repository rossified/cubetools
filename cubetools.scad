/*
Cubetools
A library of additional geometry for OpenSCAD


Author: Ross Barros-Smith
License: LGPL v2.1


*/

//VERSION HISTORY
// Moved projecto to Github. - June 6, 2024.
// January 1, 2024 - Ceased work to move to a rewrite of the library called, Supercubes. This is likely the final version.
//Added frcubexz(). - June 26, 2022
//Rewrote pie_slice() to act as a simple rotate_extrude(). Added pie_slicez(). -  May 22, 2019
//Added npolygon(). -  May 18, 2019
//Created cubetools_depricated.scad and moved printbed and triangles. -  May 18, 2019
//Added pie_slice() - May 18 2019
//Added rnpoly() - November 28, 2017
//Added frcube() - April 3, 2016
//Modified September 24, 2015 to clean up whitespace.



//Modules below 

//Creates cubes centered on a specified axis
module cubex(x=10,y=10,z=10){
    translate([-x/2, 0,0]) cube([x,y,z]);
}

module cubexy(x=10,y=10,z=10){
        translate([-x/2,-y/2, 0]) cube([x,y,z]);
}

module cubexyz(x=10,y=10,z=10){
    translate([-x/2,-y/2,-z/2]) cube([x,y,z]);
}

module cubexz(x=10,y=10,z=10){
    translate([-x/2,0,-z/2]) cube([x,y,z]);
}

module cubey(x=10,y=10,z=10){
    translate([0,-y/2,0]) cube([x,y,z]);
}

module cubeyz(x=10,y=10,z=10){
    translate([0,-y/2,-z/2]) cube([x,y,z]);
}

module cubez(x=10,y=10,z=10){
    translate([0,0,-z/2]) cube([x,y,z]);
}


//Drawing ellipses
module ellipse(x=10,y=5){
    scale([1,y/x,1]){
        circle(x/2);
    }
}


//2D rectangles
module squarex(x=10,y=10){
    translate([-x/2, 0,0]) square([x,y]);
}

module squarexy(x=10,y=10){
        translate([-x/2,-y/2, 0]) square([x,y]);
}


module squarey(x=10,y=10){
    translate([0,-y/2,0]) square([x,y]);
}


//2D rounded rectangles
module rsquare(x=20,y=20,r=5){
    hull(){
        translate([r,r,0]) circle(r=r); //Lower left
        translate([x-r,r,0]) circle(r=r); //Lower right
        translate([r,y-r,0]) circle(r=r); //Upper left
        translate([x-r,y-r,0]) circle(r=r); //Upper right
    }  
}

module rsquarex(x=20,y=20,r=5){
        translate([-x/2,0,0]) hull(){
            translate([r,r,0]) circle(r=r); //Lower left
            translate([x-r,r,0]) circle(r=r); //Lower right
            translate([r,y-r,0]) circle(r=r); //Upper left
            translate([x-r,y-r,0]) circle(r=r); //Upper right
    }  
}

module rsquarey(x=20,y=20,r=5){
        translate([0,-y/2,0]) hull(){
            translate([r,r,0]) circle(r=r); //Lower left
            translate([x-r,r,0]) circle(r=r); //Lower right
            translate([r,y-r,0]) circle(r=r); //Upper left
            translate([x-r,y-r,0]) circle(r=r); //Upper right
    }  
}

module rsquarexy(x=20,y=20,r=5){
        translate([-x/2,-y/2,0]) hull(){
            translate([r,r,0]) circle(r=r); //Lower left
            translate([x-r,r,0]) circle(r=r); //Lower right
            translate([r,y-r,0]) circle(r=r); //Upper left
            translate([x-r,y-r,0]) circle(r=r); //Upper right
    }  
}


//Rounded cubes
module rcube(x=10,y=10,z=10,r=2){
    hull(){
        //Lower level
        translate([r,r,r]) sphere(r); //Bottom left sphere
        translate([x-r,r,r]) sphere(r); //Bottom right
        translate([r,y-r,r]) sphere(r); //Top left
        translate([x-r,y-r,r]) sphere(r); //Top right
        
        //Upper level
        translate([r,r,z-r]) sphere(r); //Bottom left sphere
        translate([x-r,r,z-r]) sphere(r); //Bottom right
        translate([r,y-r,z-r]) sphere(r); //Top left
        translate([x-r,y-r,z-r]) sphere(r); //Top right

    }
}

module rcubex(x=10,y=10,z=10,r=2){
    translate([-x/2,0,0]){
        hull(){
            //Lower corners
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper corners
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}

module rcubexy(x=10,y=10,z=10,r=2){
    translate([-x/2,-y/2,0]){
        hull(){
            //Lower level
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper level
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}

module rcubexyz(x=10,y=10,z=10,r=2){
    translate([-x/2,-y/2,-z/2]){
        hull(){
            //Lower level
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper level
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}

module rcubexz(x=10,y=10,z=10,r=2){
    translate([-x/2,0,-z/2]){
        hull(){
            //Lower level
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper level
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}

module rcubey(x=10,y=10,z=10,r=2){
    translate([0,-y/2,0]){
        hull(){
            //Lower level
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper level
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}

module rcubeyz(x=10,y=10,z=10,r=2){
    translate([0,-y/2,-z/2]){
        hull(){
            //Lower level
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper level
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}

module rcubez(x=10,y=10,z=10,r=2){
    translate([0,0,-z/2]){
        hull(){
            //Lower level
            translate([r,r,r]) sphere(r); //Bottom left sphere
            translate([x-r,r,r]) sphere(r); //Bottom right
            translate([r,y-r,r]) sphere(r); //Top left
            translate([x-r,y-r,r]) sphere(r); //Top right
            
            //Upper level
            translate([r,r,z-r]) sphere(r); //Bottom left sphere
            translate([x-r,r,z-r]) sphere(r); //Bottom right
            translate([r,y-r,z-r]) sphere(r); //Top left
            translate([x-r,y-r,z-r]) sphere(r); //Top right

        }
    }
}


//Flat Rounded Cubes
module frcube(x=20,y=20,z=20,r=5){
    hull(){
        translate([r,r,0]) cylinder(h=z,r=r);
        translate([x-r,r,0]) cylinder(h=z,r=r);

        translate([r,y-r,0]) cylinder(h=z,r=r);
        translate([x-r,y-r,0]) cylinder(h=z,r=r);
    }
    
}

module frcubex(x=20,y=20,z=20,r=5){
translate([-x/2,0,0]){
        hull(){
            translate([r,r,0]) cylinder(h=z,r=r);
            translate([x-r,r,0]) cylinder(h=z,r=r);

            translate([r,y-r,0]) cylinder(h=z,r=r);
            translate([x-r,y-r,0]) cylinder(h=z,r=r);
        }
    }
}

module frcubexy(x=20,y=20,z=20,r=5){
translate([-x/2,-y/2,0]){
        hull(){
            translate([r,r,0]) cylinder(h=z,r=r);
            translate([x-r,r,0]) cylinder(h=z,r=r);

            translate([r,y-r,0]) cylinder(h=z,r=r);
            translate([x-r,y-r,0]) cylinder(h=z,r=r);
        }
    }
}

module frcubexz(x=20,y=20,z=20,r=5){
translate([-x/2,0,-z/2]){
        hull(){
            translate([r,r,0]) cylinder(h=z,r=r);
            translate([x-r,r,0]) cylinder(h=z,r=r);

            translate([r,y-r,0]) cylinder(h=z,r=r);
            translate([x-r,y-r,0]) cylinder(h=z,r=r);
        }
    }
}

module frcubexyz(x=20,y=20,z=20,r=5){
translate([-x/2,-y/2,-z/2]){
        hull(){
            translate([r,r,0]) cylinder(h=z,r=r);
            translate([x-r,r,0]) cylinder(h=z,r=r);

            translate([r,y-r,0]) cylinder(h=z,r=r);
            translate([x-r,y-r,0]) cylinder(h=z,r=r);
        }
    }
}

module frcubey(x=20,y=20,z=20,r=5){
translate([0,-y/2,0]){
        hull(){
            translate([r,r,0]) cylinder(h=z,r=r);
            translate([x-r,r,0]) cylinder(h=z,r=r);

            translate([r,y-r,0]) cylinder(h=z,r=r);
            translate([x-r,y-r,0]) cylinder(h=z,r=r);
        }
    }
}

module frcubeyz(x=20,y=20,z=20,r=5){
translate([0,0,-z/2]){
        hull(){
            translate([r,r,0]) cylinder(h=z,r=r);
            translate([x-r,r,0]) cylinder(h=z,r=r);

            translate([r,y-r,0]) cylinder(h=z,r=r);
            translate([x-r,y-r,0]) cylinder(h=z,r=r);
        }
    }
}


//Tubes
module tube(od=50, id=40, h=50){
    difference(){
        cylinder(d=od,h=h); //OD cylinder
        translate([0,0,-1]) cylinder(d=id,h=h+2);
    }
}

module tubez(od=50, id=40, h=50){
    difference(){
        translate([0,0,-h/2]) cylinder(d=od,h=h); //OD cylinder
        translate([0,0,-h/2-1]) cylinder(d=id,h=h+2);
    }
}


//Pie Slices
module pie_slice(r=20,h=10,angle=45,center=false){
    rotate([0,0,90]) rotate_extrude(angle=-angle,center=center) square([r,h]);
}

module pie_slicez(r=20,h=10,angle=45){
    translate([0,0,-h/2]) rotate([0,0,90]) rotate_extrude(angle=-angle) square([r,h]);
}

//Torus
module torus(or=25,ir=10,angle=360,steps=$fn){
    rotate_extrude(angle=-angle,$fn=steps) translate([(or/2+ir/2)/2,0,0]) circle(or-ir);
}

//Polygons
module npolygon(points=6, r=50, z=10){
    hull(){
        for(i=[1:points]){
           rotate ([0,0,i*360/points])
                cube([0.001,r,z]);
        }
    }
}

module rnpolygon(points=6, r=50, z=10, cr=10){
    hull(){
        for(i=[1:points]){
           rotate ([0,0,i*360/points])
                translate([0,r-cr/2,0]) circle(d=cr);
        }
    }
}

module rncylinder(points=6, d=50, h=10, cr=10){
    hull(){
        for(i=[1:points]){
           rotate ([0,0,i*360/points])
                translate([0,d/2-cr/2,0]) cylinder(d=cr, h=h);
        }
    }
}
