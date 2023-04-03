#importing libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


#loading dataset
data=pd.read_csv(r'G:\Unknown\hello\Python projects\Analytics projects with python\rides.csv')
print(data.head())

#check if has null values 
print(data.isnull().sum())
print(data.dropna())

#analyze the relationship between the number of drivers active per hour and 
#the number of riders active per hour: */

demand = data["Riders Active Per Hour"]
supply = data["Drivers Active Per Hour"]
plt.scatter( x = supply, y = demand)
#plt.show()

#calculate elasticity
avg_demand = data['Riders Active Per Hour'].mean()
avg_supply = data['Drivers Active Per Hour'].mean()
pct_change_demand = (max(data['Riders Active Per Hour']) - min(data['Riders Active Per Hour'])) / avg_demand * 100
pct_change_supply = (max(data['Drivers Active Per Hour']) - min(data['Drivers Active Per Hour'])) / avg_supply * 100
elasticity = pct_change_demand / pct_change_supply

print("Elasticity of demand with respect to the number of active drivers per hour: {:.2f}".format(elasticity))

# Calculate the supply ratio for each level of driver activity
data['Supply Ratio'] = data['Rides Completed'] / data['Drivers Active Per Hour']
print(data.head())



