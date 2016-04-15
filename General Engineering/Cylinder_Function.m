%Problem Statement: Create function to solve for volume and surface area of
%a cylinder

%Variables
%V - volume [m^3]
%r- radius [m]
%h - height [m]
%SA - surface area [m^2]


function[V,SA]=CylinderInfo(r,h)

%Calculate the volume of the cylinder

V=pi*r^2*h;

%Calculate the surface area of the cyinder

SA=(2*pi*r*h)+2*(pi*r^2);

end
