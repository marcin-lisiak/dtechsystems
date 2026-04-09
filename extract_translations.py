import os
import csv
import re

files = ['index.html', 'soteria.html', 'radar-capture.html', 'chronos.html']
extracted = {}

for f in files:
    if os.path.exists(f):
        with open(f, 'r', encoding='utf-8') as file:
            content = file.read()
            
            # Usuwamy style i skrypty w całości
            content = re.sub(r'<script.*?>.*?</script>', '', content, flags=re.DOTALL)
            content = re.sub(r'<style.*?>.*?</style>', '', content, flags=re.DOTALL)
            content = re.sub(r'<!--.*?-->', '', content, flags=re.DOTALL)
            
            # Wyszukujemy wszystkie teksty znajdujące się pomiędzy tagami HTML
            texts = re.findall(r'>([^<]+)<', content)
            
            clean_texts = []
            for t in texts:
                t_clean = " ".join(t.split())
                # Filtrujemy puste znaki, pojedyncze literki i zwykle liczby
                if len(t_clean) > 1 and not t_clean.isdigit() and t_clean not in ["&nbsp;"]:
                    clean_texts.append(t_clean)
                    
            extracted[f] = list(dict.fromkeys(clean_texts))

with open('tlumaczenia_dtech.csv', 'w', encoding='utf-8-sig', newline='') as f:
    writer = csv.writer(f, delimiter=';')
    writer.writerow(['Plik', 'Oryginał (Język Polski)', 'Tłumaczenie (Język Angielski)'])
    
    for filename, texts in extracted.items():
        for t in texts:
            writer.writerow([filename, t, ''])
            
print("Poprawiony skrypt wygenerowal plik tlumaczenia_dtech.csv")
