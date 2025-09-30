# Notes - TryHackMe Jupyter 101

## Task 1 - Preface
- Data Science is broad and used across industries:
  - Content recommendations (Netflix, YouTube)
  - Fraud detection in banking
  - Intrusion detection in cybersecurity
  - Weather forecasting
  - Sales/business metrics
  - Google Maps route planning
- Jupyter Notebooks = interactive Python coding environment.
- Key Libraries:
  - **Pandas** → Data handling, cleaning, analysis.
  - **Matplotlib** → Data visualization.

---

## Task 2 - What is Jupyter?
- Web-based interactive computing environment.
- Allows code execution in **cells**.
- Great for data science, machine learning, and education.

---

## Task 3 - Deploying Instance & Logging In
- TryHackMe provides a hosted environment.
- Open the web UI → Access notebooks → Start coding.

---

## Task 4 - Learning More About Jupyter
- Mix **code**, **text (Markdown)**, **math (LaTeX)**, and **visuals** in one document.
- Reproducibility: Notebooks can be shared with others.

---

## Task 5 - How Jupyter Notebooks Run
- Kernel executes Python code.
- Each cell can run independently.
- State persists between cells until kernel reset.

---

## Task 6 - Interacting With the Filesystem
- Use `!` before shell commands inside cells:
  - `!ls` → list files
  - `!pwd` → print working directory
  - `!cat file.txt` → display contents

---

## Task 7 - Handling Data with Pandas
- Import: `import pandas as pd`
- Read CSV: `df = pd.read_csv("data.csv")`
- Inspect:
  - `df.head()` → first rows
  - `df.info()` → summary
  - `df.describe()` → stats
- Manipulation:
  - `df['column']` → access column
  - `df[df['col'] > value]` → filtering
  - `df.groupby('col').mean()` → aggregation

---

## Task 8 - Visualising Data with Matplotlib
- Import: `import matplotlib.pyplot as plt`
- Basic Plot:
  ```python
  plt.plot(df['x'], df['y'])
  plt.show()
