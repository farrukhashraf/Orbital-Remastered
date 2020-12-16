% function initializes all the images from the file
function [Earth_texture, Sat_texture1, Sat_texture2, solarpan, topsat, botsat] = initialize_images()
    % Image for earth texture
    Earth_texture = imread('earth1.jpg');
        %-Image for the texture of the satellite body.
    Sat_texture1 = imread('spaceX.jpg');
    Sat_texture2 = imread('space1X.jpg'); 
        % Image for the texture of the solar panel.
    solarpan = imread('solarpan1.jpg');         
        %-Image for the lower sphere of the satellite
  	topsat = imread('sky.jpg');                 
        %-Image for the upper sphere of the satellite.
    botsat = imread('sky2.jpg'); 
end