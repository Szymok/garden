---
title: "How to get Valid SSL on your Pi home lab"
source: "https://pisource.org/how-to-get-valid-ssl-on-your-pi-home-lab/?ref=selfh.st"
category:
author:
  - "[[Ric]]"
published: 2025-01-16
created: 2025-02-20
description: "Having a home lab is great but do you want to get rid of those self signed ssl certificate errors? Well here’s how to do it by running traefik as a reverse proxy on your Raspberry Pi."
tags:
---
[Server](https://pisource.org/tag/server/)

Having a home lab is great but do you want to get rid of those self signed ssl certificate errors? Well here’s how to do it by running traefik as a reverse proxy on your Raspberry Pi.

[![Ric](https://www.gravatar.com/avatar/5f9915ba18e51db3610baeb467df0ca5?s=250&r=x&d=mp)](https://pisource.org/author/ric/)

![How to get Valid SSL on your Pi home lab](https://images.unsplash.com/photo-1633265486064-086b219458ec?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDd8fEVuY3J5cHRpb258ZW58MHx8fHwxNzM2ODk1MjQ0fDA&ixlib=rb-4.0.3&q=80&w=1200)

Photo by [Towfiqu barbhuiya](https://unsplash.com/@towfiqu999999?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit) / [Unsplash](https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit)

A home lab is a great place to learn, but do you get those pesky SSL errors or have to trust a self signed cert when you stand up a new service? If you do, I have good news for you, because by using a registered domain you can actually have valid SSL certs on your **internal** [traefik](https://traefik.io/traefik/?ref=pisource.org) proxy and thus all your sites without the need to open up any ports on your firewall. [Traefik](https://traefik.io/traefik/?ref=pisource.org) is a reverse proxy that’s super lightweight and written in Go. You’ll be able to use it to run multiple containers/sites and services on your Pi and have them all work on the standard HTTP/HTTPs ports of 80 and 443, and it makes for a very neat setup and gets rid of those warnings. The SSL certs will be issued by [LetsEncrypt](https://letsencrypt.org/?ref=pisource.org) via the DNS challenge method.

## Requirements

- [Raspberry Pi 5 setup as a server](https://pisource.org/using-your-pi-as-a-server/)
- [Docker installed on your Pi 5](https://pisource.org/installing-docker-on-the-pi5/)
- A valid Domain name (you can’t use .local)
- This tutorial uses [CloudFlare](https://www.cloudflare.com/en-gb/?ref=pisource.org) DNS for the registered domain so we can use an API key to validate ourselves

## Setting up traefik

To access your site and ensure you have a valid SSL certificate we are going to run traefik as a reverse proxy, this means we can also force all traffic to be HTTPS which is great for security, so even if someone tries the non-encrypted version of your site they’ll get automatically redirected. Traefik will automatically take care of getting a cert from [LetsEncrypt](https://letsencrypt.org/?ref=pisource.org) and rotating it when it is due to expire. All you have to do is provide an email address for registration and an API key to validate that you own the DNS.

Let’s start by creating some directories that Traefik will use:

Ensure your in the */opt/containers/traefik* directory and create a new file call *compose.yml*

now add the following to the new file:

💡

Tip

To enter ****insert mode**** in vim press i

Save and exit the file.

💡

Tip

To get out of vim just press escape then type `:wq!`

You're also going to need to set up some environment variables for this to work so once you've saved the file above you'll need to create a new file called *.env*

Populate it with these details, and remember to update the domain (I used traefik.internal.pisource.org) and your password for the web interface:

You'll need to generate a password for traefik basic\_auth to be able to login to the dashboard API. You can do that with the following command (just remember to change the user and password values):

Paste the output ***user:password*** keypair into your ***.env*** file and save and exit.

There are a few other files (five, actually) we now need to prep. Four are going to be empty files that the container will need and one will be the initial config startup for traefik.

Now for the important file to pull all this together and get traefik working.

Enter the following information and update your email address:

Now traefik is ready to run and accept HTTP and HTTPS connections. To get started is pretty simple with docker compose, run the following command:

#### Test Traefik

Now first of all make sure you create a DNS entry for whatever hostname you choose (remember I used traefik.internal.pisource.org) and make it an A record with the value of the IP address of your Pi Server.

To test traefik you can browse direction to [https://traefik.example.com](https://traefik.example.com/?ref=pisource.org) where you will be prompted to enter your basic\_auth details in your browser (That’s the user and password you generated earlier)

![Password prompt from Traefik](https://pisource.org/content/images/2025/01/IMG_0074.jpeg)

Once logged in you will see the traefik dashboard like the one below.

![The traefik dashboard](https://pisource.org/content/images/2025/01/IMG_0075.jpeg)

You’ll also notice that the SSL cert is valid 😄

![Valid SSL certificate](https://pisource.org/content/images/2025/01/IMG_0076.jpeg)

## Protecting your sites

Let’s now run a test service and see traefik dynamically assign a SSL cert on the fly. We are going to use a compose file for the “whoami” service and by adding some labels to the compose file. Let's create a new compose file.

And add the following content:

```
networks:
  traefik_proxy:
    external: true
  whoami:
    internal: true

services:

  whoami:
    image: traefik/whoami:latest

    labels:
      - traefik.enable=true
      # Use the traefik-public network (declared below)
      - traefik.docker.network=traefik_proxy
      - traefik.http.routers.whoami.entrypoints=web
      - traefik.http.routers.whoami.rule=Host(\`whoami.internal.pisource.org\`)
      - traefik.http.middlewares.whoami-https-redirect.redirectscheme.scheme=https
      - traefik.http.routers.whoami.middlewares=whoami-https-redirect
      - traefik.http.routers.whoami-secure.entrypoints=websecure
      - traefik.http.routers.whoami-secure.rule=Host(\`whoami.internal.pisource.org\`)
      - traefik.http.routers.whoami-secure.tls=true
      - traefik.http.routers.whoami-secure.service=whoami-secure
      - traefik.http.routers.whoami-secure.tls.certresolver=myresolver
      # Define the port inside of the Docker service to use
      - traefik.http.services.whoami-secure.loadbalancer.server.port=4000
    networks:
      - traefik_proxy
      - whoami
    ports:
      - 4000
    environment:
      - WHOAMI_PORT_NUMBER=4000

    restart: unless-stopped
```

Now run:

Now set up a DNS record for ***whoami.YOUR\_DNS*** and use a ***CNAME*** to point it at the DNS you set up for traefik. Once this is set up you can browse to https://whoami.<YOUR\_DNS> you’ll get something like the following screenshot

![The output from the whoami container](https://pisource.org/content/images/2025/01/IMG_0077.jpeg)

So that's it, the end of invalid SSL certs for your home lab. By using those labels and networks in the example ***compose.yml*** above you should be able to add any site you want to your proxy. Just take note to change the network name, the DNS entries, and load *balancer.service.port (*which should match the port your container service runs on). Then, when you run ***docker compose up -d*** your new service will register itself with traefik. Go have fun!