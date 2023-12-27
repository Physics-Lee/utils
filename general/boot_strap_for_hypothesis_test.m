clc;clear;close all;

% load data
option_measure = "chemo-index-down";
file_name = strcat(option_measure,".csv");

save_full_path_csv = fullfile("F:\1_learning\research\taxis of C.elegans\high throughout system\data\smd-rmd-coablation\mockkill\Or\index",file_name);
loaded_table = readtable(save_full_path_csv);
control_group = table2array(loaded_table);

save_full_path_csv = fullfile("F:\1_learning\research\taxis of C.elegans\high throughout system\data\smd-rmd-coablation\ablation\Or\index",file_name);
loaded_table = readtable(save_full_path_csv);
test_group = table2array(loaded_table);

% Combine the data
combined_data = [control_group; test_group];

% Number of bootstrap samples
n_bootstrap_samples = 100000;

% Initialize array to store differences
mean_differences = zeros(n_bootstrap_samples, 1);

% Size of each group
size_control = size(control_group, 1);
size_test = size(test_group, 1);
size_all = size_control + size_test;

% Actual difference in weighted means
actual_diff = weighted_mean(control_group) - weighted_mean(test_group);

% Bootstrap loop
for i = 1:n_bootstrap_samples

    % Shuffle combined data
    bootstrap_all = combined_data(randi(size_all, size_all, 1), :);

    % Split into new groups
    new_control = bootstrap_all(1:size_control, :);
    new_test = bootstrap_all(size_control+1:end, :);

    % Calculate weighted means
    mean_control = weighted_mean(new_control);
    mean_test = weighted_mean(new_test);

    % Store the difference
    mean_differences(i) = mean_control - mean_test;
end

% Calculate p-value
p_value = sum(abs(mean_differences) >= abs(actual_diff)) / n_bootstrap_samples;

% plot
bar_plot_with_p_value(control_group,test_group,p_value);
ylabel('Index');