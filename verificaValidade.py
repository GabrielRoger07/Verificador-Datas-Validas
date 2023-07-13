import re
from datetime import datetime

def valida_data(data):
    try:
        date_obj = datetime.strptime(data, "%d/%m/%Y")
        if date_obj.year < 1900 or date_obj.year > 2023:
            return False
        elif date_obj.day == 31 and date_obj.month in [4, 6, 9, 11]:
            return False
        elif date_obj.day > 28 and date_obj.month == 2 and (date_obj.year % 4 != 0 or (date_obj.year % 100 == 0 and date_obj.year % 400 != 0)):
            return False
        else:
            return True
    except ValueError:
        return False
        
def conta_datas_validas(filename):
    pattern = re.compile(r'\b(\d{2}/\d{2}/\d{4})\b')
    count = 0

    with open(filename, 'r') as file:
        for line in file:
            matches = pattern.findall(line)
            for match in matches:
                if valida_data(match):
                    count += 1

    return count

print(conta_datas_validas("datas.txt"))