---
created: 2025-05-13T00:19:57+02:00
reviewed:
url: "https://www.youtube.com/watch?v=n1vOfdz5Nm8&t=1577s"
title: "Traefik 3 and FREE Wildcard Certificates with Docker"
channel: "Techno Tim"
related: "[[Videos]]"
published: 2024-04-30
duration: "2377"
watched:
---
## About

type:: #type/video/youtube/new

![Traefik 3 and FREE Wildcard Certificates with Docker](https://www.youtube.com/watch?v=n1vOfdz5Nm8&t=1577s)

## Description

Save 20% on UptimeRobot today! https://l.technotim.live/uptime-robot-technotim

In today's Traefik tutorial we'll get FREE Wildcard certificates to use in our HomeLab and with all of our internal self-hosted services.  We're going to set up Traefik 3 in Docker and get Let's Encrypt certificates using Cloudflare as our DNS Provider (we'll cover how to set up others too).  Then we'll configure local DNS using PiHole (or any other local DNS) to route to our services that are now protected with secure certificates!

Thanks to UptimeRobot for sponsoring today's video!

Video Notes: https://technotim.live/posts/traefik-3-docker-certificates/

Support me on Patreon: https://www.patreon.com/technotim
Sponsor me on GitHub: https://github.com/sponsors/timothystewart6
Subscribe on Twitch: https://www.twitch.tv/technotim
Become a YouTube member: https://www.youtube.com/channel/UCOk-gHyjcWZNj3Br4oxwh0A/join
Merch Shop 🛍️: https://l.technotim.live/shop
Gear Recommendations: https://l.technotim.live/gear
Get Help in Our Discord Community: https://l.technotim.live/discord
Tinkers channel: https://www.youtube.com/@TechnoTimTinkers

(Affiliate links may be included in this description. I may receive a small commission at no cost to you.)

00:00 - Getting Wildcard Certificates with Traefik
00:54 - Monitoring with UptimeRobot (sponsor)
02:12 - Requirements
03:02 - Diagram for Visual Learners
04:11 - Traefik Docker Compose
06:12 - Docker Secrets Rant
07:30 - Explaining Traefik Compose
10:45 - Docker Container Tasks
14:59 - DNS Resolvers
16:07 - Creating Secrets
16:57 - Cloudflare API Token
19:21 - Docker Network
19:36 - Basic Auth Credentials for Traefik Dashboard
21:50 - Starting the Traefik Container
22:44 - Troubleshooting
25:17 - Traefik Dashboard Local DNS
27:03 - Viewing the Traefik Dashboard
27:57 - Getting Production Certificates from Let's Encrypt
31:08 - Creating a New Workload with Certificates
35:03 - Using Traefik for Workloads Running Outside of Docker
39:11 - Networking Considerations

Thank you for watching!

## Notes

YT=


## Transcript

## Getting Wildcard Certificates with Traefik

0:00

Traefik 3 is here and I thought this would be a good time to revisit one of my most popular tutorials to date.

0:05

And it's using Traefik in Docker to get wildcard certificates for all of your self-hosted services.

0:11

This means no more self-signed certificate errors and no more hosting things on on-ports.

0:16

And we're going to put secure certificates on everything and let you name your services whatever you like.

0:22

So today we're going to set up Traefik for a reverse proxy. We're going to use Let's Encrypt to get free certificates.

0:29

We're going to use Cloudflare to verify our domain to get these certificates. And then we'll use a local DNS system like PiHole to name our services anything we like.

0:38

We're going to take care of everything end to end and I will provide all of the documentation you need. And by the end of this video you'll have wildcard certificates for all of your services.

0:47

And all certificates will auto renew every 90 days. It truly is set it and forget it once you get it set up.

## Monitoring with UptimeRobot (sponsor)

0:54

But speaking of certificates expiring, if you want an easy way to monitor this and just about anything else,

0:59

you can with today's sponsor UptimeRobot. Now I've been using UptimeRobot for a few years now and I wanted to share three things that I really like about them

1:08

and why I use them to monitor my home lab as well as many public websites. First, the user experience is fantastic on their new website as well as in their app,

1:17

which really sets the bar as far as website monitoring apps go. It has a simple and intuitive interface that gives you exactly what you need when you need it.

1:25

Oh, and it even has push notifications to let you know when there's a problem and then again when it has recovered.

1:31

I also send these to my private Discord server, but you can also send them to Teams, Slack and many other integrations.

1:37

The second is that it has lots of options for monitoring. Website monitoring, SSL monitoring, port monitoring and many others.

1:44

Chances are if you have something you want to monitor, there's a way to do it with UptimeRobot. And three, it's the price. They have one of the most generous free tiers out there.

1:53

You get 50 monitors for free, most of the integrations you need, and even status pages to let others know the status of your sites and services.

2:01

On top of that, I've convinced them to give you 20% off any paid plan when using the link in the description.

2:07

So join 2 million other users and start monitoring your services with UptimeRobot today.

## Requirements

2:12

Before we get started, there's a few things you'll need. First and foremost, you'll need a machine running Linux that you have SSH access to.

2:19

Now I'm using Ubuntu Linux, but it can be any version of Linux you want. You want to be sure that Docker is installed.

2:25

And if you need to know how to install Docker, I'll be sure to include it in my documentation. Next, you're going to need a domain that you own.

2:32

This can be any domain, but you'll want to be sure that it's currently registered to you and that you're using Cloudflare for DNS.

2:38

Now you can use other DNS providers with Traefik, but in this tutorial we're going to use Cloudflare.

2:44

I will link other providers in the documentation, but most of what we cover is the same for all of the providers.

2:50

Last, you'll need some sort of internal DNS system. This can be as simple as PyHaul or even a router or firewall, but you'll need a way to resolve DNS entries on your local network.

3:00

So let's get started. So quick high level of how this works and how everything fits together. I'm a visual person, so I drew this diagram.

## Diagram for Visual Learners

3:07

We're going to have our Docker machine that we stand up. Within here, we're going to install Traefik proxy. Traefik proxy will use Let's Encrypt to get certificates.

3:17

And how does it get those? Well, we're going to verify with Cloudflare that we own the domain.

3:23

Then we're going to set up these three sites within our local DNS that point to our Traefik proxy.

3:32

So as a user, as me, crazy hair up here, like my niece likes to put on drawings of me.

3:38

So in my browser, when I request this site, it will look up DNS.

3:44

DNS will tell me that it resolves to our Traefik proxy and then Traefik proxy will route this to our sites.

3:53

Cloudflare is not involved at all as far as DNS goes, although we do a DNS challenge.

3:59

We don't have any of our DNS records in Cloudflare. Again, we're just using Cloudflare to verify that we actually own a domain.

4:09

Okay, let's get started. First, we'll want to SSH into our server. Then we'll need to set up our environment within the server.

## Traefik Docker Compose

4:17

I'm going to create a folder called Docker volumes that's going to house all of our Docker configuration files along with our composed files.

4:24

Then we'll want to CD into that folder. If we look in here, we shouldn't have anything here, obviously, because we just created the folder.

4:31

Then we're going to make a directory called Traefik to hold our Traefik configuration files along with our Docker compose file.

4:38

Then we'll want to CD into this Traefik folder. And then here we're going to create a Docker compose file.

4:44

Then we'll want to edit this Docker compose file so we can put some contents in it. And what contents are going to go in there?

4:49

This YAML right here. So this is a pretty basic Docker compose file with Traefik. It only has one stack as you can see, Traefik only, and then has a lot of properties that we'll talk through.

5:01

So first of all, we're going to use Traefik and we're going to use V3, the latest image. I'm pinning this to V3.

5:07

Now, if there's a newer version out when you see this, you can pin it to the newer version. I'm going to name my container Traefik.

5:13

Then I'm telling it to always restart unless we stop it ourselves. Then I'm setting some security options to say no new privileges.

5:20

Then I'm saying use a network called proxy. And if we look below, we can see networks proxy external true.

5:27

So this is saying that we expect a Docker network called proxy outside of this compose file.

5:34

So we'll create that here in a few. Then we're telling it which ports to expose, 80 and 443.

5:39

Then we're setting up some environment variables. The first variable is this CFDNS API token underscore file.

5:46

Now, this might look a little bit different in the past. And that's because we're going to use a secret that we're going to attach to it.

5:54

And this environment variable is actually mounting this secret. Well, where does this secret come from?

5:59

Well, it comes from this secret that we're actually mounting. And where does this secret come from?

6:06

Well, it comes from a top level secret that we define and we tell it where the file is.

## Docker Secrets Rant

6:12

Now, don't get me wrong. Docker secrets are great to use, but sometimes I doubt their usefulness. Docker does support them in compose.

6:19

But most people who are running compose in production are actually using Docker Swarm and Docker

6:24

Swarm has a different way to define secrets. And on top of that, not every container out there support secrets as you'll kind of see here in a little bit.

6:33

Now, we got a little bit lucky with this one because Traefik actually has a variable called underscore file that can read files that are mounted.

6:42

Actually, this comes from Lego, but not all containers out there do. And as you'll see, we can't use secrets later on.

6:48

So I thought I would mention this that, hey, secrets are supported. If you want to use environment variables, I have options set here that are commented out.

6:57

And you'll see here that we actually have to use an environment variable because Traefik doesn't support secrets within labels.

7:04

Long story short, I'm acknowledging that secrets exist, but I'm really doubting their usefulness in a home lab environment or in Docker compose, especially when you only have one service anyway.

7:16

They're designed to protect services within the stack from being able to read each other's environment variables.

7:22

But we only have one service in this stack. Anyways, again, acknowledging they exist, use whatever you want.

7:28

I'll have examples for both. Then we have an environment variable called Traefik dashboard credentials. And this is going to be our basic auth credentials to see the dashboard.

## Explaining Traefik Compose

7:37

I mentioned this earlier, but this is actually mounting this secret to this specific service from the top level secret that we see down here.

7:45

And then we're defining an ENV file to read as well. And then we have some volumes that we're mounting here. So I'm mounting on the server to this container our local time.

7:54

So we get time zones read only, and then I'm mounting the Docker socket or the Docker process.

8:00

And I'm saying read only. That's so we can get to it within this container. And then we're mounting a Traefik config that it looks like we'll need to create to a Traefik config within the container.

8:11

And we're saying this is read only, so it can't modify this file inside of the container. And then we're doing the same thing for an ACME JSON file.

8:19

We have one on disk that we're going to mount within the container. And we're not using read only here because this actually needs to write to local disk to update the certificate.

8:29

And so this ACME JSON you'll see later on is a JSON representation of our certificate.

8:36

And then I have another volume here that we'll use later on. And this is mounting a config file from disk again to the inside of the Traefik container to a YAML file.

8:45

And we're saying read only. We'll use this later, but we'll keep it commented out for now. Next, you're seeing a lot of labels. So we're saying, hey, we have an entry point of HTTP, so we're exposing something called HTTP.

8:56

We're creating a route rule to expose our dashboard to my local domain on technotim.live.

9:04

We'll talk about this here, but notice that this is a sub-sub domain.

9:09

So it's local sub domain and then a sub domain off that called Traefik-dashboard.

9:14

Then here, the basic auth credentials that we see up here, we're passing those into there so they get replaced from an environment variable.

9:22

Then we're also saying, hey, we're going to redirect HTTP to HTTPS. That's what we want.

9:28

We're setting some custom headers that we need for cores, and this will help you out with some of your services.

9:33

Then we're setting a middleware of this redirect that we talked about a little bit earlier. We're also creating an entry point called HTTPS, and we're defining that as well.

9:42

Then we're using the middleware called Traefik auth. So this is putting middleware in between so we can have authentication on this end point for a dashboard.

9:50

We're saying use TLS, and then the cert resolver that we're going to use is Cloudflare.

9:56

Now, I said there are more providers that you can use. We're going to use Cloudflare in this example, and I'll link more in the documentation below.

10:03

But we're going to use Cloudflare, and here's the top level domain that I'm going to use. So I'm going to use local.technotim.live.

10:11

And then we're saying this certificate on this route should also be sans, so subject, alternative name.

10:16

And this is really how we get our wildcards. We're saying, hey, this certificate also applies to anything lower than this local subdomain.

10:25

And then the service API internal is so that our Traefik dashboard can actually access these internal APIs.

10:32

So that's a lot of labels. Hopefully some more of these make sense. And we talked about our secrets. Again, we're going to be mounting a secret from the file system.

10:40

And then our networks, we're saying we're going to get a network external to this compose stack.

## Docker Container Tasks

10:45

So we have a lot of tasks we need to do based on this YAML file. So it looks like we need to create a data folder and in there put a Traefik YAML file in that data folder.

10:55

We're also going to create an ACME JSON file. We're going to assign special permissions to that. We need to create a secret for Cloudflare API token, which means we need some Cloudflare API tokens as well to put inside of there.

11:07

We need to create a Docker network called proxy outside of here. We're also going to need to generate basic auth credentials to get to the dashboard.

11:15

And then we need to create this config file at some point, but we won't do it now. We'll do it later. So we got a lot of tasks. Let's get into it.

11:23

So back in our server, first, let's copy this Docker compose file and paste it into the Docker compose.

11:29

Again, we were editing this Docker compose file. So we're going to paste the contents in here using nano. It's control O, enter control X to exit.

11:38

Always save, but it really stands for output and X is for close. Then if we cat this out just to make sure we have contents in there, we do.

11:46

So I said we need to make a dir called data. And in here, we need to create two files.

11:53

First, we need to touch or create an ACME.json. So we need to shmod it or change the permissions on this file.

12:01

What do we want to shmod it to? 600. And we're going to do ACME.json. So if we do it ls -l, we can see that it has the permissions applied.

12:11

Next, we need to create this Traefik.yaml. Now take note, it's YML. Traefik uses YML instead of YAML.

12:18

So just make note of that. So we're going to create this and then we're going to nano. We're going to edit it. And what goes inside of that file?

12:25

Well, the contents of our Traefik config. So in here, we're saying, hey, for the API, turn on the dashboard, turn on debug true.

12:33

This is so you get some additional logging. You can actually turn that off once you get everything working. Then we're going to create some entry points, HTTP on 80.

12:41

And we're going to set up redirections to say, hey, go to HTTPS if you land on HTTP.

12:47

And then we're defining HTTPS, which is the port of 443. Server transport insecure skip verify is true.

12:55

Now, I turn this on so that we can use self-signed certificates behind Traefik like you would with something like Proxmox.

13:03

But if you're not using any self-signed certificates behind Traefik, you can turn this off.

13:08

Then we're saying our provider is Docker. Obviously, we're using Docker. They support other providers, Kubernetes, so on and so forth.

13:15

But we're saying our endpoint is on the Docker process exposed by default false.

13:20

In here, you can see that we're then passing in a file with a file name of slash config that YAML.

13:27

This is additional configuration for routes we'll talk about later. But because we didn't mount that, we need to comment this out here, too.

13:35

Then we're setting up our cert resolvers. So we have Cloudflare. We're saying we're going to use ACME to do it.

13:40

Then we're going to specify our email address on our Cloudflare account. Our storage is going to be the ACME JSON file. And then we're going to set up our certificate server.

13:49

Now, as you notice, I have this one commented out, and that's production. Now, I would highly recommend using this second one while you're setting it up, and that's their staging endpoint.

13:59

So why would you want to use staging over production? Well, production has rate limiting on their endpoints.

14:05

And if you do this too many times and too many failures, they'll block you out for a couple of days or even a week.

14:11

So I would highly recommend testing this on staging first. Staging won't give you a trusted certificate, but it will give you one that's signed from their staging servers.

14:24

So it's a good way to test to say, hey, did I get a staging certificate? And if you did, then you can turn this on and get production.

14:31

And if you want, you can comment both of these out and the default is production. So I'd highly recommend just having them both there and toggling them back and forth as you get your certificates.

14:42

DNS challenge again, we're saying, hey, use Cloudflare. That's our provider. And then there's a few other options if you have troubles with DNS propagation.

14:49

That's something that the community added a while ago that they found that, hey, some of these options do help out.

14:54

I haven't had to use them, but I listed them just in case with some comments about them. And then our resolvers. What resolvers are we going to use?

## DNS Resolvers

15:02

Now, this is really important. You don't want to use your internal DNS to resolve this. You want to use public DNS to resolve this.

15:09

Well, why? Well, coming back to this diagram, let's encrypt is verifying your domain. It will actually create a text record here if it can, and then it will verify that text record.

15:21

And the way it verifies it is by reading that DNS entry that we had. And here we're saying use Cloudflare's DNS, but this can be Google's DNS or any external DNS.

15:30

But we're saying use an external DNS. So when it goes to verify, it's going to go out to some big DNS system and say, hey, do you have these text records here?

15:41

And once they propagate, it should say yes, and then you'll get your certificate. The reason why I say to use external DNS is because, one, it's faster.

15:49

You don't have to wait for those records to propagate all the way down to your internal DNS. And two, you might have a DNS record for this already defined.

15:58

And so it's not going to be able to verify those text records in your own DNS.

16:03

So long story short, keep this to public DNS. Don't change it to your own. So we were editing that Traefik.yaml file on our server.

## Creating Secrets

16:10

Let's paste that configuration in there. Save it with Ctrl+O, Enter, X, Ctrl+X.

16:17

And then if we do a cat on that Traefik.yaml, you should have it. And if we do a cat on acme.json, we have it, but it's empty, which is also good.

16:25

So if I'm looking at my compose file again, we still need to create this secret, that's a text file, with our Cloudflare API token.

16:33

So first, let's create the secret file. So we want to go at level up. We actually want to create this at the Traefik level and not in the data folder.

16:42

And I'm going to touch or create this file called cf\_api\_token.txt.

16:47

Just to do an ls, we see it's there. And if we edit it, there's nothing in there. But we're going to put something in there.

16:53

What goes in there? Well, our Cloudflare API token. So how do we get our Cloudflare API token?

## Cloudflare API Token

16:59

Well, if we go into the Cloudflare dashboard and you go under your profile, you can then see a section for API tokens.

17:07

Here you can see I have quite a few tokens. Well, maybe you can't because I'm going to blur it out, but just know that I have many tokens there.

17:13

And we're going to create a new token here. Now, you can pick from one of the templates, but I found it's easier to just create a custom and start from there.

17:21

That way you don't have to figure out what the default is and what you need to change. So let's do get started. First, I'm going to give it a name. Let's call this Docker Traefik.

17:31

Then we need to give it some permissions. And in the Traefik documentation that will link, it says we need zone, zone, read.

17:38

We need to add another permission for zone, DNS, and edit.

17:44

Then you choose which zones this token applies to. Now, I have lots of zones. I don't want this to apply to all zones.

17:51

I only want it to apply to the zone that we're working on, which is techno Tim Dot Live.

17:56

Next, you can filter by IP. Now, I don't have a static IP at home, but if you did, you could say that only these IPs can actually use this token, which is really good.

18:05

So if you have a static IP, I would highly recommend using this. I don't, so I can't. TTL, we're going to set this token to live forever because we need this token to generate certificates.

18:15

So let's continue to summary. So here's the summary. We're creating a token named this Docker Traefik.

18:21

It's for this email account that hopefully you can't see. And then it's for this domain and it has these permissions zone, read and DNS, edit.

18:31

So create token, then it will give you your token. So you should copy it and put it in a safe place. It's never going to show it to you again. So if you lose it, just delete it and create a new one.

18:40

You could see my token here. I'm going to delete this after this tutorial, but I'm going to save this off to a safe place. Then let's go back to our terminal where we were.

18:49

And again, we're in the Traefik root folder and let's edit this CF API token.txt.

18:56

And in here, we're actually just going to paste this token. Then let's save it. Control + O, Control + X.

19:02

And if we do a cat for that token, we should see the contents of it.

19:07

And again, I want to call out what we didn't do in Cloudflare. We didn't create any DNS entries at all. Again,

19:14

we're only using this for domain verification and not for DNS at all. We'll create those later on our local network. Going back to my Docker Compose for my task list.

## Docker Network

19:24

One thing we didn't do yet is create this external proxy network. So let's create that. So this is super simple.

19:30

We're going to do a Docker network create proxy. So that will create our proxy network.

## Basic Auth Credentials for Traefik Dashboard

19:36

Okay, that one was easy. Another easy one is creating our .env file. So we're going to do a touch.env then at nano.env.

19:44

I know I can do that in one step, but I like to do it in two. What are we going to paste in here? Well, we need our basic auth credentials for our Traefik dashboard.

19:52

So we need to generate those. So to do that, you need HT password and you need to make sure that that's installed.

19:58

You can see it's installed for me. To install that on Ubuntu, if you're using Ubuntu is sudo apt update and then sudo apt install Apache 2.0 utils.

20:06

And that will install the HT password. You can see I already have it installed. Need to do it on Mac and Windows. All of instructions for that as well.

20:14

Then to create our credentials, it's usually a username, colon, and then a base64 encoded password.

20:21

And it's a pair. To create our username and password, we're going to do it like this. So we're going to use this command,

20:26

which will create a credential pair for us, username and password. I'm going to change the username to admin and then hit enter.

20:35

Now it's going to prompt me for my password. I'm just going to type in password for my password. And then it will give me then the HT password format that we're going to use inside of that EMV file.

20:46

So as you can see, this admin matches up to here. If you want it to be something else, run this command with a different username,

20:51

and obviously then use a better password than I did. So let's copy this really quick. Let's edit this EMV file.

20:59

Going to paste this here, but we can't just paste this password. We have to set the environment variable that we want that to be assigned to.

21:07

And for us, this is Traefik dashboard credentials. Let's grab those. We're going to say that variable equals this.

21:14

So now this is assigning that variable this value. Then this EMV file gets read. And then on this stack,

21:21

we're assigning a local variable of the same from the one that's in our .EMV file.

21:28

From a service global variable right there. And again, if you want to put your API token there instead of mounting it as a secret,

21:36

you can absolutely do that there too. You would just create a CFDNS API token back in this EMV file,

21:43

and then you would assign the value. Okay. Is there anything left we need to do?

21:49

I don't think so. So now that everything's done, we can stand up our Docker Compose file. So we're going to run Docker Compose up -d. I have force recreate in there.

## Starting the Traefik Container

21:58

It's because I was testing this a lot of times, but it should be just -d. If you're going to be testing it a lot of times like I was,

22:05

you might want to use the force - recreate. It doesn't matter for the first time. So I'm going to apply it anyways. We see the container started.

22:13

Let's do a Docker logs on that Traefik container. We don't see any logs. That's usually a good sign. Don't see any logs.

22:21

That's a good sign with Traefik. No news is good news. That means I don't have any errors. It's a good thing.

22:26

But how do we verify that this is working other than going to the dashboard? First, let's check to see if our certificate has any data.

22:34

So I'm going to cat out the acme.json file. Remember, that's a JSON representation of our certificate.

22:41

Let's cat it out. As you can see, I have one. So we're in a good state. But what if we didn't have one? What if we need to troubleshoot inside of this container

## Troubleshooting

22:48

and just make sure that everything's mapped properly if we were getting some errors? Well, the first thing I would do is Docker ps and see what's running.

22:55

I would look to see if it's still running and it's not in a crash loop. That looks pretty good to me. If there were still issues, I would run a Docker exec it Traefik and then /bin/sh.

23:08

So what we're doing is we're going to shell inside of this container so that we can take a look around.

23:14

So Docker exec dash it for interactive. We're seeing the container's name is Traefik.

23:20

And then we're doing a /bin/sh. So we're going to use shell as soon as we get in there. Let's run that. So now we're inside of here. We do a top. That's always a good way to tell if you're inside of here.

23:30

Yes, we're inside of this container because we can see the only processes are running is the shell that we ran,

23:36

top that we're running, and our Traefik process right here. Pretty cool. So let's take a look around. So if we do an ls, we could see, hey, there's our ACME JSON.

23:46

So we know that's mapped properly. Or do we? We can cat out that file if we want. It's the same thing we're seeing. So cool. That's good.

23:54

Next, if we do an ls, remember, we mounted things in the root. We mounted this Traefik.yaml file.

24:01

So let's take a look at this cat Traefik.yaml. We see that it has stuff and so it looks pretty good.

24:08

Let's clear that out. And then if you want to check your secret to make sure it's mounted, you could do an ls /run/secrets to see which secrets are mounted.

24:19

You can see our secrets mounted here. And if you wanted to see that value, you would basically do the same thing.

24:24

You would do a cat /run/secrets and then this file and you could see the value there.

24:30

So that's working. And then if you remember, we have two environment variables that should work inside of this container.

24:37

So let's make sure that this environment variable is set properly. If we do an echo, interpolate this variable, we should see it's pointing to that path.

24:46

And so this looks right because we're using this special \_file, which will read the contents of this file.

24:53

So that looks pretty good. And the next variable we should be able to read inside of here is this Traefik dashboard credentials.

25:00

Let's do the same thing. We're going to echo out and interpolate this value right here.

25:05

And you could see there's our basic auth credentials. So everything looks good. So that's pretty much all the troubleshooting you should need to do inside of here if something goes wrong.

25:14

But things are going right. So let's continue. So how do we get to our dashboard now? Well, as you can see, I define that this host should be Traefik dashboard local.technotim.live.

## Traefik Dashboard Local DNS

25:27

But if we go there in a browser, it won't resolve right now. So what we need to do now is create a local DNS entry so we can get there.

25:36

So I'm going into my DNS system, which is PyHole. And what I'm going to do is create a DNS record.

25:42

Now, you can do this one of two ways. You can create an A record that points back to the IP address of the machine and that should work fine.

25:50

Or you can create a CNAME that points back to an existing record. I would recommend using a CNAME. So if we check this machine's IP address, for me, its IP address is right here.

26:03

192.168.60.40. And if we check the host name, you can see that I've named this machine Docker01.

26:12

And I already have a DNS record in here for Docker01. And you can see it right here.

26:17

And it's pointing to that IP address. So I'm going to create a CNAME now that points to this DNS record.

26:24

And the advantage of creating a CNAME is that as you create more and more websites, you're going to point them all to this Docker host and you may as well just point it to this record.

26:34

So if that IP address ever changes, you only need to change it in one place. So I am going to create a CNAME that points to that Docker system.

26:44

And the CNAME is going to be the name of my dashboard. Then I added it. There we go.

26:50

So now let's verify that we can resolve that new DNS entry or that CNAME. So let's do an NSLookup on this. And we can see right here it resolves back to that A record,

27:00

which then points that IP address. So this is great. And now when we go to that website, we can see we're getting a certificate warning.

## Viewing the Traefik Dashboard

27:08

This might be a good thing. If we check our certificate, the certificate is not valid, you can see that this certificate right here is issued from Let's Encrypt Staging.

27:17

So this is actually a good error. This means we got a certificate from Let's Encrypt rather than the default Traefik certificate.

27:26

So if you see here that you're getting a Let's Encrypt certificate, that's good. If you see it's a Traefik certificate, that means something's not working right.

27:33

You might want to go back and troubleshoot in the troubleshooting section. So that's a good thing. So let's advance and let's actually go to this website.

27:41

Now we're getting our basic auth prompt. Remember I said mine was admin and it was password.

27:47

There we go. We're in and we see our Traefik dashboard. So cool. We can get to our Traefik dashboard. Now from here you can do lots of other things and I'll let you explore that on your own.

## Getting Production Certificates from Let's Encrypt

27:57

So now that we verified that we can get to our dashboard and we verified that we have our staging certificates.

28:03

I think it's safe to say we can now get our production certificates. So remember to get our production certificates, we'll want to go back into the Traefik.yaml file.

28:14

What I would do is uncomment the production and comment out the staging.

28:19

And I did it on that file. But remember, you'll have to do it on your server. Then we'll go into the data folder and then we'll do an ls again.

28:27

And so we'll edit this Traefik.yaml file. And what we're looking for is down here and it's right here.

28:34

So let's uncomment this and we'll comment this out. So now we're going to use the production site and we're going to comment out the staging site.

28:45

So let's save that. Control O, enter, control X. So to reinitialize this, what I'm going to do is docker-compose up -d and then of course recreate.

28:53

So it's going to stop, start, recreate it. There it goes. Now it recreated. Let's do a docker logs Traefik. See if we have any logs or errors.

29:02

Logs or errors. We don't have any logs or errors. So that's a good sign so far. And then how are we going to verify certificates? We learned earlier.

29:09

It's a cat on the data /acme.json to see if we have certificates.

29:14

Cat that out. Let's scroll through here. Looks like we have a certificate. This is still from staging. So I think I know what's going on.

29:23

This happened last time and I forget because it's been a while. But as you can see, we're pointing to the staging site in this certificate.

29:30

So what we need to do is actually just blank out the contents of this file and let Traefik put the contents of the new certificate from production in this file.

29:39

Pretty easy to do. Let's do that. So first let's stop Traefik. So it's not doing anything. Stop it first with docker stop Traefik.

29:46

And then what we're going to do is we're going to do a nano data /acme.json. So we're going to go into this file. Basically what you want to do is just blank this file out.

29:55

Clear all the contents. Make sure it's empty. Then we're going to do a control O to write control X. And then you know cat it out to make sure that it is empty. Cat it out. It's cool.

30:06

So it's empty. And then let's do a docker start Traefik. So let's start that back up. Then if we do docker logs and you can see docker logs, docker logs, docker logs, it all looks good.

30:16

So let's check our website to see if we actually have certificates. So going back to Traefik dashboard local in my local techno Tim dot live dashboard,

30:26

you can see we're here and you can see we don't have any certificate warnings. So let's check this certificate and says it's secure. Let's see who issued it.

30:36

And as you can see, let's encrypt issued it. So pretty awesome. Now we have certificates on our dashboard. So pretty cool.

30:44

So if you're noticing that you're still seeing the staging, two things. One browsers hold on to certificates for a long time.

30:50

So it might be good to try this on a browser you haven't tried yet or closing your browser all the way out and then opening it back up.

30:58

I would recommend just trying a totally different browser on this so you can see if you're getting the correct certificate and then check the logs and do the troubleshooting we saw earlier in the section.

## Creating a New Workload with Certificates

31:08

So great. We have Traefik running. We have our certificates. They are production certificates.

31:14

Now let's expose a another website with a new Docker compose stack. So back on our server. If you notice, we're in the Traefik directory.

31:23

Let's actually go one up. So we do an LS and we see that we have a Traefik folder. I'm going to create a new directory called engine X and then we're going to CD into this engine X folder and then we're going to touch and we're going to create a Docker compose file again.

31:38

And then we're going to nano this Docker compose file so that we can edit it and put some contents.

31:44

So what are the contents that are going to go in there? Well, it's this engine X demo website. So it's a simple engine X demo website that will print an IP address and a few other things.

31:54

And you can see here that we're applying some labels. So on new workloads, all we need to do is apply labels.

32:00

So we're going to say enable Traefik. True. We're going to use this route. We're going to use the entry point of HTTPS.

32:08

We want to use TLS and then we need to set the server port. So one thing that we need to do is create this local DNS entry file, which we'll do in here in a minute and then explain this right here.

32:20

So why is it port 8080? We use that port because that's the port that this engine X hello container exposes.

32:29

So, for instance, if it were 80, we change it to 80. If it were 3000, we'd put 3000 there.

32:35

And if it were 9000, we would put 9000 there. So on and so forth. But you want to make sure that this server port matches the container port of that Docker container for the service you want to run.

32:47

So for me, it's 8080. And so this is important here. This is saying, hey, use the network called proxy.

32:53

And this is so I can get to the network called proxy where Traefik is living. And then we're defining this network at the higher level of proxy and saying use external.

33:04

So nothing to do there. It's the same as a Traefik. But this is just saying, hey, use the network called proxy that is already created within Docker.

33:12

So let's paste this in the compose file really quick. So we're going to paste it in here. Then we'll cat this out so you can see. Yes, we put it there.

33:21

So now the last task is just creating this DNS entry and then spinning up the stack.

33:27

So back in my PiHole or whatever DNS system you're using, you would create a DNS entry again or create a CNAME.

33:33

So I'm going to create a CNAME. And what's it going to point to? Pop quiz. Docker 01. You're right.

33:39

So let's filter this by Docker dash 01. You can see our Traefik dashboard is pointing to Docker 01.

33:46

And that's that Docker machine. Let's do the same thing now for this new domain. So this new domain is nginx.local.technotim.live. And we're going to point it to this target, which is this machine or this a record here.

34:01

We're going to add that. Then again, we'll want to do an NS lookup to see if this domain resolves.

34:07

And it does. Again, it's pointing back to this Docker machine, which is on this IP address.

34:13

So this looks pretty good. Then all there is left to do is create the stack. Let's do a Docker logs nginx just to make sure nothing weird is going on. That all looks pretty normal.

34:24

Let's do a Docker PS to see if it's OK. There it is. It started up 16 seconds ago.

34:30

And here it is. You can see this nginx demo site. The server address is a little bit weird right here. That's from Docker. But anyways, not important. You can see it is here. It's actually working.

34:40

You can see the timer is ticking. I can actually put on auto refresh maybe. That's probably a little better. Well, it won't stay on. Not important. But what is important, if we go into our connection, we look at this certificate.

34:53

And then we can see this is also a production. Let's encrypt certificate. So pretty awesome. Now it's rinse and repeat for every service that you have. That's great for everything inside of Docker.

## Using Traefik for Workloads Running Outside of Docker

35:04

But what about things outside of Docker? Well, that's pretty easy, too. And that's that configuration file we saw a little bit earlier.

35:10

So just to illustrate what we're trying to do here, I'm here. Messy hair person. I'm using a browser instead of going directly to proxmox and getting certificate errors.

35:20

What we want to do is actually use Traefik and use them as our proxy, but then go out to proxmox.

35:27

So then we have a certificate that we trust. Super simple to do. And we just need to uncomment a few things.

35:34

So if we go back to our Docker config, remember how I said, hey, we're going to use this later. I have this commented out this config dot yaml and I'm mounting it as read only.

35:43

Well, what we want to do is uncomment that. But we have a task now. We actually need to create this config dot yaml in the data folder. And what goes in there?

35:53

Well, it's this relatively simple config right here. So this is a way that I can define external services.

36:00

So I'm creating a router pointing to proxmox localhost at techno Tim that live.

36:06

I'm adding some additional middleware that are defined here. This is middleware and headers that get attached to those requests.

36:13

I found I need a lot of these for a lot of my sites, a redirection middleware as well. And then I'm defining this service saying the load balancer has servers of one.

36:24

And here is the IP address of my proxmox server. If I go there, you can see I'm getting a prompt here with a certificate warning.

36:32

But we want to get rid of that. And then I'm saying past host header true again, more header stuff. And if we scroll down here, we have this IP whitelist and the IP whitelist has a source range.

36:42

This is basically saying, hey, we trust all reverse proxies in this range right here.

36:48

And you can see on the source range, it includes all private IP addresses. You might want to tighten this up to your own subnet to say, hey,

36:55

you only trust upstream proxies from this range, but not a huge deal.

37:01

You should probably tighten it up. But for this example, I've added all private subnets just so you can pick and choose which one yours falls into.

37:09

So anyways, let's copy this. Go back to our server. Still in the nginx folder. So let's go up. I'm going to go back into our Traefik folder. Then we're going to go into our data folder and do an LS.

37:20

Then we're going to touch config.yml. Then we're going to nano and we're going to edit that file. And here we're going to paste the contents we were just looking at of config.yml. Control + O to save. Control + X to exit.

37:32

Do a cat just to make sure. Hey, it's there. It is there. And then, as I mentioned, we still need to uncomment a few things.

37:41

And so we also reference this in the Traefik.yml file. Remember how we had something commented out here? Right here.

37:49

Let's uncomment this. Then we need to edit our docker compose.yml file. And we need to uncomment that last piece right here.

38:01

Control + O to save. X. And then the last thing we need to do if we look at this config, we need to go into our internal DNS and create this entry.

38:11

So again, for me and PiHole, I'm going to create a CNAME of the CNAME we just mentioned, proxmox.local.technotim.live.

38:18

And I am going to point it to, that's wrong, I'm going to point it to the host name or the A record we already have, which is docker01.local.technotim.us, my internal local domain.

38:29

So let's say add. Now we've added that. Let's copy this out. Just make sure we can do an nslookup. nslookup.

38:39

We see it. Awesome. So now let's go to that site. Awesome. It works. Then we need to recreate this stack because it doesn't auto load our configuration. So let's do a docker compose.

38:53

Let's recreate it. Do a docker logs on Traefik. No errors. Then if we go to that URL, you can see that, hey, proxmox.local.technotim.live does get to my proxmox server.

39:08

And I do have a certificate. So one call out real quick. You might have noticed that these are on different VLANs.

## Networking Considerations

39:15

So if you have firewall rules in between VLANs, you'll need to make sure that your docker host can communicate with the services that might be on different VLANs.

39:25

So that's how easy it is to get wildcard certificates for all of my services here on my network. Huge thanks to UptimeRobot for sponsoring today's video. I'm Tim. Thanks for watching.

,

## Getting Wildcard Certificates with Traefik

,

0:00

Traefik 3 is here and I thought this would be a good time to revisit one of my most popular tutorials to date.

,

0:05

And it's using Traefik in Docker to get wildcard certificates for all of your self-hosted services.

,

0:11

This means no more self-signed certificate errors and no more hosting things on on-ports.

,

0:16

And we're going to put secure certificates on everything and let you name your services whatever you like.

,

0:22

So today we're going to set up Traefik for a reverse proxy. We're going to use Let's Encrypt to get free certificates.

,

0:29

We're going to use Cloudflare to verify our domain to get these certificates. And then we'll use a local DNS system like PiHole to name our services anything we like.

,

0:38

We're going to take care of everything end to end and I will provide all of the documentation you need. And by the end of this video you'll have wildcard certificates for all of your services.

,

0:47

And all certificates will auto renew every 90 days. It truly is set it and forget it once you get it set up.

,

## Monitoring with UptimeRobot (sponsor)

,

0:54

But speaking of certificates expiring, if you want an easy way to monitor this and just about anything else,

,

0:59

you can with today's sponsor UptimeRobot. Now I've been using UptimeRobot for a few years now and I wanted to share three things that I really like about them

,

1:08

and why I use them to monitor my home lab as well as many public websites. First, the user experience is fantastic on their new website as well as in their app,

,

1:17

which really sets the bar as far as website monitoring apps go. It has a simple and intuitive interface that gives you exactly what you need when you need it.

,

1:25

Oh, and it even has push notifications to let you know when there's a problem and then again when it has recovered.

,

1:31

I also send these to my private Discord server, but you can also send them to Teams, Slack and many other integrations.

,

1:37

The second is that it has lots of options for monitoring. Website monitoring, SSL monitoring, port monitoring and many others.

,

1:44

Chances are if you have something you want to monitor, there's a way to do it with UptimeRobot. And three, it's the price. They have one of the most generous free tiers out there.

,

1:53

You get 50 monitors for free, most of the integrations you need, and even status pages to let others know the status of your sites and services.

,

2:01

On top of that, I've convinced them to give you 20% off any paid plan when using the link in the description.

,

2:07

So join 2 million other users and start monitoring your services with UptimeRobot today.

,

## Requirements

,

2:12

Before we get started, there's a few things you'll need. First and foremost, you'll need a machine running Linux that you have SSH access to.

,

2:19

Now I'm using Ubuntu Linux, but it can be any version of Linux you want. You want to be sure that Docker is installed.

,

2:25

And if you need to know how to install Docker, I'll be sure to include it in my documentation. Next, you're going to need a domain that you own.

,

2:32

This can be any domain, but you'll want to be sure that it's currently registered to you and that you're using Cloudflare for DNS.

,

2:38

Now you can use other DNS providers with Traefik, but in this tutorial we're going to use Cloudflare.

,

2:44

I will link other providers in the documentation, but most of what we cover is the same for all of the providers.

,

2:50

Last, you'll need some sort of internal DNS system. This can be as simple as PyHaul or even a router or firewall, but you'll need a way to resolve DNS entries on your local network.

,

3:00

So let's get started. So quick high level of how this works and how everything fits together. I'm a visual person, so I drew this diagram.

,

## Diagram for Visual Learners

,

3:07

We're going to have our Docker machine that we stand up. Within here, we're going to install Traefik proxy. Traefik proxy will use Let's Encrypt to get certificates.

,

3:17

And how does it get those? Well, we're going to verify with Cloudflare that we own the domain.

,

3:23

Then we're going to set up these three sites within our local DNS that point to our Traefik proxy.

,

3:32

So as a user, as me, crazy hair up here, like my niece likes to put on drawings of me.

,

3:38

So in my browser, when I request this site, it will look up DNS.

,

3:44

DNS will tell me that it resolves to our Traefik proxy and then Traefik proxy will route this to our sites.

,

3:53

Cloudflare is not involved at all as far as DNS goes, although we do a DNS challenge.

,

3:59

We don't have any of our DNS records in Cloudflare. Again, we're just using Cloudflare to verify that we actually own a domain.

,

4:09

Okay, let's get started. First, we'll want to SSH into our server. Then we'll need to set up our environment within the server.

,

## Traefik Docker Compose

,

4:17

I'm going to create a folder called Docker volumes that's going to house all of our Docker configuration files along with our composed files.

,

4:24

Then we'll want to CD into that folder. If we look in here, we shouldn't have anything here, obviously, because we just created the folder.

,

4:31

Then we're going to make a directory called Traefik to hold our Traefik configuration files along with our Docker compose file.

,

4:38

Then we'll want to CD into this Traefik folder. And then here we're going to create a Docker compose file.

,

4:44

Then we'll want to edit this Docker compose file so we can put some contents in it. And what contents are going to go in there?

,

4:49

This YAML right here. So this is a pretty basic Docker compose file with Traefik. It only has one stack as you can see, Traefik only, and then has a lot of properties that we'll talk through.

,

5:01

So first of all, we're going to use Traefik and we're going to use V3, the latest image. I'm pinning this to V3.

,

5:07

Now, if there's a newer version out when you see this, you can pin it to the newer version. I'm going to name my container Traefik.

,

5:13

Then I'm telling it to always restart unless we stop it ourselves. Then I'm setting some security options to say no new privileges.

,

5:20

Then I'm saying use a network called proxy. And if we look below, we can see networks proxy external true.

,

5:27

So this is saying that we expect a Docker network called proxy outside of this compose file.

,

5:34

So we'll create that here in a few. Then we're telling it which ports to expose, 80 and 443.

,

5:39

Then we're setting up some environment variables. The first variable is this CFDNS API token underscore file.

,

5:46

Now, this might look a little bit different in the past. And that's because we're going to use a secret that we're going to attach to it.

,

5:54

And this environment variable is actually mounting this secret. Well, where does this secret come from?

,

5:59

Well, it comes from this secret that we're actually mounting. And where does this secret come from?

,

6:06

Well, it comes from a top level secret that we define and we tell it where the file is.

,

## Docker Secrets Rant

,

6:12

Now, don't get me wrong. Docker secrets are great to use, but sometimes I doubt their usefulness. Docker does support them in compose.

,

6:19

But most people who are running compose in production are actually using Docker Swarm and Docker

,

6:24

Swarm has a different way to define secrets. And on top of that, not every container out there support secrets as you'll kind of see here in a little bit.

,

6:33

Now, we got a little bit lucky with this one because Traefik actually has a variable called underscore file that can read files that are mounted.

,

6:42

Actually, this comes from Lego, but not all containers out there do. And as you'll see, we can't use secrets later on.

,

6:48

So I thought I would mention this that, hey, secrets are supported. If you want to use environment variables, I have options set here that are commented out.

,

6:57

And you'll see here that we actually have to use an environment variable because Traefik doesn't support secrets within labels.

,

7:04

Long story short, I'm acknowledging that secrets exist, but I'm really doubting their usefulness in a home lab environment or in Docker compose, especially when you only have one service anyway.

,

7:16

They're designed to protect services within the stack from being able to read each other's environment variables.

,

7:22

But we only have one service in this stack. Anyways, again, acknowledging they exist, use whatever you want.

,

7:28

I'll have examples for both. Then we have an environment variable called Traefik dashboard credentials. And this is going to be our basic auth credentials to see the dashboard.

,

## Explaining Traefik Compose

,

7:37

I mentioned this earlier, but this is actually mounting this secret to this specific service from the top level secret that we see down here.

,

7:45

And then we're defining an ENV file to read as well. And then we have some volumes that we're mounting here. So I'm mounting on the server to this container our local time.

,

7:54

So we get time zones read only, and then I'm mounting the Docker socket or the Docker process.

,

8:00

And I'm saying read only. That's so we can get to it within this container. And then we're mounting a Traefik config that it looks like we'll need to create to a Traefik config within the container.

,

8:11

And we're saying this is read only, so it can't modify this file inside of the container. And then we're doing the same thing for an ACME JSON file.

,

8:19

We have one on disk that we're going to mount within the container. And we're not using read only here because this actually needs to write to local disk to update the certificate.

,

8:29

And so this ACME JSON you'll see later on is a JSON representation of our certificate.

,

8:36

And then I have another volume here that we'll use later on. And this is mounting a config file from disk again to the inside of the Traefik container to a YAML file.

,

8:45

And we're saying read only. We'll use this later, but we'll keep it commented out for now. Next, you're seeing a lot of labels. So we're saying, hey, we have an entry point of HTTP, so we're exposing something called HTTP.

,

8:56

We're creating a route rule to expose our dashboard to my local domain on technotim.live.

,

9:04

We'll talk about this here, but notice that this is a sub-sub domain.

,

9:09

So it's local sub domain and then a sub domain off that called Traefik-dashboard.

,

9:14

Then here, the basic auth credentials that we see up here, we're passing those into there so they get replaced from an environment variable.

,

9:22

Then we're also saying, hey, we're going to redirect HTTP to HTTPS. That's what we want.

,

9:28

We're setting some custom headers that we need for cores, and this will help you out with some of your services.

,

9:33

Then we're setting a middleware of this redirect that we talked about a little bit earlier. We're also creating an entry point called HTTPS, and we're defining that as well.

,

9:42

Then we're using the middleware called Traefik auth. So this is putting middleware in between so we can have authentication on this end point for a dashboard.

,

9:50

We're saying use TLS, and then the cert resolver that we're going to use is Cloudflare.

,

9:56

Now, I said there are more providers that you can use. We're going to use Cloudflare in this example, and I'll link more in the documentation below.

,

10:03

But we're going to use Cloudflare, and here's the top level domain that I'm going to use. So I'm going to use local.technotim.live.

,

10:11

And then we're saying this certificate on this route should also be sans, so subject, alternative name.

,

10:16

And this is really how we get our wildcards. We're saying, hey, this certificate also applies to anything lower than this local subdomain.

,

10:25

And then the service API internal is so that our Traefik dashboard can actually access these internal APIs.

,

10:32

So that's a lot of labels. Hopefully some more of these make sense. And we talked about our secrets. Again, we're going to be mounting a secret from the file system.

,

10:40

And then our networks, we're saying we're going to get a network external to this compose stack.

,

## Docker Container Tasks

,

10:45

So we have a lot of tasks we need to do based on this YAML file. So it looks like we need to create a data folder and in there put a Traefik YAML file in that data folder.

,

10:55

We're also going to create an ACME JSON file. We're going to assign special permissions to that. We need to create a secret for Cloudflare API token, which means we need some Cloudflare API tokens as well to put inside of there.

,

11:07

We need to create a Docker network called proxy outside of here. We're also going to need to generate basic auth credentials to get to the dashboard.

,

11:15

And then we need to create this config file at some point, but we won't do it now. We'll do it later. So we got a lot of tasks. Let's get into it.

,

11:23

So back in our server, first, let's copy this Docker compose file and paste it into the Docker compose.

,

11:29

Again, we were editing this Docker compose file. So we're going to paste the contents in here using nano. It's control O, enter control X to exit.

,

11:38

Always save, but it really stands for output and X is for close. Then if we cat this out just to make sure we have contents in there, we do.

,

11:46

So I said we need to make a dir called data. And in here, we need to create two files.

,

11:53

First, we need to touch or create an ACME.json. So we need to shmod it or change the permissions on this file.

,

12:01

What do we want to shmod it to? 600. And we're going to do ACME.json. So if we do it ls -l, we can see that it has the permissions applied.

,

12:11

Next, we need to create this Traefik.yaml. Now take note, it's YML. Traefik uses YML instead of YAML.

,

12:18

So just make note of that. So we're going to create this and then we're going to nano. We're going to edit it. And what goes inside of that file?

,

12:25

Well, the contents of our Traefik config. So in here, we're saying, hey, for the API, turn on the dashboard, turn on debug true.

,

12:33

This is so you get some additional logging. You can actually turn that off once you get everything working. Then we're going to create some entry points, HTTP on 80.

,

12:41

And we're going to set up redirections to say, hey, go to HTTPS if you land on HTTP.

,

12:47

And then we're defining HTTPS, which is the port of 443. Server transport insecure skip verify is true.

,

12:55

Now, I turn this on so that we can use self-signed certificates behind Traefik like you would with something like Proxmox.

,

13:03

But if you're not using any self-signed certificates behind Traefik, you can turn this off.

,

13:08

Then we're saying our provider is Docker. Obviously, we're using Docker. They support other providers, Kubernetes, so on and so forth.

,

13:15

But we're saying our endpoint is on the Docker process exposed by default false.

,

13:20

In here, you can see that we're then passing in a file with a file name of slash config that YAML.

,

13:27

This is additional configuration for routes we'll talk about later. But because we didn't mount that, we need to comment this out here, too.

,

13:35

Then we're setting up our cert resolvers. So we have Cloudflare. We're saying we're going to use ACME to do it.

,

13:40

Then we're going to specify our email address on our Cloudflare account. Our storage is going to be the ACME JSON file. And then we're going to set up our certificate server.

,

13:49

Now, as you notice, I have this one commented out, and that's production. Now, I would highly recommend using this second one while you're setting it up, and that's their staging endpoint.

,

13:59

So why would you want to use staging over production? Well, production has rate limiting on their endpoints.

,

14:05

And if you do this too many times and too many failures, they'll block you out for a couple of days or even a week.

,

14:11

So I would highly recommend testing this on staging first. Staging won't give you a trusted certificate, but it will give you one that's signed from their staging servers.

,

14:24

So it's a good way to test to say, hey, did I get a staging certificate? And if you did, then you can turn this on and get production.

,

14:31

And if you want, you can comment both of these out and the default is production. So I'd highly recommend just having them both there and toggling them back and forth as you get your certificates.

,

14:42

DNS challenge again, we're saying, hey, use Cloudflare. That's our provider. And then there's a few other options if you have troubles with DNS propagation.

,

14:49

That's something that the community added a while ago that they found that, hey, some of these options do help out.

,

14:54

I haven't had to use them, but I listed them just in case with some comments about them. And then our resolvers. What resolvers are we going to use?

,

## DNS Resolvers

,

15:02

Now, this is really important. You don't want to use your internal DNS to resolve this. You want to use public DNS to resolve this.

,

15:09

Well, why? Well, coming back to this diagram, let's encrypt is verifying your domain. It will actually create a text record here if it can, and then it will verify that text record.

,

15:21

And the way it verifies it is by reading that DNS entry that we had. And here we're saying use Cloudflare's DNS, but this can be Google's DNS or any external DNS.

,

15:30

But we're saying use an external DNS. So when it goes to verify, it's going to go out to some big DNS system and say, hey, do you have these text records here?

,

15:41

And once they propagate, it should say yes, and then you'll get your certificate. The reason why I say to use external DNS is because, one, it's faster.

,

15:49

You don't have to wait for those records to propagate all the way down to your internal DNS. And two, you might have a DNS record for this already defined.

,

15:58

And so it's not going to be able to verify those text records in your own DNS.

,

16:03

So long story short, keep this to public DNS. Don't change it to your own. So we were editing that Traefik.yaml file on our server.

,

## Creating Secrets

,

16:10

Let's paste that configuration in there. Save it with Ctrl+O, Enter, X, Ctrl+X.

,

16:17

And then if we do a cat on that Traefik.yaml, you should have it. And if we do a cat on acme.json, we have it, but it's empty, which is also good.

,

16:25

So if I'm looking at my compose file again, we still need to create this secret, that's a text file, with our Cloudflare API token.

,

16:33

So first, let's create the secret file. So we want to go at level up. We actually want to create this at the Traefik level and not in the data folder.

,

16:42

And I'm going to touch or create this file called cf\_api\_token.txt.

,

16:47

Just to do an ls, we see it's there. And if we edit it, there's nothing in there. But we're going to put something in there.

,

16:53

What goes in there? Well, our Cloudflare API token. So how do we get our Cloudflare API token?

,

## Cloudflare API Token

,

16:59

Well, if we go into the Cloudflare dashboard and you go under your profile, you can then see a section for API tokens.

,

17:07

Here you can see I have quite a few tokens. Well, maybe you can't because I'm going to blur it out, but just know that I have many tokens there.

,

17:13

And we're going to create a new token here. Now, you can pick from one of the templates, but I found it's easier to just create a custom and start from there.

,

17:21

That way you don't have to figure out what the default is and what you need to change. So let's do get started. First, I'm going to give it a name. Let's call this Docker Traefik.

,

17:31

Then we need to give it some permissions. And in the Traefik documentation that will link, it says we need zone, zone, read.

,

17:38

We need to add another permission for zone, DNS, and edit.

,

17:44

Then you choose which zones this token applies to. Now, I have lots of zones. I don't want this to apply to all zones.

,

17:51

I only want it to apply to the zone that we're working on, which is techno Tim Dot Live.

,

17:56

Next, you can filter by IP. Now, I don't have a static IP at home, but if you did, you could say that only these IPs can actually use this token, which is really good.

,

18:05

So if you have a static IP, I would highly recommend using this. I don't, so I can't. TTL, we're going to set this token to live forever because we need this token to generate certificates.

,

18:15

So let's continue to summary. So here's the summary. We're creating a token named this Docker Traefik.

,

18:21

It's for this email account that hopefully you can't see. And then it's for this domain and it has these permissions zone, read and DNS, edit.

,

18:31

So create token, then it will give you your token. So you should copy it and put it in a safe place. It's never going to show it to you again. So if you lose it, just delete it and create a new one.

,

18:40

You could see my token here. I'm going to delete this after this tutorial, but I'm going to save this off to a safe place. Then let's go back to our terminal where we were.

,

18:49

And again, we're in the Traefik root folder and let's edit this CF API token.txt.

,

18:56

And in here, we're actually just going to paste this token. Then let's save it. Control + O, Control + X.

,

19:02

And if we do a cat for that token, we should see the contents of it.

,

19:07

And again, I want to call out what we didn't do in Cloudflare. We didn't create any DNS entries at all. Again,

,

19:14

we're only using this for domain verification and not for DNS at all. We'll create those later on our local network. Going back to my Docker Compose for my task list.

,

## Docker Network

,

19:24

One thing we didn't do yet is create this external proxy network. So let's create that. So this is super simple.

,

19:30

We're going to do a Docker network create proxy. So that will create our proxy network.

,

## Basic Auth Credentials for Traefik Dashboard

,

19:36

Okay, that one was easy. Another easy one is creating our .env file. So we're going to do a touch.env then at nano.env.

,

19:44

I know I can do that in one step, but I like to do it in two. What are we going to paste in here? Well, we need our basic auth credentials for our Traefik dashboard.

,

19:52

So we need to generate those. So to do that, you need HT password and you need to make sure that that's installed.

,

19:58

You can see it's installed for me. To install that on Ubuntu, if you're using Ubuntu is sudo apt update and then sudo apt install Apache 2.0 utils.

,

20:06

And that will install the HT password. You can see I already have it installed. Need to do it on Mac and Windows. All of instructions for that as well.

,

20:14

Then to create our credentials, it's usually a username, colon, and then a base64 encoded password.

,

20:21

And it's a pair. To create our username and password, we're going to do it like this. So we're going to use this command,

,

20:26

which will create a credential pair for us, username and password. I'm going to change the username to admin and then hit enter.

,

20:35

Now it's going to prompt me for my password. I'm just going to type in password for my password. And then it will give me then the HT password format that we're going to use inside of that EMV file.

,

20:46

So as you can see, this admin matches up to here. If you want it to be something else, run this command with a different username,

,

20:51

and obviously then use a better password than I did. So let's copy this really quick. Let's edit this EMV file.

,

20:59

Going to paste this here, but we can't just paste this password. We have to set the environment variable that we want that to be assigned to.

,

21:07

And for us, this is Traefik dashboard credentials. Let's grab those. We're going to say that variable equals this.

,

21:14

So now this is assigning that variable this value. Then this EMV file gets read. And then on this stack,

,

21:21

we're assigning a local variable of the same from the one that's in our .EMV file.

,

21:28

From a service global variable right there. And again, if you want to put your API token there instead of mounting it as a secret,

,

21:36

you can absolutely do that there too. You would just create a CFDNS API token back in this EMV file,

,

21:43

and then you would assign the value. Okay. Is there anything left we need to do?

,

21:49

I don't think so. So now that everything's done, we can stand up our Docker Compose file. So we're going to run Docker Compose up -d. I have force recreate in there.

,

## Starting the Traefik Container

,

21:58

It's because I was testing this a lot of times, but it should be just -d. If you're going to be testing it a lot of times like I was,

,

22:05

you might want to use the force - recreate. It doesn't matter for the first time. So I'm going to apply it anyways. We see the container started.

,

22:13

Let's do a Docker logs on that Traefik container. We don't see any logs. That's usually a good sign. Don't see any logs.

,

22:21

That's a good sign with Traefik. No news is good news. That means I don't have any errors. It's a good thing.

,

22:26

But how do we verify that this is working other than going to the dashboard? First, let's check to see if our certificate has any data.

,

22:34

So I'm going to cat out the acme.json file. Remember, that's a JSON representation of our certificate.

,

22:41

Let's cat it out. As you can see, I have one. So we're in a good state. But what if we didn't have one? What if we need to troubleshoot inside of this container

,

## Troubleshooting

,

22:48

and just make sure that everything's mapped properly if we were getting some errors? Well, the first thing I would do is Docker ps and see what's running.

,

22:55

I would look to see if it's still running and it's not in a crash loop. That looks pretty good to me. If there were still issues, I would run a Docker exec it Traefik and then /bin/sh.

,

23:08

So what we're doing is we're going to shell inside of this container so that we can take a look around.

,

23:14

So Docker exec dash it for interactive. We're seeing the container's name is Traefik.

,

23:20

And then we're doing a /bin/sh. So we're going to use shell as soon as we get in there. Let's run that. So now we're inside of here. We do a top. That's always a good way to tell if you're inside of here.

,

23:30

Yes, we're inside of this container because we can see the only processes are running is the shell that we ran,

,

23:36

top that we're running, and our Traefik process right here. Pretty cool. So let's take a look around. So if we do an ls, we could see, hey, there's our ACME JSON.

,

23:46

So we know that's mapped properly. Or do we? We can cat out that file if we want. It's the same thing we're seeing. So cool. That's good.

,

23:54

Next, if we do an ls, remember, we mounted things in the root. We mounted this Traefik.yaml file.

,

24:01

So let's take a look at this cat Traefik.yaml. We see that it has stuff and so it looks pretty good.

,

24:08

Let's clear that out. And then if you want to check your secret to make sure it's mounted, you could do an ls /run/secrets to see which secrets are mounted.

,

24:19

You can see our secrets mounted here. And if you wanted to see that value, you would basically do the same thing.

,

24:24

You would do a cat /run/secrets and then this file and you could see the value there.

,

24:30

So that's working. And then if you remember, we have two environment variables that should work inside of this container.

,

24:37

So let's make sure that this environment variable is set properly. If we do an echo, interpolate this variable, we should see it's pointing to that path.

,

24:46

And so this looks right because we're using this special \_file, which will read the contents of this file.

,

24:53

So that looks pretty good. And the next variable we should be able to read inside of here is this Traefik dashboard credentials.

,

25:00

Let's do the same thing. We're going to echo out and interpolate this value right here.

,

25:05

And you could see there's our basic auth credentials. So everything looks good. So that's pretty much all the troubleshooting you should need to do inside of here if something goes wrong.

,

25:14

But things are going right. So let's continue. So how do we get to our dashboard now? Well, as you can see, I define that this host should be Traefik dashboard local.technotim.live.

,

## Traefik Dashboard Local DNS

,

25:27

But if we go there in a browser, it won't resolve right now. So what we need to do now is create a local DNS entry so we can get there.

,

25:36

So I'm going into my DNS system, which is PyHole. And what I'm going to do is create a DNS record.

,

25:42

Now, you can do this one of two ways. You can create an A record that points back to the IP address of the machine and that should work fine.

,

25:50

Or you can create a CNAME that points back to an existing record. I would recommend using a CNAME. So if we check this machine's IP address, for me, its IP address is right here.

,

26:03

192.168.60.40. And if we check the host name, you can see that I've named this machine Docker01.

,

26:12

And I already have a DNS record in here for Docker01. And you can see it right here.

,

26:17

And it's pointing to that IP address. So I'm going to create a CNAME now that points to this DNS record.

,

26:24

And the advantage of creating a CNAME is that as you create more and more websites, you're going to point them all to this Docker host and you may as well just point it to this record.

,

26:34

So if that IP address ever changes, you only need to change it in one place. So I am going to create a CNAME that points to that Docker system.

,

26:44

And the CNAME is going to be the name of my dashboard. Then I added it. There we go.

,

26:50

So now let's verify that we can resolve that new DNS entry or that CNAME. So let's do an NSLookup on this. And we can see right here it resolves back to that A record,

,

27:00

which then points that IP address. So this is great. And now when we go to that website, we can see we're getting a certificate warning.

,

## Viewing the Traefik Dashboard

,

27:08

This might be a good thing. If we check our certificate, the certificate is not valid, you can see that this certificate right here is issued from Let's Encrypt Staging.

,

27:17

So this is actually a good error. This means we got a certificate from Let's Encrypt rather than the default Traefik certificate.

,

27:26

So if you see here that you're getting a Let's Encrypt certificate, that's good. If you see it's a Traefik certificate, that means something's not working right.

,

27:33

You might want to go back and troubleshoot in the troubleshooting section. So that's a good thing. So let's advance and let's actually go to this website.

,

27:41

Now we're getting our basic auth prompt. Remember I said mine was admin and it was password.

,

27:47

There we go. We're in and we see our Traefik dashboard. So cool. We can get to our Traefik dashboard. Now from here you can do lots of other things and I'll let you explore that on your own.

,

## Getting Production Certificates from Let's Encrypt

,

27:57

So now that we verified that we can get to our dashboard and we verified that we have our staging certificates.

,

28:03

I think it's safe to say we can now get our production certificates. So remember to get our production certificates, we'll want to go back into the Traefik.yaml file.

,

28:14

What I would do is uncomment the production and comment out the staging.

,

28:19

And I did it on that file. But remember, you'll have to do it on your server. Then we'll go into the data folder and then we'll do an ls again.

,

28:27

And so we'll edit this Traefik.yaml file. And what we're looking for is down here and it's right here.

,

28:34

So let's uncomment this and we'll comment this out. So now we're going to use the production site and we're going to comment out the staging site.

,

28:45

So let's save that. Control O, enter, control X. So to reinitialize this, what I'm going to do is docker-compose up -d and then of course recreate.

,

28:53

So it's going to stop, start, recreate it. There it goes. Now it recreated. Let's do a docker logs Traefik. See if we have any logs or errors.

,

29:02

Logs or errors. We don't have any logs or errors. So that's a good sign so far. And then how are we going to verify certificates? We learned earlier.

,

29:09

It's a cat on the data /acme.json to see if we have certificates.

,

29:14

Cat that out. Let's scroll through here. Looks like we have a certificate. This is still from staging. So I think I know what's going on.

,

29:23

This happened last time and I forget because it's been a while. But as you can see, we're pointing to the staging site in this certificate.

,

29:30

So what we need to do is actually just blank out the contents of this file and let Traefik put the contents of the new certificate from production in this file.

,

29:39

Pretty easy to do. Let's do that. So first let's stop Traefik. So it's not doing anything. Stop it first with docker stop Traefik.

,

29:46

And then what we're going to do is we're going to do a nano data /acme.json. So we're going to go into this file. Basically what you want to do is just blank this file out.

,

29:55

Clear all the contents. Make sure it's empty. Then we're going to do a control O to write control X. And then you know cat it out to make sure that it is empty. Cat it out. It's cool.

,

30:06

So it's empty. And then let's do a docker start Traefik. So let's start that back up. Then if we do docker logs and you can see docker logs, docker logs, docker logs, it all looks good.

,

30:16

So let's check our website to see if we actually have certificates. So going back to Traefik dashboard local in my local techno Tim dot live dashboard,

,

30:26

you can see we're here and you can see we don't have any certificate warnings. So let's check this certificate and says it's secure. Let's see who issued it.

,

30:36

And as you can see, let's encrypt issued it. So pretty awesome. Now we have certificates on our dashboard. So pretty cool.

,

30:44

So if you're noticing that you're still seeing the staging, two things. One browsers hold on to certificates for a long time.

,

30:50

So it might be good to try this on a browser you haven't tried yet or closing your browser all the way out and then opening it back up.

,

30:58

I would recommend just trying a totally different browser on this so you can see if you're getting the correct certificate and then check the logs and do the troubleshooting we saw earlier in the section.

,

## Creating a New Workload with Certificates

,

31:08

So great. We have Traefik running. We have our certificates. They are production certificates.

,

31:14

Now let's expose a another website with a new Docker compose stack. So back on our server. If you notice, we're in the Traefik directory.

,

31:23

Let's actually go one up. So we do an LS and we see that we have a Traefik folder. I'm going to create a new directory called engine X and then we're going to CD into this engine X folder and then we're going to touch and we're going to create a Docker compose file again.

,

31:38

And then we're going to nano this Docker compose file so that we can edit it and put some contents.

,

31:44

So what are the contents that are going to go in there? Well, it's this engine X demo website. So it's a simple engine X demo website that will print an IP address and a few other things.

,

31:54

And you can see here that we're applying some labels. So on new workloads, all we need to do is apply labels.

,

32:00

So we're going to say enable Traefik. True. We're going to use this route. We're going to use the entry point of HTTPS.

,

32:08

We want to use TLS and then we need to set the server port. So one thing that we need to do is create this local DNS entry file, which we'll do in here in a minute and then explain this right here.

,

32:20

So why is it port 8080? We use that port because that's the port that this engine X hello container exposes.

,

32:29

So, for instance, if it were 80, we change it to 80. If it were 3000, we'd put 3000 there.

,

32:35

And if it were 9000, we would put 9000 there. So on and so forth. But you want to make sure that this server port matches the container port of that Docker container for the service you want to run.

,

32:47

So for me, it's 8080. And so this is important here. This is saying, hey, use the network called proxy.

,

32:53

And this is so I can get to the network called proxy where Traefik is living. And then we're defining this network at the higher level of proxy and saying use external.

,

33:04

So nothing to do there. It's the same as a Traefik. But this is just saying, hey, use the network called proxy that is already created within Docker.

,

33:12

So let's paste this in the compose file really quick. So we're going to paste it in here. Then we'll cat this out so you can see. Yes, we put it there.

,

33:21

So now the last task is just creating this DNS entry and then spinning up the stack.

,

33:27

So back in my PiHole or whatever DNS system you're using, you would create a DNS entry again or create a CNAME.

,

33:33

So I'm going to create a CNAME. And what's it going to point to? Pop quiz. Docker 01. You're right.

,

33:39

So let's filter this by Docker dash 01. You can see our Traefik dashboard is pointing to Docker 01.

,

33:46

And that's that Docker machine. Let's do the same thing now for this new domain. So this new domain is nginx.local.technotim.live. And we're going to point it to this target, which is this machine or this a record here.

,

34:01

We're going to add that. Then again, we'll want to do an NS lookup to see if this domain resolves.

,

34:07

And it does. Again, it's pointing back to this Docker machine, which is on this IP address.

,

34:13

So this looks pretty good. Then all there is left to do is create the stack. Let's do a Docker logs nginx just to make sure nothing weird is going on. That all looks pretty normal.

,

34:24

Let's do a Docker PS to see if it's OK. There it is. It started up 16 seconds ago.

,

34:30

And here it is. You can see this nginx demo site. The server address is a little bit weird right here. That's from Docker. But anyways, not important. You can see it is here. It's actually working.

,

34:40

You can see the timer is ticking. I can actually put on auto refresh maybe. That's probably a little better. Well, it won't stay on. Not important. But what is important, if we go into our connection, we look at this certificate.

,

34:53

And then we can see this is also a production. Let's encrypt certificate. So pretty awesome. Now it's rinse and repeat for every service that you have. That's great for everything inside of Docker.

,

## Using Traefik for Workloads Running Outside of Docker

,

35:04

But what about things outside of Docker? Well, that's pretty easy, too. And that's that configuration file we saw a little bit earlier.

,

35:10

So just to illustrate what we're trying to do here, I'm here. Messy hair person. I'm using a browser instead of going directly to proxmox and getting certificate errors.

,

35:20

What we want to do is actually use Traefik and use them as our proxy, but then go out to proxmox.

,

35:27

So then we have a certificate that we trust. Super simple to do. And we just need to uncomment a few things.

,

35:34

So if we go back to our Docker config, remember how I said, hey, we're going to use this later. I have this commented out this config dot yaml and I'm mounting it as read only.

,

35:43

Well, what we want to do is uncomment that. But we have a task now. We actually need to create this config dot yaml in the data folder. And what goes in there?

,

35:53

Well, it's this relatively simple config right here. So this is a way that I can define external services.

,

36:00

So I'm creating a router pointing to proxmox localhost at techno Tim that live.

,

36:06

I'm adding some additional middleware that are defined here. This is middleware and headers that get attached to those requests.

,

36:13

I found I need a lot of these for a lot of my sites, a redirection middleware as well. And then I'm defining this service saying the load balancer has servers of one.

,

36:24

And here is the IP address of my proxmox server. If I go there, you can see I'm getting a prompt here with a certificate warning.

,

36:32

But we want to get rid of that. And then I'm saying past host header true again, more header stuff. And if we scroll down here, we have this IP whitelist and the IP whitelist has a source range.

,

36:42

This is basically saying, hey, we trust all reverse proxies in this range right here.

,

36:48

And you can see on the source range, it includes all private IP addresses. You might want to tighten this up to your own subnet to say, hey,

,

36:55

you only trust upstream proxies from this range, but not a huge deal.

,

37:01

You should probably tighten it up. But for this example, I've added all private subnets just so you can pick and choose which one yours falls into.

,

37:09

So anyways, let's copy this. Go back to our server. Still in the nginx folder. So let's go up. I'm going to go back into our Traefik folder. Then we're going to go into our data folder and do an LS.

,

37:20

Then we're going to touch config.yml. Then we're going to nano and we're going to edit that file. And here we're going to paste the contents we were just looking at of config.yml. Control + O to save. Control + X to exit.

,

37:32

Do a cat just to make sure. Hey, it's there. It is there. And then, as I mentioned, we still need to uncomment a few things.

,

37:41

And so we also reference this in the Traefik.yml file. Remember how we had something commented out here? Right here.

,

37:49

Let's uncomment this. Then we need to edit our docker compose.yml file. And we need to uncomment that last piece right here.

,

38:01

Control + O to save. X. And then the last thing we need to do if we look at this config, we need to go into our internal DNS and create this entry.

,

38:11

So again, for me and PiHole, I'm going to create a CNAME of the CNAME we just mentioned, proxmox.local.technotim.live.

,

38:18

And I am going to point it to, that's wrong, I'm going to point it to the host name or the A record we already have, which is docker01.local.technotim.us, my internal local domain.

,

38:29

So let's say add. Now we've added that. Let's copy this out. Just make sure we can do an nslookup. nslookup.

,

38:39

We see it. Awesome. So now let's go to that site. Awesome. It works. Then we need to recreate this stack because it doesn't auto load our configuration. So let's do a docker compose.

,

38:53

Let's recreate it. Do a docker logs on Traefik. No errors. Then if we go to that URL, you can see that, hey, proxmox.local.technotim.live does get to my proxmox server.

,

39:08

And I do have a certificate. So one call out real quick. You might have noticed that these are on different VLANs.

,

## Networking Considerations

,

39:15

So if you have firewall rules in between VLANs, you'll need to make sure that your docker host can communicate with the services that might be on different VLANs.

,

39:25

So that's how easy it is to get wildcard certificates for all of my services here on my network. Huge thanks to UptimeRobot for sponsoring today's video. I'm Tim. Thanks for watching.

,

No results found

,No results found