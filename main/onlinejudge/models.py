# -*- coding: utf-8 -*-

from django.db import models


class Problem(models.Model):
    title = models.CharField(max_length=255)
    post_date = models.DateTimeField()

    memory_limit = models.IntegerField()
    time_limit = models.IntegerField()

    description = models.TextField()
    pre_written_code = models.TextField()
    test_data = models.FileField()

    def __unicode__(self):
        return self.title


class User(models.Model):
    username = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    department = models.CharField(max_length=255)
    announcement = models.CharField(max_length=1024)

    register_date = models.DateTimeField()
    last_activity_date = models.DateTimeField()

    def __unicode__(self):
        return self.username


class Response(models.Model):
    short_string = models.CharField(max_length=30)
    display_string = models.CharField(max_length=256)

    def __unicode__(self):
        return self.display_string


class Record(models.Model):
    commit_user = models.ForeignKey(User)
    commit_problem = models.ForeignKey(Problem)
    commit_status = models.ForeignKey(Response)
    commit_date = models.DateTimeField()
    commit_sourcefile = models.TextField()
    commit_external = models.TextField(null=True)

    cost_time_ms = models.IntegerField()
    cost_memory_mb = models.IntegerField()


