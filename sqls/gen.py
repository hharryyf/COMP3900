import os
import random
import datetime
import psycopg2

file1 = open('yob1880.txt', 'r')
Lines = file1.readlines()
li = []
ch = []
start_date = datetime.date(1926, 8, 17)
end_date = datetime.date(2012, 1, 1)
time_between_dates = end_date - start_date
days_between_dates = time_between_dates.days
for i in range(26):
    ch.append(str(chr(ord('a') + i)))
    ch.append(str(chr(ord('A') + i)))
for i in range(10):
    ch.append(str(i))
ch.append('_')
myset = set()
for line in Lines:
    ss = line.split(',')
    if ss[0] in myset:
        continue
    myset.add(ss[0])
    passwd = ""
    for i in range(8):
        passwd += ch[random.randint(0,len(ch) - 1)] 
    random_number_of_days = random.randrange(days_between_dates)
    birthday = start_date + datetime.timedelta(days=random_number_of_days)
    li.append([ss[0] + '@gmail.com', passwd, str(birthday), ss[1], "false"])
random.shuffle(li)
ans = li[:671]

for i in range(5):
    v = random.randint(0, 670)
    ans[v][-1] = "true"
print(ans)
print(len(ans))

# change this line with your own password and port
con = psycopg2.connect(port=5433,database='movie1', user='postgres',password='19990115')
cur = con.cursor()
for i in range(0, 671):
    cur.execute("insert into users values(%s,%s,%s,%s,%s,%s)", [i+1, ans[i][0], ans[i][1], ans[i][2], ans[i][3], ans[i][4]])
con.commit()
cur.close()
con.close()