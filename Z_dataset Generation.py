#!/usr/bin/env python
# coding: utf-8

# In[84]:


import pandas as pd
import numpy as np
#from pandas import factorize
from random import choices


# In[85]:


ds = pd.read_csv('Zinj.csv')


# In[86]:


ds


# In[87]:


lonG = ds[['longitude']]
latI = ds[['latitude']]
print(lonG)


# In[88]:


lonG_max = lonG.max()
lonG_min = lonG.min()
latI_max = latI.max()
latI_min = latI.min()
#print(lonG_max)
#print(lonG_max - lonG_min)


# In[89]:


new_lonG = np.linspace(lonG_min, lonG_max, 3371, endpoint = True)
new_latI = np.linspace(latI_min, latI_max, 3371, endpoint = True)
new_lonG = new_lonG.tolist()
new_latI = new_latI.tolist()
#print(new_lonG)


# In[90]:


btypes = ds.iloc[:,3]


# In[91]:


btypes = btypes.factorize()


# In[92]:


counts = ds['buildingType'].value_counts()


# In[93]:


print(counts)


# In[94]:


print(btypes)


# In[95]:


btypes_l = ['single_house', 'garage', 'commercial_building', 'light_building',
       'collective_house', 'school']
tot_sum = sum(counts)


# In[96]:


counts[:] = [x/tot_sum for x in counts]
print(counts)


# In[97]:


new_bT = choices(btypes_l, counts, k=3371)


# In[98]:


print(new_bT)


# In[99]:


trash, newBtypes = pd.factorize(new_bT)


# In[100]:


print(newBtypes)


# In[101]:


ds_new = pd.DataFrame({'longitude': new_lonG, 'latitude' : new_latI, 'buildingType': new_bT})


# In[102]:


ds_new.head()


# In[103]:


print(pd.factorize(ds_new['buildingType']))


# In[104]:


ds_new.to_csv('Z_DataSet.csv')


# In[ ]:




