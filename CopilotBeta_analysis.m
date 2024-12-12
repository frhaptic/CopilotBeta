clear all
close all
T = readtable("MATLAB Copilot Beta Survey(1-22).xlsx");

% Assume T is your table
% Extract data from columns 10 to 23
idx = 10:23;
data_plot = T{:, idx};
titles = T.Properties.VariableNames(idx);

for i = 1:14


    data = data_plot(:,i);
    % Find rows that contain 'N/A'
    na_indices = strcmp(data, 'N/A');
    % Remove rows with 'N/A'
    data(na_indices) = [];
    
    % Create a new figure for the histogram with increased width
    figure('Position', [100, 100, 700, 500]); % Adjust the width (700) and height (400) here

    % Count the occurrences of each category
    [counts, categories] = histcounts(categorical(data), 'Normalization', 'count');
    % Plot the data using a bar chart

    % Sort categories by frequency in descending order
    [sortedCounts, sortIdx] = sort(counts, 'descend');
    sortedCategories = categories(sortIdx);

    % Plot the histogram using a bar chart for sorted categories
    bar(sortedCounts);
    % Adjust x-axis limits to fit the bars tightly
    xlim([0.5, numel(sortedCategories) + 0.5]);

    % Set x-tick labels
    xticks(1:numel(sortedCategories));
    xticklabels(sortedCategories);
    % Rotate x-tick labels for better readability if necessary
    xtickangle(45); % Adjust the angle for better readability if needed

    % Add title and labels
    title(titles{i});
    ylabel('Frequency');

    % Enable y-grid lines for better readability
    grid on;
    ax = gca; % Get current axes handle
    ax.YGrid = 'on';
    ax.XGrid = 'off'; % Optional: turn off x-grid lines


end
