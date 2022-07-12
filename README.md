<!-- Title -->
<br />
<p align="center">
    <h1 align="center">CODEC</h1>
    <h2 align="center">Complex Document and Entity Collection</h2>

<!-- TABLE OF CONTENTS -->
  <h5>Table of Contents</h5>
  <ol>
    <li><a href="#overview">Overview</a>
    <li><a href="#paper">Paper</a>
    <li><a href="#dataset">Dataset</a></li>
    <li><a href="#change-log">Change Log</a></li>
    <li><a href="#tasks">Tasks</a></li>
    <li><a href="#complex-topics">Complex Topics</a></li>
    <li><a href="#doc-corpus">Document Corpus</a></li>
    <li><a href="#ent-corpus">Entity KB</a></li>
    <li><a href="#judgments">Judgments</a></li>
    <li><a href="#query-reform">Query Reformulations</a></li>
    <li><a href="#entity-centric-search">Entity-Centric Search</a></li>
    <li><a href="#evaluation">Evaluation</a></li>
    <li><a href="#system-performance">System Performance</a></li>
    <li><a href="#future-work">Future Work</a></li>
  </ol>

Colab demo showing indexing, query reformulations, entity links, and evaluation: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1omFhIpCSMZfwZ6Oj7ZcTWo00vpIrq0F2?usp=sharing)



<!-- Overview -->
<h3 id="overview">Overview</h3>

<p> 
CODEC is a new document and entity ranking benchmark that focuses on complex research topics. 
We target essay-style information needs of social science researchers across history, economics, and politics.
For example, ‘How has the UK’s Open Banking Regulation benefited Challenger Banks?’ 


CODEC includes 42 topics developed by researchers and a new focused web corpus with semantic annotations including entity links. 
It includes expert judgments on 6,186 document (147.3 per topic) and 11,323 entity (269.6 per topic) from diverse automatic and interactive manual runs. 
The manual runs include 387 query reformulations (9.2 per topic), providing data for query performance prediction and automatic rewriting evaluation. 
</p>

<p align="center">
    <img src="https://github.com/grill-lab/CODEC/blob/main/assets/overview.png" alt="CODEC Diagram" width="700" height="275" >

<!-- Paper -->
<h3 id="paper">Paper</h3>

This work will be presented at SIGIR 2022: https://arxiv.org/abs/2205.04546

Correct citation: 
```
@inproceedings{mackie2022codec,
 title={CODEC: Complex Document and Entity Collection},
 author={Mackie, Iain and Owoicho, Paul and Gemmell, Carlos and Fischer, Sophie and MacAvaney, Sean and Dalton, Jeffery},
 booktitle={Proceedings of the 44th International ACM SIGIR Conference on Research and Development in Information Retrieval},
 year={2022}
}
```

<!-- Dataset -->
<h3 id="dataset">Dataset</h3>
<p> CODEC provides 42 topics for document and entity retrieval: </p> 
  <ul>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/topics/topics.json">Topics</a> 
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/topics/query_reformulations.txt">Query reformulations</a> 
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/qrels">Qrels</a></li>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/raw_judgments">Raw judgments</a></li>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/system_runs/folds/folds.json">Standard 4-folds</a></li>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/system_runs/runs">Baseline runs</a></li>
  </ul> 


CODEC full document corpus is available for research purpose: <a href="https://codec-public-data.s3.amazonaws.com/codec_documents.jsonl">FULL</a>.

This is a <a href="https://codec-public-data.s3.amazonaws.com/sample_codec_documents.jsonl">SAMPLE</a>.

CODEC entity KB is <a href="https://ai.facebook.com/tools/kilt/">KILT's</a> snapshot of Wikipedia (~30GB). 

We provide entity links over document corpus: <a href="https://codec-public-data.s3.amazonaws.com/codec_entity_links.jsonl">link</a> (~13GB).  

Colab demo showing indexing, query reformulations, entity links, and evaluation: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1omFhIpCSMZfwZ6Oj7ZcTWo00vpIrq0F2?usp=sharing)

Dataset is available via <a href="https://github.com/allenai/ir_datasets"><i>ir-datasets</i></a>.

<!-- Change Log -->
<h3 id="change-log">Change Log</h3>

Major dataset changes historic users should be aware:
<ul>
    <li> <b>25th April</b>: CODEC v1 released.  
</ul> 


<!-- Tasks -->
<h3 id="tasks">Tasks</h3>

<p>
CODEC is a test collection that provides two tasks: <b>document ranking</b> and <b>entity ranking</b>. 
This dataset benchmarks a social science researcher who is attempting to find supporting entities and documents that will form the basis of a long-form essay discussing the topic from various perspectives. 
The researcher would explore the topic to (1) identify relevant sources and (2) understand key concepts.
</p>

<p>

Document ranking systems have to return a relevance-ranked list of documents for a given natural language query. 
Entity ranking systems have to return a relevance-ranked list of entities for a given natural language query. 
Document ranking uses CODEC’s new document corpus and entity ranking uses KILT as the entity knowledge base. 
For the experimental setup, we provide four pre-defined ‘standard’ folds for k-fold cross-validation to allow parameter tuning. 
Initial retrieval or re-ranking of provided baseline runs can both be evaluated using this dataset.

</p>

<!-- Complex Topics -->
<h3 id="complex-topics">Complex Topics</h3>
CODEC provides 42 complex topics which intend to benchmark the role of a researcher. 
Social science experts from <b>history</b> (history teacher, published history scholar), <b>economics</b> (FX trader, accountant, investment banker) and <b>politics</b> (political scientists, politician) helped to generate interesting and factually-grounded topics. 
The authors develop the following criteria for complex topics:
<ul>
   <li> <i>Open-ended essay-style</i>
   <li> <i>Natural language question</i>
   <li> <i>Multiple points of view</i>
   <li> <i>Concern multiple key entities</i>
   <li> <i>Complex</i>
   <li> <i>Requires knowledge</i>
 </ul> 

Each topic contains a query and narrative. 
The query is the question the researcher seeks to understand by exploring documents and entities, i.e., the text input posed to the search system. 
The narratives provide an overview of the topic (key concepts, arguments, facts, etc.) and allow non-domain-experts to understand the topic. 

<p align="center">
    <img src="https://github.com/grill-lab/CODEC/blob/main/assets/econ_topic.png" alt="CODEC Topcs" width="400" height="400" >


<!-- Document Corpus -->
<h3 id="doc-corpus">Document Corpus</h3>

We use Common Crawl to curate a 729,824 document corpus with focused content across finance, history, and politics. 

The corpus is released in jsonline format with following fields:

<ul>
   <li> <b>id</b>: <i>Unique identifier is the MD5 hash of URL.</i>
   <li> <b>url</b>: <i>Location of the webpage (URL). </i>
   <li> <b>title</b>: <i>Title of the webpage if available.</i>
   <li> <b>contents</b>: <i>The text content of the webpage after removing any unnecessary advertising or formatting. New lines provide some structure between the extracted sections of the webpage, while still easy for neural systems to process.</i>
 </ul> 

Document distribution:

<table class="tg">
<thead>
  <tr>
    <th class="tg-7zrl"></th>
    <th class="tg-1wig">Document Count</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-7zrl">reuters.com</td>
    <td class="tg-2b7s">172,127</td>
  </tr>
  <tr>
    <td class="tg-7zrl">forbes.com</td>
    <td class="tg-2b7s">147,399</td>
  </tr>
  <tr>
    <td class="tg-7zrl">cnbc.com</td>
    <td class="tg-2b7s">100,842</td>
  </tr>
  <tr>
    <td class="tg-7zrl">britannica.com</td>
    <td class="tg-2b7s">93,484</td>
  </tr>
  <tr>
    <td class="tg-7zrl">latimes.com</td>
    <td class="tg-2b7s">88,486</td>
  </tr>
  <tr>
    <td class="tg-7zrl">usatoday.com</td>
    <td class="tg-2b7s">31,803</td>
  </tr>
  <tr>
    <td class="tg-7zrl">investopedia.com</td>
    <td class="tg-2b7s">21,459</td>
  </tr>
  <tr>
    <td class="tg-7zrl">bbc.co.uk</td>
    <td class="tg-2b7s">21,414</td>
  </tr>
  <tr>
    <td class="tg-7zrl">history.state.gov</td>
    <td class="tg-2b7s">9,187</td>
  </tr>
  <tr>
    <td class="tg-7zrl">brookings.edu</td>
    <td class="tg-2b7s">9,058</td>
  </tr>
  <tr>
    <td class="tg-7zrl">ehistory.osu.edu</td>
    <td class="tg-2b7s">8,805</td>
  </tr>
  <tr>
    <td class="tg-7zrl">history.com</td>
    <td class="tg-2b7s">6,749</td>
  </tr>
  <tr>
    <td class="tg-7zrl">spartacus-educational.com</td>
    <td class="tg-2b7s">3,904</td>
  </tr>
  <tr>
    <td class="tg-7zrl">historynet.com</td>
    <td class="tg-2b7s">3,811</td>
  </tr>
  <tr>
    <td class="tg-7zrl">historyhit.com</td>
    <td class="tg-2b7s">3,173</td>
  </tr>
  <tr>
    <td class="tg-7zrl">...</td>
    <td class="tg-7zrl">...</td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">TOTAL</span></td>
    <td class="tg-kex3"><span style="font-weight:bold">721,701</span></td>
  </tr>
</tbody>
</table>

<!-- Entity KB -->
<h3 id="ent-corpus">Entity KB</h3>

CODEC uses KILT’s Wikipedia KB for the entity ranking task, which is based on the 2019/08/01 Wikipedia snapshot. 
KILT contains 5.9M preprocessed articles which is freely available to use: <a href="https://ai.facebook.com/tools/kilt/">link</a>.

<!-- Judgments -->
<h3 id="judgments">Judgments</h3>

CODEC uses a 2-stage assessment approach to balance adequate coverage of current systems while allowing annotators to explore topics using iterative search system.
This creates 6,186 document judgments (147.3 per topic) and 11,323 entity judgments (269.6 per topic):

These raw judgements are released: <a href="https://github.com/grill-lab/CODEC/blob/main/raw_judgments">link</a>.

<table class="tg">
<thead>
  <tr>
    <th class="tg-j6zm"><span style="font-weight:bold">Judgment</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Document Ranking</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Entity Ranking</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">0</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">2,353</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">7,053</span></td>
  </tr>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">1</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">2,210</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">2,241</span></td>
  </tr>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">2</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">1,207</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">1,252</span></td>
  </tr>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">3</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">416</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">777</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">TOTAL</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">6,186</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">11,323</span></td>
  </tr>
</tbody>
</table>

<!-- Query Reformulations -->
<h3 id="query-reform">Query Reformulations</h3>

During assessment process, researchers use a live search system to explore the complex topic.
We release the full 387 queries and mapped relevance judgment: <a href="https://github.com/grill-lab/CODEC/blob/main/topics/query_reformulations_to_judgments.json">link</a> 

An example of these manual query reformulations: 

<p align="center">
    <img src="https://github.com/grill-lab/CODEC/blob/main/assets/query_aspects.png" alt="CODEC query reformulations" width="300" height="450" >


<!-- Entity-Centric Search -->
<h3 id="entity-links">Entity-Centric Search</h3>

CODEC provides aligned document and entity judgments that allows for new entity-centric search models to be developed.

We also release <a href="https://github.com/informagi/REL">REL</a> entity links grounding our document corpus to entity KD: <a href="https://codec-public-data.s3.amazonaws.com/codec_entity_links.jsonl">link</a>

<ul>
   <li> <b>mention</b>: <i>Text spans in document that is linked to entity.</i>
   <li> <b>prediction</b>:  <i>Top predicted entity link (Wikipedia title). </i>
   <li> <b>prediction_kilt</b>:  <i>We map prediction entity link to KILT id to align with entity KB and entity judgments.</i>
   <li> <b>candidates</b>:  <i>Top-k entity link candidates (Wikipedia title).</i>
   <li> <b>candidates_kilt</b>:  <i>We map candidates entity links to KILT ids to align with entity KB and entity judgments.</i>
   <li> <b>conf_ed</b>:  <i>Score of Flair NER model.</i>
   <li> <b>score</b>:  <i>Scores of REL candidate selection model.</i>

 </ul> 
   
<!-- Evaluation -->
<h3 id="evaluation">Evaluation</h3>

We provide TREC-style query-relevance files (entity rankings: <a href="https://github.com/grill-lab/CODEC/blob/main/qrels/entity.qrels">link</a>) and (document ranking: <a href="https://github.com/grill-lab/CODEC/blob/main/qrels/document.qrels">link</a>). 

The official measures for both tasks include MAP, NDCG@10, and Recall@1000.

<!-- System Performance -->
<h3 id="system-performance">System Performance</h3>

<i>Systems:</i>

Sparse retrieval <i>BM25</i> and <i>BM25+RM3</i> runs use <a href="https://github.com/castorini/pyserini">Pyserini</a> with Porter stemming and stopwords removed.
We cross validate and release tuned paramters <a href="https://github.com/grill-lab/CODEC/blob/main/baselines/folds">here</a>.

<a href="https://arxiv.org/abs/2007.00808">ANCE</a> is a dense retrieval model.
We use an MS Marco fined-tune ANCE model and Pyserini’s wrapper for easy indexing.
<i>ANCE+FirstP</i> takes the first 512 BERT tokens of each document to represent that document.
 While <i>ANCE+MaxP</i> shards the document into a maximum of four 512-token shards, with the maximum score representing the document.
 
 
<a href="https://aclanthology.org/2020.findings-emnlp.63.pdf">T5</a> is state-of-the-art LM re-ranker that casts text re-ranking into a sequence-to-sequence.
<a href="https://github.com/castorini/pygaggle">Pygaggle’s</a> MonoT5 model, which is fine-tuned using MS Marco.
We employ a max-passage approach similar to <a href="https://aclanthology.org/2020.findings-emnlp.63.pdf">Nogueira et al. (2020)</a> to re-rank all initial retrieval runs. 


<i>Document ranking:</i>

<table class="tg">
<thead>
  <tr>
    <th class="tg-7zrl"></th>
    <th class="tg-j6zm"><span style="font-weight:bold">MAP</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">NDCG@10</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Recall@1000</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.213</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.322</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.762</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.233</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.327</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.800</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-MaxP</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.186</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.363</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.689</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.340</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.468</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.762</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.346</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.472</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.800 </span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-MaxP+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.316</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.481</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.689</span></td>
  </tr>
</tbody>
</table>

<i>Entity Ranking:</i>

<table class="tg">
<thead>
  <tr>
    <th class="tg-7zrl"></th>
    <th class="tg-j6zm"><span style="font-weight:bold">MAP</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">NDCG@10</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Recall@1000</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.181</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.397</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.615</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.209</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.412</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.685</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-FirstP</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.076</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.269</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.340</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.172</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.361</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.615</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.179</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.362</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.685</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-FirstP+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.136</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.407</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.340</span></td>
  </tr>
</tbody>
</table>


<!-- Future Work -->
<h3 id="future-work">Future Work </h3>


We envision CODEC to be an evolving collection, with additional judgments and tasks added in the future, i.e. knowledge grounded generation, passage ranking, and entity linking. 
The topics could also be further enhanced with facet annotations and semantic annotations to support tail and non-KG entities research

Please suggest any future extensions or bug fixes on github or email (i.mackie.1@research.gla.ac.uk). 



