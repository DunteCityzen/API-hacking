creds_list = []
emails_list = []
passwords_list = []

with open('creds.csv', encoding='utf-8-sig') as creds_f:
	for line in creds_f:
		creds_list.append(line.strip())
for creds in creds_list:
	emails_list.append(creds.split(',')[0])
	passwords_list.append(creds.split(',')[1])

with open('emails.txt', 'w', encoding='utf-8-sig') as emails_f:
	for email in emails_list:
		emails_f.write(email + '\n')

with open('passwords.txt', 'w', encoding='utf-8-sig') as passwords_f:
	for password in passwords_list:
		passwords_f.write(password + '\n')

print('creds.csv successfully split into emails.txt and passwords.txt respectively')