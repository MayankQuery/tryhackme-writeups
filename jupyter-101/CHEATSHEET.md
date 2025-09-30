# Cheatsheet - Jupyter 101

## Jupyter Basics
- Run cell: `Shift + Enter`
- Insert cell below: `B`
- Insert cell above: `A`
- Delete cell: `D + D`
- Change to Markdown: `M`
- Change to Code: `Y`

---

## Filesystem Commands
- `!ls` → List files
- `!pwd` → Current directory
- `!cat filename` → Display file contents

---

## Pandas
```python
import pandas as pd

df = pd.read_csv("data.csv")   # Load CSV
df.head()                      # First 5 rows
df.info()                      # Summary
df.describe()                  # Stats
df['col']                      # Access column
df[df['col'] > 10]             # Filter
df.groupby('category').mean()  # Group & aggregate
```
## Matplotlib
```python
import matplotlib.pyplot as plt

plt.plot(df['x'], df['y'])
plt.show()

df['col'].hist()                                # Histogram
df['category'].value_counts().plot(kind='bar')  # Bar chart
```
---
