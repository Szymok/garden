---
title: Day 1
Data: ""
type: event
---
# Abstrakt
# Opinia

# Notes

## Modele

- [[Bert]]
BERT (Bidirectional Encoder Representations from Transformers) model is typically trained in two phases, pre-training and fine-tuning.
BERT is pre-trained using two unsupervised tasks: Masked LM & Next Sentence Prediction (NSP)
![[images/Pasted image 20240308000422.png]]
- [[Electra]]
ELECTRA: PRE-TRAINING TEXT ENCODERS AS DISCRIMINATORS RATHER THAN GENERATORS
![[images/Pasted image 20240308000500.png]]
(A) Replaced token detection pre-training consistently outperforms masked language model pre-
training given the same compute budget. The left graph is a zoomed-in View of the dashed box.
![[images/Pasted image 20240308000515.png]]
(B) An overview of replaced token detection. The generator can be any model that produces an
output distribution over tokens, but a small masked language model that is trained jointly with the
discriminator is used. Though the model is structured like GAN, the generator is trained with
maximum likelihood. After pre-training, the generator is removed, and only the fine-tuning of the
discriminator (ELECTRA model) on the downstream łask is carried out.
- [[T5 Model]]
T5 Model (Text-to-Text Transfer Transformer)
![[images/Pasted image 20240308000603.png]]
T 5 is all about reframing all NLP tasks into a unified text-to-text-format where the input and output are always text strings The T5 model, pre-trained on C4 dataset, achieves state-of-the-art results on many NLP benchmarks.
- [[XLNET]]
![[images/Pasted image 20240308000655.png]]
(a): Content stream attention, which is the same as the standard self-attention. (b): Query stream attention, which does not have access to information about the content rzt . (c): Overview Of the permutation language modeling training with two-stream attention.
XLNet outperforms BERT on 20 tasks, often by a large margin, including question answering,  atural language inference, sentiment analysis, and document ranking
- [[GPT Model]]
![[images/Pasted image 20240308002129.png]]
Original GPT Architecture
![[images/Pasted image 20240308002144.png]]
Improved GPT Architecture by OpenAI
- ERNIE Model Enhanced Language Representation with Informative Entities
![[images/Pasted image 20240308002342.png]]
(A) The left part is the architecture of ERNIE. On the right is the aggregator for the mutual  ntegration of the input of tokens and entities. The information fusion layer takes two kinds of input: one is the token embedding, and the Other one is the concatenation of the token embeddings and entity embedding. After information fusion, ił outputs new token embeddings
and entity embeddings for the next layer.
![[images/Pasted image 20240308002350.png]]
(B) Modifying the input sequence for the specific tasks. The dotted rectangles are used as
placeholder to align tokens among different types of input. The coloured rectangles represent
mark tokens.
- MINILM
![[images/Pasted image 20240308003203.png]]
The The student is trained by deeply mimicking the self-attention behavior of the last Transformer layer of the teacher. In addition to the self-attention distributions, the self-attention value- relation transfer is introduced to help the student achieve a deeper mimicry. The student models are named as MINILM
The teacher model is trained using pre-training datasets which includes 160GB text corpora from English Wikipedia, BookCorpus, OpenWebText6, CC-News, and Stories. The teacher model is distilled into 12-layer and 6- layer models with 384 hidden sizes using the same corpora. The 12x384 model is used as the teacher assistant to train the 6x384 model.
Knowledge distillation is a promising way to compress large models while maintaining accuracy. Ił transfers the knowledge of a large model or an ensemble of neural networks (teacher) to a single lightweight model (student). Use cases for MINILM include question generation, abstract summarization, multilingual, and extractive question answering.

Question Answering
![[images/Pasted image 20240308003646.png]]
• Question Answering (QA) is about information retrieval whereby a question is posed to the system and a corresponding answer is replied in return. • The QA system does this by retrieving the answer from a given context such as text or document.
• Based on the inputs and output pattern, there are 3 different types of QA:
Extractive QA - which extracts answers from a text or document referred to as context.
Open Generative QA - that generates direct text using the context given
Closed Generative QA - generates answers without any given context
• Our focus would be on Extractive QA including examples of such datasets, and how to build custom datasets for extractive

SQUAD
SQuAD is a reading comprehension dataset that ontains questions posed by crowd workers on a et of Wikipedia articles. hese questions are answerable within a text aragraph known as context. he data format include: • version • data • title • paragraphs • qas • context There are 442 topics/domains and 442 paragraphs covered in the SQuAD json dataset

Question Answering Dataset
The Natural Questions is a large-scale corpus dataset from Google that target open-domain question answering system. Ił contains questions issued to Google search engines and long and short answers that were annotated from Wikipedia pages. The full dataset is 42GB including HTML of Wikipedia pages, and contains 3071< training examples, 8k examples each for testing and development respectively. The simplified version of NQ training dataset is 4GB
• Each example of NQ contains:
	• a document paragraph (document_text),
	• long answer candidates (long_answer_candidates),
	• question (question_text),
	• annotations,
	• document url , and
	• example_id.
• Training examples from the simplified version (vl .0- simplified_simplified-nq-train.jsonl.gz) are shown image on the left-side

Conversational Question Answering (CoQA) is a large-scale dataset for building conversational question-answering systems. The goal is to have a dataset that can measure the ability of machines to comprehend a text passage and correctly respond to a series of interconnected questions within a conversation.