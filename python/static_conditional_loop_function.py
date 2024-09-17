def greet_person(name, time_of_day):
    if time_of_day == 'morning':
        greeting = 'Top of the morning'
    elif time_of_day == 'afternoon':
        greeting = 'Shaby  afternoon'
    else:
        greeting = 'Heffers evening'
    return f'{greeting}, {name}!'

if __name__ == '__main__':
    names_list = ['Kyoto', 'Toytama', 'Jicinto', 'Squad']
    for person in names_list:
        print(greet_person(person, 'afternoon')) # this is not dynamic, must manually set
