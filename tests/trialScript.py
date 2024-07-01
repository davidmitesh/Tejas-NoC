import os
import re
import matplotlib.pyplot as plt


folder_path = '/home/mitesh/Documents/Tejas/tests/new-new'

# plt.style.use("fivethirtyeight")

def extract_parameter_value(folder_path, passed_string_name):
    
    if passed_string_name == 'branch_predictor':
        parameter_name = 'branch predictor accuracy'
        last_text = '%'
        y_label = 'Percentage%'
        equal_sign = '='
    elif passed_string_name == 'ipc':
        parameter_name = 'Total IPC'
        last_text = 'in terms of CISC instructions'
        y_label = "IPC"
        equal_sign='='
    elif passed_string_name == 'i_cache_hit':
        parameter_name='I1 Hit-Rate'
        last_text=''
        y_label="i-cache hit"
        equal_sign = '='
    elif passed_string_name == 'd_cache_hit':
        parameter_name='L1 Hit-Rate'
        last_text=''
        y_label="D-cache hit rate(%)"
        equal_sign = '='
    elif passed_string_name == 'average_read_latency_from_memory':
        parameter_name='Average Read Latency'
        last_text = 'cycles'
        y_label = "Latency to main memory(cycles)"
        equal_sign = ':'
    elif passed_string_name == 'tlb':
        parameter_name = 'iTLB[0] Hit-Rate'
        last_text = ''
        y_label = "i-TLB hit rate"
        equal_sign = '='
    elif passed_string_name == 'latency':
        parameter_name = 'Total Cycles taken'
        last_text = ''
        y_label = "Total Cycles taken"
        equal_sign = '='

    values = []
    legends = []  # Store legend names
    file_types = []  # Store file types
    # Iterate over files in the folder
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        if os.path.isfile(file_path):
            with open(file_path, 'r') as file:
                # Read each line in the file
                for line in file:
    
                    # Use regular expression to find parameter_name followed by "=" and capture the value
                    match = re.search(fr'{re.escape(parameter_name)}\s*{equal_sign}\s*(.*){last_text}', line)
                    if match:
                        
                        value = match.group(1)
                        values.append(float(value.strip()))  # Convert value to float and append
                        legend = filename.replace('spec', '').replace('parsec', '').strip('_')
                        legends.append(legend)  # Use filename as legend name
                        if 'spec' in filename:
                            file_types.append('spec')
                        elif 'parsec' in filename:
                            file_types.append('parsec')
                        break
    return values, legends,parameter_name,y_label,file_types

# Example usage:

plt.style.use('seaborn-darkgrid')
plt.figure(figsize=(6, 4))

color_map = {'spec': 'blue', 'parsec': 'red'}
parameters_to_plot = ['latency','branch_predictor','ipc','i_cache_hit','d_cache_hit','average_read_latency_from_memory','tlb']
# passed_string_name = 'tlb'
for passed_string_name in parameters_to_plot:
	parameter_values, legends,parameter_name,y_label,file_types = extract_parameter_value(folder_path, passed_string_name)
	print(parameter_values)
	# Plotting the values using a bar graph
	# plt.bar(range(len(parameter_values)), parameter_values)
	for i, legend in enumerate(legends):
	    plt.bar(i, parameter_values[i], color=color_map[file_types[i]], label=legend)
	# plt.xlabel('Index')
	plt.ylabel(y_label)
	plt.title(f'Bar Graph of {parameter_name} values')
	plt.xticks(range(len(parameter_values)), legends, rotation=45)  # Set legends as x-axis labels
	plt.legend()
	# Add color labels to the side of the plot
	spec_patch = plt.Line2D([], [], color='blue', label='Spec Files', marker='s', linestyle='')
	parsec_patch = plt.Line2D([], [], color='red', label='Parsec Files', marker='s', linestyle='')
	plt.legend(handles=[spec_patch, parsec_patch],bbox_to_anchor=(1.05, 1), loc='upper left')
	# Add legend outside the plot area
	# plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
	# plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
	plt.tight_layout()
	plt.grid(True)
	plt.show()




