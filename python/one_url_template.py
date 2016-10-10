import requests
from bs4 import BeautifulSoup

url = "https://www.inprocorp.com/colorsandfabrics/clickeze-privacy-systems/Bronze"
r = requests.get(url)

soup = BeautifulSoup(r.content, "lxml")

g_data = soup.find_all("li", {"class": "colorItem"})

for item in g_data:
        print item("img", {"class": "colorImage"})[0].get("src") +' |||'
        print item("h3")[0].text.replace(' ', '' , 1 ) +' ||'
        print item("p")[0].text.replace(' ', '' , 1 ) +' |'
        print '\n'
