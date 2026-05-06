---
title: Deploy a Lambda Function within the Console
created: 2026-02-10
status: 🌱 draft
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# ðŸŽ¯ Definicja
**WdraÅ¼anie funkcji Lambda przez KonsolÄ™ AWS** to najprostszy sposÃ³b na uruchomienie kodu w modelu serverless bez koniecznoÅ›ci konfigurowania lokalnych narzÄ™dzi CLI czy potokÃ³w CI/CD. Pozwala na szybkie przetestowanie logiki w chmurze.

# ðŸ”‘ Kluczowe punkty
- **Brak serwerÃ³w:** Nie musisz martwiÄ‡ siÄ™ o aprowizacjÄ™ czy skalowanie â€“ AWS zajmuje siÄ™ tym automatycznie.
- **Konfiguracja roli (IAM):** Lambda potrzebuje uprawnieÅ„ do logowania (CloudWatch Logs) oraz dostÄ™pu do innych zasobÃ³w.
- **WybÃ³r Å›rodowiska:** MoÅ¼esz zaczÄ…Ä‡ od zera ("Author from scratch"), uÅ¼yÄ‡ gotowego szablonu ("Blueprint") lub obrazu kontenera.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie
Proces wdraÅ¼ania w konsoli obejmuje kilka krokÃ³w:
1.  **WybÃ³r Dashboardu:** PrzejÅ›cie do usÅ‚ugi Lambda i wybranie "Create function".
2.  **Podstawowe informacje:** Nadanie nazwy funkcji oraz wybÃ³r runtime'u (np. Python 3.13) i architektury (np. x86_64).
3.  **Uprawnienia:** AWS domyÅ›lnie tworzy rolÄ™ wykonawczÄ…, ktÃ³ra umoÅ¼liwia przesyÅ‚anie logÃ³w do CloudWatch, co jest kluczowe dla debugowania.
4.  **Opcje dodatkowe:** MoÅ¼liwoÅ›Ä‡ wÅ‚Ä…czenia adresu URL funkcji (Function URL), tagowania czy podpiÄ™cia do VPC w celu dostÄ™pu do prywatnych zasobÃ³w.

# ðŸ’¡ PrzykÅ‚ad zastosowania
- **Prosty "Hello World":** Utworzenie funkcji w Pythonie, ktÃ³ra zwraca powitanie, aby sprawdziÄ‡, czy system dziaÅ‚a.
- **Szybkie prototypowanie:** Napisanie maÅ‚ego skryptu w edytorze wbudowanym w konsolÄ™, aby przetworzyÄ‡ zdarzenie z S3 lub API Gateway bez budowania caÅ‚ego Å›rodowiska deweloperskiego.
- **Testowanie uprawnieÅ„:** Szybka weryfikacja, czy dana rola IAM pozwala na wykonanie konkretnej operacji wewnÄ…trz funkcji.

## ðŸ“Œ Å¹rÃ³dÅ‚a

## ðŸ‘½ Brudnopis

To help us understand how AWS Lambda works in practice, let's work through how to deploy a function right from the AWS console. Now the great thing about Lambda is you don't need to worry about servers, provisioning, or scaling. You just write your code and tell AWS when to run it. So let's head to the console to start. All right, I'm in my console here. So as you see, we have Recently visited AWS Lambda, but let's try looking it up from the Search box. And there we go. So we're going to click on Lambda here. So the first thing you see, we have a Lambda Dashboard and we have Applications, Functions, then we have Additional resources like Code signing configurations, Event source mappings, Layers, Replicas. And then for Related AWS resources, we have Step Functions state machines. But we're going to move ahead and we're just going to Create function here. Now we have Author from scratch, Use a blueprint, or Container image. We're going to Author from scratch, and we're just going to start with a simple Hello, your name example. So we're going to name a function, and we're going to call it my_Name_Function here. And we're going to use Python 3.13, and that is what we're going to choose to use for our Lambda function. So, we can choose the instruction set architecture you want for your function code, and we're going to do x86_64. Now we have permissions by default, Lambda would create an execution role to upload logs to CloudWatch Logs, so we can use CloudWatch to see any errors or why code or function isn't running properly. Here we have Changed default execution role, which we can create a new role or use an existing role, but we're going to create a new role with basic Lambda permissions. And here we have additional configurations from enabling code signing, encryption, enabling function URL, enabling tags, and enabling VPC, which it connects our function to a VPC to access private resources. But we're going to click on Create function here. All right, so we have our Function overview. We have my function and we have the layers, and we can add a trigger and add destination, but we also have six tabs here, which is Code, where we will write our Lambda function code. We have Tests, where we will create a test event or pass any test event code that we need for our function to rely on. We have Monitor, and this is for our CloudWatch metrics, which we see it can monitor our applications, the duration of our function, and error count and success rate. We have throttles, total concurrent executions, and more. Then we have Configurations, and this is for our triggers, permissions, destination, function URL, tags, etc. Then we have Aliases. An alias is a name pointer that you can create to point to a version that you may have of your Lambda function. A Lambda function can have multiple versions, for example, version 1, version 2, version 3. And here the last tab you have Versions. So we get back to our code here, we're going to change this code, and we're going to import our own code. So this Lambda function just takes a name from the input and creates a greeting like Hello, Broadus or Hello, World if no name is given, and then it sends back with a success code. So what we're going to do here is we're going to deploy our code, which saves it. Okay, so we successfully updated to the function. And now what we're going to do is go over to Test. We're going to call this My_event_test. And we're going to head down and we're going to enter JSON that passes my name as a variable so our function can pick it up and return Hello, Broadus. And we're going to click on Save here. Now, what we're going to do is test our function. So you see how quick that was. If we head to Details here, you see that our statusCode is 200 and our body is Hello, Broadus. So my function returned Hello, Broadus and the statusCode of 200, which is exactly what we wanted, but here's a summary of the code. We have our Init duration, we have our Billed duration, the Max memory used, and Execution time. So with Lambda, we're only charge for what we use, which is pretty much a billed duration of 3 ms. Now I just wanted to show you how to simply create a Lambda function and understand how it works so the next time you want to create functions for your application, you can understand how you could pass variables and you can understand how you could just simply write code, and AWS simply takes care of everything else.