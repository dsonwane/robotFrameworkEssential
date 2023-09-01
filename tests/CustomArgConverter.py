from datetime import date
import re


def parse_date(value, library):
    # Validate input using regular expression and raise ValueError if not valid.
    # Use locale based from library state to determine parsing format.
    if library.locale == 'en_US':
        match = re.match(r'(?P<month>\d{1,2})/(?P<day>\d{1,2})/(?P<year>\d{4})$', value)
        format = 'mm/dd/yyyy'
    else:
        match = re.match(r'(?P<day>\d{1,2})\.(?P<month>\d{1,2})\.(?P<year>\d{4})$', value)
        format = 'dd.mm.yyyy'
    if not match:
        raise ValueError(f"Expected date in format '{format}', got '{value}'.")
    return date(int(match.group('year')), int(match.group('month')), int(match.group('day')))


ROBOT_LIBRARY_CONVERTERS = {date: parse_date}


def keyword(arg: date):
    print(f'year: {arg.year}, month: {arg.month}, day: {arg.day}')