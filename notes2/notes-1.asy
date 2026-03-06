if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="notes-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph3;
size(10cm,0); // Set the width of the figure
currentprojection=perspective(60,30,45);

// Surface 1: The Paraboloid
triple f(pair u) {
return (u.x, u.y, u.x^2 + u.y^2 + 6*u.x - 8*u.y + 25);
}

// Surface 2: The Cylinder
triple cyl(pair u) {
return (4*cos(u.x), 4*sin(u.x), u.y);
}

// Draw Cylinder first (order doesn't matter for transparency/depth in Asy)
surface s2 = surface(cyl, (0, 20), (2*pi, 100), 40, 10);
draw(s2, orange+opacity(0.5), meshpen=black+0.1pt);

// Draw Paraboloid
surface s1 = surface(f, (-5,-5), (5,5), 50, 50);
draw(s1, lightgreen+opacity(0.5), meshpen=black+0.1pt);

// Draw the Intersection Curve (Calculated mathematically)
path3 inter;
for(real t=0; t<=2*pi; t+=0.05) {
real x = 4*cos(t);
real y = 4*sin(t);
real z = x^2 + y^2 + 6*x - 8*y + 25;
inter = inter .. (x,y,z);
}
draw(inter, red+1.5pt);

// Axes
xaxis3("$x$", Arrow3);
yaxis3("$y$", Arrow3);
