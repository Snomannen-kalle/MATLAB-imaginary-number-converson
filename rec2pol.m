function [theta,rho] = rec2pol(varargin)
% Simple function to convert complex numbers to polar coordinates. It allows
% for one or two input arguments: A complex number and the angle format. If
% only one input argument is specified, the standard angle format is degrees.
% Angle format must be either 'rad' or 'deg'. Output argument format is 
% first the magnitude, then the angle

num = varargin{:,1};
theta = abs( num );
rho = atand( imag( num )/real( num ) );

if real( num ) == 0 && imag( num ) < 0
    rho = -rho;
elseif real( num ) < 0 && imag( num ) > 0
    rho = 180 - abs( rho );
elseif real( num ) < 0 && imag( num ) < 0
    rho = abs( rho ) - 180;
else
    return
end

if nargin == 1
    return
elseif nargin == 2
    number_format = varargin{:,2};
    if strcmp(number_format, 'deg')
        return
    else
        rho = deg2rad( rho );
    end
elseif nargin >= 3
    error('There can only be two input arguments')
else
    return
end

end
