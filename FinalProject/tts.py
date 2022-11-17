# # -*- coding: utf-8 -*-
# 給任何使用這支程式的人：這支程式是台語台羅語音合成的API的client端。具體上會發送最下方變數data的台羅
# 給伺服器，並接收一個回傳的wav檔，output.wav
# 接受之台羅為教育部羅馬拼音，非教會羅馬拼音，請注意。
# 接受格式為UTF-8台羅，不是帶數字的。即請用類似"phái-sè"而非"phai2-se3"這種

# *********請注意以下幾點**********
# 1. 會有一點執行時間，請等待一下。
# 2. data請不要太長。建議轉成UTF-8後不要超過1024字元
# 3. server端電腦比較陽春，請不要一次執行多個client
# 4. 如果出現目標電腦拒絕連線，而你的網路正常，基本上是server那邊壞了。
# 5. 如果port被占用，請稍等一會後重試
# 6. 不要有逗號和句號以外標點符號
# 7. 如果傳回來的音檔不太對，再試一次

#客戶端 ，用來呼叫service_Server.py
import os
import sys
import socket
import struct
from gtts import gTTS
import timeit
import re
import time
from news import get_news

### Don't touch
global HOST
global PORT
def askForService(token,data,model,name):
    # HOST, PORT 記得修改
    global HOST
    global PORT
    HOST, PORT = "140.116.245.146", 10012
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    received = ""
    try:
        sock.connect((HOST, PORT))
        msg = bytes(token+"@@@" + data + "@@@" + model, "utf-8")
        msg = struct.pack(">I", len(msg)) + msg
        sock.sendall(msg)
        
        with open(name,'wb') as f:
            while True:
                # print("True, wait for 15sec")
                # time.sleep(15)
                
                l = sock.recv(8192)
                # print('Received')
                if not l: break
                f.write(l)
    finally:
        sock.close()
    return "OK"
### Don't touch

def process(token,data,model,name):
    # 可在此做預處理
    start = time.time()
    # 送出
    result = askForService(token,data,model,name)
    # 可在此做後處理
    print(time.time()-start)
    return result

def notation_modify(sen):
    sen_list=list(sen) #字串轉列表
    num_dict= { "-":"負","%":"趴","~":"到",".":"點","？":"，","　":"，","？":"，",}
    #"0":"零","1":"一","2":"二","3":"三","4":"四","5":"五","6":"六","7":"七","8":"八","9":"九",
    for i in range(len(sen_list)):
        if(num_dict.get(sen_list[i])):
            sen_list[i]=num_dict.get(sen_list[i])
    sen_new=''.join(sen_list) #列表轉字串
    return sen_new

def speech_generate():
    start = timeit.default_timer()
    token = "eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3OTc3MzcyNDMsImlhdCI6MTY0MDA1NzI0Mywic3ViIjoiIiwiYXVkIjoid21ta3MuY3NpZS5lZHUudHciLCJpc3MiOiJKV1QiLCJ1c2VyX2lkIjoiMjk1IiwibmJmIjoxNjQwMDU3MjQzLCJ2ZXIiOjAuMSwic2VydmljZV9pZCI6IjI0IiwiaWQiOjQyMiwic2NvcGVzIjoiMCJ9.dSnjdyK08XKIhX53EABNgd9Pw_Fo-7nhV_wZeQI1526RWhjpMmL0L8nDUoUsqGx1b5BQwxIzbjOFPx3d-cYSWJzXTPcVgniXsGQFBAYX8Lh9Wy4nocd11oFIWCOO0ZpgsGym_CbvFw5iTFR-0r4zhMUv2nDbBG9Zb1gH9PduWC4"
    # 男生聲音: model = "M12_sandhi" / 女生聲音: model = "F14_sandhi"
    model = "F14_sandhi"
    #model = "M12_sandhi"
    category_list=[1,17,21]
    category_dict={1:'政治', 17:'財經',21:'健康'}
    for i in range(len(category_list)):
        type=category_dict.get(category_list[i])
        answer=get_news(3,category_list[i])
        #台語
        answer_tw = re.sub("[A-Za-z,\（,\）]", "", answer)
        answer_tw=notation_modify(answer_tw)
        answer_tw='您好，我是主播鄭琇櫻，歡迎收看成功台'+type+'新聞'+answer_tw
        print(answer_tw,'\n')
        file='output/audio/output_tw_'+str(category_list[i])+'.wav'
        print("Client : ",process(token, answer_tw, model,file))
        #中文
        answer_ch='您好，我是主播方稚榕，歡迎收看成功台'+type+'新聞'+answer
        print(answer_ch,'\n')
        tts=gTTS(text=answer_ch,lang='zh-tw')
        file='output/audio/output_ch_'+str(category_list[i])+'.mp3'
        tts.save(file)
    stop = timeit.default_timer()
    print('Speech Time: ', stop - start)

# if __name__ == "__main__":
#     speech_generate()
