clear; close all;
load('task4Weddy.mat')
kt = 1.311;
speed   = (1/kt) * CH3V;
referenceVoltage = CH1V;
feedforwardSignal = CH2V;

[fitresult, gof] = createFit(feedforwardSignal, speed);
figure(2);
plot(referenceVoltage, speed, 'bo', 'MarkerSize', 10);
ax = gca;
ax.FontName = 'LaTeX';
ax.TickLabelInterpreter = 'LaTeX';
ax.FontSize = 18;
ax.XColor = 'k';
ax.YColor = 'k';

ax.YLabel.String = ('Speed (rad/s)');
ax.YLabel.FontSize = 16;
ax.YLabel.FontWeight = 'bold';
ax.YLabel.Color = 'k';

ax.XLabel.String = ('Reference Signal (V)');
ax.XLabel.FontSize = 16;
ax.XLabel.FontWeight = 'bold';
ax.XLabel.Color = 'k';

ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('Speed Vs. Reference Voltage');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;


function [fitresult, gof] = createFit(feedforwardSignal, speed)
    %CREATEFIT(FEEDFORWARDSIGNAL,SPEED)
    %  Create a fit.
    %
    %  Data for 'Error Rejection' fit:
    %      X Input : feedforwardSignal
    %      Y Output: speed
    %  Output:
    %      fitresult : a fit object representing the fit.
    %      gof : structure with goodness-of fit info.
    %
    %  See also FIT, CFIT, SFIT.

    %  Auto-generated by MATLAB on 21-Nov-2017 06:02:25


    %% Fit: 'Error Rejection'.
    [xData, yData] = prepareCurveData( feedforwardSignal, speed );

    % Set up fittype and options.
    ft = fittype( 'poly1' );

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft );
    % Plot fit with data.
    figure( 'Name', 'Error Rejection' );
    h = plot(fitresult, xData, yData);
    set(h, 'LineWidth', 2);
    set(h, 'MarkerSize', 10);
    hold on
    legend( h, 'Data', 'Error Rejection Fit', 'Location', 'Best' );
    % Label axes
    ax = gca;
    ax.FontName = 'LaTeX';
    ax.TickLabelInterpreter = 'LaTeX';
    ax.FontSize = 18;
    ax.XColor = 'k';
    ax.YColor = 'k';

    ax.YLabel.String = ('Speed (rad/s)');
    ax.YLabel.FontSize = 16;
    ax.YLabel.FontWeight = 'bold';
    ax.YLabel.Color = 'k';

    ax.XLabel.String = ('Feedforward Signal (V)');
    ax.XLabel.FontSize = 16;
    ax.XLabel.FontWeight = 'bold';
    ax.XLabel.Color = 'k';

    ax.Box = 'off';
    ax.LineWidth = 1.5;
    ax.YGrid = 'on';
    ax.XMinorTick = 'on';
    ax.YMinorTick = 'on';

    t = title('Speed Vs. Feedforward Voltage');
    t.Color = 'k';
    t.Interpreter = 'LaTeX';
    t.FontSize = 24;
end
