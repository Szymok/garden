---
title: Validate like a pro - Pydantic
Data: 2024-01-05
type: event
---
# Abstrakt
Pydantic to biblioteka do parsowania i walidacji danych spopularyzowana min. przez Fast API. Bogate możliwości konfiguracji i definicji typów pozwalają na skuteczne zastosowanie tej biblioteki nie tylko przy tworzeniu API, ale wszędzie tam gdzie jesteśmy zmuszeni walidować dane dostarczane z zewnątrz. W prezentacji przybliżę możliwości które oferuje Pydantic 2+ i pokażę bardziej zaawansowane możliwości pakietu.
# Opinia

# Notes
### Czym jest Pydantic
Pydantic is the most widely used data validation library for Python.
Fast and extensible, Pydantic plays nicely with your
linters/IDE/brain. Define how data should be in pure, canonical
Python 3.7+; validate it with Pydantic.
### Po co? Kiedy?
- Aby zachować spój ność danych
- Aby mieć pewność że operuj emy faktycznie na typach na których chcemy
- Aby było bezpieczniej
- Aby przyj emniej się pracowało
### BaseModel, model—dump, constrain'y pól
![[images/Pasted image 20240105122325.png]]
![[images/Pasted image 20240105122802.png]]
#### Model dumping
![[images/Pasted image 20240105122924.png]]
![[images/Pasted image 20240105144339.png]]

### error handling i przetwarzanie error message'y
![[images/Pasted image 20240105122506.png]]
![[images/Pasted image 20240105122654.png]]
modele złożone
### RootMode1
![[images/Pasted image 20240105144628.png]]
### custom validators
![[images/Pasted image 20240105144942.png]]
generics
TypeAdapter
custom types