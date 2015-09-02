module blade(dim) {
translate([16.5/2,0,0])
//X
intersection() {
translate(-dim/2)rotate([90,0,90])linear_extrude(height=dim[0]) {
polygon(points=[[0,0],[0.2,0.25],[0.4,0.45],[0.8,0.6],[2,0.45],[3,0.25],[4.5,0]]);
}
//Y
translate([-dim[0]/2,dim[1]/2,-dim[2]/2])rotate([90,0,0])linear_extrude(height=dim[1]) {
polygon(points=[[0,0],[0,0.6],[12,0.6],[14,0.4],[16.5,0]]);
}
//Z
translate([0,0,-dim[2]/2])rotate([0,0,0])linear_extrude(height=dim[2]) {
polygon(points=[[-8.25,1.5],[-5.25,2.25],[4,2.25],[8,1.75],[8.25,1.25],[8.5,-1.25],[5,-2.25],[-5.25,-2.25],[-8.25,-1.5]]);
}
}
}

module rotor(dir=0,angle=-20){
difference() {
mirror([dir%2,0,0]) union() {
rotate ([angle,0,0]) blade([16.5,4.5,0.6]);
rotate ([angle,0,180]) blade([16.5,4.5,0.6]);
union() {
translate([0,0,-1.25]) cylinder(r=1.5,h=3.5,center=true);
translate([0,0,0.25]) sphere(r=1.5);
}
}
cylinder(r=0.4,h=20,center=true);
}
}

rotor(0);

$fn=20;

//blade([16.5,4.5,0.6]);