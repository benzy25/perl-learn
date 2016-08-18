import requests
from bs4 import BeautifulSoup

with open('urls.txt') as inf:
	urls = (line.strip() for line in inf)
	for url in urls:
		r = requests.get(url)
		soup = BeautifulSoup(r.content, "lxml")
		print soup.find_all("h1", {"class": "entry-title"})[0].text
                try:
                    print soup.find_all("img", {"class": "alignleft"})[0].get("src")
                except:
                    pass
                try:
                    print soup.find_all("h3")[0].text
                except:
                    pass
                try:
                    print soup.find_all("p")[0].text
                except:
                    pass
                print "\n"
