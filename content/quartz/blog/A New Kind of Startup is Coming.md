---
title: A New Kind of Startup is Coming
type: blog post
tags: 
aliases:
---
There’s a famous theory in engineering called Conway’s Law, which explains a lot about why different eras of technology produce different kinds of organizations. The [original formulation](http://www.melconway.com/Home/Committees_Paper.html) is:

“Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure.”

For example, if your organization consists of three tight-knit teams that are spread across three geographical locations, your software will probably consist of three main modules with lots of internal complexity and simple, well-defined interfaces between them.

Here’s a graphic from [an excellent explainer](https://martinfowler.com/bliki/ConwaysLaw.html) of Conway’s Law that illustrates the idea:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2594/optimized_zXFwM4zDnQtczz8JUggdangxM4oV4KdnwIaEgaSNEyyxrQ2rfaCMqPIL0QEZxjyYd3NIY9KqBsZR7nCSi_a9UYz04ou6Y17yca1HdO2kdctc4J7Hwkt26DJOkz1pO4OoXY3Fr8YNKaTkSmDfFscCXbw.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2594/optimized_zXFwM4zDnQtczz8JUggdangxM4oV4KdnwIaEgaSNEyyxrQ2rfaCMqPIL0QEZxjyYd3NIY9KqBsZR7nCSi_a9UYz04ou6Y17yca1HdO2kdctc4J7Hwkt26DJOkz1pO4OoXY3Fr8YNKaTkSmDfFscCXbw.png?link=true)

Normally when engineers talk about Conway’s Law, they’re thinking about how managers should organize their employees to yield better systems design. But the law goes the other way, too: The systems we work with determine the organizations we get.

## 2

In the dot-com-bubble era, the typical internet startup looked something like this:

- Executive team full of MBAs
- Raise $10M+ Series A right out of the gate
- Hire dozens of engineers
- Ship first product a year or two later

The internet was brand-new, so building even a relatively simple web service required significant investment. You had to build everything in-house.

After the bubble burst and the MBAs fled the valley, there was a long period of time during which not many startups were built. The cost of getting started was still high, and investors’ appetite to take on that risk was low. But as time passed, startup activity began to heat up again. There were two major catalysts. First, open source web frameworks like Ruby on Rails launched. This made it much easier for smaller teams to build products. Second, cloud computing became a thing. Instead of managing physical hardware, you could simply sign up for an AWS account and add more servers with a few keystrokes.

Because it became so much easier to launch a startup, more people did. The archetypal startup org became much simpler: just a handful of people, mostly technical. They were able to ship product quickly and iterate with customer feedback. Investors caught on and started writing smaller checks to this new kind of team. It worked. A whole new wave of startups with a new cultural DNA took over.

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2594/optimized_4HVZoVMu69IV-IolmRjUIPtcYFCt-a5fxhlEJ6Mmt7UO4O6w2yu59Zxp89r4dCPPHfKqUMRUK7YtUgKN5Nfqckv07395IFIDuKMoHrnnvN0c2HtOhUQLE3_Lh3cvAUS8Yh5iJfk48zZpAU3bx_K2xMA.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2594/optimized_4HVZoVMu69IV-IolmRjUIPtcYFCt-a5fxhlEJ6Mmt7UO4O6w2yu59Zxp89r4dCPPHfKqUMRUK7YtUgKN5Nfqckv07395IFIDuKMoHrnnvN0c2HtOhUQLE3_Lh3cvAUS8Yh5iJfk48zZpAU3bx_K2xMA.png?link=true)

## 3

You probably know where I’m going with this.

Just as cloud computing and open source unlocked “lean startups” in the 2010s, it’s likely that AI will unlock a new kind of organization in the 2020s.

Like lean startups, startups born in the AI era will start small. They will use open source and cloud computing to get off the ground quickly and iterate. But thanks to AI, they will stay smaller for much longer, and the most successful of them will achieve staggering scale with only a handful of employees. Stories like Instagram (13 employees, acquired for $1B) and WhatsApp (35 engineers supported 450 million users at the time of its $16B acquisition) will become more common. Perhaps we’ll even see companies with fewer than 100 employees go public.

More importantly, this new type of organization will be able to try out new kinds of ideas. It’s hard to imagine what those ideas will look like, but there is historical precedent for it. In the 1990s and early 2000s, there were relatively fewer of the types of weird and fun startups that emerged in the late 2000s and 2010s. Disappearing photo messages? Renting out your guest bedroom? Getting a ride with a stranger? These ideas all sounded strange at the time, but they turned into huge businesses. Weird ideas like these are much more likely to emerge in a world where it’s easy to get started. When experiments get cheaper, a wider variety of people can run a wider variety of experiments. The barrier to entry is already lower than ever, but now that AI is good enough to design interfaces, write code, and execute marketing campaigns, we’re going to see a whole new set of experiments come online.

But to really understand what the new wave of AI-native startups will look like, we need to understand exactly how startups will use AI to get more done with fewer people—and Conway’s Law will help us understand what effect that might have on organizational structure. 

## 4

Right now it’s difficult to predict what tasks AI will perform in the future. On the one hand, it’s exciting to think that AI might be able to do almost _anything_, but it feels guided more by magical thinking than by concrete observations. On the other hand, we can’t rule out the possibility that we’re riding such an extreme exponential curve of AI improvement that it doesn’t make any sense to extrapolate current capabilities very far into the future. Perhaps in two years we’ll have AI that makes today’s tools seem as dumb as rocks, and in 10 years we’ll arrive at the singularity and none of this will matter anyway.

My starting point for this essay’s purposes is to just do my best to project forward based on capabilities that either already exist or seem very close to existing. Even based on this unrealistically conservative starting point, I still think we’ll see pretty radical changes as the technology gets built into more and more tools and organizations have a chance to adapt.

So, with that in mind, what are people using AI for today?

There are a few functions that stick out as having the most practical effect on startup formation and scaling:

1. **Building products and features.** [Most engineers](https://newsletter.pragmaticengineer.com/p/ai-coding-tools) now use AI to write code, and they’re writing code significantly faster than before. This means you need fewer engineers; with fewer engineers there’s less need for complex org structures.
2. **Working with data.** When you want to understand something based on your data, you almost always need to write a script to transform the data into the format needed to create a graph or chart. This can take a human a lot of time, but AI is especially useful for this kind of work. I’ve used ChatGPT to generate dozens of one-off scripts. Extremely helpful! Companies like [Seek](https://www.seek.ai/) are automating this even further, letting anyone ask a bot a question in Slack and get data back.
3. **Learning new technologies.** This one is super important and will impact startups in two ways. First, there will be a whole new generation of technical founders that taught themselves to code using ChatGPT. Learning to code is an order of magnitude easier than it used to be. Second, experienced engineers can learn new programming languages and frameworks much more quickly than previously. Perhaps startups will now have less of a need to hire specialists than before.
4. **Testing your software.** You can build features and make changes to your code much more quickly when you have a test system that you can rely upon. Automated software tests catch problems much faster than human testers would. The problem is, writing tests takes a lot of time. AI is well suited to automating this process.
5. **Designing interfaces.** Companies like [Diagram](https://diagram.com/) and [Galileo](https://www.usegalileo.ai/) are helping designers work much faster, and helping non-designers generate better interfaces than they ever could before. These tools can help with everything from organizing naming the layers in your Figma file to creating full designs and interactive prototypes.
6. **Communicating with users.** Marketing copy and content of all sorts can be easily generated and improved with the help of tools like [Lex](https://lex.page/) (which I created), [Jasper](https://jasper.ai/), and [Copy.ai](https://copy.ai/). 
7. **Interpreting user feedback.** Most companies, even small startups, have a mountain of emails and feedback surveys that they struggle to turn into actionable information. LLMs are quite good at extracting themes and summarizing giant piles of text into something useful for a busy founder.
8. **Automating sales and customer support.** One of the biggest sources of headcount for most businesses is sales and customer support. Both essentially boil down to talking to people and answering their questions about your product, or taking actions on their behalf. All of this will get much easier with AI, and the humans that work in these functions will begin to act more like managers than line workers.

When you add all of this up, it’s clear that the role humans play in company building is going to change going forward. More and more business activity will be delegated to machines. Humans will set the initial vision then act as the glue that links everything together and keeps it running smoothly. 

Existing companies will adopt many of these techniques, but newer and smaller organizations will blaze the trail and discover what it looks like to fully embrace AI in order to scale. Following Conway’s Law, the types of products we get will change as the organizations that build them also change.

## 5

Obviously, no one knows how the future will play out. We’re at the earliest stages of understanding how AI can be applied to business and all we can do is squint. But the implications are significant, and the systems we design now will determine the organizations we get in the future. It’s up to us to make sure that the applications of AI in our businesses create a better future and not just a cheaper present.