function [num] = pol2rec(varargin)
% Simple function to convert complex numbers from polar coordinates to
% rectangular coordinates. It allows for one or two input arguments:
% A complex number and the angle format. If only two input arguments 
% are specified, the standard angle format is degrees. Angle format
% must be either 'rad' or 'deg'

theta = varargin{:,1};
rho = varargin{:,2};

if nargin == 3
    angle_format = varargin{:,3};
    if strcmp( angle_format,'rad' ) == true
        rho = rad2deg( rho );
    elseif strcmp( angle_format,'deg' )  ~= true
        error('Third input argument must be either rad or deg')
    end
elseif nargin > 3
    error('There must be two input arguments')
end

if theta < 0
    theta = abs( theta );
    rho = rho - 180;
end

re = theta*cosd( rho );
im = theta*sind( rho );

num = re + 1i*im;

end
