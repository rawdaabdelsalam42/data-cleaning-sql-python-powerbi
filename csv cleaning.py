import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv(r'D:\DATA ENGINEERING\ecommerce_sales.csv')
print("Data loaded:")
print(df.head())
print(df.shape)
print(df.info())

df['Age'] = df['Age'].fillna(df['Age'].median())
df['Gender'] = df['Gender'].fillna(df['Gender'].mode()[0])
df['Category'] = df['Category'].fillna(df['Category'].mode()[0])

print("Null values after cleaning:")
print(df.isnull().sum())
print("Duplicates:", df.duplicated().sum())

conn_str = (
    "mssql+pyodbc://@DESKTOP-89HBF4H/cleandata?"
    "driver=ODBC+Driver+17+for+SQL+Server&Trusted_Connection=yes"
)
engine = create_engine(conn_str)

try:
    print("Connection successful!")
    df.to_sql('finaldata', engine, schema='dbo', if_exists='replace', index=False)
    print("Table 'finaldata' created and data loaded!")

    query = "SELECT TOP 5 * FROM dbo.finaldata"
    df_sql = pd.read_sql(query, engine)
    print("Data from SQL:")
    print(df_sql.head())

except Exception as e:
    print(f"Error: {e}")

finally:
    engine.dispose()
