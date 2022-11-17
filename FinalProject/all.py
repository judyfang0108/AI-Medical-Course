from tts import *
from video import *


if __name__ == "__main__":
    start = timeit.default_timer()
    speech_generate()
    video_generate()
    stop = timeit.default_timer()
    print('All Time: ', stop - start)