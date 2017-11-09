from django.contrib import admin

from infome.models import Call, Tag


# Register your models here.
class CallAdmin(admin.ModelAdmin):
    fields = ('description', 'status')
    list_display = ('description', 'status')

    class Meta:
        model = Call


class TagAdmin(admin.ModelAdmin):
    fields = ('description',)
    list_display = ('description',)

    class Meta:
        model = Tag

admin.site.register(Call, CallAdmin)
admin.site.register(Tag, TagAdmin)
