import ffmpeg
import eyed3
from moviepy.editor import *
import contextlib
import wave
import timeit
import math


def video_cut(original_file,new_file,start_time,end_time):
    video = VideoFileClip(original_file).subclip(start_time,end_time)
    result = video.write_videofile(new_file)# Many options...
    return result

def video_generate():
    start = timeit.default_timer()
    category_id=[1,17,21]
    #中文
    for i in range(len(category_id)):
        id=str(category_id[i])
        mp3_path= 'output/audio/output_ch_'+id+'.mp3'
        mp3Info = eyed3.load(mp3_path)
        duration=mp3Info.info.time_secs
        min=int(duration/60)
        second=math.ceil(duration-(60*min))
        end_time='00:0'+str(min)+':'+str(second)
    
        file1 = 'output/video/use/ch_'+id+'.mp4'
        file2 = 'output/video/use/cut_ch_'+id+'.mp4'
        cmd_cut="ffmpeg -y -ss 00:00:00 -to " +end_time+" -i "+file1+" -c "+"copy "+file2
        os.system(cmd_cut)

        infile1 = 'output/video/use/cut_ch_'+id+'.mp4'
        infile2 = mp3_path
        outfile='news_app/assets/videos/news_ch_'+id+'.mp4'
        #ffmpeg.concat(infile1, infile2, v=1, a=1).output('news_app/assets/videos/news_ch_'+id+'.mp4').run()
        cmd = "ffmpeg -y -i "+infile1+" -i "+ infile2+ " -c:v copy -c:a aac "+ outfile
        os.system(cmd)
    #台語
    for j in range(len(category_id)):
        id=str(category_id[j])
        wav_path=r"output/audio/output_tw_"+id+".wav"
        with contextlib.closing(wave.open(wav_path, 'r')) as f:
            frames = f.getnframes()
            rate = f.getframerate()
            wav_length = frames / float(rate)

        min=int(wav_length/60)
        second=math.ceil(wav_length-(60*min))
        end_time='00:0'+str(min)+':'+str(second)

        file1 = 'output/video/use/tw_'+id+'.mp4'
        file2 = 'output/video/use/cut_tw_'+id+'.mp4'
        cmd_cut="ffmpeg -y -ss 00:00:00 -to " +end_time+" -i "+file1+" -c "+"copy "+file2
        os.system(cmd_cut)

        infile1 = 'output/video/use/cut_tw_'+id+'.mp4'
        infile2 = wav_path
        outfile='news_app/assets/videos/news_tw_'+id+'.mp4'
        #ffmpeg.concat(infile1, infile2, v=1, a=1).output('news_app/assets/videos/news_tw_'+id+'.mp4').run()
        cmd = "ffmpeg -y -i "+infile1+" -i "+ infile2+ " -c:v copy -c:a aac "+ outfile
        os.system(cmd)
    stop = timeit.default_timer()
    print('Video Time: ', stop - start)
    

# if __name__ == "__main__":
   