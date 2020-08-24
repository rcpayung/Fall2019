xL = 2.5;                            % x, left limit
xR = 5.2;                            % x, right limit
panels = 500;                        % number of panels
deltax = (xR-xL)/panels;             % panel width
h = deltax;                          % height, h
total_area = 0.0;                    % total area
for x = xL:h:(xR-h)                  % begin integration
    b1 = cos(x^4)-log(2+x);          % base 1
    b2 = cos((x+h)^4)-log(2+(x+h));  % base 2
    area = 0.5*h*(b1+b2);            % panel area
    total_area = total_area + area;  % add panel area to
end                                  % total area
disp(total_area);                    % report total area 