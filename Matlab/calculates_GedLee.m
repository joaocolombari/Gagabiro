function gm = calculates_GedLee(input, Values)
    % Define the transfer function T(x) using interpolation
    T = @(x) interp1(input, Values, x, 'spline', 'extrap');
    
    % Define the second derivative of T(x)
    % Compute first derivative
    dT = @(x) gradient(T(x), x);
    % Compute second derivative
    d2T = @(x) gradient(dT(x), x);
    
    % Define the integrand function
    integrand = @(x) cos(x * pi / 2).^2 .* (d2T(x)).^2;
    
    % Compute the integral from -1 to 1
    integral_value = integral(@(x) integrand(x), -1, 1);
    
    % Compute the square root of the integral value
    gm = sqrt(integral_value);
end
