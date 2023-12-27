function bar_plot_with_p_value(data_1,data_2,p_value)

% Bar graph
figure;
hold on;
means = [weighted_mean(data_1), weighted_mean(data_2)];
errors = [weighted_SEM(data_1), weighted_SEM(data_2)];
bar(means);
errorbar(means, errors, '.', 'LineWidth', 3);

% Display p-value
p_value_text = sprintf('p = %.4f', p_value);
text(1.5, max(means) + max(errors), p_value_text, 'HorizontalAlignment', 'center', 'FontSize', 12);

% Scatter points
noise_strength = 0.2; % Adjust this value as needed
noise_1 = noise_strength * rand(size(data_1, 1), 1) - noise_strength / 2;
noise_2 = noise_strength * rand(size(data_2, 1), 1) - noise_strength / 2;

scatter(ones(size(data_1, 1), 1) + noise_1, data_1(:, 1), 'filled'); % Points for data_1
scatter(2 * ones(size(data_2, 1), 1) + noise_2, data_2(:, 1), 'filled'); % Points for data_2

%
title('Error-bar for SEM');

% Assuming you have a bar plot already created
xticks([1, 2]); % Set the x-tick positions to the centers of the two bars
xticklabels({'control', 'test'}); % Rename the x-tick labels
set(gca, 'XTickLabel', {'control', 'test'}, 'fontsize', 12);

end