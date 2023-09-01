from robot.utils import is_truthy
from robot.api.deco import keyword
from typing import Union
from datetime import date
import asyncio
import time
import sys
from robot.api import logger


def any_arguments(*args):
    print("Got arguments:")
    for arg in args:
        print(arg)


def one_required(required, *others):
    print("Required: %s\nOthers:" % required)
    for arg in others:
        print(arg)


def also_defaults(req, def1="default 1", def2="default 2", *rest):
    print(req, def1, def2, rest)


# Free Keyword Argument
def example_keyword(**stuff):
    for name, value in stuff.items():
        print(name, value)


def various_args(arg=None, *varargs, **kwargs):
    if arg is not None:
        print('arg:', arg)
    for value in varargs:
        print('vararg:', value)
    for name, value in sorted(kwargs.items()):
        print('kwarg:', name, value)


# Keyword - only arguments
def sort_words(*words, case_sensitive=False):
    key = str.lower if case_sensitive else None
    return sorted(words, key=key)


def strip_spaces(word, *, left=True, right=True):
    if left:
        word = word.lstrip()
    if right:
        word = word.rstrip()


# Positional-only arguments
def keyword1(position, /, normal):
    print(f"Got positional-only argument {position} and normal argument {normal}.")


# Manual argument conversion
def example_keyword1(count, case_insensitive=True):
    count = int(count)
    if is_truthy(case_insensitive):
        print("count ", count)

    print(case_insensitive)


# Specifying argument types using @keyword decorator
@keyword(types={'count': int, 'case_insensitive': bool})
def example_keyword2(count, case_insensitive=True):
    if case_insensitive:
        print("case_sensitive ", case_insensitive)


@keyword(types=[int, bool])
def example_keyword3(count, case_insensitive=True):
    if case_insensitive:
        print("case_sensitive ", case_insensitive)


# Implicit argument types based on default values
def example_keyword4(count=-1, case_insensitive=True):
    if case_insensitive:
        print("count", count)
        print("case_sensitive ", case_insensitive)


# Specifying multiple possible types
def example_keyword5(length: Union[int, float], padding: Union[int, str, None] = None):
    print(length, padding)


# Converter function.
def parse_fi_date(value):
    day, month, year = value.split('.')
    return date(int(year), int(month), int(day))


# Register converter function for the specified type.
ROBOT_LIBRARY_CONVERTERS = {date: parse_fi_date}


# Keyword using custom converter. Converter is resolved based on argument type.
def keyword3(arg: date):
    print(f'year: {arg.year}, month: {arg.month}, day: {arg.day}')


# Embedding arguments into keyword names
@keyword('Add ${quantity:\d+} copies of ${item} to cart')
def add_copies_to_cart(quantity, item):
    print("Quantity and item ",quantity, item)


async def task_async():
    await asyncio.sleep(5)

@keyword
async def examples():
    tasks = [task_async() for _ in range(10)]
    results = await asyncio.gather(*tasks)

    background_task = asyncio.create_task(task_async())
    await background_task

    # If running with Python 3.10 or higher
    async with asyncio.TaskGroup() as tg:
        task1 = tg.create_task(task_async())
        task2 = tg.create_task(task_async())


def example_keyword6():
    print('*INFO:%d* Message with timestamp' % (time.time()*1000))


def my_keyword(arg):
    print('Message only to console.',arg, file=sys.__stdout__)


def my_keyword1(arg):
    print('*CONSOLE* Message both to log and to console.', arg)


def log_to_console(arg):
    logger.console('Message only to console.')


def log_to_console_and_log_file(arg):
    logger.info('Message both to log and to console.', also_console=True)


def logging_example():
    print('Hello from a library.')
    print('*WARN* Warning from a library.')
    print('*ERROR* Something unexpected happen that may indicate a problem in the test.')
    print('*INFO* Hello again!')
    print('This will be part of the previous message.')
    print('*INFO* This is a new message.')
    print('*INFO* This is <b>normal text</b>.')
    print('*CONSOLE* This logs into console and log file.')
    print('*HTML* This is <b>bold</b>.')
    print('*HTML* <a href="http://robotframework.org">Robot Framework</a>')
