#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.metrics import confusion_matrix,ConfusionMatrixDisplay,classification_report,accuracy_score, precision_score, recall_score, f1_score
from sklearn.preprocessing import LabelEncoder


# In[21]:


data =  pd.read_csv('Iris.csv')
data.head(5)


# In[22]:


data.describe(include = 'all')


# In[23]:


data.info()


# In[24]:


print(data.shape)
data['Species'].unique()


# In[ ]:





# In[25]:


data.isnull().sum()


# In[1]:


x = data.iloc[:,1:5]
y = data.iloc[:,5:]


# In[27]:


encode = LabelEncoder()


# In[28]:


y = encode.fit_transform(y)


# In[29]:


x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 0.3,random_state = 0)


# In[30]:


naive_bayes = GaussianNB()
naive_bayes.fit(x_train,y_train)
pred = naive_bayes.predict(x_test)


# In[31]:


pred


# In[32]:


y_test


# In[33]:


matrix =  confusion_matrix(y_test,pred,labels = naive_bayes.classes_)
print(matrix)

tp, fn, fp, tn = confusion_matrix(y_test,pred,labels=[1,0]).reshape(-1)


# In[34]:


conf_matrix = ConfusionMatrixDisplay(confusion_matrix=matrix,display_labels=naive_bayes.classes_)
conf_matrix.plot(cmap=plt.cm.YlGn)
plt.show()


# In[35]:


print(classification_report(y_test,pred))


# In[36]:


print('\nAccuracy: {:.2f}'.format(accuracy_score(y_test,pred)))
print('Error Rate: ',(fp+fn)/(tp+tn+fn+fp))
print('Sensitivity (Recall or True positive rate) :',tp/(tp+fn))
print('Specificity (True negative rate) :',tn/(fp+tn))
print('Precision (Positive predictive value) :',tp/(tp+fp))
print('False Positive Rate :',fp/(tn+fp))

