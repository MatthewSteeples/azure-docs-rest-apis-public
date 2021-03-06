---
title: "Naming rules (Azure Search) | Microsoft Docs"
description: Name coventions for Azure Search services, indexes, indexers, and other resources.
ms.date: "2018-06-13"
services: search
ms.service: search
ms.topic: conceptual
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Naming rules (Azure Search)
  This section explains the naming rules for Azure Search services, indexes, fields, document keys, scoring profiles, suggesters, synonym maps, indexers, data sources, and skillsets.  

## Chart of naming rules  
 You'll notice that the conventions in the following table are not consistent down the line for all objects. This is because objects are used in different contexts, where the naming rules of other standards are imposed on specific Azure Search objects. URLs, JSON, and DNS all have different conventions in terms of case-sensitivity, special characters, and character placement. By necessity, objects referenced in a URL (host name, path, or query string) or JSON request body have to follow the naming conventions of the applicable standard, thus accounting for the variation you see below.  

|Name|Length|Case|Allowable characters|Character placement|Example|  
|----------|------------|----------|--------------------------|-------------------------|-------------|  
|Service|2 - 60|Lower|Letters, numbers, dashes ("-")|First, second, and last characters must be a letter or number.<br /><br /> No consecutive dashes.|contoso-srch1|  
|Index|2 - 128|Lower|Letters, numbers, dashes ("-")|First character must be a letter or number.<br /><br /> No consecutive dashes.|idx-hotels-2015|  
|Field|1 -128|Upper or lower|Letters, numbers, underscores ("_")|First character must be a letter.<br /><br /> The name cannot begin with "azureSearch".|Store_Name|  
|Document key|No upper limit, but keys must fit within the 8 KB URL length limit|Upper or lower|Letters, numbers, dashes ("-"), underscores ("_"), equal signs ("=")<br /><br /> For compound keys, we recommend using a dash, underscore, or equal sign as a separator.<br /><br /> If keys contain characters other than the above, we recommend encoding them using a URL-safe variant of Base64. For example, in .NET you can use the [HttpServerUtility.UrlTokenEncode](http://msdn.microsoft.com/library/system.web.httpserverutility.urltokenencode.aspx) method for this purpose.|First character cannot be an underscore.|RXhhbXBsZSBkb2N1bWVudCBrZXk=<br /><br /> This is the string “Example document key” encoded in base 64. URL-safe Base64 encoding is recommended because document keys are sometimes used in the URL path. Encoding allows you to use characters in a document key that would otherwise be problematic in a URL.|  
|Scoring profile|1 - 128|Upper or lower|Letters, numbers, underscores ("_")|First character must be a letter or number.|BoostFunc_TagsCustHist|  
|Suggester|1 - 128|Upper or lower|Letters, numbers, underscores ("_")|First character must be a letter or number.|Sugst01_Apparel|  
|Data source|1 - 128|Lower|Letters, numbers, dashes ("-")|First and last character must be a letter or number.|docdbds-onlinecatalog-20150228|  
|Indexer|1 -128|Lower|Letters, numbers, dashes ("-")|First and last character must be a letter or number.|docbindxr-onlinecatalog-20150228|  
|Synonym map|1 -128|Lower|Letters, numbers, dashes ("-")|First and last character must be a letter or number.|custom-synonyms-15|  
|Skillset|1 -128|Lower|Letters, numbers, dashes ("-")|First and last character must be a letter or number.|grok-myfiles-skillset-1|  

## See also  

+ [Azure Search Service REST](index.md)   
+ [Create Indexer &#40;Azure Search Service REST API&#41;](create-indexer.md)   
+ [Create Data Source &#40;Azure Search Service REST API&#41;](create-data-source.md)   
+ [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md)   
+ [Add scoring profiles to a search index](add-scoring-profiles-to-a-search-index.md)   
+ [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
+ [Azure Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
