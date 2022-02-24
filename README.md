<!-- Title -->
<br />
<p align="center">
    <h1 align="center">CODEC</h1>
    <h2 align="center">COmplex Document and Entity Collection</h2>

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

Colab demo (Pyserini): <a href="TODO">link</a>


<!-- Overview -->
<h3 id="overview">Overview</h3>

<p> 
CODEC is a new document and entity ranking benchmark that focuses on complex research topics. 
We target essay-style information needs of social science researchers across History, Economics, and Politics.
For example, ‘How has the UK’s Open Banking Regulation benefited Challenger Banks?’ 


CODEC includes 36 topics developed by researchers and a new focused web corpus with semantic annotations including entity links. 
It includes expert judgments on 5,130 document (142.5 per topic) and 10,239 entity (284.4 per topic) from diverse automatic and interactive manual runs. 
The manual runs include over 300 query reformulations (9.3 per topic), providing data for query performance prediction and automatic rewriting evaluation. 
</p>

<p align="center">
    <img src="https://github.com/grill-lab/CODEC/blob/main/assets/overview.png" alt="CODEC Diagram" width="700" height="275" >


<!-- Paper -->
<h3 id="paper">Paper</h3>

This work is currently under review. More details and correct citation to follow. 
```
@inproceedings{mackie2022codec,\
 title={CODEC: Complex Document and Entity Collection},\
 author={Mackie, Iain and Owoicho, Paul and Gemmell, Carlos and Fischer, Sophie  and MacAvaney, Sean and Dalton, Jeffery},\
 year={2022}\
}
```


<!-- Dataset -->
<h3 id="dataset">Dataset</h3>
<p> CODEC provides 36 topics for document and entity retrieval: </p> 
  <ul>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/topics/topics.json">Topics</a> 
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/topics/query_reformulations_to_judgments.json">Query reformulations</a> 
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/qrels/document.qrels">Document qrels</a></li>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/qrels/entity.qrels">Entity qrels</a></li>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/baselines/folds/folds.json">Standard 5-folds</a></li>
    <li><a href="https://github.com/grill-lab/CODEC/blob/main/baselines/runs">Baseline runs</a></li>

  </ul> 


CODEC full document corpus will be made available for research purpose on acceptable. 
This is a <a href="https://codec-public-data.s3.amazonaws.com/sample_codec_documents.jsonl ">SAMPLE</a>.

CODEC entity KB is <a href="https://ai.facebook.com/tools/kilt/">KILT's</a> snapshot of Wikipedia (~30GB). 

We provide entity links over document corpus: <a href="https://codec-public-data.s3.amazonaws.com/codec_entity_links.jsonl">link</a> (~13GB).  

Colab demo (Pyserini): <a href="TODO">link</a>

<!-- Change Log -->
<h3 id="change-log">Change Log</h3>

Major dataset changes historic users should be aware:
<ul>
    <li> <b>None</b>.  
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
CODEC provides 36 complex topics which intend to benchmark the role of a researcher. 
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

Each topic contains a (1) query and (2) narrative. 
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
This creates 5,130 document judgments (142.5 per topic) and 10,239 entity judgments (284.4 per topic):

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
    <td class="tg-2b7s"><span style="font-weight:normal">2,075</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">6,665</span></td>
  </tr>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">1</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">1,819</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">1,910</span></td>
  </tr>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">2</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">924</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">1,038</span></td>
  </tr>
  <tr>
    <td class="tg-kex3"><span style="font-weight:bold">3</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">312</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">626</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">TOTAL</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">5,130</span></td>
    <td class="tg-2b7s"><span style="font-weight:normal">10,239</span></td>
  </tr>
</tbody>
</table>

<!-- Query Reformulations -->
<h3 id="query-reform">Query Reformulations</h3>

During assessment process, researchers use a live search system to explore the complex topic.
We release the full 331 queries and mapped relevance judgment: <a href="https://github.com/grill-lab/CODEC/blob/main/topics/query_reformulations_to_judgments.json">link</a> 

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

We provide TREC-style query-relevance files (entity rankings: <a href="https://github.com/grill-lab/CODEC/blob/main/qrels/entity.qrels">link</a>) and (document ranking: <a href="https://github.com/grill-lab/CODEC/blob/main/qrels/document.qrels">link</a>). 

The official measures for both tasks include MAP, Recall@100 and Recall@1000, NDCG@10 and NDCG@1000.

<!-- System Performance -->
<h3 id="system-performance">System Performance</h3>

<i>Document ranking:</i>

<table class="tg">
<thead>
  <tr>
    <th class="tg-7zrl"></th>
    <th class="tg-j6zm"><span style="font-weight:bold">MAP</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">NDCG@10</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">NDCG@1000</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Recall@100</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Recall@1000</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.208</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.401</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.528</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.485</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.760</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.223</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.389</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.547</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.512</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.795</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-MaxP</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.193</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.430</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.509</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.412</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.719</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.282</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.496</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.604</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.580</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.778</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.287</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.513</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.615</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.586</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.795</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-MaxP+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.278</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.505</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.585</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.554</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.719</span></td>
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
    <th class="tg-j6zm"><span style="font-weight:bold">NDCG@1000</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Recall@100</span></th>
    <th class="tg-j6zm"><span style="font-weight:bold">Recall@1000</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.175</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.472</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.472</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.353</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.587</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.196</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.489</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.51</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.384</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.656</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-FirstP</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.081</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.322</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.286</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.184</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.349</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.141</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.388</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.44</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.344</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.587</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">BM25+RM3+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.147</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.392</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.47</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.349</span></td>
    <td class="tg-l2oz"><span style="font-weight:bold">0.656</span></td>
  </tr>
  <tr>
    <td class="tg-j6zm"><span style="font-weight:bold">ANCE-FirstP+T5</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.126</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.44</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.339</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.272</span></td>
    <td class="tg-lqy6"><span style="font-weight:normal">0.349</span></td>
  </tr>
</tbody>
</table>


<!-- Future Work -->
<h3 id="future-work">Future Work </h3>


We envision CODEC to be an evolving collection, with additional judgments and tasks added in the future, i.e. knowledge grounded generation, passage ranking, and entity linking. 
The topics could also be further enhanced with facet annotations and semantic annotations to support tail and non-KG entities research

Please suggest any future extensions or bug fixes on github or email (i.mackie.1@research.gla.ac.uk). 



