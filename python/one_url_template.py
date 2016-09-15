import requests
from bs4 import BeautifulSoup

url = "http://www.traillink.com/traillist.aspx?zipcode=48009&distance=50&length=0|99999"
r = requests.get(url)

soup = BeautifulSoup(r.content, "lxml")

g_data = soup.find_all("div", {"class": "item"})

for item in g_data:
	print item.contents[0].find_all("p", {"class": "name"})[0].text
	print item.contents[0].find_all("img", {"class": "wp-post-image"})[0].get("src")
	print item.contents[0].find_all("td", {"class": "col2"})[0].text
