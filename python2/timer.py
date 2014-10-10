import time

START_TIME = 'start_time'
END_TIME = 'end_time'
FORMAT = '\nTime run: {0:<5.5f}'


class Timer(object):

    def __init__(self, clock):
        self.clock = clock

    def __enter__(self):
        self.clock[START_TIME] = time.time()

    def __exit__(self, type_, value, traceback):
        self.clock[END_TIME] = time.time()


def print_time(func, *args, **kwargs):
    clock = {}
    with Timer(clock):
        func(*args, **kwargs)
    print(FORMAT.format(clock[END_TIME] - clock[START_TIME]))
