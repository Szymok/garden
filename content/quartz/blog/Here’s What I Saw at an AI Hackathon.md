---
title: Here’s What I Saw at an AI Hackathon
type: blog post
tags: 
aliases:
---
I went to an [AI](https://every.to/c/ai-and-gpt3) hackathon and saw God. Well, an AI-generated version of God, anyway. 

It was a version of GPT-3 cosplaying as a deity and rigged to conduct a real-time verbal conversation. A projector displayed a visualization of it on a screen, and it could listen to your questions and respond with a god-like verbal inflection and tone. The program’s aim was to get you to commit to using AI for benevolent purposes, and it was about as impressive a demo for a weekend hack project as I’ve ever seen.

In his 1999 book [_The Age of Spiritual Machines_](https://www.amazon.com/Age-Spiritual-Machines-Computers-Intelligence/dp/0140282025)_,_ Ray Kurzweil wrote: “It is in the nature of exponential growth that events develop extremely slowly for extremely long periods of time, but as one glides through the knee of the curve, events erupt at an increasingly furious pace. And that is what we will experience as we enter the twenty-first century.”

Kurzweil is looking mighty prescient these days. That's why I ended up at this hackathon in the first place: I wanted to witness what it felt like to be there as we entered the knee of the curve. 

So I did something I’ve never done before for an Every article: I traveled to San Francisco to see what I could first hand, at AI Hack Week—an AI hackathon put on by my friend Dave Fontenot of [HF0](https://www.hf0.com/). (Dave is also an Every investor through his fund Backend Capital. [Evan](http://twitter.com/itsurboyevan) went too—his column on this is coming later this week.) They rented out a mansion in Alamo Square, and a bunch of programmers spent a week building projects to try to show what’s possible with this new technology wave. 

Here’s a report of everything that I saw.

## Setting the scene

I got there on Sunday, the day of the demos. Everyone had been hacking in the house—a three-story Victorian mansion—for a week. I arrived a few hours before the demos started, and  the whole place was filled with the taut energy of a high-school gym in the final 10 minutes of the SATs. 

People were hunched over laptops with their knees bouncing. VSCode and Google Colab were open on secondary monitors, and Dave was running around setting up for demos with a manic twinkle in his eye. As I sat and watched, someone who had previously been quietly working threw his hands up in the air. “It worked?” said his partner incredulously. “This is the fourth fucking time I’ve tried to call this script, but I think so!” 

The structure of the event was to hack for a week, demo for the public for a few hours, and crown a winner. One winner would be judged by human judges and the other by a GPT-3 bot based on the feedback it aggregated from everyone in attendance.

## The trends

**Art is in.** I’ve been to a number of hackathons over the years, and this was the first one with so many hacks that were basically art projects. Stable Diffusion is making it easier for geeks to make art—and I think that’s very cool. 

One interesting project was called Drip, which was [Lensa](https://prisma-ai.com/lensa) for video. Upload a few photos of your face and a video of you doing something (smiling, raising your eyebrows, saying a few lines of dialogue). After a few minutes it would generate a video of your AI avatar doing whatever action you recorded in the video. (This kind of tech is useful for a whole generation of what are called [VTubers](https://en.wikipedia.org/wiki/VTuber)—YouTubers who use a virtual avatar in front of their audiences. I know at least one investor who is actively interested in this as an investable category.)

Another hack, called Wand, was a sketching app that would allow you to draw anything on a virtual canvas—much like you could do with Procreate or Paper. Once you drew an image, you could prompt Stable Diffusion to replace your hand-drawn sketch with a higher fidelity AI-generated version:

[

![](https://pbs.twimg.com/profile_images/1564368706091761664/lBGR2LJy_normal.jpg)wand©@wand_app

Wand’s sketch feature now only modifies regions where you draw, so you can create amazing things one small edit at a time ✨ #conceptart

![](https://pbs.twimg.com/ext_tw_video_thumb/1604186017723924480/pu/img/VpSzoSJCEPzwElJ5.jpg)

![](https://every.to/packs/media/components/quilljs/tweet/play-285d23947da53f3cc0e095b225553e45.png)

December 17th 2022, 1:45pm EST

73 Retweets453 Likes



](https://twitter.com/wand_app/status/1604186054923210752)

Then there was WARP, an immersive audiovisual experience generated dynamically with user input. Users fed in a few adjectives about how they view the world today, and the system would generate a video of a virtual world projected onto a screen in front of them based on their inputs. The system would also generate a storyline that was voice-narrated by AI as users explored. 

The art projects weren’t limited to visual art. One of the top hacks, Biological Artificial Intelligence, was a Reverse Turing test: send a prompt to the project and it would return four completions. One of them was from GPT-3, and the other three were from human “chatbots” hidden behind a curtain. The challenge was to identify which one of the outputs was from GPT-3. Its creators demoed this in front of the audience—and the audience got it wrong. 

**Motion capture technology with ARKit is common.** A number of projects used the body position tracking included in Apple’s ARKit to help you control a digital version of yourself. 

One of my favorites was made by a friend of mine—someone I met 10 years ago at another hackathon and hadn’t seen until I bumped into him at this event. It involved jumping up and down to control a hacked together version of [Flappy Bird](https://flappybird.io/):

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2417/optimized_Pe4RDNhgqAMWQO7QnK5xQR8rWWfQWx6aMPde95e9TtZVNz6fDY526r0TpqpgOKnGZgzvE_dx08TxCebZ9pPJ8j0XrcbnGYGBwbqCHESlUU7mnK35E-IZ5omVlQ62iMI0o5TjHwdLmVjaZzqi_HTms_X53mFb4uP4KS_CtW5MWdm0Nm8b4awIY7AmMKkrMQ.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2417/optimized_Pe4RDNhgqAMWQO7QnK5xQR8rWWfQWx6aMPde95e9TtZVNz6fDY526r0TpqpgOKnGZgzvE_dx08TxCebZ9pPJ8j0XrcbnGYGBwbqCHESlUU7mnK35E-IZ5omVlQ62iMI0o5TjHwdLmVjaZzqi_HTms_X53mFb4uP4KS_CtW5MWdm0Nm8b4awIY7AmMKkrMQ.png?link=true)

I loved this. It was voted one of the top hacks and would make for an incredible party game.

In general, the idea that motion capture technology and body position tracking is sufficiently simple and works well enough for anyone to build an app like this over a weekend is mind-blowing—and will become more important as the usage of AI avatar versions of ourselves online becomes more common. (See the VTuber point above.)

**Copilot for everything.** There were a lot of hacks designed to put [Github Copilot-like](https://github.com/features/copilot/) functionality into solving different problems—probably the most expected trend. There was a journaling hack that would help you write and draw patterns from your thinking (a personal favorite of mine). There was an AI-assisted LinkedIn outreach bot that would automatically find similarities between you and whoever you were connecting with to help make recruiting easier. The list goes on.

## Overheard in AI

It’s always fun being in a house with lots of smart people because you hear things that you might not otherwise. Here’s a list of them. I don’t agree with all of them but they’re at least an interesting portrait of what at least some people _do_ believe. 

- **Google’s brain drain.** “All the best people I used to work with at Google Brain are now at OpenAI.”—AI Hack Week participant
- **People are expecting asymptotic gains for completion quality.** These technologies have quickly progressed from returning great results 30% of the time to 80% of the time,  but getting from 80% to 90% is going to be much harder. Ninety percent to 99% is even harder. The consensus is that it’s better to build for use cases where 80% is good enough; if you need 99%, you might have to wait awhile.
- **Startups building infrastructure on current models are in trouble.** A fine-tuned product on the current generation of models will be instantly outperformed by non-fine-tuned next-generation models. (For more, see [Evan’s piece](https://every.to/napkin-math/6-new-theories-about-ai).) It’s better to save your money and wait than build a sand castle on top of the current tech.
- **OpenAI can extract a 10% equity tax from any company that wants to win.** The company is currently giving access to GPT-4 for companies that they invest in through their fund [Converge](https://techcrunch.com/2022/11/02/openai-will-give-roughly-ten-ai-startups-1m-each-and-early-access-to-its-systems/) ($1 million check for 10%). Any company that has early access to GPT-4 has an advantage, and OpenAI gets to be kingmaker and tax collector. Maybe this is how research-driven companies developing models are actually going to make the most money. (Evan [wrote about this](https://every.to/napkin-math/6-new-theories-about-ai) as well.)
- **The future of programming is writing prompts.** The future of programming might be abstracted away from writing code at all. Instead, you ask GPT-4 in natural language to perform any operation (e.g., convert this file, perform a function that does the following). In one version of the future, GPT-4 generates the code and you run it yourself (which is currently possible with ChatGPT.) In another version, you don’t even need the code—you just rely on GPT-4 to produce the right answer for you. The possibilities are wild. 
- **A battle between AI’s dark side and light side is currently raging.** A contingent of people thinks OpenAI is moving too fast and supports [Anthropic’s](https://www.anthropic.com/) more closed-down, safety-first approach to building these technologies. On the other side, OpenAI proponents complain Anthropic can’t ship. (This attitude follows the dynamic I wrote about in “[Artificial Unintelligence](https://every.to/superorganizers/artificial-limits).”) Both organizations are filled with smart people trying to make tough decisions under a lot of pressure, and I'm curious which approach ends up working better.
- **Machines are getting smarter faster than humans are.** There’s a debate about whether prompt engineering is going to go away, and that debate is even occurring internally at OpenAI. Everyone thinks that with the new generation of models, you won’t need to be as clever in your prompt design. But there’s a big question about whether the more complicated, dynamically generated prompts are going to become obsolete. Even the people inside of these companies don’t know the answer yet.

## **My favorite hack**

In my opinion, the best hack didn’t use GPT-3. It was called MARVIN, and it used computer vision and a custom microscope to do automatic microscope analysis of asbestos samples. The team that built it [runs a company that makes the microscope](https://www.frontiermicroscopy.com/marvin/), and they spent the weekend seeing if they could build a computer vision algorithm that could accurately label its samples.

It turns out, it works! Big budgets are spent every year doing manual labeling of samples from microscopes—and being able to reliably do so without requiring humans is a big deal. 

## Most endearing hack (and hacker)

A Dungeons and Dragons fan dressed in a wizard costume built a hack to make playing the game more immersive. It lets you take a piece of art for something you might use in D&D—like a sword or a pair of boots—and generate other objects in the same art style using that one sample.  

## Top hacks

The human-judged hack winner was:

**Scribble Bots** by Olivia Li, Oana Florescu, Zain Shah. In this hack users were projected into a game using ARKit’s body position tracking technology and tasked with trying to get a cat out of a tree. The twist: you could prompt Stable Diffusion to generate an object that would help you get the cat (a net, a chainsaw, etc.). It was fun to see the combination of these two technologies.   

The AI-judged hack winner was:

**Church of GPT** by Colin Fortuner and Zain Shah. This was the hack I mentioned at the top where you entered a room and could talk to a “god” version of GPT-3. My colleague Evan will have more on it tomorrow.

Runners-up:

**Flappy.ai**—the Flappy Bird clone controlled by body movements mentioned above.

**UI for all AI**—a project that let you explore outputs from text and image models by mapping them on an infinite canvas. 

## Celebrity sleuthing

I figured out who [Roon](https://twitter.com/tszzl) is at this hackathon. (If you’re not extremely online enough to know who Roon is, he’s a pseudonymous AI researcher who shitposts on Twitter.) I was sitting at the demos minding my own business and scrolling through Twitter when he tweeted this:

[

![](https://pbs.twimg.com/profile_images/1572784789291401216/1WrwslUF_normal.jpg)roon (impersonator)@tszzl

hmmm

![](https://pbs.twimg.com/media/FkTT1kcVQAA8O01.jpg)

December 18th 2022, 7:50pm EST

30 Retweets707 Likes



](https://twitter.com/tszzl/status/1604640290064568320)

I’d heard rumors that he was going to be there so my antennae went up. Sure enough, I checked the rest of his timeline and saw this:

[

![](https://pbs.twimg.com/profile_images/1572784789291401216/1WrwslUF_normal.jpg)roon (impersonator)@tszzl

accelerate the timelines

![](https://pbs.twimg.com/media/FkS6WPPUEAA6Ysh.jpg)

December 18th 2022, 5:59pm EST

8 Retweets160 Likes



](https://twitter.com/tszzl/status/1604612263003901952)

Of course, being the nosy gossip that I am, I zoomed in on the first picture to try to see if he might be in the room and, if so, whether there were any clues to his location. I noticed the wooden edge on the floor to the right of his leg. And… I noticed the same wooden edge next to me:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2417/optimized_rIxXk1szM8Yam4ZhvLNUn2Fim2HqOaEmbfDwYNQfiUNB226-WlQnAT8m9UBjuRLo9tUCQPVuemA1m2JB4G8FzqbMki5bkYfz-64vtvqjpG6-epXXVyuC555zF5eb87Ngt9dxhPRFuWHad1Q1RPC_EwPMljB9rvBwaDoG0DmIFyV1MQgPfLAH62H0Rpad5A.jpeg)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2417/optimized_rIxXk1szM8Yam4ZhvLNUn2Fim2HqOaEmbfDwYNQfiUNB226-WlQnAT8m9UBjuRLo9tUCQPVuemA1m2JB4G8FzqbMki5bkYfz-64vtvqjpG6-epXXVyuC555zF5eb87Ngt9dxhPRFuWHad1Q1RPC_EwPMljB9rvBwaDoG0DmIFyV1MQgPfLAH62H0Rpad5A.jpeg?link=true)

_My leg next to the same wooden edge as Roon's leg._

I looked up to see a guy sitting in front of me with the same sweatpants as the ones in the picture. Bingo! For a brief moment I sat there basking in my Sherlock Holmesian powers of perception and enjoying the warm glow of knowing a secret that no one else around me knew—but that anyone else could’ve figured out.

A few minutes later I met him backstage. He was nice. Funnier on Twitter. I didn’t tell him about my internet sleuthing. (Sorry for doing that, Roon—your identity is safe with me.) 

## What comes next

There’s something great about the energy at hackathons. The point of these events isn’t necessarily to create something revolutionary—it’s to use the pressure of a deadline and a compressed time period to make something fun and new. This new generation of AI technology makes possible a level of quality and interestingness for these kinds of projects that was not available previously.

All the attendees felt the excitement of being at the knee of the exponential curve—but there was also some trepidation. No one knows exactly how this plays out, who will win, or what the consequences will be for the future.

But as far as I could tell, everyone is trying to make sure it goes well. I think that’s a good start.