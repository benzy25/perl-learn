#!/usr/bin/python
# -*- coding: utf-8 -*-

from bs4 import BeautifulSoup #required to parse html
import requests #required to make request

#read file
with open('urls.csv','r') as f:
    csv_raw_cont=f.read()

#split by line
split_csv=csv_raw_cont.split('\n')

#remove empty line
split_csv.remove('')

#specify separator
separator=";"

#iterate over each line
for each in split_csv:

    #specify the row index
    url_row_index=0 #in our csv example file the url is the first row so we set 0

    #get the url
    url=each.split(separator)[url_row_index] 

    #fetch content from server
    html=requests.get(url).content

    #soup fetched content
    soup=BeautifulSoup(html, "lxml")

    #show title from soup
    # print soup.title.string
    g_data = soup.find_all("div", {"id": "ItemPage"})
    for item in g_data:
        try:
            number=item("table", {"class": "item-info"})[0].tr.text.replace('Item Number:\n', '')
            number=number.replace('\n','')
            # image="https://www.laerdal.com"+item("a", {"rel": "SlideShow"})[0].get("href")
            print number+"|"
        except:
            pass
        # try:
        #     print item("div", {"class": "lightborder"})[0].h3
        # except:
        #     pass
        # try:
        #     print item("div", {"class": "lightborder"})[0].ul.replace('\n', '')
        # except:
        #     pass
        try:
            print item("div", {"class": "mainText"})[0].ul
        except:
            pass
        print '\n---------------------------------------------------------------------'