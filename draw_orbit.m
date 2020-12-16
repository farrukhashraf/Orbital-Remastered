function draw_orbit(xs,ys,zs, x,y,z, x1,y1,z1, Earth_texture, Sat_texture1, Sat_texture2, solarpan, topsat, botsat)
    r = 6;   
    %for drawing the satellite and connecting the elements to each other.
    hgt1 = hgtransform ;
    hgt2 = hgtransform;
    % to the movement of the earth
    hgth = hgtransform('Parent',gca);      
    % Earth
    h = surf(x*r,y*r,z*r,'FaceColor', 'texturemap', 'CData', Earth_texture, 'FaceAlpha',1,'EdgeColor', 'none', 'Parent', hgth);


    % Cylinder body of the satellite
    h3 = surf(x1,y1,z1*3-1.5,'FaceColor', 'texturemap', 'CData', Sat_texture1, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt1);
    h31 = surf(x1,y1,z1*3-1.5,'FaceColor', 'texturemap', 'CData', Sat_texture2, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt2);
    % Upper and lower sphere of the satellite.
    h4 = surf(xs,ys,zs+1.5,'FaceColor', 'texturemap', 'CData', topsat, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt1);
    h5 = surf(xs,ys,zs-1.5,'FaceColor', 'texturemap', 'CData', botsat, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt1);
    h41 = surf(xs,ys,zs+1.5,'FaceColor', 'texturemap', 'CData', topsat, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt2);
    h51 = surf(xs,ys,zs-1.5,'FaceColor', 'texturemap', 'CData', botsat, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt1);

    % Solar panels of the satellite
    solpan1 = surf([0.5, 4;0.5, 4],[0, 0; 0, 0],[1, 1; -1, -1],'FaceColor', 'texturemap', 'CData', solarpan, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt1);
    solpan2 = surf([-4, -0.5; -4, -0.5],[0, 0; 0, 0],[1, 1; -1, -1],'FaceColor', 'texturemap', 'CData', solarpan, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt1);
    solpan3 = surf([0.5, 4;0.5, 4],[0, 0; 0, 0],[1, 1; -1, -1],'FaceColor', 'texturemap', 'CData', solarpan, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt2);
    solpan4 = surf([-4, -0.5; -4, -0.5],[0, 0; 0, 0],[1, 1; -1, -1],'FaceColor', 'texturemap', 'CData', solarpan, 'FaceAlpha', 1, 'EdgeColor', 'none','Parent',hgt2);
    t1 = 0:0.1:90*pi;
    X1 = 22*cos(t1/4.6);
    Y1 = 52*sin(t1/4.6);
    Z1 = 32*cos(t1/4.6);

    t2 = 0:0.1:90*pi;
    X2 = 52*cos(t2/6.6);
    Y2 = 22*sin(t2/6.6);
    Z2 = 52*cos(t2/5.6);
    beta = pi/500;% for the rotation of the earth.
    % We now set the axis and background color of the MATLAB figure
    axis([-45 ,45, -45, 45, -15, 15])
    set(gca, 'color' , 'white')

    % for song
    load handel.mat
    filename = 'hande.wav';
    audiowrite(filename,y,Fs)
    clear y Fs
    [y, Fs] = audioread('handel.wav');
    sound(y,Fs);
    for i=1:length(X1)
    % earth
    %{
    RxTx =  [1,            0,               0,   0;
            0,  cos(i*beta),    -sin(i*beta),   0;
            0,  sin(i*beta),     cos(i*beta),   0; 
            0,            0,               0,   1  ] * [1,            0,               0,   0;
                                                        0,  cos(i*beta),    sin(i*beta),   0;
                                                        0,  -sin(i*beta),     cos(i*beta),   0; 
                                                        0,            0,               0,   1  ]*[1,            0,               0,   0;
                                                                                             0,  cos(i*beta),    sin(i*beta),   0;
                                                                                             0,  -sin(i*beta),     cos(i*beta),   0; 
                                                                                             0,            0,               0,   1  ];
                                                                                      
    %}                                                                                     
                                                                                        
    RxTx =  [cos(i*beta),-sin(i*beta),0,0;
            sin(i*beta),cos(i*beta),0,0;
            0, 0, 1, 0; 
            0,0,0,1  ];
        
    RxTx =  RxTx*[1,0, 0,0;
            0,cos(pi),-sin(pi),0;
            0,sin(pi),cos(pi),0; 
            0,0,0,1]; 
                                                                                        
    % rotation matrix along x-axis
    set( hgth,'Matrix',RxTx);
    drawnow;
    Trans1 = [1, 0,0, 0.6*X1(i);
    0, 1, 0, 0.6*Y1(i);
    0, 0, 1, 0.1*Z1(i);
    0, 0, 0, 1.0000 ];
    Trans2 = [1, 0, 0, 0.8*X2(i);
    0, 1, 0, 0.8*Y2(i);
    0, 0, 1, 0.1*Z2(i);
    0, 0, 0, 1 ];
    set(hgt1,'Matrix',Trans1);
    set(hgt2,'Matrix',Trans2);


    drawnow;
    end
end