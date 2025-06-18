# Data Privacy Pack

### Privacy Lifecycle

### Privacy Challenges

Regulation is complex and different in each country/region Potentially impacts all aspects of a business Needs attention at the detail level Complexity is overwhelming • Where to start? • How to develop a cost-effective, pragmatic approach?

The ODPi Data Privacy Pack provides best practices and related content to assist an organization in creating a data privacy program and implementing it across its operations. The contents are written for the organization's [privacy officer](https://odpi.github.io/data-governance/roles/privacy-officer-role.html). This is the person responsible for defining the privacy policies and ensuring they are implemented and followed.

Why is a data privacy program important?

Data privacy is being written into law in many regions today and this legislation/regulation is both broadening the scope of data covered and increasing the penalties for non-compliance. Being able to manage your organization so people's rights relating to their data is a basic capability for doing business in many places.

More importantly, but often forgotten, is that an organization's attitude to the wishes of its customers, employees and business partners over the processing of their data shows clearly in the way the organization operates. The actions taken to ensure data privacy lead to higher levels of customer service, better internal efficiency and a more respectful working environment for employees by creating transparency in the way the organization operates and eliminating unnecessary processing and storing of data.

The role of the privacy officer

The appointment of the privacy officer is the first step in acknowledging the importance of data privacy to the business. The privacy officer provides focus on the privacy challenge and assesses how well the organization is meeting that challenge, making adjustments as necessary. For it is indeed a challenge. Respecting privacy is likely to impact all aspects of the business, which means many of the roles within the organization will change.

What does having a data privacy program entail?

A data privacy program ensures that an organization processes data about an individual (or data that may identify an individual) with respect to that individual's wishes, whilst ensuring that minimal data is used and retained for this processing and it is properly protected so an unauthorized third party can not access it for their own purposes.

At a high level, it entails:

- Defining the scope of data about individuals that needs special treatment - this data is called personal data. Within the personal data category is sensitive personal data which requires additional care.
- Documenting where personal data is stored and used.
- Validating that all processing of personal data is with consent of the individual concerned (called the [data subject](https://odpi.github.io/data-governance/roles/data-subject-role.html)).
- Creating, implementing and enforcing governance controls that ensure any changes to the processing of personal data are recorded and validated according to the privacy policies.
- Providing capability within the digital service where the data subject can exercise their rights with respect to their data.

Getting started

An important place to start is to document and understand the [digital services](https://github.com/odpi/data-governance/blob/main/docs/digital-services) operated by your organization.

These digital services may be:

- to directly support your customers
- to support and manage your employees
- to enable collaboration with business partners
- to interact with legal and regulatory authorities (such as tax, data protection, ...)

These digital services are likely to identify the principle uses of personal data and where it is stored.

The effort required to build this inventory is going to be proportional to the size and complexity of the organization. This means it needs prioritization and can not be left to the sole effort of the data privacy officer.

The data privacy officer needs to appoint owners of digital services for each business area and have them create the inventory of their digital services since they will be responsible for the correct operation of the services.

Digital service lifecycle

Each digital service will follow a [lifecycle](https://github.com/odpi/data-governance/blob/main/docs/digital-services/digital-service-lifecycle.md) for how it is developed from an initial idea, to a working service and then operated and improved until it is decommissioned. Every organization will have its own definition of the lifecycle, but for purposes of illustration, the ODPi Egeria community PMC has developed a simple lifecycle that can be used to show how data privacy controls can be introduced.

Figure 1 shows this simple lifecycle with the data privacy controls overlaid. Details of these controls are described below the figure. the aim is to gather information about the data use in a digital service to demonstrate compliance as the digital service is developed in the most cost effective manner and use the associated processes to design, develop, deploy and operate the digital service in a way that ensures data privacy is respected.

​![https://github.com/odpi/data-governance/raw/main/docs/data-privacy-pack/digital-service-lifecycle-with-data-privacy-controls.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/data-privacy-pack/digital-service-lifecycle-with-data-privacy-controls.png#pagewidth)​

> Figure 1: The additional steps needed to manage data privacy throughout the digital service's lifecycle

- Data Value Assessment - review of the types of data expected to be captured and why they are needed
- Data Processing Impact Assessment - review of the likely impact on an individual (data subject) if their data is processed by this digital service.
- Data Processing Description - details of the data usage within a digital service.
- Data Processing Certification - certifies that the data processing description for the digital service accurately reflects its processing.
- Security Certification - certifies that the infrastructure where the digital service will run is compliant with the appropriate security standards.
- Contract including Minimal Data Processing Descriptions - these are the terms and conditions that an individual signs up to when they enroll with the service. This determines the legitimate interest of the digital service, which effectively states that this is the minimal use of personal data that the digital service needs to operate.
- Data Use Report shows the audit report of the data use for the data subject (and/or data controller if this service is a data processor.)
- Personal Data Management - provides the controls for a data subject to exercise their rights.
- Data Export - Data subjects have the right to request their data stored by your digital services.
- Suspicious Activity Report - describes some activity that needs investigating.
- Data Breach Report - describes a data breach - what happened and the steps to recover from it.
- Data Breach Impact Assessment - covers the impact of the data breach on the data subjects involved.

### Personal Data Categories

[ODPi - Personal Data Categories.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/d6521fdd-e8cf-41a0-9c2d-e58b2178ad0c/ODPi_-_Personal_Data_Categories.pdf)

[ODPi - Privacy User Stories - 2nd November 2017.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/84040ebd-c3aa-451d-9212-818f58500c4e/ODPi_-_Privacy_User_Stories_-_2nd_November_2017.pdf)

# Example

Introducing Coco Pharmaceuticals

Coco Pharmaceuticals (CocoP) is a fictitious organization that is used by the Egeria team to illustrate different open metadata and governance scenarios.

This company is vertical integrated, with its own research, manufacturing, sales and distribution services. Its business model is focus on supplying unique targeted medication for cancer suffers. In recent years, their focus has been in personalised medicine - where a patient's genome is used to determine the right course of treatment. This has created a massive growth in the amount and the sensitivity of the data they hold.

Coco Pharmaceuticals has research partnerships with universities in order to collaborate on further research.

History

The company has grown from a small group of researchers working together in a spirit of open communication, collaboration and trust to a medium-sized successful pharmaceutical company that has a small range of very successful drugs in the market and many others in development – three of which look very promising.

Their investment in IT had traditionally been focused on the automation of the manufacturing process due to the growth in demand for their most successful drugs. However, a recent attempted fraud in their supplier network sparked a company-wide investigation into their operations. The result was the appointment of Jules Keeper as their Chief Data Officer (CDO). Jules' mission is to improve the organization's protection, management and use of data.

Jules instigated a company-wide data strategy focused on "better data for everyone". This was underpinned by an data governance program that ensured their regulatory compliance as well as providing for data management, protection and access.

Through Jules' influence:

- Faith Broker, their HR director, was also appointed as their Privacy Officer.
- Ivor Padlock, their security officer was teamed up with Gary Geeke, their IT infrastructure expert to be responsible for cyber security.
- Erin Overview, their IT Architect, was given greater prominence in the organization since her deep expertise is in information architecture. She was able then to get some investment in master data management, a data lake for the researchers and metadata management tools.
- Individuals throughout the business were appointed as data owners. For example, Tom Tally from Finance was appointed the data owner of the accounts data, and Tessa Tube, a Lead Researcher, became the data owner for their clinical research data.
- Jules also appointed data stewards for critical data sets. Tanya Tidie, their clinical records clark, became a data steward for all patient records maintained during clinical trials.

The scenarios

The [scenarios](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios) follow the Coco Pharmaceutical personas as they work to set up their new roles and meet the challenges their new responsibilities bring. Examples include:

- Defining the data strategy
- Setting up the data governance program
- Investigating suspicious activity
- Receiving patient data from a hospital
- Developing a new digital service using personal data

### Building the governance team

When [Jules Keeper](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) joined Coco Pharmaceuticals as the CDO, he soon realized that the execution of their business strategy to move to personalized medicine was being held back by their operational practices. Some of this was related to their use and management of data (his responsibility to fix of course), but there were broader issues relating to security, IT infrastructure management, software development and their corporate governance. He realizes that he can not do this alone and calls his colleagues together to discuss how they proceed.

They agree to divide the work amongst themselves, using the traditional governance domains to divide out the responsibilities, but maintaining the governance information using open metadata (Egeria) to be able to coordinate their work across the governance domains.

The result is as follows:

- [Jules Keeper](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) becomes the CDO and head of the DATA governance domain.
- [Ivor Padlock](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/ivor-padlock.md) becomes the CISO and head of the SECURITY governance domain.
- [Faith Broker](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/faith-broker.md) becomes the CPO and head of the PRIVACY governance domain.
- [Reggie Mint](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/reggie-mint.md) as the CFO becomes head of the CORPORATE governance domain.
- [Gary Geeke](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/gary-geeke.md) as the infrastructure lead becomes head of the IT INFRASTRUCTURE governance domain.
- [Polly Tasker](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/polly-tasker.md) as the most senior software manager becomes had of the SOFTWARE DEVELOPMENT governance domain.

[Erin Overview](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/erin-overview.md) is also appointed the CDO for IT systems. This makes her a deputy for Jules and recognizes her role in ensure data is properly managed by IT.

ODPi Egeria includes a sample client ([docs](https://github.com/odpi/egeria/blob/main/open-metadata-resources/open-metadata-samples/access-services-samples/governance-program-client-samples/governance-leadership.md), [code](https://github.com/odpi/egeria/blob/main/open-metadata-resources/open-metadata-samples/access-services-samples/governance-program-client-samples/src/main/java/org/odpi/openmetadata/accessservices/governanceprogram/samples/GovernanceLeadershipSample.java)) that issues the appropriate API calls to set up this team through the [Governance Program OMAS](https://github.com/odpi/egeria/blob/main/open-metadata-implementation/access-services/governance-program/README.md) Governance Leadership Interface.

### Creating a data governance program

[Jules Keeper](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) is the Chief Data Officer (CDO) for Coco Pharmaceuticals. He is responsible for improving the management and use of their information. This includes the information governance program.

When Jules joined Coco Pharmaceuticals the rules for handling data were documented on an internal website. They defined how researchers should manage data for clinical trials in order to be compliant with FDA regulations.

A recent fraud incident with a bogus supplier and demands to use more data by the clinical research teams showed that the company should have a more focused approach to information governance - and so Jules was appointed CDO.

In this scenario we walk through the steps that Jules takes to set up a governance program for Coco Pharmaceuticals. This includes:

- Defining classification schemes for information, technology capability, roles and activities.
- Defining policies and rules that specify how information of each classification should be handled when working with a particular classification of technology or performing a certain classification of activity in a particular context.
- Making the governance program actionable by assigning governance roles and responsibilities, providing education and commissioning new IT projects to improve the automation of the information landscape.

### Defining a glossary

A [glossary](https://github.com/odpi/data-governance/blob/main/docs/common-data-definitions/anatomy-of-a-glossary.md) is a collection of common data definitions, typically focused on defining the meaning of data. The process of building a glossary is iterative and collaborative. It switches between creating a overview of the content and then drilling down into the specifics, increasing the precision, before returning to review the overall consistency of the definitions.

Often organizations begin with a simple exercise to identify the broad topics that need to be covered. These broad topics are called Subject Areas. In an earlier scenario, [Erin Overview](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/erin-overview.md) created an initial list of [Subject Areas for Coco Pharmaceuticals](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/README.md).

In this scenario, Erin is working with [Faith Broker](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/faith-broker.md) the director for human resources on the employee data subject area.

What are the initial list of key concepts?

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/initial-term-list.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/initial-term-list.png#pagewidth)​

> Figure 1: Defining the initial list of terms

Drilling down to fill out more information

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/work-location.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/work-location.png#pagewidth)​
> Figure 2: Refining Work Location

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/postal-address.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/postal-address.png#pagewidth)​

> Figure 3: Redefining Postal Address

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/manager.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/manager.png#pagewidth)​

> Figure 4: Defining Manager

### Defining how continuous analytics is achieved

Todo

### Defining how to create data-enabled employees

#Todo

### Defining key information supply chains

#Todo

### Defining the need for multi-faceted governance

#Todo

### Defining the new systems architecture overview

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-new-systems-architecture-overview/data-driven-systems-architecture.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-new-systems-architecture-overview/data-driven-systems-architecture.png#pagewidth)​

> Figure 1: Proposed data driven systems architecture

### Defining Subject Areas

[Jules Keeper](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) asks [Erin Overview](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/erin-overview.md) for a list of the key subject areas managed by the IT systems today.

To be sure she understands, Erin asks Jules what he means by “subject area” - Jules says - the different topics of data.

To Erin “subject area” sounds like a “data domain” and Jules agreed. Data Domain is probably a more formal name - but the term “domain” is used in different contexts and that can be confusing to people who are new to the concepts around a data-driven enterprise. For example, it is used in the term “Governance Domain” which is a focus area for governance such as data, security or privacy. He tends to use the term subject area since it seems to be easier for people to remember.

Erin then asks how granular should they go in defining the subject areas - for example, “Address” is a subject area but very fine-grained. Alternatively, they could start with some broader subject areas (say about 10) that would make it easier to engage the other teams and help find business owners.

Jules agrees they are going to need the very granular subject areas eventually but to get them started, the broader, business oriented subject areas are more useful. He also suggests that rather than focusing on the whole business, she should emphasises the areas of the business that are most impacted by the move to personalised medicine - such as patient, treatments and sales.

Erin enlists [Peter Profile](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/peter-profile.md) to help.

Considering the Enterprise Information Model

Peter reminds Erin that they worked on an enterprise information model (EIM) a few years ago which may be a useful input.

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/coco-pharmaceuticals-eim-data-domains.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/coco-pharmaceuticals-eim-data-domains.png#pagewidth)​

> Figure 1: Data domains from Coco Pharmaceutical’s existing EIM

The EIM turned out to be a good reflection of today’s business since there is a clear separation between the data used in the product development and research work that [Tessa Tube](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/tessa-tube.md) leads, the sales process, manufacturing and finance.

They compared this model with the catalog of systems that [Gary Geeke](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/gary-geeke.md) has created as part of his new role as the IT Infrastructure governance leader.

Again, there was a surprisingly straight-forward mapping between the systems owned by each part of the business and the subject areas. Erin concluded that there was little data sharing going on today beyond the common use of the product catalog and customer list by Sales and Distribution from Manufacturing. The finance teams had the biggest overlap with the other parts of the business because income and expenses all flowed to them.

Erin guessed that personalised medicine may well increase the data sharing between the research and development teams and the clinicians in the hospitals. She was not so sure if sales and manufacturing were affected.

View from manufacturing

Erin spoke to [Stew Faster](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/stew-faster.md) from manufacturing. He has been looking at modernization of the manufacturing line to make it ready for their new lines of drugs. He said their future plant would use a lot more data and automation since they needed to be able to manufacture much smaller batch runs, maybe even down to a single patient dose for some drugs.

He said today, once a new drug is approved, they effectively get a recipe from the research team and works with their procurement team to find suppliers. He then designed the manufacturing and quality control processes. Big batches of each drug are manufactured, a small percentage is pulled to one side for quality testing and once approved, the rest is packages and distributed to the customers (typically hospitals).

Going forward he sees them needing to support a much broader list of manufactured products, with short lead times to first put a manufacturing process into place and then to create small batches on demand. The distribution process needs a big overhaul as the resulting drugs need to be sent to the right clinician in the right hospital for the right patient at the right time. This is very different from a regular delivery of a fixed order to each hospital.

View from Sales

Erin then goes to talk to [Harry Hopeful](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/harry-hopeful.md) from Sales. Harry is an experienced sales person and knows everyone in the research hospitals where Coco Pharmaceuticals has their main business. Erin asked how the sales process would change. He said that today he works with the consultants and persuades them of the value of the drugs offered by Coco Pharmaceuticals. Harry then works with the consultants to put pressure on the procurement department to approve the desired products. Procurement then orders batches of the drugs as the consultants use up the stock. Harry gets paid for each order that comes in.

Prior to talking to Erin, Harry had expecting that much of the same selling process will continue as before. However he realises that the orders will need to come in in smaller batches, based on treatment need. Coco pharmaceuticals needs to begin working with the procurement teams at the hospitals now to change the approval process for orders since they can not be delayed for the standard procurement process. At the same time the procurement teams will need some role to control costs so he imagines he will be more involved with them as they jointly monitor usage over time.

Conclusions

Erin is getting a picture from these conversations that the notion of Patient, Clinician and Treatment needs to become more prominent in the subject areas, and this is linked to the clinical measurements, symptoms and outcomes. The clinical teams focus on these to determine the treatment for the patient. A prescribed treatment configures the desired product which drives manufacturing. Finance produces the invoices for the product orders and pays the suppliers as they deliver raw materials. But the stock management becomes more critical as manufacturing is driven on a patient demand basis.

Erin is surprised how much shifting her focus towards the needs of their business transformations has affected the subject area model. Her original EIM matched the organisational structure of the business. It challenged nothing in the status quo. The new subject area model has drawn out the most important subject areas for the business that need focus and attention now.

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/coco-pharmaceuticals-core-subject-areas.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/coco-pharmaceuticals-core-subject-areas.png#pagewidth)​

> Figure 2: Coco Pharmaceutical’s new candidate subject area model

### Defining the data strategy

The fundamental question behind any data strategy is:

```
    How can data assist the organization in delivering its business strategy?

```

The business strategy may be to move into a new geography, radically change its operations to meet competitive challenges or to develop a new product line. Whatever the direction of the business strategy, there is always an element of internal business transformation and a need for information about the new opportunity that the business strategy embraces.

[Jules Keeper](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) was hired by Coco Pharmaceuticals to drive their data strategy.

During his first few weeks at Coco Pharmaceuticals, Jules spent his time understanding the workings of the business and the impact of the new business strategy of moving towards personalised medicine.

To date they have developed one new personalised treatment that is designed for patients with a specific genomic marker. The impact on the business was as follows:

- The research cycle was quicker since developing proof of a drug's efficacy was simpler.
- Since the new drug was only designed for a subset of patients, the hospitals are not willing to order big batches of the drug. They are looking for a more on-demand ordering model.
- The manufacturing team realized that they will need to operate a hybrid model where all existing drugs are manufactured according to the existing batch processes, and the new drugs need more agile planning, manufacturing and delivery processes. This has a knock on effect to their suppliers and finance.

As Jules dug deeper he noticed that the exchange of data between different parts of Coco Pharmaceuticals was pretty minimal, focused on the regularly scheduled processing of orders, manufacturing and deliveries. Going forward, Jules could see that key people in Coco Pharmaceuticals are going to need accurate real-time data that helps them manage a dynamic and constantly changing business.

In particular:

- The physicians and supporting medical staff will need interactive support for drug choices based on their patients' characteristics and responses.
- The new team that works with the hospitals supporting new orders, validating results, liaising with manufacturing and research will need up to date information about the clinicians and patients under treatment. They need to be supported by predictive analytics driven by the treatment plans and patient trends.
- Measurements from existing treatments could provide active data to supplement the research team as they look for new opportunities to cure different cancers for a broader range of patients.
- Finance need up to date information on suppliers orders / payments, patients orders / payments and future predictions so they can manage the cash flow.
- The board need to be able to understand which drugs are delivering profit, where the gaps are so they can direct research and sales/marketing.
- Manufacturing need details of the drug requirements coming from the active treatment plans so that they can plan and drive the manufacturing processes.

The purpose of the data strategy is to identify and plan how data can transform business to meet its strategic goals.

In Coco Pharmaceutical's case they need to reduce cycle times across business. Data needs to be exchanged between different parts of the business as triggers for the different life cycles. New types of data needs to be collected, managed and used - all of this this implies an investment in new systems.

Jules realizes there is a lot to do! He creates a simple framework that organizes what needs to be done into understandable chunks that can be delivered and measured incrementally. Figure 1 shows his first attempt.

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-the-data-strategy/data-strategy-framework.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/defining-the-data-strategy/data-strategy-framework.png#pagewidth)​

> Figure 1: Data Strategy Framework

He feels the names of the framework could be improved, but it essentially covers the major building blocks:

- Common data definitions - in order for Coco Pharmaceuticals to share data across its organization and with its business partners, it needs shared agreements on what this data means, how it is formatted, expected quality and how it can be used. This information is managed in a metadata catalog and should be used to configure the tools and IT systems used by the organization.
- Data driven systems architecture - the IT systems need to evolve to support the new data and process requirements. They need to be integrated so that data flows between them in real-time enabling the new business model to execute effectively.
- Optimized information supply chains - the flow of data between the systems needs to be understood, optimized and managed so that any failure is quickly detected, located and resolved without affecting the service offered to the hospitals.
- Authoritative sources - provides trusted sources of key information.
- Continuous analytics - analytics is core to the discovery and validation of personalized medicine. In addition, the agile nature of the corresponding business operations needs analytics to automate and monitor the flow of orders, manufacturing, delivery of drugs and payments.
- Data enabled employees - the managers of each part of the business, and the board, needs access to up-to-date information about how their business is operating. They need to be able to use data to continuously evolve and expand the rand of treatments on offer.
- Multi-faceted governance model - finally, their governance model can not just cover data - their transformation needs and integrated governance program that covers data, infrastructure, privacy, security and corporate operations. Jules needs to talk to the board about a comprehensive approach. He envisages a team of governance leaders, each responsible for their own governance domain, but working together in a coordinated response.

Jules shares this framework with the board and his peers. They are cautiously supportive but want to see more detail before committing to it. The company has prided itself in its informality, collaboration and trust and this seems to be moving away from this model. The board understands that things need to change but they created Coco Pharmaceuticals as a startup and is it very dear to them. They have no experience of how to scale it up to meet the new business needs. The effort looks expensive and is likely to divert investment from pure research which is also something that they are concerned about.

Jules is not discouraged by the feedback - in fact, he is pleased that his colleagues have openly expressed their concerns so he can work with them to ensure the right compromises between evolution and tradition are maintained.

He begins to work on the next level of detail:

- [Planning for common definitions](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/planning-for-common-data-definitions)
- [Identifying authoritative sources](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/identifying-authoritative-sources)
- [Defining the new data-driven systems architecture overview](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-new-systems-architecture-overview)
- [Defining the key information supply chains](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-information-supply-chains)
- [Defining what is meant by continuous analytics](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-continuous-analytics)
- [Defining how employees can be data-enabled](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-data-enabled-employees)
- [Defining why a multi-faceted governance model is needed](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-multi-faceted-governance)

---

### Identifying authoritative sources

An authoritative source can be thought of as the "best" source of a particular type of information. Authoritative sources may come from trusted third parties or be explicitly identified and managed within the organization.

[Jules Keeper](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) asks [Erin Overview](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/erin-overview.md) to work with [Gary Geeke](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/gary-geeke.md) to build a list of authoritative sources for the business.

Erin and Gary have two resources to work with:

- Gary has a catalog of all of Coco Pharmaceutical's systems
- Erin has the [subject area definitions](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas)

For each subject area, they need to identify one or two systems that could act as an authoritative source for that type of information.

They need to consider:

- Is this a strategic system that has a long term future?
- Is this system able to take on additional workload?
- Does this system support APIs and related mechanisms to allow it to supply data to other systems?
- Is this system kept up to date with regular feeds of information?
- Could this system support the work of a steward to resolve conflicts and fix values in the data?

The result of the exercise shows where there are critical gaps in the information landscape that need further investment. This may be updates to the identified systems, or an investment in new systems. The second is more likely in areas that are new for the business. For example, when Erin and Gary looked at the area of patient details they realized they do hold a lot of patient data but it is locked in files received from the hospitals as part of each clinical trial. Coco Pharmaceuticals has no capability to actively maintain information about the patients they are treating through the personalized medicine services.

On the other hand, for employee data, they do have a single system for managing information about employees. This also has the maintenance capabilities and is currently used to automatically update their LDAP (security) directory.

### Investigating suspicious activity

The challenge

[Sally Counter](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/sally-counter.md), a payment clerk in Finance, spotted irregular payments being made to some suppliers. She reported it and the finance and sales teams are engaged in an investigation into these payments and related activities ...

The team

- [Sally Counter](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/sally-counter.md)
- [Tom Tally](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/tom-tally.md)
- [Reggie Mint](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/robbie-records.md)
- [Sidney Seeker](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/sidney-seeker.md)
- [Harry Hopeful](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/harry-hopeful.md)

The process

more to come

---

### New digital service for clinical trials scenario

#Todo

### Planning for common data definitions

Part of [Jules Keeper's](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/jules-keeper.md) [data strategy](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-the-data-strategy) includes creating common data definitions. The board of Coco Pharmaceuticals asked for more details on what this means, how they would be defined and used as well as the likely cost.

Working with [Erin Overview](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/personas/erin-overview.md), they seek to outline the following questions:

- What is a [common data definition](https://github.com/odpi/data-governance/blob/main/docs/common-data-definitions/README.md)?
- How does it help the business?
- How are common data definitions created and managed?
- How are common data definitions used in analytics tools, such as those used by the data science teams?
- How are common data definitions use in the IT systems?

For Coco Pharmaceuticals, Jules and Erin decide they will:

- Define the broad topics of data that are key to personalised medicine - these are called subject areas.
- For each subject area, they will define a glossary term for each of the key concepts.
- The glossary terms will be organized into categories and linked together.
- The glossary terms will then be classified to define how data of that type should be governed.

Figure 1 shows the over all process for using these common definitions.

​![https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/planning-for-common-data-definitions/using-common-data-definitions.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/coco-pharmaceuticals/scenarios/planning-for-common-data-definitions/using-common-data-definitions.png#pagewidth)​

> Figure 1: process for using common data definitions

### Receiving patient data from a hospital

#Todo

# Common data definitions

Common data definitions

Common data definitions (also known as the common information model or CIM) create a shared understanding of data. They are critical where data is to be shared between different systems and or groups of people.

Typically the common data definitions consist of:

- Names and descriptions for concepts described by the data.
- Relationships between these concepts.
- Classifications of the concepts to indicate how they are used.
- Definitions of the valid data values for specific concepts.
- Preferred logical and physical data formats for storing data about these concepts.

The common data definitions are managed in a metadata catalog. The core definitions that cover the meaning of data are described in one or more [glossaries](https://github.com/odpi/data-governance/blob/main/docs/common-data-definitions/anatomy-of-a-glossary.md).

Governance classifications may be added to these definitions which in turn link to governance requirements. This determines how data that is linked to these common definitions should be governed.

Tools used by the organizaton to, for example, create new data stores, data visualizations, or APIs, or analytics models are pre-populated with concrete data definitions by automated tool bridges. Each tool bridge extracts the relevant definitions from the metadata catalog, generates the concrete definitions and loads them into the tool. Where possible, these definitions include tags that link the definitions back to the common data definitions.

When the new IT capability is deployed to test and production environments, the tool typically produces a packaged version of the concrete definitions with their tags that point to the metadata. The dev-ops pipeline that deploys the artifact reads the tags and ensures that any specific governance requirements for the specific type of data that is being used are met.

Once the new capability is running, the IT infrastructure that is supporting it can be using the tags, and related metadata deployed to the production environment to manage the governance related to the capability, and, where the capability is also using metadata directly, to drive the function and data delivered to its consumer.

Figure 1 summarizes this process for using these common definitions.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/using-common-data-definitions.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/using-common-data-definitions.png#pagewidth)​

> Figure 1: process for using common data definitions

The four boxes in figure 1 show the activity around managing the common definitions and below them are the tools and processes using them. Typically all 4 activities are running continually as the scope of the common definitions typically starts small and expands as new projects consume them.

The harvesting activity is locating and extracting content for the common definitions from existing sources. These may be definitions created by the organization for previous projects or definitions from external sources. They need to be validated and and transformed so they can be injected into the catalog used to manage the definitions.

The managing activity describes the efforts of the subject matter experts to import, create and maintain the common definitions in a catalog. Typically the common definitions are organized into [subject areas](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/README.md) (topics) and the appropriate subject matter experts are assigned to each subject area.

The consuming activity is where the common definitions are transformed and made available in tools that are being used to build or maintain new capability.

The delivering value activity is where the common definitions are beign used to deliver business function and governance in the production systems.

### Anatomy of a glossary

A glossary is a collection of common data definitions, typically focused on defining the meaning of data. An organization may have multiple glossaries that represent different collections of definitions, each reflecting a scope of use or a source of the definitions.

Each glossary defined should have a well defined content and an owner, who is responsible for ensuring that the contributed content meets the needs of its consumers.

Figure 1 shows the typical content of a glossary.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-structure.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-structure.png)​

> Figure 1: Elements within a glossary

The glossary terms describe a single concept. The glossary categories are like folders to organize the glossary terms. Glossary terms that are related to one another can be linked together with term relationships. There are different types of term relationships that help to pin down how the glossary terms are related. Finally there are classifications that can be linked to the glossary itself, the glossary categories or the glossary terms. The classification provide more information about the kind of element it is connected to, or its intended use.

The sections that follow provide more information about these concepts and how they are used. There is further information on how to define a glossary in the [Coco Pharmaceuticals scenarios](https://github.com/odpi/data-governance/blob/main/docs/coco-pharmaceuticals/scenarios/defining-a-glossary/README.md).

Inside a glossary term

At a minimum glossary term has a name - this is the concept it describes, and a short description that explains at a high level what this concept means. This short description should distinguish it from other terms.

For some glossaries, this may be all that you need. However, if this is an important term and the consumers of it will want to know much more, then the glossary term can be built out to include a more detailed description and supplementary information such as:

- links to further information
- images of the concept
- descriptions of its usage
- examples of its use.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/anatomy-of-a-glossary-term.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/anatomy-of-a-glossary-term.png)​

> Figure 2: Contents of a glossary term

The glossary term may then be organized into one or more categories, classified and linked to related terms.

Glossary categories

Glossary categories provide a folder structure for organizing glossary terms. A category belongs to a single glossary but it may contain glossary terms both from its local glossary and other glossaries. Categories can also be nested inside a single parent to create a folder structure.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-categories.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-categories.png)​

> Figure 3: Glossary categories

Glossary term relationships

Glossary terms can be linked together in pairs to show that they are related in some way.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-term-relationships.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-term-relationships.png)​

> Figure 4: Glossary term relationships

The relationships between glossary terms are divided into two groups:

- Relationships that show how the meanings of terms are related. This includes:
    
    - RelatedTerm is a relationship used to say that the linked glossary term may also be of interest. It is like a "see also" link in a dictionary.
    - Synonym is a relationship between glossary terms that have the same, or a very similar meaning.
    - Antonym is a relationship between glossary terms that have the opposite (or near opposite) meaning.
    - PreferredTerm is a relationship that indicates that one term should be used in place of the other term linked by the relationship.
    - ReplacementTerm is a relationship that indicates that one term must be used instead of the other. This is stronger version of the PreferredTerm.
    - Translation is a relationship that defines that the linked terms represent the same meaning but each are written in a different language. Hence one is a translation of the other. The language of each term is defined in the Glossary that owns the term.
    - IsA is a relationship that defines that the one term is a more generic term than the other term. For example, this relationship would be use to say that "Cat" IsA "Animal".
- Relationships that show how terms are typically used together.
    
    - UsedInContext links a term to another term that describes a context. This helps to distinguish between terms that have the same name but different meanings depending on the context.
    - HasA is a term relationship between a term representing a SpineObject (see glossary term classifications below) and a term representing a SpineAttribute.
    - IsATypeOf is a term relationship between two SpineObjects saying that one is the sybtype (specialisation) of the other.
    - TypedBy is a term relationship between a SpineAttribute and a SpineObject to say that the SpineAttribute is implemented using a type represented by the SpineObject.

Glossary classifications

The contents of a glossary can be further described using classifications. These are descriptions that tell the consumer more about how the glossary is defines and used.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-classifications.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/glossary-classifications.png)​

> Figure 5: Glossary classifications

There are different types of classifications for the glossary itself, each glossary category and each glossary term.

Classifications for a glossary

A glossary may be classified to describe the way its content should be used.

- Taxomony means that the same term is not present in more than one of its categories. This is used in glossaries that are designed to provide an organizing structure for other types of informaiton, such as a document library.
- Canonical Vocabulary means the glossary only includes terms that have a unique name. Thus there is only one defnition for any concept.

Classifications for a category

- Subject Area means the category describes an important topic area for the organization. Typically subject areas have owners and are managed carefully. To understand more about subject areas and how they are used see the [Coco Pharmaceuticals scenarios](https://github.com/odpi/data-governance/blob/main/docs/docs/coco-pharmaceuticals/scenarios/defining-subject-areas/README.md).

Classifications for a term

- ActivityDescription is a classification used to indicate that the term describes a verb, or an activity. Most term definitions are nouns, they describe concepts or things. However, it is useful to be able to define the meanings of particular activities in the glossary. The ActivityDescription classification highlights when a term describes such an activity. This classification can be further refined with a specific activity type:
    
    - OPERATION - describes a function or API call
    - ACTION - describes a governance action that results from evaluating governance rules.
    - TASK - describes a task performed by a person.
    - PROCESS - describes a process, which is a series of steps that are performed in a defined order.
    - PROJECT - describes a type of project.
    - OTHER - describes some other type of activity
- AbstractConcept means that the term describes an abstract concept.
    
- DataValue means that the glossary term describes a valid value for a data item.
    
- ContextDefinition indicates that the term describes a context. Contexts define where a specific definition is used.
    
- SpineObject indicates that the term represents a type of object (such as a person, place, thing).
    
- SpineAttribute indicates that the term represents a type of attribute or data field.
    
- ObjectIdentifier indicates that a term is typically is a type of attribute or data field that is an identifier for an object.
    

### Open metadata for common data definitions

The [ODPi Egeria project](https://odpi.github.io/egeria/) provides a comprehensive set of [open metadata types](https://odpi.github.io/egeria/open-metadata-publication/website/open-metadata-types/) for managing [common data definitions](https://github.com/odpi/data-governance/blob/main/docs/common-data-definitions/README.md). These types provide a common language and format for exchanging these definitions between tools and metadata repositories. Each tool/repository provides a mapping to the ODPi Egeria types and Egeria manages the exchange of metadata between these parties.

The glossary

The glossary is at the heart of the common data definitions. Figure 1 shows that the glossary contains glossary terms. Each glossary term describes a concept used by the business. It is also possible to link two glossary terms together with a relationship. The relationship may describe a semantic relationship or a structural one.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-glossaries.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-glossaries.png)​

> Figure 1: Glossaries for describing concepts and the relationships between them

See [anatomy of a glossary](https://github.com/odpi/data-governance/blob/main/docs/common-data-definitions/anatomy-of-a-glossary.md) for more information about creating glossaries.

Data classes

Data classes provide definitions of

- Logical types
- How to detect them in data
- Preferred implementation types for different technologies

Data classes can be linked together in part-of and is-a hierarchies. For example, Date, Social Security Number, Credit Card Number.

Each data class is linked glossary terms to show how data with that meaning should be represented. This helps to create a candidate list for glossary term assignment recommendations based on the data values stored if they can be matched to a data class.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-data-classes.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-data-classes.png)​

> Figure 2: Data classes for describing the logical data types and implementation options

Schemas

Schemas document the structure of data, whether it is stored or moving through APIs, events and data feeds. There is a schema type that describes a reusable schema. It may be a single primitive field, a set of values, an array of values, a map between two sets of values or a nested structure. The nested structure is the most common. In this case the the schema type has a list of schema attributes that describe the fields in the structure. Each of these attributes has its own schema type that may be primitive, array, set, map or structure in turn.

Figure 3 shows a simple structure schema.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-schemas.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-schemas.png)​

> Figure 3: Schemas for documenting the structure of data

Schemas and assets

Since schema types describe the structure of data, they can be attached to assets to indicate that this asset's data is organized as described by the schema. A single schema type can be attached to multiple assets to show these asset all have data with the same structure (but not necessarily the same data values).

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-assets-and-schemas.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-assets-and-schemas.png)​

> Figure 4: Assets for documenting the organization's important data assets

Connectors and connections

Assets are accessed through connectors. A Connector is a client library that applications use to access the asset across the network. Typically there is a specialized connector for each type of Asset. Sometimes there are multiple connectors to access a specific type of asset, each offering a different interface for the application to use.

Instances of connectors are created using the Connector Broker. The connector broker creates the connector instance using the information stored in a Connection object. These can be created by the application or retrieved from the metadata repositories.

A connection object is stored in the metadata repository, it is typically linked to the asset that is accessed by the connector that the connection describes.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-connectors.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-connectors.png)​

> Figure 5: Connection information needed to access the data held by an asset

Metadata discovery

A discovery engine is a process that runs a pipeline of analytics to describe the data content of an asset. It uses statistical analysis, reference data and other techniques to determine the type and range of values stored, potentially what the data means and its level of quality. The result of the analysis is stored in metadata objects called annotations.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-discovery.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-discovery.png)​

> Figure 6: Output from a metadata discovery engine

Bringing it all together

Figure 7 shows each of these pieces linking together. In a real-world environment, the aim is to automate as much of this linkage as possible. This is made considerably easier if the implementation landscape is reasonable consistent. However, where the stored data values do not match the expected types defined in the schema, the metadata model reveals the inconsistencies and often requires human intervention to ensure the links are correct.

​![https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-big-picture.png](https://github.com/odpi/data-governance/raw/main/docs/common-data-definitions/semantic-to-implementation-big-picture.png)​

> Figure 7: Linking the metadata together

# Guidance on Governance Introduction

Governance enables all types of organizations (multi-nationals, small businesses, government services, non-profits ...) to operate effectively and ethically.

It delivers management system that focuses on the culture of the organization and the way it develops, maintains and uses assets.

Both of these aspects are of extreme importance to modern organizations because:

- Natural resources need to be used in an efficient and sustainable manner.
- Digital services operate at a scale beyond an individuals ability to understand, monitor and control. The technology is moving rapidly and the complexity of modern systems means that the people operating them need specific automated help to ensure they are secure and operating correctly.
- Regulation is imposing exacting requirements on traceability of the organization's activity.
- Social changes are creating expectations that people are treated with respect and as individuals. The organization must embrace the diversity of the people that interact with it, and treat them fairly.

Good governance creates transparency in an organization's operation and enables people to develop and be the best they can.

Although each organization is different, there are many common aspects to the way they work (largely because they are built and operated by people) that can act as the framework to this collection of guidance on developing a governance capability.

Consider figure 1:

​![https://github.com/odpi/data-governance/raw/main/docs/governance-basics/simple-model-of-an-org.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/governance-basics/simple-model-of-an-org.png#pagewidth)​

> Figure 1: simple model of an organization

This simple model highlights the key drivers of any type of organization.

Consider the organization's stakeholders. For a commercial organization, they are the investors. For a department within an organization, they could be the management committee that created the department. For a charity, they are the founders of the organization.

Whoever the stakeholders are, they define a purpose for the organization (eg making a profit selling fish, supporting an organization's IT systems or feeding starving people after a disaster.) Obviously the purpose can evolve over time, but basically the organization is considered successful if it is meeting its purpose.

For the organization to get started, it needs investment. This typically comes from the stakeholders. They are therefore keen to see that they are getting good value for the investment they provide. That is, they want to see that the organization is cost-effective.

The organization can spend the stakeholder's investment on:

- People to work on meeting the purpose (employees),
- Assets to support their work (see Note),
- Paying a business partner to perform some of the work that is needed.

> Note: The use of the term "Asset" in this model is intended to cover a very broad definition. Examples of assets include buildings, computers, software packages, IT systems, processes, data stores, analytical models, digital locations, intellectual property.

An organization can generate income from providing goods and/or services in exchange for some sort of feedback and reward (payment). These goods and/or services typically involve the organization creating more assets using its employees, existing assets and business partners.

In most cases the recipient of the goods and/or services is the one providing the feedback and reward. However, consider a charity. It supplies support to its target audience (consumers), and receives donations from other sources (customers). Also consider a service that is funded by advertising. The customers are the advertisers rather than the consumers of the service.

Typically, the purpose of the organization includes an aspect of how well it supports its consumers and customers. So the reward often provides the ability to hire more employees and create more assets. The feedback helps them hone the goods and/or services that they offer.

The organization aims to operate in a sustainable manner, using the rewards it receives from is customers to pay for its operation and, potentially provide rewards to its stakeholders (assuming that is part of its purpose).

Finally the regulators protect the interests of particular groups that the organization's activities may impact. An organization is often working with many types of regulators from the governments and tax authorities of the territories where they a operating, industry regulators ensuring fair competition, financial regulators protecting investors, privacy regulators and safely regulators protecting individuals, as some of the examples.

Governance has evolved as a series of practices and mechanisms within an organization to ensure successful and cost-effective operation that stakeholders and regulators can verify.

Figure 2 shows governance added to the simple organization model.

​![https://github.com/odpi/data-governance/raw/main/docs/governance-basics/simple-model-of-an-org-with-governance.png](https://github.com/odpi/data-governance/raw/main/docs/governance-basics/simple-model-of-an-org-with-governance.png)​

> Figure 2: simple model of an organization with governance

Governance covers both the employees and the organization's assets. Often the governance of different types of assets and employees is coordinated by different teams. For example:

- Data assets are governed by the data governance team
- Financial assets are governed by the finance team
- Privacy is governed by the privacy team
- Security is governed by the security compliance team

However, their work is inter-related and follows a common pattern. See [Governing Systems](https://github.com/odpi/data-governance/blob/main/docs/governing-systems) for more information.

# Governance of data

Although ODPi Egeria supports all types of governance, it has a specific focus on data governance because (1) data is so critical to modern digital business and (2) data by its very nature needs special treatment.

Unlike a physical object, such as a chair or a building, data can be freely copied and combined in multiple ways. It is fluid. This is why water analogies, such as data lake, are popular when it comes to describing data management.

The fluidity of data creates 2 challenges:

- What are the dividing lines between different data assets?
- Who is responsible for the quality and protection of data when there are so many copies?

In addition, the original meaning of data is often lost. Data is created in a specific context (such as an application or from a specific sensor). This context means there are certain assumptions made about the precision, quality, timeliness and completeness of the data.

As the data is copied and sent to different destinations, this context needs to be captured so it can be used to validate whether the data can be used in a new context.

Some standard data formats, such as JPG and MP3 files, include support for this context, which is called metadata (literally data about data). However, most data is in a format that does not include this metadata and it must be managed separately.

The next challenge is that people, in general, are sloppy about the precise meaning of the terminology they use and this lack of precision can translate to misunderstandings on what specific data values mean. Even within the same organization, a term may have multiple meanings, or their may be multiple terms for the same thing. In order the communicate the meaning of data from one context to another, these anomalies in the meaning of the terminology used to describe the data need to be reconciled.

Finally there is is still a lot of uncertainty related to ownership of data. Just because an organization holds data, it does not mean it has the right to process it. The data may be subject to copyright (such as the [Creative Commons licenses](https://creativecommons.org/licenses/), or a more specific type of data license (such as the [Community Data License Agreement (CDLA)](https://cdla.io/)), or may be personal data that is subject to specific data privacy regulations (such as the [General Data Protection Regulation (GDPR)](https://ec.europa.eu/commission/priorities/justice-and-fundamental-rights/data-protection/2018-reform-eu-data-protection-rules_en)).

This means that the organization needs to track the flow of data between data stores and applications to ensure that it is only used for approved purposes. The organization needs to define the precise responsibilities of people that hold copies of data and the requirements that they must fulfil.

# The governing systems

Organizations operate as a series of systems that are made up of people, the processes they follow and the technology that supports them.

These systems, and their component parts, are some of the [assets of the organization](https://github.com/odpi/data-governance/blob/main/docs/governance-basics).

Governance teams focus on building the systems that provide a healthy culture and the asset management capability. These systems are called the governing systems. They support the business systems (that is, the governed systems). See figure 1.

​![https://github.com/odpi/data-governance/raw/main/docs/governing-systems/systems-of-an-organization.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/governing-systems/systems-of-an-organization.png#pagewidth)​

> Figure 1: Systems of an organization

Ideally governance is embedded in the daily work of the organization, rewarding individuals who follow the practices it encourages. When this is the case, individuals engaging with the organization use a blend of the business systems and the governing systems to perform their role(s). They may not even be aware of the difference.

Capabilities of the governing systems

The capabilities of the governing systems are typically focused on managing the organization's assets.

Figure 2 details the type of capabilities provided by the governing systems shown in green. The business systems are shown in blue.

​![https://github.com/odpi/data-governance/raw/main/docs/governing-systems/capabilities-of-the-governing-systems.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/governing-systems/capabilities-of-the-governing-systems.png#pagewidth)​

> Figure 2: Capabilities of the governing systems

Underpinning the capabilities of the governing system is a knowledge base about the assets, their relationships and the activity related to their management. This knowledge base is called the asset catalog and it is one of the functions provided by a metadata repository.

# Governance Maturity Model

The data governance maturity model shown in Figure 1 was first published in 2018:

> REDP5486 The Journey Continues: from Data Lake to Data-Driven Organization [http://www.redbooks.ibm.com/abstracts/redp5486.html?Open](http://www.redbooks.ibm.com/abstracts/redp5486.html?Open)

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Governance-Maturity-Model.png](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Governance-Maturity-Model.png)​

> Figure 1: Governance Maturity Model

It shows five levels of maturity that build on one another until the organization is able to support a wide range of advanced data use along with appropriate self-service access to data for a majority of people in the organization. This is the capability that Forrester calls [Data Citizenship](https://www.forrester.com/webinar/Data+Governance+20+The+Journey+Toward+Data+Citizenship/-/E-WEB21683).

In general, organizations are not universally at one level of maturity. They adjust their investment to focus on the types of data that will bring the most value. So their coverage looks more like figure 2.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Governance-Maturity-Model-Progress.png](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Governance-Maturity-Model-Progress.png)​

> Figure 2: Staging maturity

The maturity levels are:

- [Data Awareness](https://github.com/odpi/data-governance/blob/main/docs/maturity-model/Data-Awareness.md) - where is the organization's data and what does it contain?
- [Governance Awareness](https://github.com/odpi/data-governance/blob/main/docs/maturity-model/Governance-Awareness.md) - how should data be governed?
- [Embedded Governance](https://github.com/odpi/data-governance/blob/main/docs/maturity-model/Embedded-Governance.md) - how can governance be automated?
- [Business Driven Governance](https://github.com/odpi/data-governance/blob/main/docs/maturity-model/Business-Driven-Governance.md) - how can the business leaders take ownership of data and governance?
- [Data Citizenship](https://github.com/odpi/data-governance/blob/main/docs/maturity-model/Data-Citizenship.md) - how can every employee, system and server get the data they need, every day?

Click on the links above for more detail about each level. You will notice that the number of integrations between tools, engines and metadata repositories grows with each level of maturity. [ODPi Egeria](https://egeria.odpi.org/) provides open standards and services to simplify this integration.

### Business Driven Governance

Business driven governance is where the implementations of governance within the IT systems is driven by the governance classifications and other metadata settings. As the asset owners change the classifications attached to the asset descriptions, then the runtime governance functions change their treatment of the assets.

The big change that this brings is that the runtime governance functions need reliable and performant access to the metadata. Typically this is provided by an operational metadata catalog that its tuned for the needs of the runtime governance components.

In fact there may be many operational metadata catalogs, one in each subsystem that manages assets. Some technology may be so critical that is needs to keep its metadata in an inmemory cache that is regularly synchronized from the master data catalog.

Figure 1 shows the business driven governance in operation.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Business-Driven-Governance.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Business-Driven-Governance.png#pagewidth)​

> Figure 1: Capabilities needed to achieve Business Driven Governance

### Data Awareness

An organization has achieved data awareness when it has a catalog of its data assets that shows the properties of the data assets, who owns them and their lineage (how they were created).

These catalogs ideally need to cover all types of data asset, from data stores, data feeds, APIs and the processes/applications that work with them. In addition, the catalog can include information about the logical structure (schema) of the data, its format (for example, XML, JSON) the values stored and what the data elements within the asset mean to the organization.

Figure 1 shows the different types of tools that can be used to build up the data catalog and make it searchable through a user interface.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Data-Awareness.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Data-Awareness.png#pagewidth)​

> Figure 1: Capabilities needed to achieve Data Awareness

### Data Citizenship with ODPi Egeria

Data citizenship within an organization supports people who need access to data to be effective in their role. This data access needs to be embedded in the tools that they use and flexible enough to meet the changing challenges they face day to day. Since the data landscape is also changing, the tools that these people use need to be integrated with the data catalog.

This is shown in figure 1.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Data-Citizenship.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Data-Citizenship.png#pagewidth)​

> Figure 1: Capabilities needed to achieve Data Citizenship

Achieving data citizenship creates huge value for an organization. At this point it can claim it is truly data driven and can confidently may use of advanced techniques such as natural language processing and artificial intelligence. However there is a cost behind this benefit due to the metadata integration and synchronization required.

[ODPi Egeria](https://egeria.odpi.org/) provides libraries and integration servers to simplify the integration of metadata repositories and governance functions.

It provides an extensible, open metadata type system that covers most if not all of the types of metadata that an organization needs to exchange, APIs and event formats to support the exchange of metadata along with embeddable libraries that support the underlying protocols.

Figure 1 shows an example of using the egeria technology (shown in bright blue) to integrate metadata repositories and governance functions. Notice that the egeria libraries are embedded in many technologies, and there are also servers (called Open Metadata and Governance (OMAG) servers) that provide governance APIs to different types of tools.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Data-Citizenship-with-Egeria.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Data-Citizenship-with-Egeria.png#pagewidth)​

> Figure 1: Using ODPi Egeria to achieve Data Citizenship

### Embedded Governance

With embedded governance, the technology that is managing data has the governance requirements directly encoded into its operations. This can be done with code or configuration depending on the capability of the technology.

Figure 1 shows the IT team implementing the governance requirements. This needs to be repeated for all of the key infrastructure that is managing the assets.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Embedded-Governance.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Embedded-Governance.png#pagewidth)​

> Figure 1: Capabilities needed to achieve Embedded Governance

### Governance Awareness

Governance awareness is where the governance requirements are attached to the descriptions of the data assets in the data catalog. This means that someone wishing to use a data asset can easily understand the governance requirements they must meet to use it responsibility.

Most organizations use governance classifications. These are labels that are attached to the asset descriptions, or the data elements descriptions where they exist.

The governance classifications each define a list of governance requirements for different situations. For example a governance classification could be "confidential". The governance program would then describe the governance requirements for confidential data when, for example:

- it is shared with a colleague,
- passed to an external person,
- stored etc

The governance program educated employees on the use and meaning of the governance classifications so they know how to manage any data with that classification.

Classifications can be added directly to an asset's metadata description, or the descriptions of the data elements within the asset, or indirectly to the glossary terms that are linked to the asset/data element descriptions.

Figure 1 shows both options for adding classifications to the catalog. Classifying through the glossary terms creates greater consistency in the way that data is classified, but it does requirement that the attachment of glossary terms to the descriptions of assets/data elements is comprehensive.

​![https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Governance-Awareness.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/maturity-model/governance-maturity-model-Governance-Awareness.png#pagewidth)​

> Figure 1: Capabilities needed to achieve Governance Awareness

# Data Governance Roles

Data governance defines how an organization will make best use of data whilst also keeping it safe and managed with a reasonable level of cost and resources. Done well, data governance creates a sense of responsibility for data across every person in an organization plus an appreciation of its value to their work.

Of course, not everyone is responsible for everything. An individual will have different skills and interests. Therefore data governance breaks down the work that needs to happen into tasks and groups related tasks into what are called roles.

A role is assigned to a person with a scope. This makes them responsible for performing the tasks for the role, within the assigned scope.

The scope defines the specific data sets and/or processing that this person must perform the tasks for.

For example, the data stewardship role lists all of the tasks related to making a data set fit for purpose, such as correcting errors in it. There may be a data steward assigned to customer records, another for supplier records and another for the financial accounts.

Where data is flowing from system to system, responsibility may be handed off from one data steward to another as the data moves between their scopes of responsibility.

​![https://github.com/odpi/data-governance/raw/main/docs/roles/role-scopes.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/roles/role-scopes.png#pagewidth)​

Except in very large enterprises, the data governance roles are typically assigned to individuals in addition to their main role in the organization. Some of these roles are permanently assigned, and other may just be for a project or particular incident.

Roles typically are clustered together defining related types of interactions that need to occur. The roles below are those most important to data governance. In some larger organizations, these roles may be staffed by a dedicated team, or further sub-divided into more specific roles. However, for most organizations, they represent just part of an individual's responsibility.

​![https://github.com/odpi/data-governance/raw/main/docs/roles/role-summary.png#pagewidth](https://github.com/odpi/data-governance/raw/main/docs/roles/role-summary.png#pagewidth)​