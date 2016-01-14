{% extends 'markdown.tpl' %}
{%- block header -%}
---
layout: post
title: "{{resources['metadata']['name']}}"
---
{%- endblock header -%}

{% block in_prompt %}
**In [{{ cell.execution_count }}]:**
{% endblock in_prompt %}

{% block input %}
{{ '{% highlight python %}' }}

{{ cell.source }}

{{ '{% endhighlight %}' }}
{% endblock input %}

{% block data_svg %} 
![svg]({{ output.metadata.filenames['image/svg+xml'] | path2support }}) 
{% endblock data_svg %} 

{% block data_png %}
<img class='img-output' src='{{ output.metadata.filenames['image/png'] | path2support }}' alt='png'>
{% endblock data_png %}


{% block data_jpg %} 
![jpeg]({{ output.metadata.filenames['image/jpeg'] | path2support }}) 
{% endblock data_jpg %} 

{% block markdowncell scoped %} 
{{ cell.source | wrap_text(80) }} 
{% endblock markdowncell %} 

{% block headingcell scoped %}
{{ '#' * cell.level }} {{ cell.source | replace('\n', ' ') }}
{% endblock headingcell %}
