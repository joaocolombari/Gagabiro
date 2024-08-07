% --------------------------------------------------------- % 
%   MATLAB Script to Import and Plot Min and Max Values     %
%   from LTspice Log File                                   %
%   Joao Victor Colombari Carlet                            %
%   jvccarlet@usp.br                                        %
% --------------------------------------------------------- % 

% Verificar os comandos 

% Simular com menos pontos 

%% Setup

close all 
clear

% Specify the path to your log file
logFilePath = 'C:\Users\alunos\Desktop\Gagabiro\EL84\POWER_AMP_IC_rework_el84_transient_stairs.log';

% Open the log file
fid = fopen(logFilePath, 'r');

% Check if the file was opened successfully
if fid == -1
    error('Cannot open log file.');
end

% Read the entire file
fileContent = fread(fid, '*char')';
fclose(fid);

% Remove unnecessary spaces (considering that there may be valid spaces in numeric data)
fileContent = regexprep(fileContent, '\x00', ''); % Replace multiple spaces with a single space

% Split the data into lines
lines = strsplit(fileContent, {'\r', '\n', '\r\n'}, 'CollapseDelimiters', true);

% Initialize variables to store min and max values
minValues = [];
maxValues = [];

% Process each line
for i = 1:length(lines)
    tline = strtrim(lines{i}); % Trim leading and trailing whitespace
    
    % Check if the line contains a max or min measurement
    if contains(tline, 'MAX(v(out))')
        % Extract the max value using regular expression
        maxMatch = regexp(tline, 'MAX\(v\(out\)\)=([\d\.-]+[eE]?[-+]?\d*)', 'tokens');
        if ~isempty(maxMatch)
            maxValues = [maxValues, str2double(maxMatch{1}{1})];
        end
    elseif contains(tline, 'MIN(v(out))')
        % Extract the min value using regular expression
        minMatch = regexp(tline, 'MIN\(v\(out\)\)=([\d\.-]+[eE]?[-+]?\d*)', 'tokens');
        if ~isempty(minMatch)
            minValues = [minValues, str2double(minMatch{1}{1})];
        end
    end
end

% Check if any values were read
if isempty(maxValues) || isempty(minValues)
    error('No min or max values were read from the log file.');
end

% Flips minValues
minValues = fliplr(minValues);

% Combine and reverse min values
Values = [minValues(1:end-1), 0.5*(maxValues(1)+minValues(end)) ,maxValues(2:end)];

% Makes input vector
input = (-(length(Values)-1)/2:length(Values)/2) * 0.01; % Intervals of 10ms

% Gets the gain of the amplifier
gain = calculates_gain(input,Values);

% Normalizes Values in relation to gain
Values = Values/gain;

figure;
plot(input, Values, 'b', 'DisplayName', 'Transfer Curve');
xlabel('Input (V)');
ylabel('Output (V)');
title('Transient Analysis: Transfer Characteristics');
legend show;
grid on;
