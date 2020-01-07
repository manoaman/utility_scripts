import pandas as pd


xls = 'resources/some.xlsx'
sheets = ['Sheet1', 'Sheet2', 'Sheet3']
columns = ['Name', 'status1', 'status2']


for s in sheets:
    df = pd.read_excel(xls, sheet_name=s)
    df_fil = df.query('Name.str.contains("John", na=False)')
    print(df.query('Name.str.contains("John", na=False)'))

    print('Sheet: {}'.format(s))
    for c in columns:
        print('----------{}----------'.format(c))
        vc = df_fil[c].value_counts()
        print(vc)
        print('----------------------')
    print('\n')
