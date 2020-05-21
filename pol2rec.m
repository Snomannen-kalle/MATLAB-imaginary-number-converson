function [num] = pol2rec(varargin)
% Simple function to convert complex numbers from polar coordinates to
% rectangular coordinates. It allows for one or two input arguments:
% A complex number and the angle format. If only two input arguments 
% are specified, the standard angle format is degrees. Angle format
% must be either 'rad' or 'deg'

if nargin == 2
    theta = varargin{:,1};
    rho = varargin{:,2};
    re = theta*cosd(rho);
    im = theta*sind(rho);
elseif nargin == 3
    theta = varargin{:,1};
    rho = varargin{:,2};
    angle_format = varargin{:,3};
    if angle_format == 'deg'
        re = theta*cosd(rho);
        im = theta*sind(rho);
    elseif angle_format == 'rad'
        re = theta*cos(rho);
        im = theta*sin(rho);
    else
        error('Third input argument must be either rad or deg')
    end
else
    error('There must be two input arguments')
end
num = re + 1i*im;
end