from faker import Faker
import csv


def writeToCSV():
    with open('random_us_addresses.csv', mode='w') as file:
        fake = Faker()
        writer = csv.writer(file)
        for i in range(4000000):
            name = fake.name()
            street_address = fake.street_address()
            street_address_Arr = street_address.split()
            city = fake.city()
            state = fake.state_abbr()
            zipcode = fake.zipcode()
            email = fake.domain_name()
            nameArr = name.lower().split()
            userEmail = nameArr[0]+nameArr[1]+street_address_Arr[0]+"@"+email
            writer.writerow([i, name, street_address, city, state, zipcode, userEmail])

writeToCSV()