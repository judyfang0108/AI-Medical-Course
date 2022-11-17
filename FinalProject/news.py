# 載入python 套件
import requests
from bs4 import BeautifulSoup  
import datetime
import timeit

def get_news(number,category):
    start = timeit.default_timer()
    today=datetime.date.today()#get date
    number=number
    category=[category,]
    # 抓 title
    for tt in category:
        title = []
        u = "https://www.ettoday.net/news/news-list-"+str(today)+"-"+str(tt)+".htm"
        res = requests.get(u)
        soup = BeautifulSoup(res.content, "lxml")
        soup = soup.find("div", class_="part_list_2")
        domian = "https://www.ettoday.net"
        for a in soup.find_all("h3"):
            p = a.a.string
            if p != None:
                p = p.split('／')
                if len(p) > 1:
                    title.append(p[1])
                else:
                    title.append(p[0])
            if(len(title)==number):
                break
        #print(len(title))

        # with open(str(tt)+".txt", "a") as f:
        #     for t in title:
        #         f. write(t+"\n")

    #  抓 內文
    for tt in category:
        #print(tt)
        urls = []
        u = "https://www.ettoday.net/news/news-list-"+str(today)+"-"+str(tt)+".htm"
        res = requests.get(u)
        soup = BeautifulSoup(res.content, "lxml")
        soup = soup.find("div", class_="part_list_2")
        domian = "https://www.ettoday.net"
        for a in soup.find_all("h3"):
            urls.append(domian+a.a['href'])
        allcontent = []
        for u in urls[0:number]:
            #print(u)
            content = []
            res = requests.get(u)
            soup = BeautifulSoup(res.content, "lxml")
            try:
                soup = soup.find("div", class_="story")
                for a in soup.find_all("p"):
                    p = a.string
                    if p != None:
                        p = p.split('／')
                        #print(p)
                        if len(p) > 1:
                            length=len(p[1])
                        else:
                            length=len(p[0])
                            content.append(p[0])
                            if(p[0][length-1]=='。'):
                                break
                #print(content)
                allcontent.append(content[0])
            except:
                pass

    news0='首先為您報導第ㄧ則新聞，'+title[0]+'，'+allcontent[0]
    news1='接下來第二則新聞為，'+title[1]+'，'+allcontent[1]
    news2='最後一則新聞我們看到，'+title[2]+'，'+allcontent[2]
    end='以上是今天的新聞報導，謝謝您的收看。'
    speak=news0+news1+news2+end
    speak=speak.replace('　','，')
    #print(speak)
    #print('新聞長度：',len(speak))
    stop = timeit.default_timer()
    print('Get News Time: ', stop - start)
    #     # with open(str(tt)+".txt", "a") as f:
    #     #     for c in allcontent:
    #     #         if len(c) > 3:
    #     #             ss = ""
    #     #             for aaa in c:
    #     #                 ss+=aaa+'，'
    #     #             f.write(ss+"\n")  
    return speak
# if __name__ == "__main__":
#     answer=get_news(3,21)
