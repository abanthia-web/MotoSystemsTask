%need Data Acquisition Toolbox installed

function maxT = getMaxTorq(file)
    data = tdmsread(file); %read the tdms file 
    names = data{1,1}.Properties.VariableNames; %store heading names
    idx = strcmp(names, 'FMI 1');  %find the FMI 1 heading index
    maxT = max(data{1,1}{:, idx}); %find max of all measurements in FMI 1
end

rpm = [1750, 2750, 3250, 3750, 4250, 4750, 5250];

files = [
    "torque-speed-1750RPM.tdms"
    "torque-speed-2750RPM.tdms"
    "torque-speed-3250RPM.tdms"
    "torque-speed-3750RPM.tdms"
    "torque-speed-4250RPM.tdms"
    "torque-speed-4750RPM.tdms"
    "torque-speed-5250RPM.tdms"
];

%create empty array for the max torque values
maxTorq = zeros(size(rpm)); 

%store max torque values in the empty array
for i = 1:length(maxTorq)
    maxTorq(i) = getMaxTorq(files(i));
end

rpmCon = [0,1750]; %x values for horizontal constant torque region
torqCon = [maxTorq(1),maxTorq(1)]; %y values for constant torque region

p_poly = polyfit(rpm, maxTorq, 3); %fit data points into 3rd order polynomial
rpmFit = linspace(min(rpm), max(rpm), 100); %generates x values for the polynomial
torqFit = polyval(p_poly, rpmFit); %corresponding y values of each polynomial x value

figure;
hold on;
plot(rpm, maxTorq, 'o', 'DisplayName', 'Maximum Measured Torque')
plot(rpmFit, torqFit, 'b-', 'LineWidth', 2, 'DisplayName', 'Constant Power Region');
plot(rpmCon, torqCon, 'r-', 'LineWidth', 2, 'DisplayName', 'Constant Torque Region');
xlabel('Speed (RPM)');
ylabel('Maximum Measured Torque (Nm)');
title('Torque Speed Envelope');
grid on;
