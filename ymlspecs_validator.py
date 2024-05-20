with open('test_specs.yml', encoding='utf-8-sig') as f:
	lines = f.readlines()

with open('test_specs.yml', 'w', encoding='utf-8-sig') as f:
	for line in lines:
		if 'api' in line and 'ignore:' in line:
			newline = line.replace('ignore:', '')
			f.write(newline)
		else:
			f.write(line)