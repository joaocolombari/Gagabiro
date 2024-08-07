function gain = calculates_gain(input, Values)
    % Find the index of the value 445 in the input vector
    idx = find(input == 0.45, 1);
    
    % Check if the value 445 was found
    if isempty(idx)
        error('Value 445 not found in the input vector.');
    end
    
    % Get the corresponding value in the Values vector
    value445 = Values(idx);
    
    % Calculate the gain as the value in Values over the value 445
    gain = value445 / 0.45;
end
