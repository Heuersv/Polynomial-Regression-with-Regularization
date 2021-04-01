clear

% Parameters
degree = 6;
regularization_factor = 10;

% Put in all folder names "by hand"
for dataset = {'band_tabs_cumulated'}
    for folder = {'mean', 'pure_pixels', 'sd'}
        % A lot of handling the filenames
        path = strcat(dataset, '/', folder, '/');
        files_string = strcat('data/', path, '*.csv');
        files_string = files_string{1};
        files = dir(files_string);
        for filenumber = 1:length(files)
            filename = strcat(path, files(filenumber).name);
            filename = filename{1};
            % Get the polynomial coefficients
            result = process_file(strcat('data/', filename), degree, regularization_factor);
            % Write coefficients to output file
            output_path = strcat('processed_data/', path);
            output_path = output_path{1};
            if (~exist(output_path, 'dir'))
                mkdir(output_path);
            end
            csvwrite(strcat('processed_data/', filename), result);
        end
    end
end
