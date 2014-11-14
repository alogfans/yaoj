from django.db import models


class BlogPost(models.Model):
    title = models.CharField(max_length=100)
    author = models.CharField(max_length=30)

    abstract = models.CharField(max_length=500)
    body = models.TextField()

    created_time = models.DateTimeField()
    modified_time = models.DateTimeField()

    def __unicode__(self):
        return self.title
