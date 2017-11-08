# -*- coding: utf-8 -*-

from django.db import models


class Call(models.Model):
    DEFAULT_STATUS = (1, 'Aberta')
    STATUS = (
        DEFAULT_STATUS,
        (2, 'Resolvida'),
        (3, 'Cancelada')
    )

    description = models.TextField(max_length=300, default='')
    tags = models.ManyToManyField('Tag')
    location = models.OneToOneField('Location', null=True)
    status = models.IntegerField(choices=STATUS, default=DEFAULT_STATUS[0], null=False, blank=False)
    created = models.DateTimeField(auto_now_add=True, auto_now=False, null=False)


class Hand(models.Model):

    call = models.OneToOneField('Call')
    location = models.OneToOneField('Location')
    created = models.DateTimeField(auto_now_add=True, auto_now=False, null=False)


class Location(models.Model):
    latitude = models.DecimalField(max_digits=9, decimal_places=6, null=False, blank=False)
    longitude = models.DecimalField(max_digits=9, decimal_places=6, null=False, blank=False)


class Tag(models.Model):
    description = models.CharField(max_length=50, null=False, blank=False)


