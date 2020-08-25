import os
import sys
import numpy as np  
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

# define the list of countries we are interested in for these visualizations
countries = ['United States', 'United Kingdom', 'China', 'India', 'France', 'Ghana', 'Guatemala', 'Syria']

# open the .csv file
df = pd.read_csv('./data/gapminder-1.csv')
print(df.info())
print(df.shape)

# eliminate null values
df = df.dropna('index', 'any')
print(df.info())
print(df.shape)

# extract just the United States using the dataframe loc - not needed here, just an example
us_df = df.loc[ df['country']=='United States' ]
print(us_df)

# extract the countries we are interested in 
subset_df = df.loc[ df['country'].isin(countries) ]
print(subset_df.info())
print(subset_df.shape)

# create a lineplot of the countries of interest life-expectancy from 1960 to 2017
fig = plt.figure(figsize=(8,6))

# set the background grid style - seaborn has a range of styles - this one removes the grid and just sets tick marks
sns.set(style='ticks')

# use a lineplot - returns matplotlib axes object with plot drawn into it
ax = sns.lineplot(x='year', y='life-expectancy', hue='country', data=subset_df)

# set title,  legend, and axes labels
ax.set_title('Life Expectancy (8 Countries)')

# save the results
plt.savefig('./results/exercise-0.png', dpi=100)
plt.show()

# create a scatterplot of all the data, color by region 
fig = plt.figure(figsize=(8,6))

# set the background grid style - seaborn has a range of styles - this one removes the grid and just sets tick marks
sns.set(style='ticks')

# use a lineplot - returns matplotlib axes object with plot drawn into it
ax = sns.scatterplot(x='fertility-rate', y='life-expectancy', hue='region', size='population', data=df, palette='colorblind')

# set title,  legend, and axes labels
ax.set_title('Life Expectancy vs. Fertility Rate')

# save the results
plt.savefig('./results/exercise-1.png', dpi=100)
plt.show()