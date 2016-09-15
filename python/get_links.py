import requests
from bs4 import BeautifulSoup

with open('urls.txt') as inf:
	urls = (line.strip() for line in inf)
	for url in urls:
		r = requests.get(url)
		# soup = BeautifulSoup(r.content, "lxml")
		soup = BeautifulSoup(r.content, "html.parser")
		links = soup.find_all("a")
		for link in links:
			print link.get("href")
