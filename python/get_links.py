import requests
from bs4 import BeautifulSoup

with open('urls.txt') as inf:
	urls = (line.strip() for line in inf)
	for url in urls:
		r = requests.get(url)
		soup = BeautifulSoup(r.content, "lxml")
		links = soup.find_all("a")
		for link in links:
			print link.get("href")