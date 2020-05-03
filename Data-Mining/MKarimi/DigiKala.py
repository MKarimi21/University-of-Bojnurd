import requests
from bs4 import BeautifulSoup
felan = input('chi mikhay ?')
req = requests.get('https://www.digikala.com/search/?q={}'.format(felan))
soup = BeautifulSoup(req.text , "html.parser")

title = soup.find_all('div' , attrs={'class':'c-product-box__title'})
cost = soup.find_all('div', attrs={'class':'c-price__value-wrapper'})
len_page = int(len(title))

with open("File/Resul_di.txt", "w") as res:
    for i in range(0, len_page - 1 ):
        res.write("Title: {} -" .format(title[i].text))
        res.write("- Cost: {}".format(cost[i].text))

