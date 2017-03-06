import requests
from bs4 import BeautifulSoup

zpid = "18429834"
url = "http://www.zillow.com/homes/" + zpid + "_zpid/"

r = requests.get(url)

soup = BeautifulSoup(r.content, "lxml")

g_data = soup.find_all("div", {"class": "home-summary-row"})

for item in g_data:
        #print item("img", {"class": "colorImage"})[0].get("src") +' |||'
        print item("span")[0].text
        #print item("p")[0].text.replace(' ', '' , 1 ) +' |'
        print '\n'
