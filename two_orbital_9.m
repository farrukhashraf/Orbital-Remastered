function two_orbital_9()
[xs,ys,zs, x,y,z] = initialize_sphere();
[x1,y1,z1] = initialize_cylinder();
[Earth_texture, Sat_texture1, Sat_texture2, solarpan, topsat, botsat] = initialize_images();
draw_orbit(xs,ys,zs, x,y,z, x1,y1,z1, Earth_texture, Sat_texture1, Sat_texture2, solarpan, topsat, botsat)
end