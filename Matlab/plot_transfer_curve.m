function plot_transfer_curve(input, Values)
    % Define the transfer function T(x) using interpolation
    T = @(x) interp1(input, Values, x, 'spline', 'extrap');
    
    % Define the first and second derivatives
    dT = @(x) gradient(T(x), x);
    d2T = @(x) gradient(dT(x), x);
    
    % Generate a range of x values for plotting
    x_range = linspace(min(input), max(input), 1000);
    
    % Compute T(x), first derivative, and second derivative
    T_values = T(x_range);
    dT_values = dT(x_range);
    d2T_values = d2T(x_range);
    
    % Plot the original Values against input
    figure;
    plot(input, Values, 'DisplayName', 'Original Data');
    hold on;
    
    % Plot the interpolated T(x) curve
    plot(x_range, T_values, 'b', 'DisplayName', 'Interpolated T(x)');
    
    % Plot the first derivative
    plot(x_range, dT_values, 'r', 'DisplayName', 'First Derivative');
    
    % Plot the second derivative
    plot(x_range, d2T_values, 'g', 'DisplayName', 'Second Derivative');
    
    % Add labels and legend
    xlabel('Input');
    ylabel('Values / Derivatives');
    title('Transfer Curve and Its Derivatives');
    legend show;
    grid on;
end
