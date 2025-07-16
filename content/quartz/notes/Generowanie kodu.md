---

title: Generowanie kodu  
created: 2025-07-16  
status:  
category: LLM  
difficulty: podstawowy  
language: pl  
tags:

- kod
- generowanie
- LLM
- Python
- SQL  
aliases:
- code generation

---

# 🎯 Definicja

**Generowanie kodu** przez duże modele językowe (LLM), takie jak ChatGPT, polega na tworzeniu fragmentów kodu programistycznego na podstawie instrukcji w języku naturalnym. Modele mogą tworzyć funkcje, zapytania, klasy, schematy baz danych, debugować, uzupełniać oraz wyjaśniać kod w różnych językach programowania.

# 🔑 Kluczowe punkty

- LLM mogą generować kod z instrukcji tekstowych albo komentarzy w kodzie.
- Najlepsze rezultaty osiąga się przy dobrej inżynierii promptów (np. komunikaty systemowe).
- Możliwe są różne zadania: kodowanie, wyjaśnianie, debugowanie, edytowanie.
- Modele dobrze radzą sobie z Pythonem, SQL, JavaScriptem i innymi głównymi językami programowania.
- W generowanym kodzie mogą pojawiać się drobne błędy – kod powinien być zawsze testowany.

# 📚 Szczegółowe wyjaśnienie

## Komunikaty systemowe

Przykładowy komunikat systemowy w OpenAI Playground:

```
You are a helpful code assistant that can teach a junior developer how to code. Your language of choice is Python. Don't explain the code, just generate the code block itself.
```

## Scenariusze użycia

### 1. Generowanie prostego kodu

Prompt:

```
Write code that asks the user for their name and say "Hello"
```

Wynik:

```python
name = input("What is your name? ")
print(f"Hello, {name}")
```

### 2. Z komentarzy do kodu

Prompt:

```
"""
1. Create a list of movies
2. Create a list of ratings
3. Combine them to a JSON object and print
"""
```

Wynik (z brakującym `import json`!):

```python
import json

movies = [...]
ratings = [...]
# kod tworzący słownik, zapis do JSON itd.
```

### 3. Uzupełnianie funkcji

Prompt (fragment funkcji):

```
# function to multiply two numbers and add 75 to it
def multiply(
```

Wynik:

```python
a, b):
    result = a * b
    result += 75
    return result
```

### 4. Zapytania SQL

Prompt:

```
Table departments, columns = [DepartmentId, DepartmentName]
Table students, columns = [DepartmentId, StudentId, StudentName]
Create a MySQL query for all students in the Computer Science department
```

Wynik:

```sql
SELECT students.StudentId, students.StudentName
FROM students
INNER JOIN departments
ON students.DepartmentId = departments.DepartmentId
WHERE departments.DepartmentName = 'Computer Science';
```

### 5. Generowanie schematu bazy danych

Prompt:

```
Create a valid database schema with the above tables and columns
```

Wynik:

```sql
CREATE TABLE ...
```

### 6. Fikcyjne dane INSERT

Prompt:

```
...generate INSERT statements with 4 rows per table
```

Wynik:

```sql
INSERT INTO departments ...
INSERT INTO students ...
```

### 7. Wyjaśnianie kodu

Mimo ograniczeń systemowego promptu (w tym przypadku ograniczonego do Pythona), model potrafi udzielić wyjaśnienia:

Prompt:

```
Explain the SQL statement
```

Model:

> This SQL selects students from the Computer Science department...

# 💡 Przykład zastosowania

**Uczeń programowania** korzysta z ChatGPT do nauki poprzez eksperymenty:

- wpisuje komentarze zamiast kodu,
- generuje zapytania SQL dla swojej bazy danych MySQL,
- tworzy szkielet projektu w Pythonie,
- zleca modelowi wyjaśnienie, gdzie jest błąd w kodzie.

# 📌 Źródła

- [https://platform.openai.com/docs/guides/code](https://platform.openai.com/docs/guides/code)
- [https://www.codecademy.com/resources/blog/chatgpt-for-programming/](https://www.codecademy.com/resources/blog/chatgpt-for-programming/)
- [https://www.freecodecamp.org/news/how-to-use-chatgpt-in-code/](https://www.freecodecamp.org/news/how-to-use-chatgpt-in-code/)

# 👽 Brudnopis

- Modele radzą sobie coraz lepiej z kodem – GPT-4, Claude, Gemini, Copilot
- Generowanie z komentarzy (prompt = comment → code) działa jak "AI pair programmer"
- SQL, Python – dobre wsparcie, ale testować zawsze!
- Braki: importy, typy danych, lub nieaktualne składnie
- Debugowanie, edytowanie – ChatGPT lepszy z kontekstem (np. „Why does this function fail?”)
- GitHub Copilot stosuje podobne podejście (token prediction w edytorze)