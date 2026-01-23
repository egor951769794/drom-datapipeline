import time
from numpy.random import normal


def sleep(sec, d):
    time.sleep(max(0, sec + normal(0, d)))