#!/usr/bin/env python
# coding: utf-8

# In[7]:


# 1) Подключаемся к БД.
import psycopg2 # драйвер для postgresql
import getpass  # прячем параль, чтобы не писать его в параметрах

conn=psycopg2.connect(user='postgres',
                      database='HW',
                      host='localhost',
                      port='5432',
                      password=getpass.getpass('Insert password: ')
                        )
# Insert password: ········
# Данный код для подключения с БД.

# 2) Запрашиваем из Python необходимую информацию из таблиц bond_description и quotes
query = """ SELECT *
            FROM (SELECT MAX("CPN") AS "CPN", "ISIN", max("BUYBACKDATE") AS "BUYBACKDATE",
                  max("BUYBACKPRICE") AS "BUYBACKPRICE"
                  FROM public.quotes_task
                  GROUP BY "ISIN") AS cpn
            INNER JOIN(SELECT "ISINCode", "FaceValue", "HaveOffer", "AmortisedMty", 
                       "CouponPerYear", "NumCoupons", "EndMtyDate", "CouponType", "IssuerName"
                       FROM public.bond_description_task
                       WHERE "Status"!='Погашен') AS bonds
            ON cpn."ISIN" = bonds."ISINCode" """
          
          


# In[35]:


query = """ SELECT *
            FROM (SELECT MAX("CPN") AS "CPN", "ISIN", max("BUYBACKDATE") AS "BUYBACKDATE",
                  max("BUYBACKPRICE") AS "BUYBACKPRICE"
                  FROM public.quotes_task
                  GROUP BY "ISIN") AS cpn
            INNER JOIN(SELECT "ISINCode", "FaceValue", "HaveOffer", "AmortisedMty", 
                       "CouponPerYear", "NumCoupons", "EndMtyDate", "CouponType", "IssuerName"
                       FROM public.bond_description_task
                       WHERE "Status"!='Погашен') AS bonds
            ON cpn."ISIN" = bonds."ISINCode" """
          

# 3) Возвращаем матрицу платежей.
import pandas as pd

data = pd.read_sql_query(query, conn)
data = pd.DataFrame(data)
# data = data.drop(['ISINCode'], axis=1)
data
# data.head(10)


# In[32]:


issuer = 'Воронежская Обл Прав'

data2 = data[data['IssuerName'] == issuer]
data2 = data2[['ISIN','EndMtyDate', 'CouponType', 'CPN', 'AmortisedMty']]
data2 = data2.sort_values(by="EndMtyDate", ascending=True)
data2


# In[33]:


import matplotlib.pyplot as plt

x_const = data2[data2['CouponType'] == 'Постоянный']['EndMtyDate']
y_const = data2[data2['CouponType'] == 'Постоянный']['CPN']

x_fixed = data2[data2['CouponType'] == 'Фиксированный']['EndMtyDate']
y_fixed = data2[data2['CouponType'] == 'Фиксированный']['CPN']

plt.bar(x_const, y_const, width = 10, label = 'Постоянный купон')
plt.bar(x_fixed, y_fixed, width = 10, label = 'Фиксированный купон')
plt.title('Купонные выплаты по облигациям ' + issuer)
plt.legend()

