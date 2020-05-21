function [theta,rho] = rec2pol(varargin)
% Simple function to convert complex numbers to polar coordinates. It allows
% for one or two input arguments: A complex number and the angle format. If
% only one input argument is specified, the standard angle format is degrees.
% Angle format must be either 'rad' or 'deg'. Output argument format is 
% first the magnitude, then the angle

if nargin == 1
    theta = abs( varargin{:} );
    rho = atand( imag( varargin{:} )/real( varargin{:} ) );
    if real( varargin{:} ) == 0 && imag( varargin{:} ) < 0
        rho = -rho;
    end
elseif nargin == 2
    num = varargin{:,1};
    angle_format = varargin{:,2};
    if angle_format == 'deg'
        rho = atand( imag( num )/real( num ) );
    elseif angle_format == 'rad'
        rho = atan( imag( num )/real( num ) );
    else
        error('Second input argument must be either deg or rad')
    end
    if real( num ) == 0 && imag( num ) < 0
        rho = -rho;
    end
    theta = abs( num );
else
    error('There can only be two input arguments')
end
end