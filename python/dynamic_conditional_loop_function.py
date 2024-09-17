from datetime import datetime


def greet_person_dynamic(name):
    current_hour = datetime.now().hour # this is the difference between static function 

    if current_hour < 12:   # greater or = to, also making this a bit ore dynamic in this section
        greeting = 'Top of the morning'
    elif 12 <= current_hour < 18:
        greeting = 'Shaby afternoon'
    else:
        greeting = 'Heffers evening'

    return f'{greeting}, {name}!'


if __name__ == '__main__':
    names_list = ['Kyoto', 'Toyotama', 'Jicinto', 'Squad']
    for person in names_list:
        print(greet_person_dynamic(person))
