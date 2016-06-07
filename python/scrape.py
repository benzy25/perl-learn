import requests
from BeautifulSoup import BeautifulSoup

for i in range(170):
    url = "http://marquismedical.net/scanners-and-parts/find-your-part/part-results/page/{}/?p_type=parts".format(i)
    response = requests.get(url)
    html = response.content
    soup = BeautifulSoup(html)
    print soup.prettify()
