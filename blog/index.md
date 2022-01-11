---
layout: inset
title: Blog
---
<ul style="list-style-type: none;">
  {% for post in site.posts %}
    <li>
      <h2 class="posts__article_title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
