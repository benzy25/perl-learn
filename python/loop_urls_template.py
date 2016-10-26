import requests
from bs4 import BeautifulSoup

with open('urls.txt') as inf:
	urls = (line.strip() for line in inf)
	for url in urls:
		r = requests.get(url)
		soup = BeautifulSoup(r.content, "lxml")
                print soup.find_all("h1", {"class": "trailName"})[0].text.replace("\n", "") +"|"
		#print soup.find_all("h3", {"class": "loremTitle"})[0].text
                try:
                    print soup.find_all("table", {"class": "details"}).str.replace('\n', ' ') +"|"
                except:
                    pass
                try:
                    print soup.find_all("div", {"id": "divDesc"})[0].text +"|"
                except:
                    pass
                try:
                    print soup.find_all("div", {"id": "divPark"})[0].text +"|"
                except:
                    pass
                try:
                    print soup.find_all("a", {"class": "mainTrailImage"})[0].get('href') +"|"
                except:
                    pass
                try:
                    print soup.find_all("a", {"class": "btnviewmap"})[0].get('href') +"|"
                except:
                    pass
                try:
                    print soup.find_all("a", {"id": "ContentPlaceHolderDefault_rootMainContent_mainContent_traildetailmain_3_btnViewAllReviews"})[0].get('href') +"|"
                except:
                    pass
                try:
                    print soup.find_all("div", {"id": "hotelVisible"})[0].text.replace("                        ", "") +"|"
                except:
                    pass
                try:
                    print soup.find_all("table", {"class": "details"})[0].text +"|"
                except:
                    pass
                try:
                    print soup.find_all("div", {"id": "trailVisible"})[0].text.replace("                               ", "") +"|"
                except:
                    pass
                print "\n"
