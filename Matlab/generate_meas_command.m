% Parameters
numMeasurements = 100; % Number of measurements
timeStep = 10e-3; % Time step in seconds (10 ms)

% File to write the commands to
fileName = 'ltspice_meas_commands.txt';

% Open the file
fid = fopen(fileName, 'w');
if fid == -1
    error('Cannot open file for writing.');
end

% Loop to generate and write the commands
for i = 0:numMeasurements
    % Compute the time range
    fromTime = i * timeStep;
    toTime = (i + 1) * timeStep;
    
    % Generate the MIN command string
    minCommand = sprintf('.MEAS TRAN MIN%d MIN V(out) FROM=%gm TO=%gm\n', i, fromTime * 1e3, toTime * 1e3);
    
    % Generate the MAX command string
    maxCommand = sprintf('.MEAS TRAN MAX%d MAX V(out) FROM=%gm TO=%gm\n', i, fromTime * 1e3, toTime * 1e3);
    
    % Write the commands to the file
    fprintf(fid, '%s', minCommand);
    fprintf(fid, '%s', maxCommand);
end

% Close the file
fclose(fid);

disp('LTspice measurement commands generated successfully.');
