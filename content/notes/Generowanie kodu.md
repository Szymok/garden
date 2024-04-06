---
title: Generowanie kodu
tags: 
aliases:
---
LLM, takie jak ChatGPT, są bardzo skuteczne w generowaniu kodu. W tej sekcji omówimy wiele przykładów wykorzystania ChatGPT do generowania kodu.

We wszystkich poniższych przykładach wykorzystano OpenAI's Playground (Chat Mode) i model gpt-3.5-turbo.

Podobnie jak w przypadku wszystkich modeli czatu OpenAI, można użyć komunikatu systemowego, aby zdefiniować zachowanie i format odpowiedzi. W poniższych przykładach użyjemy następującego komunikatu systemowego:

```
You are a helpful code assistant that can teach a junior developer how to code. Your language of choice is Python. Don't explain the code, just generate the code block itself.
```

## Podstawowe przykłady

Komunikat użytkownika będzie wówczas samym promptem z instrukcją konkretnego kodu, który ma zostać wygenerowany przez model. Poniżej znajduje się migawka pierwszego podstawowego promptu o wygenerowanie kodu. Należy zauważyć, że ostateczny kod został wygenerowany przez Asystenta.

![[images/Pasted image 20230925214359.png]]

Oto prompt, jeśli chcesz spróbować samemu:

```
Write code that asks the user for their name and say "Hello"
```

## Przekształcanie komentarzy w kod

Możesz także użyć możliwości generowania kodu tych LLM, aby wygenerować kod na podstawie samych komentarzy. Spójrzmy na inny przykład, który przekazuje instrukcje jako blok komentarza:

_Prompt:_

```
"""
1. Create a list of movies
2. Create a list of ratings for these movies
3. Combine them to make a json object of 10 movies with their ratings.
"""
```

_Output:_

```python
movies = ["The Shawshank Redemption", "The Godfather", "The Dark Knight", "Schindler's List", "Pulp Fiction", "The Lord of the Rings: The Return of the King", "Forrest Gump", "Star Wars: Episode V - The Empire Strikes Back", "Inception", "The Silence of the Lambs"]
 
ratings = [9.3, 9.2, 9.0, 8.9, 8.9, 8.9, 8.8, 8.7, 8.7, 8.6]
 
movie_ratings = {}
 
for i in range(len(movies)):
    movie_ratings[movies[i]] = ratings[i]
 
json_object = json.dumps(movie_ratings, indent=4)
 
print(json_object)
```

Wygenerowany kod wygląda jak działający kod. Jednak dane wyjściowe nie zawierają ważnej instrukcji importu, tj. import json. Chociaż modele te generują działający kod, należy zwracać szczególną uwagę na takie drobne szczegóły i zawsze testować swój kod.

## Kompletne funkcje lub następna linia

Te LLM zostały również włączone do narzędzi takich jak GitHub Copilot, co czyni je użytecznymi dla programistów. Jedną z przydatnych cech jest zdolność modelu do uzupełniania funkcji.

_Prompt:_

```
# function to multiply two numbers and add 75 to it
 
def multiply(
```

_Output:_

```
a, b):
    result = a * b
    result += 75
    return result
```

## Generowanie zapytań MySQL

Oprócz powyższego podstawowego przykładu generowania kodu, można użyć modelu do wygenerowania użytecznego kodu, który można wykorzystać w innych aspektach programowania, takich jak tworzenie i testowanie zapytań MySQL.

Załóżmy, że masz zestaw danych z pewnymi informacjami, które możesz uwzględnić jako część promptu, a następnie poinstruować go, aby wygenerował określone zapytanie. Na przykład:

```
"""
Table departments, columns = [DepartmentId, DepartmentName]
Table students, columns = [DepartmentId, StudentId, StudentName]
Create a MySQL query for all students in the Computer Science department
"""
```

_Output:_

```
SELECT students.StudentId, students.StudentName
FROM students
INNER JOIN departments
ON students.DepartmentId = departments.DepartmentId
WHERE departments.DepartmentName = 'Computer Science';
```

Model generuje zapytanie! Jednak w tym przykładzie stworzyliśmy bazę danych, więc nie mamy bazy danych do przetestowania wygenerowanego zapytania. Jeśli testujesz ten przykład, przydatne może być utworzenie takiej bazy danych. Na szczęście możesz użyć ChatGPT, aby wygenerować ją również dla Ciebie. Jednym z podejść jest użycie zmodyfikowanej wersji powyższego promptu z nieco innymi instrukcjami generowania schematu bazy danych:

```
Table departments, columns = [DepartmentId, DepartmentName]
Table students, columns = [DepartmentId, StudentId, StudentName]
Create a valid database schema with the above tables and columns
```

Model wygenerował następujący schemat:

```
CREATE TABLE departments (
  DepartmentId INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
);
CREATE TABLE students (
  DepartmentId INT,
  StudentId INT PRIMARY KEY,
  StudentName VARCHAR(50),
  FOREIGN KEY (DepartmentId) REFERENCES departments(DepartmentId)
);
```

Możesz utworzyć tymczasową bazę danych za pomocą czegoś takiego jak sqliteonline.com.

Będziesz także potrzebował fikcyjnych danych, aby sprawdzić, czy pierwotnie wygenerowane zapytanie było prawidłowe. Do tego również użyjmy ChatGPT! prompt może wyglądać następująco:

```
CREATE TABLE departments (
  DepartmentId INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
);
CREATE TABLE students (
  DepartmentId INT,
  StudentId INT PRIMARY KEY,
  StudentName VARCHAR(50),
  FOREIGN KEY (DepartmentId) REFERENCES departments(DepartmentId)
);
Given the database schema above, generate valid insert statements include 4 rows for each table.
```

Dane wyjściowe z instrukcjami wstawiania:

```
INSERT INTO departments (DepartmentId, DepartmentName)
VALUES (1, 'Computer Science'), (2, 'Mathematics'), (3, 'Physics'), (4, 'Biology');
INSERT INTO students (DepartmentId, StudentId, StudentName)
VALUES (1, 101, 'John Doe'), (1, 102, 'Jane Doe'), (2, 201, 'Alice Smith'), (2, 202, 'Bob Johnson');
```

Teraz, gdy masz już bazę danych i fikcyjne dane, możesz przetestować oryginalne zapytanie. W oparciu o fikcyjne dane, wynikiem powinny być dwa wiersze z danymi Jane Doe i John Doe.

## Wyjaśnianie kodu

Jeśli uczysz się programować w określonym języku, przydatne może być poproszenie modelu o wyjaśnienie niektórych fragmentów kodu. Ponownie użyjmy zapytania wygenerowanego powyżej i poprośmy model o jego wyjaśnienie.

Jeśli używasz tego samego komunikatu systemowego co poprzednio, uważaj na sposób, w jaki instruujesz model. Na przykład, jeśli użyjemy poniższego przykładu, model będzie narzekał, że jest to asystent kodu w Pythonie, ale mimo to dostarczy wyjaśnienie. Czasami model odmawia wygenerowania instrukcji, ponieważ został zaprojektowany do podążania za komunikatem systemowym.

_Prompt:_

```
SELECT students.StudentId, students.StudentName
FROM students
INNER JOIN departments
ON students.DepartmentId = departments.DepartmentId
WHERE departments.DepartmentName = 'Computer Science';
Explain the above SQL statement.
```

_Output:_

```
Sorry, as a code assistant in Python, I cannot generate SQL code. However, I can explain the purpose of the SQL statement provided. 
This SQL statement selects the `StudentId` and `StudentName` columns from the `students` table, where the `DepartmentName` column in the `departments` table is equal to 'Computer Science'. To achieve this, the statement performs an inner join on the `DepartmentId` column between the `students` and `departments` tables. 
In simpler terms, it is selecting the names and IDs of students who are enrolled in the Computer Science department.
```

## Edytowanie kodu


## Debugowanie kodu


## Najlepsze praktyki