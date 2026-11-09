---
title: "Don't Shoot the Messenger: How Source Context Shapes Human and Model Interpretation of Online Discourse"
layout: "publication-single"
image: "/images/pubs/dont-shoot-messenger-tsc2026.png"
citation: "Di Wang, Prachi Aswani, Marina Kogan, Robert Kirby. **Don't Shoot the Messenger: How Source Context Shapes Human and Model Interpretation of Online Discourse.** ACM Transactions on Social Computing, 2026."
bibtex: |
  @article{wang2026messenger,
    title = {Don't Shoot the Messenger: How Source Context Shapes Human and Model Interpretation of Online Discourse},
    author = {Wang, Di and Aswani, Prachi and Kogan, Marina and Kirby, Robert},
    journal = {ACM Transactions on Social Computing},
    year = {2026}
  }
---

## Overview

**Abstract:** Official crisis messages on social media draw extensive public replies. Some replies contribute new information by offering evidence, corrections, explanations, or concrete requests, whereas others primarily express stance, sentiment, or affiliation. We frame this distinction as an epistemic classification problem and ask whether humans and large language models (LLMs) draw the boundary between discussion and reaction in the same way. We analyze replies to official COVID-19 communication on Twitter/X during the politically salient period of the 2020 U.S. election. From conversations initiated by politicians and by officials of government agencies, we construct 2,000 initiator–response pairs and collect human labels under two controlled information conditions: without-context (initiator post and reply text only) and with-context (the tweet pairs as well as labels that identify if the initiator is a politician or a government account). After generating training data through human annotation, we then apply a three-expert LLM ensemble under matched conditions to compare human and model epistemic judgments. The results confirm that context shifts the decision boundary between discussion and reaction. Human annotators exhibit substantial shifts when source information is visible for both politician- and government-initiated posts. When trained without source context, the LLM ensemble remained relatively insensitive to source context at test time; when provided source context during training, the ensemble’s judgments shift toward reaction by a magnitude comparable to human annotators’, indicating that models reproduce the human contextual effect through their training labels rather than by interpreting source information at inference time.
